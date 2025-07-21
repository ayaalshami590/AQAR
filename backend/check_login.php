<?php
session_start();
header('Content-Type: application/json');

// اتصال بقاعدة البيانات
$connect = mysqli_connect("localhost", "root", "", "aqar");

if (!$connect) {
    echo json_encode(['loggedIn' => false, 'error' => 'Database connection failed']);
    exit;
}

// التحقق من وجود جلسة مستخدم
if (isset($_SESSION['user_id'])) {
    $userId = $_SESSION['user_id'];
    
    // جلب بيانات المستخدم من قاعدة البيانات
    $query = "SELECT name, email FROM users WHERE id = ?";
    $stmt = mysqli_prepare($connect, $query);
    mysqli_stmt_bind_param($stmt, "i", $userId);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $user = mysqli_fetch_assoc($result);
    
    if ($user) {
        echo json_encode([
            'loggedIn' => true,
            'user' => [
                'name' => $user['name'],
                'email' => $user['email']
            ]
        ]);
    } else {
        echo json_encode(['loggedIn' => false]);
    }
} else {
    echo json_encode(['loggedIn' => false]);
}

mysqli_close($connect);
?>
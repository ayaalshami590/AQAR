<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');
$connect = mysqli_connect("localhost", "root", "", "aqar");
?>

<?php
header('Content-Type: application/json');

// تأكد من اتصال قاعدة البيانات
$connect = mysqli_connect("localhost", "root", "", "aqar");
if (mysqli_connect_errno()) {
    echo json_encode([
        'success' => false,
        'message' => 'فشل الاتصال بقاعدة البيانات: ' . mysqli_connect_error()
    ]);
    exit;
}

// احصل على البيانات المرسلة
$json = file_get_contents('php://input');
$payload = json_decode($json, true);

// تحقق من وجود البيانات المطلوبة
if (empty($payload["email"]) || empty($payload["password"])) {
    echo json_encode([
        'success' => false,
        'message' => 'البريد الإلكتروني وكلمة السر مطلوبان'
    ]);
    exit;
}

// نظف البيانات المدخلة
$email = trim(mysqli_real_escape_string($connect, strtolower($payload["email"])));
$password = $payload["password"];

// استخدم prepared statements لمنع الثغرات الأمنية
$query = "SELECT * FROM users WHERE LOWER(email) = LOWER(?) LIMIT 1";
$stmt = mysqli_prepare($connect, $query);
mysqli_stmt_bind_param($stmt, "s", $email);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$row = mysqli_fetch_assoc($result);

if ($row) {
    // إذا كانت كلمات السر غير مشفرة في الداتابيز
    if ($row['password'] === $password) {
        echo json_encode(['success' => true]);
    }
    // إذا كانت كلمات السر مشفرة (يفضل)
    elseif (password_verify($password, $row['password'])) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'كلمة السر غير صحيحة'
        ]);
    }
} else {
    echo json_encode([
        'success' => false,
        'message' => 'البريد الإلكتروني غير مسجل'
    ]);
}

mysqli_close($connect);
?>
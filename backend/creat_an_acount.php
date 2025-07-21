<?php
header('Content-Type: application/json');

// التحقق من وجود جميع البيانات المطلوبة
if (!isset($_POST['name']) || !isset($_POST['email']) || !isset($_POST['password']) || !isset($_POST['password1'])) {
    echo json_encode(['success' => false, 'message' => 'جميع الحقول مطلوبة']);
    exit;
}

// تنظيف البيانات المدخلة
$name = trim($_POST['name']);
$email = trim($_POST['email']);
$password = $_POST['password'];
$password1 = $_POST['password1'];

// التحقق من صحة الإيميل
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(['success' => false, 'message' => 'البريد الإلكتروني غير صالح']);
    exit;
}

// التحقق من تطابق كلمات المرور
if ($password !== $password1) {
    echo json_encode(['success' => false, 'message' => 'كلمات المرور غير متطابقة']);
    exit;
}

// الاتصال بقاعدة البيانات
$connect = mysqli_connect("localhost", "root", "", "aqar");
if (!$connect) {
    echo json_encode(['success' => false, 'message' => 'فشل الاتصال بقاعدة البيانات']);
    exit;
}

// التحقق من عدم وجود الإيميل مسبقاً باستخدام prepared statement
$query = "SELECT email FROM users WHERE email = ? LIMIT 1";
$stmt = mysqli_prepare($connect, $query);
mysqli_stmt_bind_param($stmt, "s", $email);
mysqli_stmt_execute($stmt);
mysqli_stmt_store_result($stmt);

if (mysqli_stmt_num_rows($stmt) > 0) {
    echo json_encode(['success' => false, 'message' => 'هذا البريد الإلكتروني مستخدم بالفعل']);
    exit;
}

// تشفير كلمة المرور
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

// إدراج المستخدم الجديد باستخدام prepared statement
$query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
$stmt = mysqli_prepare($connect, $query);
mysqli_stmt_bind_param($stmt, "sss", $name, $email, $hashedPassword);
$result = mysqli_stmt_execute($stmt);

if ($result) {
    echo json_encode(['success' => true, 'message' => 'تم إنشاء الحساب بنجاح']);
} else {
    echo json_encode(['success' => false, 'message' => 'حدث خطأ أثناء إنشاء الحساب']);
}

mysqli_close($connect);
?>
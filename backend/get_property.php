<?php
header('Content-Type: application/json');

$connect = mysqli_connect("localhost", "root", "", "aqar");

// بناء الاستعلام الأساسي
$query = "SELECT
    p.size,
    l.city,
    l.area,
    pp.photo_url
FROM
    properties AS p
INNER JOIN
    locations AS l ON p.location_id = l.id
INNER JOIN
    property_photos AS pp ON p.id = pp.property_id";

// إضافة شرط الفئة إذا وجد
if(isset($_GET['id'])) {
    $query .= " WHERE p.category_id = " . intval($_GET['id']);
}

// إضافة الترتيب والحد
$query .= " ORDER BY p.id DESC LIMIT 13";

$result = mysqli_query($connect, $query);

if($result) {
    $properties = mysqli_fetch_all($result, MYSQLI_ASSOC);
    echo json_encode($properties);
} else {
    echo json_encode(['error' => mysqli_error($connect)]);
}
?>
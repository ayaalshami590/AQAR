<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');
$connect = mysqli_connect("localhost", "root", "", "aqar");
?>
<?php 
$connect = mysqli_connect("localhost", "root", "", "aqar");
$squery = "SELECT
    p.size,
    l.city,
    l.area,
    pp.photo_url
FROM
    properties AS p
INNER JOIN
    locations AS l ON p.location_id = l.id
INNER JOIN
    property_photos AS pp ON p.id = pp.property_id
ORDER BY
    p.id DESC
LIMIT 5;";
$result = mysqli_query($connect, $squery);
$properties = mysqli_fetch_all($result, MYSQLI_ASSOC);

echo json_encode($properties);

?>
<?php
$connect = mysqli_connect("localhost", "root", "", "aqar");
 $squery = "SELECT * FROM categories";
 $result = mysqli_query($connect, $squery);
 $categories=mysqli_fetch_all($result,MYSQLI_ASSOC);
echo json_encode($categories);
?>
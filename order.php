<?php
$servername = "localhost";
$username = "root";
$password = "password";
$database="fos";

// Create connection
$conn = mysqli_connect($servername, $username, $password,$database);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";

// $name=$_POST("name");
// $houseno=$_POST("houseno");
// $soc=$_POST("soc");
// $area=$_POST("area");
// $city=$_POST("city");


$sql="INSERT INTO Customer VALUES ('9','abc', 'abc', 'abc', 'abc','abc')";

$result=mysqli_query($conn,$sql);


?>
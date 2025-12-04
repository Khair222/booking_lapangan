<?php
include 'connection.php';

$id = uniqid();
$name = $_POST['full_name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$password = password_hash($_POST['password'], PASSWORD_DEFAULT);

$query = "INSERT INTO users (id, full_name, email, phone, password) 
          VALUES ('$id', '$name', '$email', '$phone', '$password')";

if (mysqli_query($conn, $query)) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "failed", "message" => mysqli_error($conn)]);
}

<?php
include 'connection.php';

$email = $_POST['email'];
$password = $_POST['password'];

$query = "SELECT * FROM users WHERE email='$email'";
$result = mysqli_query($conn, $query);
$user = mysqli_fetch_assoc($result);

if ($user && password_verify($password, $user['password'])) {
    echo json_encode([
        "status" => "success",
        "user" => [
            "id" => $user["id"],
            "full_name" => $user["full_name"],
            "email" => $user["email"],
            "phone" => $user["phone"]
        ]
    ]);
} else {
    echo json_encode(["status" => "failed", "message" => "Invalid email or password"]);
}

<?php
include 'connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get raw POST data
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (
        isset($data['id']) &&
        isset($data['field_id']) &&
        isset($data['user_name']) &&
        isset($data['booking_date']) &&
        isset($data['start_time']) &&
        isset($data['end_time']) &&
        isset($data['total_price']) &&
        isset($data['payment_method'])
    ) {
        $id = $conn->real_escape_string($data['id']);
        $field_id = $conn->real_escape_string($data['field_id']);
        $user_name = $conn->real_escape_string($data['user_name']);
        $booking_date = $conn->real_escape_string($data['booking_date']);
        $start_time = $conn->real_escape_string($data['start_time']);
        $end_time = $conn->real_escape_string($data['end_time']);
        $total_price = $data['total_price'];
        $payment_method = $conn->real_escape_string($data['payment_method']);

        $sql = "INSERT INTO bookings (id, field_id, user_name, booking_date, start_time, end_time, total_price, payment_method) 
                VALUES ('$id', '$field_id', '$user_name', '$booking_date', '$start_time', '$end_time', $total_price, '$payment_method')";

        if ($conn->query($sql) === TRUE) {
            echo json_encode(["success" => true, "message" => "Booking created successfully"]);
        } else {
            echo json_encode(["success" => false, "message" => "Error: " . $sql . "<br>" . $conn->error]);
        }
    } else {
        echo json_encode(["success" => false, "message" => "Invalid input"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method"]);
}

$conn->close();
?>

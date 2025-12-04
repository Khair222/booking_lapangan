<?php
include 'connection.php';

$sql = "SELECT * FROM fields";
$result = $conn->query($sql);

$fields = [];

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        // Ensure numeric types are cast correctly if needed, but JSON handles numbers well.
        // Flutter expects double for price, so we can cast here or in Flutter.
        // Let's keep it as strings/numbers from DB and handle parsing in Flutter.
        $fields[] = $row;
    }
}

echo json_encode($fields);

$conn->close();
?>

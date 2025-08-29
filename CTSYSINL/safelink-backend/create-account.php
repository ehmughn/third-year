<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['message' => 'wrong request method']);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);
$email = isset($data['email']) ? $data['email'] : '';
$password = isset($data['password']) ? $data['password'] : '';
$role = isset($data['role']) ? $data['role'] : '';

if (empty($email) || empty($password) || empty($role)) {
    echo json_encode(['message' => 'missing values']);
    exit;
}

$mysqli = new mysqli('localhost', 'root', '', 'db_safelink');

if ($mysqli->connect_error) {
    echo json_encode(['message' => 'connection failed']);
    exit;
}

// Hash the password before storing
$hashedPassword = password_hash($password, PASSWORD_BCRYPT);

$stmt = $mysqli->prepare('INSERT INTO users (email, password, role) VALUES (?, ?, ?)');
$stmt->bind_param('sss', $email, $hashedPassword, $role);

if ($stmt->execute()) {
    echo json_encode(['message' => 'account created']);
} else {
    echo json_encode(['message' => 'insert failed']);
}
?>
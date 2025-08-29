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

if (empty($email) || empty($password)) {
    echo json_encode(['message' => 'missing values']);
    exit;
}

$mysqli = new mysqli('localhost', 'root', '', 'db_safelink');

if ($mysqli->connect_error) {
    echo json_encode(['message' => 'connection failed']);
    exit;
}

$stmt = $mysqli->prepare('SELECT * FROM users WHERE email = ?');
$stmt->bind_param('s', $email);
$stmt->execute();
$result = $stmt->get_result();

if ($user = $result->fetch_assoc()) {
    if (password_verify($password, $user['password'])) {
        unset($user['password']);
        echo json_encode([
            'message' => 'success',
            'user' => $user
        ]);
        exit;
    }
}

echo json_encode(['message' => 'wrong email or password']);
?>
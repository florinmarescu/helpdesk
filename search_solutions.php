<?php
header('Content-Type: application/json');

$host = '127.0.0.1';
$dbname = 'helpdesk';
$username = 'root';
$password = '';

$pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);

$query = $_GET['query'] ?? '';

if (empty($query)) {
    $stmt = $pdo->query("SELECT * FROM solutionarticles ORDER BY title");
} else {
    $stmt = $pdo->prepare("SELECT * FROM solutionarticles WHERE title LIKE ? OR keywords LIKE ? ORDER BY title");
    $stmt->execute(["%$query%", "%$query%"]);
}

$solutions = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($solutions);
?>
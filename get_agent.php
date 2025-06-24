<?php
session_start();
header('Content-Type: application/json');

if (!isset($_SESSION['agent_id'])) {
    echo json_encode(['error' => 'Not logged in']);
    exit;
}

$pdo = new PDO("mysql:host=127.0.0.1;dbname=helpdesk", "root", "");

$stmt = $pdo->prepare("SELECT firstname, lastname FROM agents WHERE agent_id = ?");
$stmt->execute([$_SESSION['agent_id']]);
$agent = $stmt->fetch();

if ($agent) {
    echo json_encode([
        'agent_name' => $agent['firstname'] . ' ' . $agent['lastname']
    ]);
} else {
    echo json_encode(['error' => 'Agent not found']);
}
?>
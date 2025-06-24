<?php

session_start();

$pdo = new PDO("mysql:host=127.0.0.1;dbname=helpdesk", "root", "");

$username = $_POST['username'];
$password = $_POST['password'];

$stmt = $pdo->prepare("SELECT * FROM agents WHERE username = ? AND password = ?");
$stmt->execute([$username, $password]);
$agent = $stmt->fetch();

if ($agent) {
    $_SESSION['agent_id'] = $agent['agent_id'];
    $_SESSION['firstname'] = $agent['firstname'];
    $_SESSION['lastname'] = $agent['lastname'];
    header('Location: app.html');
} else {
    echo "Invalid login";
}
?>
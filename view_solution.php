<?php
$solution_id = $_GET['id'] ?? 0;

if (!$solution_id) {
    die("No solution ID provided");
}

$host = '127.0.0.1';
$dbname = 'helpdesk';
$username = 'root';
$password = '';

$pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);

$stmt = $pdo->prepare("SELECT * FROM solutionarticles WHERE id = ?");
$stmt->execute([$solution_id]);
$solution = $stmt->fetch();

if (!$solution) {
    die("Solution not found");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="solutionarticle.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <title><?php echo htmlspecialchars($solution['title']); ?> | HelpDesk Assist</title>
</head>
<body>
    <div class="navigation">
        <div class="logo">HelpDesk Assist - Solution</div>
    </div>
    <div class="solution-container">
        <div class="solution-content">
            <?php echo $solution['content']; ?>
        </div>
    </div>
</body>
</html>
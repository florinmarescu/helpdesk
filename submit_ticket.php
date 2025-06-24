<?php
session_start();
header('Content-Type: application/json');

if (!isset($_SESSION['agent_id'])) {
    echo json_encode(['success' => false, 'error' => 'Not logged in']);
    exit;
}

$host = '127.0.0.1';
$dbname = 'helpdesk';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo json_encode(['success' => false, 'error' => 'Database connection failed']);
    exit;
}

$input = json_decode(file_get_contents('php://input'), true);

if (empty($input['title']) || empty($input['script'])) {
    echo json_encode(['success' => false, 'error' => 'Title and script are required']);
    exit;
}

try {
    $stmt = $pdo->prepare("
        INSERT INTO tickets (
            customer_firstname, 
            customer_lastname, 
            customer_phone, 
            customer_mobile, 
            customer_email, 
            ticket_type, 
            ticket_status, 
            priority, 
            title, 
            script,
            agent_id
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ");
    
    $stmt->execute([
        $input['customer_firstname'] ?? '',
        $input['customer_lastname'] ?? '',
        $input['customer_phone'] ?? '',
        $input['customer_mobile'] ?? '',
        $input['customer_email'] ?? '',
        $input['ticket_type'] ?? 'failure',
                                    'open',
        $input['priority'] ?? 'medium',
        $input['title'],
        $input['script'],
        $_SESSION['agent_id']
    ]);
    
    $ticket_id = $pdo->lastInsertId();
    
    echo json_encode([
        'success' => true, 
        'ticket_id' => $ticket_id,
        'message' => 'Ticket created successfully'
    ]);
    
} catch (Exception $e) {
    echo json_encode([
        'success' => false, 
        'error' => 'Database error: ' . $e->getMessage()
    ]);
}
?>
<?php
session_start();
header('Content-Type: application/json');

// Check if user is logged in
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

// Get POST data
$input = json_decode(file_get_contents('php://input'), true);

// Validate required fields
if (empty($input['ticket_id'])) {
    echo json_encode(['success' => false, 'error' => 'Ticket ID is required']);
    exit;
}

try {
    $updateFields = [];
    $updateValues = [];
    
    if (isset($input['ticket_status'])) {
        $updateFields[] = 'ticket_status = ?';
        $updateValues[] = $input['ticket_status'];
    }
    
    if (isset($input['priority'])) {
        $updateFields[] = 'priority = ?';
        $updateValues[] = $input['priority'];
    }
    
    if (isset($input['ticket_type'])) {
        $updateFields[] = 'ticket_type = ?';
        $updateValues[] = $input['ticket_type'];
    }
    
    if (isset($input['title'])) {
        $updateFields[] = 'title = ?';
        $updateValues[] = $input['title'];
    }
    
    if (isset($input['script'])) {
        $updateFields[] = 'script = ?';
        $updateValues[] = $input['script'];
    }
    
    $updateValues[] = $input['ticket_id'];
    
    if (empty($updateFields)) {
        echo json_encode(['success' => false, 'error' => 'No fields to update']);
        exit;
    }
    
    $sql = "UPDATE tickets SET " . implode(', ', $updateFields) . " WHERE ticket_id = ?";
    
    $stmt = $pdo->prepare($sql);
    $stmt->execute($updateValues);
    
    echo json_encode([
        'success' => true,
        'message' => 'Ticket updated successfully',
        'updated_fields' => count($updateFields)
    ]);
    
} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'error' => 'Database error: ' . $e->getMessage()
    ]);
}
?>
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
    echo json_encode(['success' => false, 'error' => 'Database connection failed: ' . $e->getMessage()]);
    exit;
}

$filter = $_GET['filter'] ?? 'all';

try {
    $stmt = $pdo->query("SHOW TABLES LIKE 'tickets'");
    $tableExists = $stmt->fetch();
    
    if (!$tableExists) {
        echo json_encode(['success' => false, 'error' => 'Tickets table does not exist']);
        exit;
    }
    
    switch ($filter) {
        case 'open':
            $sql = "SELECT t.*, a.firstname as agent_firstname, a.lastname as agent_lastname 
                    FROM tickets t 
                    LEFT JOIN agents a ON t.agent_id = a.agent_id 
                    WHERE t.ticket_status = 'open' 
                    ORDER BY t.ticket_id DESC";
            break;
        case 'resolved':
            $sql = "SELECT t.*, a.firstname as agent_firstname, a.lastname as agent_lastname 
                    FROM tickets t 
                    LEFT JOIN agents a ON t.agent_id = a.agent_id 
                    WHERE t.ticket_status IN ('resolved', 'closed') 
                    ORDER BY t.ticket_id DESC";
            break;
        case 'all':
        default:
            $sql = "SELECT t.*, a.firstname as agent_firstname, a.lastname as agent_lastname 
                    FROM tickets t 
                    LEFT JOIN agents a ON t.agent_id = a.agent_id 
                    ORDER BY t.ticket_id DESC";
            break;
    }
    
    error_log("Executing SQL: " . $sql);
    
    $stmt = $pdo->query($sql);
    $tickets = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    foreach ($tickets as &$ticket) {
        $ticket['agent_name'] = trim(($ticket['agent_firstname'] ?? '') . ' ' . ($ticket['agent_lastname'] ?? ''));
        if (empty($ticket['agent_name'])) {
            $ticket['agent_name'] = 'Unassigned';
        }
    }
    
    echo json_encode([
        'success' => true,
        'tickets' => $tickets,
        'filter' => $filter,
        'count' => count($tickets),
        'debug' => [
            'sql' => $sql,
            'tickets_found' => count($tickets)
        ]
    ]);
    
} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'error' => 'Database error: ' . $e->getMessage(),
        'debug' => [
            'filter' => $filter,
            'attempted_sql' => $sql ?? 'No SQL generated'
        ]
    ]);
}
?>
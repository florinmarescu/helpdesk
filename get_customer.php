<?php
header('Content-Type: application/json');

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

$phone = $_GET['phone'] ?? '';

if (empty($phone)) {
    echo json_encode(['success' => false, 'error' => 'No phone number provided']);
    exit;
}

try {
    error_log("Searching for phone: " . $phone);
    
    $stmt = $pdo->prepare("SELECT * FROM users WHERE phone = ? OR mobile = ?");
    $stmt->execute([$phone, $phone]);
    $customer = $stmt->fetch(PDO::FETCH_ASSOC);

    error_log("Customer found: " . ($customer ? 'YES' : 'NO'));
    if ($customer) {
        error_log("Customer data: " . json_encode($customer));
    }

    if ($customer) {
        echo json_encode([
            'success' => true,
            'customer' => [
                'firstname' => $customer['firstname'],
                'lastname' => $customer['lastname'],
                'email' => $customer['email'],
                'phone' => $customer['phone'],
                'mobile' => $customer['mobile']
            ],
            'debug' => [
                'searched_for' => $phone,
                'found_phone' => $customer['phone'],
                'found_mobile' => $customer['mobile']
            ]
        ]);
    } else {
        $stmt = $pdo->query("SELECT phone, mobile FROM users LIMIT 5");
        $allNumbers = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        echo json_encode([
            'success' => false,
            'error' => 'Customer not found',
            'debug' => [
                'searched_for' => $phone,
                'sample_numbers_in_db' => $allNumbers
            ]
        ]);
    }
} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'error' => 'Database error: ' . $e->getMessage()
    ]);
}
?>
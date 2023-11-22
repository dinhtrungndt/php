<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods:  GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// http://127.0.0.1:8686/get-users.php
// import file connection.php
include_once './connection.php';
$sql = "SELECT id, email, password, name, role, avatar FROM users";

// Thực thi câu lệnh pdo
$stmt = $dbConn->prepare($sql);
$stmt->execute();

// Lấy tất cả dữ liêuj từ câu lệnh pdo
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Trả về dữ liệu dạng json
echo json_encode($users);

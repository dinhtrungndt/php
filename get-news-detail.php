<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// http://127.0.0.1:8686/get-news-detail.php
// lấy chi tiết 1 bản tin
include_once './connection.php';
// Đọc id từ query string
$id = $_GET['id'];

// Đọc dữ liệu từ database
$sqlQuery = "SELECT id, title, content, created_at,
            user_id, topic_id FROM news WHERE id = $id";

// Thực thi câu lệnh pdo
$stmt = $dbConn->prepare($sqlQuery);
$stmt->execute();

// Đọc dữ liệu 1 bảng tin
$news = $stmt->fetch(PDO::FETCH_ASSOC);

// trả về dữ liệu dạng json
echo json_encode($news);

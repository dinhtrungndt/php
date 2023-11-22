<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST ");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// http://127.0.0.1:8686/login.php
// đăng nhập
include_once './connection.php';

try {
    // Đọc dữ liệu từ client gửi lên
    $data = json_decode(file_get_contents("php://input"));
    // Đọc dữ liệu từ json
    $email = $data->email;
    $password = $data->password;

    // Kiểm tra email và password
    $sqlQuery = "SELECT * FROM users WHERE email = '$email' AND password = '$password'";

    // Thực thi câu lệnh pdo
    $stmt = $dbConn->prepare($sqlQuery);
    $stmt->execute();

    // Lấy dữ liệu từ database
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // kiêm tra dữ liệu
    if ($user) {
        echo json_encode(array(
            "status" => true,
            "user" => $user
        ));
    } else {
        echo json_encode(array(
            "status" => true,
            "user" => null,
        ));
    }
} catch (Exception $ex) {
    echo json_encode(array(
        "success" => "Đăng nhập thất bại!",
        "error" => $ex->getMessage()
    ));
}

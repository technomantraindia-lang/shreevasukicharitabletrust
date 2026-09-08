<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");

$to_email = "devilsun807@gmail.com";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Read JSON payload or Form POST
    $inputData = json_decode(file_get_contents('php://input'), true);
    if (!$inputData) {
        $inputData = $_POST;
    }

    $name        = isset($inputData['Full_Name']) ? strip_tags(trim($inputData['Full_Name'])) : (isset($inputData['name']) ? strip_tags(trim($inputData['name'])) : '');
    $email       = isset($inputData['Email_Address']) ? filter_var(trim($inputData['Email_Address']), FILTER_SANITIZE_EMAIL) : (isset($inputData['email']) ? filter_var(trim($inputData['email']), FILTER_SANITIZE_EMAIL) : '');
    $phone       = isset($inputData['Phone_Number']) ? strip_tags(trim($inputData['Phone_Number'])) : (isset($inputData['phone']) ? strip_tags(trim($inputData['phone'])) : '');
    $subject     = isset($inputData['Subject']) ? strip_tags(trim($inputData['Subject'])) : (isset($inputData['subject']) ? strip_tags(trim($inputData['subject'])) : 'Website Inquiry');
    $description = isset($inputData['Message_Description']) ? strip_tags(trim($inputData['Message_Description'])) : (isset($inputData['message']) ? strip_tags(trim($inputData['message'])) : '');

    if (empty($name) || empty($description) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        http_response_code(400);
        echo json_encode(["status" => "error", "message" => "Please complete all required fields."]);
        exit;
    }

    // SMTP Headers & Content
    $email_subject = "Website Inquiry: $subject";
    
    $email_content = "==========================================\n";
    $email_content .= " NEW CONTACT FORM SUBMISSION\n";
    $email_content .= "==========================================\n\n";
    $email_content .= "Full Name:            " . $name . "\n";
    $email_content .= "Email Address:        " . $email . "\n";
    $email_content .= "Phone Number:         " . $phone . "\n";
    $email_content .= "Subject:              " . $subject . "\n\n";
    $email_content .= "Message / Description:\n";
    $email_content .= $description . "\n\n";
    $email_content .= "==========================================\n";

    $headers  = "From: Shree Vasuki Website <devilsun807@gmail.com>\r\n";
    $headers .= "Reply-To: $name <$email>\r\n";
    $headers .= "MIME-Version: 1.0\r\n";
    $headers .= "Content-Type: text/plain; charset=UTF-8\r\n";

    // Gmail SMTP directives for PHP mailer environment
    ini_set("SMTP", "smtp.gmail.com");
    ini_set("smtp_port", "587");
    ini_set("sendmail_from", "devilsun807@gmail.com");

    if (mail($to_email, $email_subject, $email_content, $headers)) {
        http_response_code(200);
        echo json_encode(["status" => "success", "message" => "All details sent directly to devilsun807@gmail.com!"]);
    } else {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "Unable to send message."]);
    }
} else {
    http_response_code(403);
    echo json_encode(["status" => "error", "message" => "Forbidden."]);
}
?>

<?php
include "Connection.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
    try 
    { 
        if(!empty ($_POST['username']) && !empty ($_POST['email']) && !empty ($_POST['phone']) && !empty ($_POST['appointment_date']) && !empty ($_POST['appointment_time'])) 
        {

            $username = $_POST['username'];
            $email = $_POST['email'];
            $phone = $_POST['phone'];
            $appointment_date = $_POST['appointment_date'];
            $appointment_time = $_POST['appointment_time'];


            $sql = "INSERT INTO appointments (username, email, phone, appointment_date, appointment_time) VALUES ('$username', '$email', '$phone', '$appointment_date', '$appointment_time')";
            if ($connection->query($sql) == TRUE) 
            {
                require_once 'mail.php';
                $mail->setFrom('mustafafares29@gmail.com', 'steavo');
                $mail->addAddress('mustafafares29@gmail.com');
                $mail->Subject = 'رسالة تجريبية';
                $mail->IsHTML(true);
                $mail->Body = "لقد تم حجز موعد <br>" .
                    "اسم العميل: $username <br>" .
                    "رقم العميل: $phone <br>" .
                    "البريد الإلكتروني الخاص به: $email <br>" .
                    "موعد المقابلة: $appointment_date <br>" .
                    "ساعة المقابلة: $appointment_time <br>";
                if ($mail->send()) 
                {
                    include 'success_page.php';
                } 
                else
                {
                    echo "Email not send successfully";
                }
            }
            else
            {
                echo "there are problim ";
            }
        } 
    }
    catch (Exception $e) 
    {
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }
}

?>
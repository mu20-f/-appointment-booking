# booking Apointment

Small website to make booking appointment and send message to email by PHPMAILER library

### [PHPMAILER](https://github.com/PHPMailer/PHPMailer) 
```
it is a popular open-source library for sending emails from PHP applications.
It provides a set of classes and methods that simplify the process of sending emails,
allowing developers to send emails via SMTP, mail()
```


**HOW TO USE IT**


1- download [composer](https://getcomposer.org)

2- download PHPMAILER by write this in cmd 
```
composer require phpmailer/phpmailer
```
3- make some options on your Email from Security it is most important to enable send message to this email
  - app password 
  - 2 step verification
4- add this code
```
<?php
//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require 'vendor/autoload.php';

//Create an instance; passing `true` enables exceptions
$mail = new PHPMailer(true);

try {
    //Server settings
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'youremail@gmail.com';                     //SMTP username
    $mail->Password   = 'your app password';                               //SMTP password
    $mail->SMTPSecure = "tls";            //Enable implicit TLS encryption
    $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`


    //Recipients
    $mail->setFrom('from@example.com', 'Mailer');
    $mail->addAddress('joe@example.net', 'Joe User');     //Add a recipient
    
    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = 'Here is the subject';
    $mail->Body    = 'This is the HTML message body <b>in bold!</b>';

    $mail->send();
    ?>
```

5- Change this 
```
    $mail->Username   = 'youremail@gmail.com';                     //email you want to send him msg 
    $mail->Password   = 'your app password';                               //app password you take it from your email 
    $mail->SMTPSecure = "tls";            //Enable implicit TLS encryption or "ssl"
    $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set or 465


    $mail->setFrom('from@example.com', 'Mailer');         //add from who Email
    $mail->addAddress('joe@example.net', 'Joe User');     //Add a recipient Email
```
6- Add your message 
```
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = 'Here is the subject';              //subject of message
    $mail->Body    = 'This is the HTML message body <b>in bold!</b>';   // here your message 
```
7- Send it by 
```
$mail->send();
```
![Main page](https://github.com/mu20-f/-appointment-booking/assets/159249321/1f0a93fd-57e2-4f84-95e0-bd47bae3c862)
![book an appointment page](https://github.com/mu20-f/-appointment-booking/assets/159249321/bc02a0de-2b34-419c-996c-ee111c34dac1)
![View Appointment page](https://github.com/mu20-f/-appointment-booking/assets/159249321/4cebee2f-a6f2-441e-b118-fa7a0204ab59)



**HOW TO RUN PROJECT**

  1- run your localhost like XAMPP
  
  2- create database and import appointmentscheduler
  
  3- download phpmailer and Set his settings
  
  4- change Connection.php setting if you need 

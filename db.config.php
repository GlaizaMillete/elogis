<?php
    $host = 'localhost';
    $user = 'root';
    $psw = '';
    $dbname = 'login';
    $con = mysqli_connect($host,  $user,  $psw,  $dbname);
    if(mysqli_connect_errno()) {  
        die("Failed to connect with MySQL: ". mysqli_connect_error());  
    }  
?>

<?php
    $dbhost ='localhost';
    $dbuser = 'root';
    $dbpsw = '';
    $dbname = 'elogis';
    $con = mysqli_connect($dbhost,  $dbuser,  $dbpsw,  $dbname);
    if(mysqli_connect_errno()) {  
        die("Failed to connect with MySQL: ". mysqli_connect_error());  
    }
?>


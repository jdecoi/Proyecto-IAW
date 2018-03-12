<?php
session_start();

$_SESSION['canaccess'] = false;
    header('Location: login.php');
    exit;


?>
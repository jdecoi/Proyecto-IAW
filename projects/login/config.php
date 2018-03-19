<?php

define('DB_HOST', 'localhost');
define('DB_NAME', 'tienda');
define('DB_USER', 'tienda_user');
define('DB_PASSWORD', 'usuario');

$mysqli = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
mysqli_set_charset($mysqli, "utf8mb4");
?>
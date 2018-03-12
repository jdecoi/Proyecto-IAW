<!doctype html>

<?php

session_start();

include('config.php');

$email = $_POST['email'];
$password= md5($_POST['password']);

$result = mysqli_query($mysqli, "SELECT * FROM usuario");

$query = "SELECT * FROM usuario WHERE email='$email' AND password = '$password'";
$result = mysqli_query($mysqli, $query);
$count = mysqli_num_rows($result);

if($count >= 1) {
    $_SESSION['canaccess'] = true;
    header('Location: dashboard.php');
    exit;
} else {
    $_SESSION['canaccess'] = false;
   //echo "ERROR";
}


//while($res = mysqli_fetch_array($result)) {
  //  echo "<h2>ID:".$res['id']."</h2>";
    //echo "<h2>email:".$res['email']."</h2>";
    //echo "<h2>password:".$res['password']."</h2>";
    //echo "<h2>nombre:".$res['nombre']."</h2>";
//}

mysqli_close($mysqli);

?>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="/../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/../css/signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
    <form class="form-signin" method="POST">
      <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
      <label for="Email" class="sr-only">Email address</label>
      <input type="email" name="email" class="form-control" placeholder="Email address" required autofocus>
      <label for="Password" class="sr-only">Password</label>
      <input type="password" name="password" class="form-control" placeholder="Password" required>
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      <p class="mt-5 mb-3 text-muted">&copy; 1789-2018</p>
    </form>
  </body>
</html>

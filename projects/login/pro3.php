<!doctype html>
<html>
<title>Productos AMD</title>
<body>
<?php
include("config.php");

$result = mysqli_query($mysqli, "SELECT * FROM producto where codigo_fabricante = 3");

echo "<table class=\"table table-striped\">";
  	
		echo "<thead>";
		echo "<tr>";
        echo "<th>NOMBRE</th>";
        echo "<th>PRECIO</th>";
		echo "</tr>";
		echo "</thead>";

while ($row = mysqli_fetch_array($result)){
    echo "<tr>";
    echo "<th>".$row['nombre']."</th>";
    echo "<th>".$row['precio']."</th>";
    echo "</tr>";
    	
} 
?>
</table>
</body>
</html>
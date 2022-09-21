<?php
$servername = "10.10.20.15";
$username = "vagrant";
$password = "vagrantpass";
$dbname = "vagrant";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connessione non riuscita: " . $conn->connect_error);
	echo "Connessione non riuscita";
}else{
	echo "<h1>PHP test connection</h1>
	<p>
		Connessione riuscita<br>
		Connected to $servername<br>
		DB $dbname selected<br>
	</p> ";
}

$conn->close();
?>
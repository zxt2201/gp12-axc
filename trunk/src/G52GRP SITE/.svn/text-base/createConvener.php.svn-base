    <?php
	
	require_once('dbconnect.php');
	
	$username = $_POST['username'];
	$password = $_POST['password'];

	$query = "INSERT INTO  `Members` (
	`Username` ,
	`Password` ,
	`UserType`
	) VALUES (
	'$username',  '$password',  'convener'
	);";
	mysql_query($query);
	
	header("location:main_login.php");
    ?>
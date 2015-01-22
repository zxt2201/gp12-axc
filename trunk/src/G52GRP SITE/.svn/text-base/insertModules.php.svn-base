    <?php
	
	require_once('dbconnect.php');
	
	$modules = $_POST['modules'];
	$mLength = count($modules);
	$weightings = $_POST['weightings'];
	$wLength = count($weightings);
	
	for ($i = 0; $i < $mLength; $i++) {
	$query = "UPDATE Modules SET Weighting = $weightings[$i] WHERE  Modules.MCode =  '$modules[$i]'";
	mysql_query($query);
	}
	
    ?>
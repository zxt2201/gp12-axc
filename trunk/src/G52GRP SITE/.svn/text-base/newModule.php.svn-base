    <?php
	
	require_once('dbconnect.php');
	
	$module = $_POST['module'];
	$weighting = $_POST['weighting'];
	$convener = $_POST['convener'];
	$date = $_POST['date'];
	
	$query = "INSERT INTO `Modules` (`MCode`, `Weighting`, `Convener`, `DueDate`) VALUES ('$module', '$weighting', '$convener', '$date')";
	mysql_query($query);
	
    ?>
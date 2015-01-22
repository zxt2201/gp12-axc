<html>
<head>
	<title>Group PHP file</title>
	<meta http-equiv="Content-Type" content="text/html /">
	<link rel="stylesheet" type="text/css" href="styles.css" />

</head> 

<?php
require_once('dbconnect.php');
?>

<body>
<h1>GRP</h1>
Working
<?php

$query = "SELECT * FROM Modules";

$result = mysql_query($query);

echo "<br>";
echo "<table>";
echo "<tr>";
echo "<th>MCode</th>" . "<th>Weighting</th>";
echo "</tr>";

while ($row = mysql_fetch_array($result))
{
	echo "<tr>";
	echo "<td>" . $row['MCode'] . "</td>";
	echo "<td>" . $row['Weighting'] . "</td>";
	echo "</tr>";
}

echo "</table>";

?>
</body>
</html>

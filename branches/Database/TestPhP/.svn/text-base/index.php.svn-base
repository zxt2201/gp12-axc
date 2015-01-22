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

$query = "SELECT SID1, SID2 FROM Student NATURAL JOIN PeerMark";


$result = mysql_query($query);

echo "<br>";
echo "<table>";
echo "<tr class = \"tablehead\">";
echo "<th>SID1</th>" . "<th> SID2</th>";
echo "</tr>";

while ($row = mysql_fetch_array($result))
{
	echo "<tr>";
	echo "<td>" . $row['SID1'] . "</td>";
	echo "<td>" . $row['SID2'] . "</td>";
	
	echo "</tr>";
}

echo "</table>";
?>
</body>
</html>

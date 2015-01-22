<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="main.css" />
    <?php
require_once('dbconnect.php');
?>
	<!--http://jsfiddle.net/T8t2r/132/ %% http://stackoverflow.com/questions/11574586/expand-collapse-table-rows-with-nested-rows-->
    <script src="jquery-1.9.0.min.js"></script>
    <style type="text/css">
    .child {
    display:none;
    }
    </style>
    <script type="text/javascript"> 
$(document).ready(function() {

    $(document).ready(function() {

    function getChildren($row) {
        var children = [];
        while($row.next().hasClass('child')) {
             children.push($row.next());
             $row = $row.next();
        }            
        return children;
    }        

    $('.parent').on('click', function() {

        var children = getChildren($(this));
        $.each(children, function() {
            $(this).toggle();
        })
    });

})
    
}) 
	
    </script> 
</head>
<body>
<?php

$modName = $_GET["modName"];

$query = "SELECT * FROM Groups WHERE MCode = '$modName'";

$result = mysql_query($query);

echo "<table border = \"0\" cellpadding=\"0\" id=\"mytable\">";
echo "<tr>";
echo "<th align=\"left\">Group Name</th>" . "<th>Completed</th>"."<th>Mark</th>"."<th>Module</th>";
echo "</tr>";

while ($row = mysql_fetch_array($result))
{
	echo "<tr class = \"parent\">";
	echo "<td>" . $row['GName'] . "</td>";
	echo "<td name=\"completed\" class = \"completed\">" . $row['GCompleted'] . "</td>";
	echo "<td name=\"initial\" class = \"mark\">" . $row['GMark'] . "</td>";
	echo "<td name=\"module\" class = \"module\">" . $row['MCode'] . "</td>";
	echo "</tr>";
	
	$groupName = $row['GName'];
	
	$query2 = "SELECT DISTINCT fullName, iMark
	FROM (
	StuGroup
	JOIN Student ON StuGroup.SID = Student.SID
	)
	WHERE GName = '$groupName'";

	$result2 = mysql_query($query2);

	while ($row = mysql_fetch_array($result2)) {
	echo "<tr class = \"child\">";
        echo "<td>".$row['fullName']."</td>";
	echo "<td>".$row['iMark']."</td>";
	echo "</tr>";
	}
}

echo "</table>";

?>

</body>
</html>
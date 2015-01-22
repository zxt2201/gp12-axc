<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
  <link rel="stylesheet" type="text/css" href="site.css" >
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>Groups</title>
<script type="text/javascript" src="mktree.js"></script>

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
<script>
var edited = 'false';

function editGMark() {
if (edited == 'false') {
edited = 'true';
document.getElementById("groupMark").innerHTML= "SAVE CHANGES";
} else {
var groups = new Array();
var groupsArr = new Array();
var marks = new Array();
var marksArr = new Array();
groups = document.getElementsByName('gName');
marks = document.getElementsByName('entry');

for (var i = 0; i < groups.length; i++) {
groupsArr[i] = groups[i].innerHTML;
marksArr[i] = marks[i].value;
}
edited = 'false';
document.getElementById("groupMark").innerHTML= "ADD GROUP MARK";
	$.ajax({
	url: "alterGMark.php",
	type: "POST",
	dataType: "json",
	data: {groups: groupsArr, marks: marksArr},
	});
//Work out all the relevant individual marks as a result	
for (var i = 0; i < groups.length; i++) {
$.ajax({
	url: "indivMark.php",
	type: "POST",
	dataType: "json",
	data: {group: groupsArr[i]},
	});
}
alert("changes should been made");
self.location = location;	
}	
editable();
}

var visible = "all";

function uncompleted() {
var groups = new Array();
var groupArr = new Array();
groups = document.getElementsByName('group');
for (var i = 0; i < groups.length; i++) {
//check whether an ticked/completed group is shown
if (groups[i].cells[1].innerHTML == "<img src=\"checked.png\">") {
//check if completed groups are currently visible
if (visible == "all") {
document.getElementById("completed").innerHTML = "SHOW ALL";
groups[i].style.display = "none";
visible = "uncompleted";
} else {
document.getElementById("completed").innerHTML = "HIDE COMPLETED";
groups[i].style.display = "table-row";
visible = "all"
}
}
}
}

//url vars getter referenced from http://papermashup.com/read-url-get-variables-withjavascript/

function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}

var modName = getUrlVars()["modName"];

function addGroup() {
   var match = 'notMatch';

   //get all existing groups from database for name check
    var existingGroups = <?php 
    $modName = $_GET["modName"];
    $dataArray = array();
    $query = "SELECT DISTINCT GName FROM Groups";
    $result = mysql_query($query);
    $i = 0;	
    while ($row = mysql_fetch_array($result)) {
    $dataArray[$i] = $row['GName'];
    $i++;
    }
    echo json_encode($dataArray); 
    ?>;

   var groupSelect = prompt("Please enter desired group name","");
   var groupString = groupSelect.toString();
   //Check that a valid group name has been stated
   if (groupString !=null && groupString != "" && groupString.length <= 10) {
   //Cycle through all the group names, check if there is a group with the same name
   for (var j = 0; j < existingGroups.length; j++) {
		if (groupString == existingGroups[j]) {
		match = 'match';
		}
   }
   if (match != 'match') {
		$.ajax({
		url: "newGroup.php",
		type: "POST",
		dataType: "json",
		data: {group: groupString, modName: modName},
		}); 

		self.location = ("groups.php?modName=" + modName);
		alert("The group named " + groupString + " has been succesfully added.");
   } else {
   alert("Existing Group with that name, please re-enter");
   }
   } else {
   alert("Invalid Group Name Entry");
   }
   }
   
    var color;
    var blank = "";
    function deleteGroup() {
    arr = document.getElementsByName("group");
    for (var i = 0; i< arr.length; i++ ) {
    color = (document.getElementsByName("group")[i].style.backgroundColor);
    //Check if there is a selected module
    if (!color == blank) {
	var groupName = document.getElementsByName("group")[i].cells[0].innerHTML;
	var conf = confirm("Are you sure you wish to delete the group named " + groupName + "?");
	if (conf == true) {
	$.ajax({
		url: "deleteGroup.php",
		type: "POST",
		dataType: "json",
		data: {group: groupName},
		});
		self.location = ("groups.php?modName=" + modName);
		alert("The group named " + groupName + " has been succesfully deleted.");
    }
	}
    }
    }

    $(document).ready(function() {
    function getChildren($row) {
        var children = [];
	if (edited == 'false') {
             while($row.next().hasClass('child')) {
             children.push($row.next());
             $row = $row.next();
	}            
        return children;
	}
    }        
	
    $('.parent').on('click', function() {
	if (edited == 'false') {
        var children = getChildren($(this));
        $.each(children, function() {
            $(this).toggle();
	    //$(this).css('background-color', 'rgb(200,200,200)');
        })
	}
    });
})
	
onload=function() {
var arr = new Array(); 
arr = document.getElementsByName("completed"); 
for (var i = 0; i < arr.length; i++){
var value = document.getElementsByName("completed")[i].innerHTML;
if (value == 'Y') {
document.getElementsByName("completed")[i].innerHTML="<img src='checked.png'>";
} else {
document.getElementsByName("completed")[i].innerHTML="<img src='unchecked.png'>";
}
}

//On entry to the page calculate any individual marks for group members

var groups = new Array();
groups = document.getElementsByName('gName');
	
for (var i = 0; i < groups.length; i++) {
	$.ajax({
	url: "indivMark.php",
	type: "POST",
	dataType: "json",
	data: {group: groupsArr[i]},
	});
}
}

function addStudents() {
	arr = document.getElementsByName("group");
    for (var i = 0; i< arr.length; i++ ) {
    color = (document.getElementsByName("group")[i].style.backgroundColor);
    //Check if there is a selected module
    if (!color == blank) {
	var groupName = document.getElementsByName("group")[i].cells[0].innerHTML;
	self.location = ("students.php?modName=" + modName + "&gName="+ groupName);
	}
    }
}

function adjustAssessments(gName, sID) {
self.location = ("adjustAssessments.php?modName=" + modName + "&gName="+ gName + "&sID=" + sID);
}

function logOut() {
var r = confirm("Are you sure you wish to quit? Unsaved data will be lost");
	if(r == true) 
	{
		self.location = ("main_login.php");
	}
}
</script>

</head>
<div id = "wrap">
  <body>
  <div id = "header">
  <img class = "floatleft"src="smallerlogo.png" alt="logo">
  </div>
  <div id = "rightcol">
  <table border = "0" cellpadding="3">
	<tr>
	<td><button type="button" class= "logout" onclick="logOut()">LOG OUT</button></br></br></br></td>
	</tr>
	<tr>
	<td><a href="home.html"><button type="button" class= "button">HOME</button></a></td>
	</tr>
	<tr>
	<td><button type="button" class= "button" id="completed" onclick="uncompleted()">HIDE COMPLETED</button></td>
	</tr>
	<tr>
	<td><button type="button" class= "button" onclick="addStudents()">ADD STUDENTS</button></td>
	</tr>
	<tr>
	<td><button type="button" class= "button" onclick="addGroup()" >ADD GROUP</button></td>
	</tr>
	<tr>
	<td><button type="button" class= "button" id="groupMark" onclick="editGMark()">ADD GROUP MARK</button></td>
	</tr>
	<tr>
	<td><button type="button" class= "button" onclick="deleteGroup()">DELETE GROUP</button></td>
	</tr>
</table>	
    </div>
    <div id = "leftcolumn">   
	
<?php

$query = "SELECT * FROM Groups WHERE MCode = '$modName'";

$result = mysql_query($query);

echo "<table border = \"0\" cellspacing = \"0\" cellpadding=\"1\">";
echo "<tr>";
echo "<th align=\"left\" width=\"190px\">Group Name</th>" . "<th width=\"130px\">PA's Completed</th>"."<th width=\"85px\" align=\"center\">Mark</th>"."<th width=\"170px\">Module</th>";
echo "</tr>";

while ($row = mysql_fetch_array($result))
{
	echo "<tr name =\"group\" class = \"parent\" onclick=\"toggleGroups(this)\">";
	echo "<td name=\"gName\">" . $row['GName'] . "</td>";
	echo "<td name=\"completed\" class = \"completed\">" . $row['GCompleted'] . "</td>";
	echo "<td name=\"initial\" class = \"mark\"   style=\"font-weight: bold;\" >" . $row['GMark'] . "</td>";
	echo "<td name=\"module\" class = \"module\">" . $row['MCode'] . "</td>";
	echo "</tr>";
	
	$groupName = $row['GName'];
	
	$query2 = "SELECT DISTINCT fullName, SComplete ,iMark, StuGroup.SID
	FROM (
	StuGroup
	JOIN Student ON StuGroup.SID = Student.SID
	)
	WHERE GName = '$groupName'";

	$result2 = mysql_query($query2);

	while ($row = mysql_fetch_array($result2)) {
	echo "<tr class = \"child\">";
	echo "<td>".$row['fullName']."</td>";
	echo "<td name=\"completed\" class = \"completed\">".$row['SComplete']."</td>";
	echo "<td align=\"center\">".$row['iMark']."</td>";
	echo "<td align=\"center\">"."<button type=\"button\" class=\"button\" onclick=\"adjustAssessments('$groupName',".$row['SID'].")\">ADJUST PA'S</button>"."</td>";
	echo "</tr>";
	}
}

echo "</table>";
?>
    </div> 
   <div id = "footer">  
  <a href="modules.php"><button type="button" class= "button" >PREVIOUS</button></a>
</div>
</body>
</div>
</html>
<?php
session_save_path('/lhome/dxm01u/php_sessions');
ini_set('session.gc_probability',1);

session_start();
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
  <link rel="stylesheet" type="text/css" href="site.css" >
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>Modules</title>

<?php
require_once('dbconnect.php');
?>
<script src="jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="mktree.js"></script>

</head>
<div id = "wrap">
  <body>
  <div id = "header">
  <img class = "floatleft" src="smallerlogo.png" alt="logo">
  </div>
  <div id = "rightcol">
  <table border = "0" cellpadding="3">
  <tr>
	<td><button type="button" class= "logout">LOG OUT</button></br></br></br></td>
	</tr>
	<tr>
	<td><button type="button" class= "button" id="weighting" onclick="saveWeights()">CHANGE WEIGHTING</button></td>
	</tr>
	<tr>
	<td><button type="button" class= "button" onclick="viewGroups()">VIEW GROUPS</button></td>
	</tr>
	<tr>
	<td><button type="button" class= "button" id = "addMod" onclick="addMod()">ADD MODULE</button></td>
	</tr>
	<tr>
	<td><button type="button" class= "button" onclick="deleteModule()">DELETE MODULE</button></td>
	</tr>
</table>	
    </div>

    <div id = "leftcolumn">
	
<?php

$convenerID = $_SESSION['username'];

$query = "SELECT * FROM Modules WHERE Convener = '$convenerID'";

$result = mysql_query($query);
echo "<table border = \"0\" cellspacing = \"0\" cellpadding=\"1\">";
echo "<tr>";
echo "<th align=\"left\" width = \"420px\"> Module Name</th>" . "<th>Weighting</th>";
echo "</tr>";

while ($row = mysql_fetch_array($result))
{
	echo "<tr name = \"module\" onclick = \"toggle(this)\">";
	echo "<td name=\"moduleName\" >" . $row['MCode'] . "</td>";
	echo "<td id =\"weighting\" name=\"initial\" class = \"completed\">" . $row['Weighting'] . "</td>";
	echo "</tr>";
}

echo "</table>";

?>
<script> 	

	//url vars getter referenced from http://papermashup.com/read-url-get-variables-withjavascript/

	function getUrlVars() {
	var vars = {};
	var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
	});
	return vars;
	}
 	
	var arr = new Array(); 
	arr = document.getElementsByName("initial"); 
	var checkType = 'nonEntry';
	var values = new Array();
	var newVals = new Array();

	function saveWeights() {
	var module = new Array();
	var modules = new Array();
	var initial = new Array();
	var entry = new Array();
	var weightings = new Array();
	module = document.getElementsByName('moduleName');
	initial = document.getElementsByName('initial');
	entry = document.getElementsByName('entry');
	if (initial.length > entry.length) {
	document.getElementById("weighting").innerHTML= "SAVE CHANGES";
	} else {
	document.getElementById("weighting").innerHTML= "CHANGE WEIGHTING";
	for (var i = 0; i < entry.length; i++) {
	modules[i] = module[i].innerHTML;
	weightings[i] = entry[i].value;
	}
	$.ajax({
	url: "insertModules.php",
	type: "POST",
	dataType: "json",
	data: {modules: modules, weightings: weightings},
	});
	}
	
	if (checkType == 'nonEntry' ) {
        for (var i = 0; i < arr.length; i++) {
	    var value = document.getElementsByName("initial")[i].innerHTML;
	    values.push(value);
	    document.getElementsByName("initial")[i].innerHTML="<input type=\"text\" name=\"entry\" value=\"" + value + "\" size=\"8\" />";
	    }
	    checkType = 'Entry';
	} else if (checkType == 'Entry') {
           for (var j = 0; j < values.length; j++) {
	    document.getElementsByName("initial")[j].innerHTML=document.getElementsByName("entry")[0].value;
	    checkType = 'nonEntry';
	    }
	}	
	}
   
   function addMod() {
   var convener = "<?php echo $convenerID ?>";
   var match = 'notMatch';
   var modules = new Array();
   var moduleArr = new Array();
   modules = document.getElementsByName('moduleName');
   for (var i = 0; i < modules.length; i++) {
   moduleArr[i] = modules[i].innerHTML;
   }
   var moduleSelect = prompt("Please enter desired module name","");
   var modString = moduleSelect.toString().toUpperCase();
   if (modString !=null && modString != "" && modString.length <= 6) {
   for (var j = 0; j < moduleArr.length; j++) {
		if (modString == moduleArr[j]) {
		match = 'match';
		}
   }
   if (match != 'match') {
   var weighting = prompt("Please enter desired weighting","");
   var weightString = weighting.toString();
	    if (weightString != null & weightString != "" & weighting <= 1) {
		$.ajax({
		url: "newModule.php",
		type: "POST",
		dataType: "json",
		data: {module: modString, weighting: weightString, convener: convener},
		});
		self.location = ("modules.php");
		alert("The module named " + modString + " has been succesfully added.");
        } else {
		weightString = "0.6";
		$.ajax({
		url: "newModule.php",
		type: "POST",
		dataType: "json",
		data: {module: modString, weighting: weightString, convener: convener},
		});
		self.location = ("modules.php?");
		alert("Incorrect weighting: The module named " + modString + " has been added, with the default weighting of 0.6.");
        }
   } else {
   alert("Existing Module with that code, please re-enter");
   }
   } else {
   alert("Invalid Module Name Entry");
   }
   }
   
    var color;
    var blank = "";
    function deleteModule() {
    arr = document.getElementsByName("module");
    for (var i = 0; i< arr.length; i++ ) {
    color = (document.getElementsByName("module")[i].style.backgroundColor);
    //Check if there is a selected module
    if (!color == blank) {
	var modName = document.getElementsByName("module")[i].cells[0].innerHTML;
	var conf = confirm("Are you sure you wish to delete the module named " + modName + "?");
	if (conf == true) {
	$.ajax({
		url: "deleteModule.php",
		type: "POST",
		dataType: "json",
		data: {module: modName},
		});
		self.location = ("modules.php");
		alert("The module named " + modName + " has been succesfully deleted.");
	}
	}
    }
	}
 </script>  
	</div> 
   <div id = "footer">  
  <a href="home.html"><button type="button" class= "button" >HOME</button></a>
</div>
</body>
</div>
</html>
//Added own functions

var arr = new Array(); 
arr = document.getElementsByName("initial"); 
var checkType = 'nonEntry';
var values = new Array();
var newVals = new Array();

function editable() {
	    if (checkType == 'nonEntry' ) {
        for (var i = 0; i < arr.length; i++) {
	    var value = document.getElementsByName("initial")[i].innerHTML;
	    values.push(value);
	    document.getElementsByName("initial")[i].innerHTML="<input type=\"text\" name=\"entry\" value=\"" + value + "\" size=\"8\" />";
	    }
	    checkType = 'Entry';
	    } else if (checkType == 'Entry'){
        for (var j = 0; j < values.length; j++) {
	    document.getElementsByName("initial")[j].innerHTML=document.getElementsByName("entry")[0].value;
	    checkType = 'nonEntry';
	    }
	    }		
}

function toggle(it) {

  arr = document.getElementsByName("module");
  if ((it.style.backgroundColor == "none") || (it.style.backgroundColor == "")) {
    for (var i = 0; i< arr.length; i++ ) {
    document.getElementsByName("module")[i].style.backgroundColor = "";
    }
    it.style.backgroundColor = "rgb(230,230,230)"; 
    }
}

function toggleGroups(it) {
  arr = document.getElementsByName("group");
  if ((it.style.backgroundColor == "none") || (it.style.backgroundColor == "")) {
    for (var i = 0; i< arr.length; i++ ) {
    arr[i].style.backgroundColor = "";
    }
    it.style.backgroundColor = "rgb(230,230,230)"; 
    }
}

var color;
var blank = "";

function viewGroups() {
    arr = document.getElementsByName("module");
    for (var i = 0; i< arr.length; i++ ) {
    color = (document.getElementsByName("module")[i].style.backgroundColor);
    if (!color == blank) {
    var selectedMod = document.getElementsByName("module")[i].cells[0].innerHTML;
    window.location = ("groups.php?modName="+selectedMod);
    return false;
    }
    }
}

function startPA() {
    arr = document.getElementsByName("module");
    for (var i = 0; i< arr.length; i++ ) {
    color = (document.getElementsByName("module")[i].style.backgroundColor);
    if (!color == blank) {
	var selectedMod = document.getElementsByName("module")[i].cells[0].innerHTML;
    window.location = ("researchInput.php?studID="+selectedMod);
    return false;
    }
    }
}
function pickStudents() {
    arr = document.getElementsByName("module");
    for (var i = 0; i< arr.length; i++ ) {
    alert("in here");
    color = (document.getElementsByName("module")[i].style.backgroundColor);
    if (!color == blank) {
	var selectedMod = document.getElementsByName("module")[i].cells[0].innerHTML;
    var groupName = document.getElementsByName("module")[i].cells[1].innerHTML;
    window.location = ("selectStudent.php?modCode=" + selectedMod + "&gName=" + groupName);
    return false;
    }
    }
}

function backToSelect() {
	var r=confirm("Quitting now means your data so far will be lost! Are you sure you want to abandon this assessment?");
	if(r==true)
	{
		window.location = ("selectStudent.php");
	}
}

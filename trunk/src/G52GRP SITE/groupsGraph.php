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

$dataName = $_GET["data"];

$sql = "select fullName, IMark from Student JOIN StuGroup ON  Student.SID = StuGroup.SID WHERE GName = '$dataName'";

//$sql = "select GName , GMark from Groups WHERE MCode = 'G52APR'";

$result = mysql_query($sql);

$arrY = array();
$arrX = array();
$average = array();

$i = 0;
while ($row = mysql_fetch_array($result)) {
	if ($row['IMark'] == 0) {
	$arrY[$i] = 0;
	} else {
    $arrY[$i] = $row['IMark'];
	}
    $arrX[$i] = $row['fullName'];
	$i++;
}

$entrycount = mysql_num_rows($result);

//if ($entrycount > 1 ) {
//$averageMark = 0;
//for ($j = 0; $j < $entrycount; $j++) {
//$averageMark = $averageMark + $arrY[$j];
//}
//$arrY[$i] = $averageMark/$entrycount;
//$arrX[$i] = "Average";
//}

if ($entrycount > 1 ) {
$averageMark = 0;
for ($j = 0; $j < $entrycount; $j++) {
$averageMark = $averageMark + $arrY[$j];
}
//$arrY[$i] = $averageMark/$entrycount;
for ($j = 0; $j < $entrycount; $j++) {
$average[$j] = $averageMark/$entrycount;
}
//$arrX[$i] = "Average";
}


//print_r($arrY);
//print_r($arrX);

function s1tostr($nums) {
    $output = "";
    foreach($nums as $num) {
        $output .= $num.',';
    }
    return substr($output, 0, strlen($output) - 1);
}

function ytostr($nums) {
    $output = "";
    foreach($nums as $num) {
        $output .= '\''.$num.'\',';
    }
    return substr($output, 0, strlen($output) - 1);
}

?>

<!--http://jsfiddle.net/T8t2r/132/ %% http://stackoverflow.com/questions/11574586/expand-collapse-table-rows-with-nested-rows-->
    <script src="jquery-1.9.0.min.js"></script>
    <style type="text/css">
    .child {
    display:none;
    <!--background-color:rgb(230,230,230);-->
    }
    </style>
    <link rel="stylesheet" type="text/css" href="./jquery.jqplot.css" />

<script type="text/javascript" src="./jquery.js"></script>
<script type="text/javascript" src="./jquery.jqplot.min.js"></script>
<script type="text/javascript" src="./plugins/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="./plugins/jqplot.pieRenderer.min.js"></script>
<script type="text/javascript" src="./plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="./plugins/jqplot.pointLabels.min.js"></script>
<link rel="stylesheet" type="text/css" hrf="../jquery.jqplot.min.css" />

   <script type="text/javascript">

   function previous() {
   self.location = "graphs.php"
   }
   
   function logOut() {
   var r = confirm("Are you sure you wish to quit? Unsaved data will be lost");
   if(r == true) 
   {
	self.location = ("main_login.php");
   }
   }
   
   $(document).ready(function(){
            $.jqplot.config.enablePlugins = true;
            var s1 = [<?php echo s1tostr($arrY);?>];
            var ticks = [<?php echo ytostr($arrX);?>];
			var trend = [<?php echo s1tostr($average);?>];
             
            plot1 = $.jqplot('chart1', [s1, trend], {
                // Only animate if we're not using excanvas (not in IE 7 or IE 8)..
                animate: !$.jqplot.use_excanvas,
				seriesDefaults:{
                rendererOptions:{
                   barWidth: 80,
                }
				}, 
                series: [
                {label:'Group Mark',renderer:$.jqplot.BarRenderer},
                {label: 'Average Mark: <?php echo $average[0];?>',pointLabels: { show:false } }
                ],
				legend: {
                show: true,
                location: 'e',
                placement: 'outside'
				},
                axes: {
                    xaxis: {
                        renderer: $.jqplot.CategoryAxisRenderer,
                        ticks: ticks,
						minPad: 0
                    }
                },
                highlighter: { show: false }
		}
		
		/*seriesDefaults: {
		renderer: jQuery.jqplot.PieRenderer, 
		rendererOptions: {
		// Turn off filling of slices.
		fill: false,
		showDataLabels: true, 
		// Add a margin to seperate the slices.
		sliceMargin: 4, 
		// stroke the slices with a little thicker line.
		lineWidth: 5
		}
		}, 
		legend: { show:true, location: 'e' }
		}*/
	    );
         
            $('#chart1').bind('jqplotDataClick', 
                function (ev, seriesIndex, pointIndex, data) {
                    $('#info1').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
                }
            );
        });


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
  </table>
	<p align="center"><b><?php echo strtoupper($dataName); ?> INDIVIDUAL MEMBER MARKS</b></p>
    </div>
    <div id = "leftcolumn">   
	<div id="chart1" style="margin-top:20px; margin-left:20px; width:500px; height:460px; align:right;"></div>
    </div> 
   <div id = "footer">  
  <button type="button" class= "button" onclick="previous()">PREVIOUS</button>
</div>
</body>
</div>
</html>
<?php 
//content="text/plain; charset=utf-8"
require_once ('dbconnect.php');
//require_once ('jpgraph/jpgraph_bar.php');




//$data = mysql_query("SELECT GMark FROM Groups WHERE GName = 'gp12-axc'") 
//or die(mysql_error()); 
$datay=array(20,50,60,80);

while(datay != null){

// Create the graph. These two calls are always required
$graph = new Graph(350,220,'auto');
$graph->SetScale("textlin");

$theme_class="DefaultTheme";
$graph->SetTheme(new $theme_class());

// set major and minor tick positions manually
$graph->yaxis->SetTickPositions(array(0,10,20,30,40,50,60,70,80,90,100), array(15,45,75,105,135));
$graph->SetBox(true);

//$graph->ygrid->SetColor('gray');
$graph->ygrid->SetFill(true);
$graph->xaxis->SetTickLabels(array('gp12-axc','groupb','groupC','groupD'));
$graph->yaxis->HideLine(false);
$graph->yaxis->HideTicks(false,false);

// Create the bar plots
$b1plot = new BarPlot($datay);

// ...and add it to the graPH
$graph->Add($b1plot);


$b1plot->SetColor("black");
$b1plot->SetFillGradient("#000001","black",GRAD_LEFT_REFLECTION);
$b1plot->SetWidth(45);
$graph->title->Set("Bar Gradient(Left reflection)");

// Display the graph
$graph->Stroke();
}


?>
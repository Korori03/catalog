<div class="d-flex row row-eq-height my-3">
	<div class="col-md-12">
		<div class="card">
			<div class="card-header blue">
				<div class="row justify-content-end">
					<div class="col" style="font-size:18px;"><strong>Switch</strong></div>
				</div>
			</div>
			<div class="card-body no-p" style="overflow:hidden;">
				<div class="tab-content">
					<div class="tab-pane animated fadeInRightShort go active show" id="v-pills-w1-tab1" role="tabpanel" aria-labelledby="v-pills-w1-tab1">
						<div class="row p-3">
							<div class="col-md-6"style="height:300px;">
								<div id="total_pie" style="height:300px;max-width:550px;margin-left: auto;margin-right: auto;"></div>
							</div>
							<div class="col-md-6" style="height:300px; ">
								<div id="playing_donut" style="height:300px;max-width:550px;margin-left: auto;margin-right: auto;"></div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>					
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
window.onload = function() {
var objectsPlaying = {
finished: [@finished] ,
pending: [@pending]

};
donutPlaying(objectsPlaying);

var objectsTotal = {
usa: [@usa],
japanese: [@japanese],
europeon: [@europeon]

};
pieTotal(objectsTotal);

$('.canvasjs-chart-credit').remove();

}

function donutPlaying(objects){

var chart = new CanvasJS.Chart("playing_donut", {
animationEnabled: true,
zoomEnabled: false,
indexLabel:true,
data: [{
type: "doughnut",
startAngle: 240,
yValueFormatString: "##0.00\"%\"",
indexLabel: "{label} {y}",

dataPoints: [
{y: objects.finished, label: "Finished"},
{y: objects.pending, label: "Pending"}
]
}]
});
chart.render();
}

function pieTotal(objects){
var total =(objects.japanese + objects.usa + objects.europeon)  + 5;
console.log(total);
var chart = new CanvasJS.Chart("total_pie", {
animationEnabled: true,
axisY:{
maximum : total,
minimum : 0,
interval:10
},
data: [{
type: "column",

dataPoints: [
{y: objects.usa, label: "USA"},
{y: objects.japanese, label: "JAPANESE"},
{y: objects.europeon, label: "EUROPEON"}
]
}]
});
chart.render();
}
</script>
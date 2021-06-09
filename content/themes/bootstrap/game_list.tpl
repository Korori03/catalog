<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="/games">Games</a></li>
	<li class="breadcrumb-item"><a href="/games/[@subtype]">[@brand]</a></li>
	<li class="breadcrumb-item active">[@system]</li>
</ol>
<div class="d-flex row row-eq-height my-3">
	<div class="col-md-12">
		<div class="card">
			<div class="card-header blue">
				<div class="row justify-content-end">
					<div class="col" style="font-size:18px;"><strong>[@system]</strong>[@admin]</div>
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
europeon: [@europeon],
asia: [@asia],
australia: [@australia]

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
{y: objects.europeon, label: "EUROPEON"},
{y: objects.asia, label: "ASIA"},
{y: objects.australia, label: "AUSTRALIA"}
]
}]
});
chart.render();
}
</script>
					 
 <div class="row my-3">
	<div class="col-md-12">
	   <div class="card r-0 shadow">
		  <div class="table-responsive">
			 <form>
				<table class="table table-striped table-hover r-0" style="margin-bottom:0px;">
				   <thead>
					  <tr class="no-b">
						 
						 <td><input /></td>
						 <td>STATUS</td>
						 <td>STATUS</td>
					  </tr>
				   </thead>
				   
				   <tbody>
					  
					
				   </tbody>
				</table>
			 </form>
		  </div>
	   </div>
	</div>
 </div>
					 
					 <div class="row my-3">
                        <div class="col-md-12">
                           <div class="card r-0 shadow">
                              <div class="table-responsive">
								 <form>
                                    <table class="table table-striped table-hover r-0">
                                       <thead>
                                          <tr class="no-b">
                                             
                                             <th>NAME</th>
                                             <th>STATUS</th>
                                          </tr>
                                       </thead>
                                       
									   <tbody>
                                          
										  [@list]
                                       </tbody>
                                    </table>
                                 </form>
                              </div>
                           </div>
                        </div>
                     </div>
					 
					 
					 
                     [@pagin]
					 
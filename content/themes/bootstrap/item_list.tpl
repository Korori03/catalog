<ol class="breadcrumb">
	[@breadcrumbs]
</ol>
<div class="d-flex row row-eq-height my-3">
	<div class="col-md-12">
		<div class="card">
			<div class="card-header blue">
				<div class="row justify-content-end">
					<div class="col" style="font-size:18px;padding-left:15px"><strong>[@type]</strong>[@admin]</div>
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

$(function(){

	$('.single-url-link').click(function(){
		var url = $(this).attr('data-url');
		$(location).attr('href',url);
	});
});


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

var total =(objects.japanese + objects.usa + objects.europeon + objects.asia + objects.australia)  + 5;

console.log((total > 1000?Math.floor(total/100):50));
var chart = new CanvasJS.Chart("total_pie", {
animationEnabled: true,
axisY:{
maximum : total,
minimum : 0,
interval:(total > 1000?Math.floor(total/25)  * 2.5:10)
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
	<style>

.text-warning{
	color:#00BCD4 !important;
}
.letters{
	font-size: 26px;letter-spacing: 0.1em;
}
.letters a{
	padding:7px;
}
.letters a:hover,.letters a:visited,.letters a:link,.letters a:active{
	text-decoration: none;
}
</style>	
 <div class="row my-3">
	<div class="col-md-12">
	   <div class="card r-0 shadow">
		  <div class="table-responsive">
			 <form>
				<table class="table table-striped table-hover r-0" style="margin-bottom:0px;">
				   <tbody>
					  <tr class="no-b">
						 <td style="width:80% !important;"><input type="text" id="txtSearch" />
						 <input type="hidden" id="objects" value="[@objects]" /></td><td>
						 <label class="switch" data-children-count="1">
							<input type="checkbox" id="buslic" aria-label="Business License Renewal" checked="checked">
							<span class="slider"></span>
						</label></td><td>
						 <input type="button" class="btn-primary btn" id="btnSearch" value="Search" style="display:inline;width:95px;"/></td>
					  </tr>
					<tr><td style="width:100% !important;text-align: center;" colspan="3" class="letters">
						<a href="[@surl]"><strong>All</strong></a>
						<a href="[@surl]/letter/1"><strong>#</strong></a>
						<a href="[@surl]/letter/A"><strong>A</strong></a>
						<a href="[@surl]/letter/B"><strong>B</strong></a>	
						<a href="[@surl]/letter/C"><strong>C</strong></a>	
						<a href="[@surl]/letter/D"><strong>D</strong></a>	
						<a href="[@surl]/letter/E"><strong>E</strong></a>	
						<a href="[@surl]/letter/F"><strong>F</strong></a>	
						<a href="[@surl]/letter/G"><strong>G</strong></a>	
						<a href="[@surl]/letter/H"><strong>H</strong></a>	
						<a href="[@surl]/letter/I"><strong>I</strong></a>	
						<a href="[@surl]/letter/J"><strong>J</strong></a>	
						<a href="[@surl]/letter/K"><strong>K</strong></a>	
						<a href="[@surl]/letter/L"><strong>L</strong></a>	
						<a href="[@surl]/letter/M"><strong>M</strong></a>	
						<a href="[@surl]/letter/N"><strong>N</strong></a>	
						<a href="[@surl]/letter/O"><strong>O</strong></a>
						<a href="[@surl]/letter/P"><strong>P</strong></a>
						<a href="[@surl]/letter/Q"><strong>Q</strong></a>
						<a href="[@surl]/letter/R"><strong>R</strong></a>
						<a href="[@surl]/letter/S"><strong>S</strong></a>
						<a href="[@surl]/letter/T"><strong>T</strong></a>
						<a href="[@surl]/letter/U"><strong>U</strong></a>
						<a href="[@surl]/letter/V"><strong>V</strong></a>
						<a href="[@surl]/letter/W"><strong>W</strong></a>
						<a href="[@surl]/letter/X"><strong>X</strong></a>
						<a href="[@surl]/letter/Y"><strong>Y</strong></a>
						<a href="[@surl]/letter/Z"><strong>Z</strong></a>	
					</td></tr>
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
					 
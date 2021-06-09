[@breadcrumb]
<div class="d-flex row row-eq-height my-3">
	<div class="col-md-12">
		<div class="card">
			<div class="card-header blue">
				<div class="row justify-content-end">
					<div class="col" style="font-size:18px;"><strong>[@book]</strong></div>
				</div>
			</div>
			<div class="card-body no-p" style="overflow:hidden;">
				<div class="tab-content">
					<div class="tab-pane animated fadeInRightShort go active show" id="v-pills-w1-tab1" role="tabpanel" aria-labelledby="v-pills-w1-tab1">
						<div class="row p-3">
							<div class="col-md-6"style="height:300px;">
								<div id="total_pie" style="height:300px;max-width:550px;margin-left: auto;margin-right: auto;"></div>
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

var objectsTotal = {
usa: [@usa],
japanese: [@japanese],
german: [@german],
spanish: [@spanish]

};
pieTotal(objectsTotal);

$('.canvasjs-chart-credit').remove();

}


function pieTotal(objects){
var total =(objects.japanese + objects.usa)  + 5;
var interval =total < 270?10:total % 270;

var chart = new CanvasJS.Chart("total_pie", {
animationEnabled: true,
axisY:{
maximum : total,
minimum : 0,
interval: interval
},
data: [{
type: "column",

dataPoints: [
{y: objects.usa, label: "USA"},
{y: objects.japanese, label: "JAPAN"},
{y: objects.german, label: "GERMAN"},
{y: objects.spanish, label: "SPANISH"}
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
                                    <table class="table table-striped table-hover r-0">
                                       <thead>
                                          <tr class="no-b">
                                             
                                             <th>NAME</th>
                                             <th></th>
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
					 
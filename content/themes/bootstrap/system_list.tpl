
[@breadcrumb]
<div class="d-flex row row-eq-height my-3" style="margin-left:0px;margin-right:0px;margin-top:0px;">
<div class="col-md-12" style="margin-bottom:10px;margin-top:10px;padding-left:0px;padding-right:0px;">
		<div class="card">
			<div class="card-header blue">
				<div class="row justify-content-end">
					<div class="col" style="font-size:18px;padding-left:15px"><strong>Search</strong></div>
				</div>
			</div>
			<div class="card-body no-p" style="overflow:hidden;">
				<div class="tab-content" style="padding-left:5px;padding-right:5px;">


				<table class="table table-striped table-hover r-0" style="margin-bottom:0px;">
				   <tbody>
					  <tr class="no-b">
						 
						 <td style="width:80% !important;" data-children-count="1"><input type="text" id="txtSearch">
						 <input type="hidden" id="objects" value="[@objects]"></td><td>
						 <label class="switch" data-children-count="1">
							<input type="checkbox" id="buslic" aria-label="Business License Renewal" checked="checked">
							<span class="slider"></span>
						</label></td><td>
						 <input type="button" class="btn-primary btn" id="btnSearch" value="Search" style="display:inline;width:95px;"></td>
					  </tr>
					
				   </tbody>
				</table>
					
				</div>
			</div>
		</div>
	</div>
		</div>
<div class="flex-grid">

[@list]
</div>
<style>
.progress_bar_title{
	font-weight:400;
	color:#86939e;
	line-height:1.5;
	margin:0;
	font-size:1rem;
}

.progress_bar{
	height: .25rem;
	border-radius: 0!important;
	overflow: hidden;
	font-size: .75rem;
	background-color: #e9ecef;
	display: flex;
}
.progress_bar div {
	
	display: flex;
	flex-direction: column;
	justify-content: center;
	color: #fff;
	text-align: center;
	white-space: nowrap;
	background-color: #03a9f4;
	
}

.flex-grid {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  justify-content: center;
}

.flex-grid > div {
  flex: 2;
  margin: 15px;
  padding: 15px;
  background: #fbfbfb;
  border: 1px solid #bbb;
  box-shadow: 0 0 20px -3px #bbb;
  width: 330px;
  min-width: 330px;
  max-width: 330px;
  font-size: 14px;
  cursor:pointer;
}

.flex-grid h2 {
  margin: -15px -15px 15px -15px;
  padding: 12px 15px;
  font-size: 16px;
  font-weight: 400;
  border-bottom: 1px solid #ddd;
}

.flex-grid li {
  padding: 0 0 0 5px;
  display: table-cell;
}

.flex-grid div ul{
  margin-bottom: 15px;
  display: table;
  width: 100%;
  margin-left: -5px;
  text-align: center;
}


</style>
<ol class="breadcrumb">
                        <li class=""><a href="/">Directory</a></li>
                        <li class="active"><a href="/directory">Directory</a></li>
                     </ol>
                     <div class="page-heading">
                        <h1>Directory</h1>
                     </div>
                     <div class="container-fluid">

<script type="text/javascript">
	$(document).ready(function(){
		$('#btnSearchDirectory').click(function(){
			var namequery = '';
			if($('#txtName').val() !== '')
				namequery = '&name=' + $('#txtName').val();
				
			if($('#cmbDept').val() == '')
				$.jpop.alert('Please enter a department.','Intranet',{resizable:false,icon:'check',close:false});
			else 
				$(location).attr('href','index.php?view=directory&dept=' + $('#cmbDept').val() + namequery);
		});	
		$('#btnReverse').click(function(){
			if($('#txtPhone').val() !== ''){
				$.post('jquery.php',{phone:$('#txtPhone').val(),btnLookup:1},function(data){
					$.jpop.alert(data,'Intranet',{resizable:false,icon:'check',close:false},function(r){
						if(r==true)
							$('#txtPhone').focus();
					});
				});	
			}
		});
		$(document).on('keypress keydown',"#txtName",function(e) {
			if(e.which == 13) {
				$(this).blur();
				$('#btnSearchDirectory').click();
			}
		});
		$(document).on('keypress keydown',"#txtPhone",function(e) {
			if(e.which == 13) {
				$(this).blur();
				$('#btnReverse').click();
			}
		});
	});
</script>
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">Directory</h3>
	</div>
	<div class="panel-body">
		<table style="margin-left: auto; margin-right: auto; width: 500px;">
			<tr>
				<td style="width: 162px">
				<h4><span class="label label-default">Name:</span></h4>
				</td>
				<td>
				<input id="txtName" class="form-control" maxlength="500" name="txtName" type="text" value="" /></td>
			</tr>
			<tr>
				<td style="width: 162px">
				<h4><span class="label label-default">Department:</span></h4>
				</td>
				<td>
				<select id="cmbDept" class="form-control" name="cmbDept" style="width: 400px;">
				<option value="all">All</option>
				[@options]</select></td>
			</tr>
			<tr>
				<td colspan="2">
				<div style="margin-top: 20px;">
					<input id="btnSearchDirectory" class="btn btn-primary" name="btnSearchDirectory" type="button" value="Search Directory" style="float:right;" /></div>
				</td>
			</tr>
		</table>
	</div>
</div>
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">Reverse Lookup</h3>
	</div>
	<div class="panel-body">
		<table style="margin-left: auto; margin-right: auto; width: 500px;">
			<tr>
				<td style="width: 162px">
				<h4><span class="label label-default">Phone Extension:</span></h4>
				</td>
				<td>
				<div class="btnSearch" style="height: 2em; padding-right: 15px">
					<input id="txtPhone" class="form-control" maxlength="4" name="txtPhone" style="width: 400px;" type="text" value=""/></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<div style="margin-top: 10px;">
					<input id="btnReverse" class="btn btn-primary" name="btnReverse" type="button" value="Lookup" style="float:right;margin-right:15px;" /></div>
				</td>
			</tr>
		</table>
	</div>
</div>
</div>
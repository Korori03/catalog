<script type="text/javascript">
	$(function() {
		$(document).on('click', '#btnAddProfile', function() {
			var username = $("#txtEUserName").val();
			var first_name = $("#txtEFName").val();
			var last_name = $("#txtELName").val();
			var email = $("#txtEEmail").val();
			var pass1 = $("#txtEPass1").val();
			var pass2 = $("#txtEPass2").val();
			var current_pass = $("#txtECurrentPass").val();
			
			
			var admin = $("#txtEAdmin").val();
			var dept_admin = $("#txtEDeptAdmin").val();
			var web_manage = $("#txtEWebManage").val();
			var news = $("#txtENews").val();
			var important = $("#txtEImport").val();
			var tag = $("#txtETag").val();
			var files = $("#txtEFiles").val();
			var video = $("#txtEVideo").val();
			var subdept = $("#subdept").val();
			$.post("/jquery",{sub_dept: subdept, username: username, first_name: first_name,last_name: last_name,email: email,pass1: pass1,pass2: pass2,dept_admin: dept_admin,web_manage: web_manage,news: news,important: important,tag: tag,files: files,current_pass:current_pass,video:video,admin: admin,subaddprofile: 1},function(data) {
				if(data.indexOf("true") != -1)
					$(location).attr('href ','/cpanel');	
				else 
					$.FormErrorHandler(data);
			});
		});
						
		$(document).on('click ','.toggle_button',function(){
			var img_toggle = $(this).find('img').attr('class');
			var input_toggle = $(this).find('input');
			if(img_toggle == 'toggle_no'){
				$(this).find('img').attr('class','toggle_yes');
				input_toggle.val('1');
			}
			else{
				$(this).find('img').attr('class','toggle_no');
				input_toggle.val('0');
			}
		});
	});
</script><a href="javascript:history.back(-1);" style="font-size:12px;text-decoration:none;">&larr; Go Back</a>
<table style="width:675px;" cellpadding="0" cellspacing="0" class="rounded-corner">
	<tr>
		<td class="th_table th_tl th_tr" colspan="3" style="text-align:center;">Add User Account</td>
	</tr>
	<tr>
		<td style="width: 40%;padding-left:10px;">Username:</td>
		<td style="width:60%;padding-left:10px;padding-bottom:10px;">
			<input class="text" value="" style="width:90%;" type="text" id="txtEUserName" /> </td>
		<td style="width:5px;"></td>
	</tr>
	<tr>
		<td style="width: 40%;padding-left:10px;">First Name:</td>
		<td style="width:60%;padding-left:10px;padding-bottom:10px;">
			<input class="text" value="" style="width:90%;" type="text" id="txtEFName" /> </td>
		<td style="width:5px;"></td>
	</tr>
	<tr>
		<td style="width: 40%;padding-left:10px;">Last Name:</td>
		<td style="width:60%;padding-left:10px;padding-bottom:10px;">
			<input class="text" value="" style="width:90%;" type="text" id="txtELName" /> </td>
		<td style="width:5px;"></td>
	</tr>
	<tr>
		<td style="width: 40%;padding-left:10px;">Email:</td>
		<td style="width:60%;padding-left:10px;padding-bottom:10px;">
			<input class="text" value="" style="width:90%;" type="text" id="txtEEmail" /> </td>
		<td style="width:5px;"></td>
	</tr>
	<tr>
		<td style="width: 40%;padding-left:10px;">Choose Password:</td>
		<td style="width:60%;padding-left:10px;padding-bottom:10px;">
			<input class="text" value="" style="width:90%;" type="password" id="txtEPass1" /> </td>
		<td style="width:5px;"></td>
	</tr>
	<tr>
		<td style="width: 40%;padding-left:10px;">Verify Password:</td>
		<td style="width:60%;padding-left:10px;padding-bottom:10px;">
			<input class="text" value="" style="width:90%;" type="password" id="txtEPass2" /> </td>
		<td style="width:5px;"></td>
	</tr>
	<tr>
		<td>Sub Dept</td>
		<td>
			<div id="subdept_selector" class="dyn_drop" style="width: 350px;"><a class="dyn_list_title" href="javascript:void(0);" style="width: 300px;"><span class="dyn_list_title_span" style="color: white;">Select an Option</span></a>
				<a class="handler" href="javascript:void(0);"></a>
				<div class="dyn_drop_nested" style="width: 350px; height: 147px;">
					<ul>
						<li class="dyn_li selected" ref="0" style="width: 350px;"><strong>Select an Option</strong></li>
						<li class="dyn_li " ref="1" style="width: 350px;"><strong>Elections</strong></li>
						<li class="dyn_li" ref="2" style="width: 350px;"><strong>Licenses</strong></li>
						<li class="dyn_li" ref="3" style="width: 350px;"><strong>Probate Court</strong></li>
						<li class="dyn_li" ref="4" style="width: 350px;"><strong>Recording</strong></li>
						<li class="dyn_li" ref="6" style="width: 350px;"><strong>Tags</strong></li>
						<li class="dyn_li" ref="7" style="width: 350px;"><strong>E-Filing</strong></li>
					</ul>
				</div>
				<select id="subdept" class="subdept_selector" style="display: none;">
					<option value="0" selected="selected">Select an Option</option>
					<option value="3">Elections</option>
					<option value="8">Licenses</option>
					<option value="1">Probate Court</option>
					<option value="4">Recording</option>
					<option value="2">Tags</option>
					<option value="10">E-Filing</option>
				</select>
			</div>
		</td>
		<td></td>
	</tr>
	
	<tr>
	<td style="width:40%;padding-left:10px;height:40px;">Administrator:</td>
	<td style="width:60%;padding-left:10px;height:40px;">
		<a href="javascript:void(0);" class="toggle_button"><img alt="On_off" src="/images/blank.png" class="toggle_no" />
			<input type="hidden" value="0" id="txtEAdmin" />
		</a>
	</td>
	<td></td>
</tr>
	
	
	<tr>
		<td style="width:40%;padding-left:10px;height:40px;">Department Administrator:</td>
		<td style="width:60%;padding-left:10px;height:40px;">
			<a href="javascript:void(0);" class="toggle_button"><img alt="On_off" src="/images/blank.png" class="toggle_no" />
				<input type="hidden" value="0" id="txtEDeptAdmin" /> </a>
		</td>
		<td></td>
	</tr>
	<tr>
		<td style="width:40%;padding-left:10px;height:40px;">Webpage Manager:</td>
		<td style="width:60%;padding-left:10px;height:40px;">
			<a href="javascript:void(0);" class="toggle_button"><img alt="On_off" src="/images/blank.png" class="toggle_no" />
				<input type="hidden" value="0" id="txtEWebManage" /> </a>
		</td>
		<td></td>
	</tr>
	<tr>
		<td style="width:40%;padding-left:10px;height:40px;">News Manager:</td>
		<td style="width:60%;padding-left:10px;height:40px;">
			<a href="javascript:void(0);" class="toggle_button"><img alt="On_off" src="/images/blank.png" class="toggle_no" />
				<input type="hidden" value="0" id="txtENews" /> </a>
		</td>
		<td></td>
	</tr>
	<tr>
		<td style="width:40%;padding-left:10px;height:40px;">Important Information Manager:</td>
		<td style="width:60%;padding-left:10px;height:40px;">
			<a href="javascript:void(0);" class="toggle_button"><img alt="On_off" src="/images/blank.png" class="toggle_no" />
				<input type="hidden" value="0" id="txtEImport" /> </a>
		</td>
		<td></td>
	</tr>
	<tr>
		<td style="width:40%;padding-left:10px;height:40px;">Tag Renewal Manager:</td>
		<td style="width:60%;padding-left:10px;height:40px;">
			<a href="javascript:void(0);" class="toggle_button"><img alt="On_off" src="/images/blank.png" class="toggle_no" />
				<input type="hidden" value="0" id="txtETag" /> </a>
		</td>
		<td></td>
	</tr>
	<tr>
		<td style="width:40%;padding-left:10px;height:40px;">Video Manager:</td>
		<td style="width:60%;padding-left:10px;height:40px;">
			<a href="javascript:void(0);" class="toggle_button"><img alt="On_off" src="/images/blank.png" class="toggle_no" />
				<input type="hidden" value="0" id="txtEVideo" /> </a>
		</td>
		<td></td>
	</tr>
	<tr>
		<td style="width: 40%;padding-left:10px;height:40px;">Upload Files:</td>
		<td style="width:60%;padding-left:10px;height:40px;">
			<a href="javascript:void(0);" class="toggle_button"><img alt="On_off" src="/images/blank.png" class="toggle_no" />
				<input type="hidden" value="0" id="txtEFiles" /> </a>
		</td>
		<td></td>
	</tr>
	<tr>
		<td style="width: 40%;padding-left:10px;height:40px;">Current Password:
			<br/><span style="font-size:10px;">For security reasons, your current password is required to make changes to this account.</span></td>
		<td style="width:60%;padding-left:10px;height:40px;">
			<input class="text" value="" style="width:90%;" type="password" id="txtECurrentPass" /> </td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td>
			<input class="default" value="Add Profile" id="btnAddProfile" name="btnAddProfile" type="button" style="outline: none;float:right;margin-right:30px;margin-top:10px;margin-bottom:10px;" /> </td>
		<td></td>
	</tr>
	<tr>
		<td colspan="3" class="tf_table tf_bl tf_br" style="text-align:center;font-size:12px;"></td>
	</tr>
</table>
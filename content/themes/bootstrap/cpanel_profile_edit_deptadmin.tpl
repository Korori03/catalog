<a href="javascript:history.back(-1);" style="font-size:12px;text-decoration:none;">&larr; Go Back</a>
<script type="text/javascript">
$(function() {
	$(document).on('click', '#btnEditProfile', function() {
			var username = $("#txtEUserName").val();
			var first_name = $("#txtEFName").val();
			var last_name = $("#txtELName").val();
			var email = $("#txtEEmail").val();
			var pass1 = $("#txtEPass1").val();
			var pass2 = $("#txtEPass2").val();
			var current_pass = $("#txtECurrentPass").val();
			
			
			($user->isLoggedIn() && ($user->hasPermission('admin') || $user->hasPermission('dept_admin '))? 
			($user - > hasPermission('admin') ? 
			
				var admin = $("#txtEAdmin").val();
				var subdept = $("#subdept").val();
			:
			
			var dept_admin = $("#txtEDeptAdmin").val();
			var web_manage = $("#txtEWebManage").val();
			var news = $("#txtENews").val();
			var important = $("#txtEImport").val();
			var tag = $("#txtETag").val();
			var files = $("#txtEFiles").val();
			var video = $("#txtEVideo").val();
			
			
			
			$.post("/jquery", {
					username: username,
					first_name: first_name,
					last_name: last_name,
					email: email,
					pass1: pass1,
					pass2: pass2,
					current_pass: current_pass,
					subeditprofile: 1 
					
					$user->hasPermission('dept_admin') || $user->hasPermission('admin')?
					,
					dept_admin: dept_admin,
					web_manage: web_manage,
					news: news,
					important: important,
					tag: tag,
					files: files,
					video: video,
					userid: $('#userid').val()
					
					$user - > hasPermission('admin') ? 
					,
					admin: admin,
					sub_dept: subdept 
					},function(data) {
						if(data.indexOf("true") != -1) 
							$(location).attr('href',' /panel');
						else 
							$.jpop.alert(data, 'Houston County Probate Office Website ',{resizable:false,icon:'close ',close:true});
				
					});
		}); 
		
		$(document).on('click', '.toggle_button', function() {
			var img_toggle = $(this).find('img').attr('class');
			var input_toggle = $(this).find('input');
			if(img_toggle == 'toggle_no') {
				$(this).find('img').attr('class', 'toggle_yes');
				input_toggle.val('1');
			} else {
				$(this).find('img').attr('class', 'toggle_no');
				input_toggle.val('0');
			}
		});
	});
</script>
<table style="width:675px;" cellpadding="0" cellspacing="0" class="rounded-corner">
	<tr>
		<td class="th_table th_tl th_tr" colspan="3" style="text-align:center;">Edit '. ($user->data()->id == $userid ? 'My Profile' : Strings::ascii_convert($getuser->data()->fname) . ' ' . Strings::ascii_convert($getuser->data()->lname)) . ' Profile'.'</td>
	</tr>
	<tr>
		<td style="width: 40%;padding-left:10px;">Username:</td>
		<td style="width:60%;padding-left:10px;padding-bottom:10px;">
			<input class="text" value="'. Strings::ascii_convert($getuser->data()->username).'" style="width:90%;" type="text" id="txtEUserName" />
			<input type="hidden" id="userid" value="'.$getuser->data()->id.'" /> </td>
		<td style="width:5px;"></td>
	</tr>
	<tr>
		<td style="width: 40%;padding-left:10px;">First Name:</td>
		<td style="width:60%;padding-left:10px;padding-bottom:10px;">
			<input class="text" value="'. Strings::ascii_convert($getuser->data()->fname).'" style="width:90%;" type="text" id="txtEFName" /> </td>
		<td style="width:5px;"></td>
	</tr>
	<tr>
		<td style="width: 40%;padding-left:10px;">Last Name:</td>
		<td style="width:60%;padding-left:10px;padding-bottom:10px;">
			<input class="text" value="'. Strings::ascii_convert($getuser->data()->lname).'" style="width:90%;" type="text" id="txtELName" /> </td>
		<td style="width:5px;"></td>
	</tr>
	<tr>
		<td style="width: 40%;padding-left:10px;">Email:</td>
		<td style="width:60%;padding-left:10px;padding-bottom:10px;">
			<input class="text" value="'. Strings::ascii_convert($getuser->data()->email).'" style="width:90%;" type="text" id="txtEEmail" /> </td>
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
		<td style="width: 40%;padding-left:10px;height:40px;">Current Password:
			<br/><span style="font-size:10px;">For security reasons, your current password is required to make changes to this account.</span></td>
		<td style="width:60%;padding-left:10px;height:40px;">
			<input class="text" value="" style="width:90%;" type="password" id="txtECurrentPass" /> </td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td>
			<input class="default" value="Edit Profile" id="btnEditProfile" name="btnEditProfile" type="button" style="outline: none;float:right;margin-right:30px;margin-top:10px;margin-bottom:10px;" /> </td>
		<td></td>
	</tr>
	<tr>
		<td colspan="3" class="tf_table tf_bl tf_br" style="text-align:center;font-size:12px;"></td>
	</tr>
</table>
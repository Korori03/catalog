<script type="text/javascript">
$(function(){
	$('#btnFileManager').click(function(){
		$.jPopup('<div style="width: 625px; height: 400px;background-color:white;"><div style="text-align:center;font-size:18px;border-bottom:1px black solid;">File Manager</div><div style="float: left; border-right: 1px black solid;height: 375px; width:300px;  margin-left: 10px;"><div style="width: 100%;margin-top:25px;text-align:center;font-size:16px;">Select a File You Want!</div><div style="overflow: auto;height: 330px;width:300px;" id="filelist"><img src="/images/loading_large.gif" alt="loading" style="margin-left:90px;margin-top:80px;width:100px;height:100px;"/></div></div><div style="float: right; width: 300px; height: 350px; margin-right: 10px;"><form action="/jquery" method="post" name="frmUploadFile" id="frmUploadFile" enctype="multipart/form-data" target = "submitiframe"><input type="hidden" name="subfileuploadpop" value="1" /><table cellpadding="0" cellspacing="0" class="sort" style="width: 300px;margin-top:25px;"><tr><td colspan="2" style="text-align:center;font-size:16px;">Upload a File!</td></tr><tr class=""><td style="padding-left: 10px; width: 100px;">File Name:</td><td><input id="txtTitleUpload" class="text" name="txtTitleUpload" type="text" value="" style="width:230px;"/></td></tr><tr class=""><td style="padding-left: 10px; width: 80px;">File:</td><td><div class="fileupload"><input type="file" name="btnFile" id="btnFile" /><span class="button" id="button">Please Select a File to Upload</span></div></td></tr><tr class=""><td style="padding-left: 10px; width: 80px;">[@dept]</td><td style="text-align:right;">[@deptlist]<input id="btnFileUpload" class="default" name="btnFileUpload" type="button" value="Upload" /></td></tr><tr><td colspan="2"><div style="color:red;text-align:center;">Files must be under 5mb in size and must be either a images, pdf, word document, excel document, or text file document.</div></td></tr><tr><td colspan="2"><div style="color:red;text-align:center;" id="popuploaderror"></div></td></tr></table> <iframe id="submitiframe" name="submitiframe" src="" style="display:none;"></iframe></form><div class="successfulupload"></div></div></div>');
		$.post('/jquery',{subfilepoplist:1}, function(data) {
			$('#filelist').html(data).slideDown("slow");
		});
	});
	$(document).on('click','.select_image',function(){
				var select_id = $(this).find('.select_id').val();
				var select_name = $(this).find('.select_name').val();
				
				field=document.getElementById('txtMessage');
				if (document.selection)	{
					disable_jpop();
					field.focus();
					var selected = document.selection.createRange().text;
					var ins = '[img]'+select_id +'[/img]';
					var selected2 = document.selection.createRange();
					var sel = document.selection.createRange();
					sel.text = '[img]'+select_id +'[/img]';
					selected2.moveStart ('character', -field.value.length);
					sel.moveStart('character', selected2.text.length + ins.length - selected.length);
					
				}
				else if (field.selectionStart || field.selectionStart == 0){
					disable_jpop();
					var startPos = field.selectionStart;
					var endPos = field.selectionEnd;
					var ins = '[img]'+select_id +'[/img]';
					field.focus();
					field.value = field.value.substring(0, startPos)
					+ ins
					+ field.value.substring(endPos, field.value.length);
					field.setSelectionRange(endPos + ins.length, endPos + ins.length-selected.length);
				}
				else
					disable_jpop();
			});
			
			$(document).on('click','.select_file',function(){
				var select_id = $(this).find('.select_id').val();
				var select_name = $(this).find('.select_name').val();
				var file_name= $(this).find('.file_name').val();
				field=document.getElementById('txtMessage');
				if (document.selection){
					disable_jpop();
					field.focus();
					var selected = document.selection.createRange().text;
					var ins = '[url=/file/'+select_id+'-'+file_name+']' + select_name + '[/url]';
					var selected2 = document.selection.createRange();
					var sel = document.selection.createRange();
					sel.text = '[url=/file/'+select_id+'-'+file_name+']' + select_name + '[/url]';
					selected2.moveStart ('character', -field.value.length);
					sel.moveStart('character', selected2.text.length + ins.length - selected.length);
					
				}
				else if (field.selectionStart || field.selectionStart == 0)	{
					disable_jpop();
					var startPos = field.selectionStart;
					var endPos = field.selectionEnd;
					var ins = '[url=/file/'+select_id+'-'+file_name+']' + select_name + '[/url]';
					field.focus();
					field.value = field.value.substring(0, startPos)
					+ ins
					+ field.value.substring(endPos, field.value.length);
					field.setSelectionRange(endPos + ins.length, endPos + ins.length-selected.length);
				}
				else
					disable_jpop();
			});
			
	$(document).on('click','#btnFileUpload',function(){
		var ext = $('#btnFile').val().split('.').pop().toLowerCase();
		if($('.button').html() === 'Please Select a File to Upload')
			$('.button').css('background-color','#990000').focus();	
		else if($.inArray(ext, ['pdf','png','jpg','gif','pdf','doc','docx','xlsx','xls','txt']) == -1) 
			$('.button').css('background-color','#990000').focus();	
		else{
			$("#frmUploadFile").submit();	
				$('#popuploaderror').html('<img src="/images/loading_large.gif" alt="loading" style="width:50px;height:50px;"/>');
				var popupFile=setInterval(function(){
				var myContent = $("#submitiframe").contents().find("#message").html();
				if(myContent != '' && myContent != null){
					if(myContent.indexOf('Successfully') != -1){
						$('#popuploaderror').html(myContent).css('color','green');
						$('#fileupload_list').html('<img src="/images/loading_large.gif" alt="loading" style="margin-left:90px;margin-top:80px;width:100px;height:100px;"/>');
						$.post('/jquery',{subfilepoplist:1}, function(data) {
							$('#fileupload_list').html(data).slideDown("slow");
						});
					}
					else				
						$('#popuploaderror').html(myContent);
						
					clearInterval(popupFile);	
				}
			},1);
		}
	});

	var iframe = $("#submitiframe");
	
	$("#frmUploadFile").submit(function() {
		this.target = iframe.attr("name");
		iframe.get(0).processContent = true;
	 });
	
	 $("#submitiframe").load(function() {
		if (!this.processContent)
		 return;
	 });
	
	
	$(document).on('keyup','#txtTitleUpload',function(){
		$('#txtTitleUpload').css('background-color','#D9EFF2').css('color','black');
	});
	$(document).on('keyup','.button',function(){
		$('#txtTitleUpload').css('background-color','#D9EFF2').css('color','black');
	});
});
</script>

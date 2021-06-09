$(function(){	
		
	$('#buttonGo').click(function(){
		$.post("/jquery", {searchword: $("#searchword").val(), sitesearch: 1}, function (e) {
			$(location).attr("href", "/search/" + e);
		});
	});
	$(document).on("keydown", "#searchword", function (e) {
        if (e.which == 13) {
            $.post("/jquery", {searchword: $("#searchword").val(), sitesearch: 1}, function (e) {
				$(location).attr("href", "/search/" + e);
			});
        }
    });
	
	function login(){
		var username = $("#username").val();									
		var password = $("#password").val();								

		$.post("/jquery",{username:username,password:password,sublogin:1},function(data) {
			if(data.indexOf("true") != -1)
				window.location.href = window.location.href;
			else
				$.jpop.alert(data, 'Houston County Website', {label:'Login',type:'warning'},{resizable:false,icon:'check',close:true});
		});
	}	
	var default_username = "Username";
	$(document).on('focus','#username',function(){
		if($(this).val() == default_username)
			$(this).attr('value' ,'');
	});
	
	$(document).on('blur','#username',function(){
		if($(this).val() == '')
			$(this).attr('value',default_username);
	});
	
	$(document).on('keypress keydown',"#password",function(e) {											
		if(e.which == 13) {
		   $(this).blur();
		   login();
		}
	});
});
	

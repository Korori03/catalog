var bootstrap_title = "Korori-Gaming :: ";
	
(function (e) {

	/*
		Modal UI Hook 
	*/
	var theme = {
		 "default":BootstrapDialog.TYPE_DEFAULT, 
		 "info" :BootstrapDialog.TYPE_INFO, 
		 "primary":BootstrapDialog.TYPE_PRIMARY, 
		 "success":BootstrapDialog.TYPE_SUCCESS, 
		 "warning":BootstrapDialog.TYPE_WARNING, 
		 "danger":BootstrapDialog.TYPE_DANGER
	};
	var button = {
		 "default":"btn-default btn-override", 
		 "info" :"btn-info btn-override", 
		 "primary":"btn-primary btn-override", 
		 "success":"btn-success btn-override", 
		 "warning":"btn-warning btn-override", 
		 "danger":"btn-danger  btn-override"
	};
	var defaults = {
		theme: theme["primary"],
		button: button["primary"],	
		modal: true,
		close:true
	};
	

$.jpop = {
	alert: function(msg, title,button_options,options,callback){
			
			var settings = $.extend( {}, defaults, options );
			var settings_buttons = $.extend( {}, defaults, button_options );
			var labelName =  (typeof settings_buttons.label == "string"? settings_buttons.label:"OK");
			
			var cssitem = (typeof settings_buttons.type == "string"?button[settings_buttons.type]:button["warning"]);
			
			BootstrapDialog.alert({
				title:title,
				message:msg,
				closable: settings.close, 
				draggable: settings.modal,
				type:(typeof settings_buttons.type == "string"?theme[settings_buttons.type]:theme["warning"]),
				buttons: [{
					label:labelName,
					cssClass: cssitem, 
					action: function(dialogRef){
						dialogRef.close();
					}
				}],
				callback: callback
			});
			
		},
		confirm: function(msg, title,button_options,options,callback){
			var settings = $.extend( {}, defaults, options );
			var settings_buttons = $.extend( {}, defaults, button_options );
			
			BootstrapDialog.confirm({
				title:title,
				message: msg,
				closable: settings.close, 
				draggable: settings.modal,
				type:(typeof settings_buttons.type != null && settings_buttons.type != undefined?theme[settings_buttons.type]:theme["primary"]),
				cssClass:  (typeof settings_buttons.type != null && settings_buttons.type != undefined?button[settings_buttons.type]:button["primary"]), 
				 btnOKLabel: (typeof settings_buttons.label == "string"? settings_buttons.label:"OK"), // <-- Default value is 'OK',
				callback: callback
			});
		}
	};	
})(jQuery);


(function (e) {
	$.ScrollEvent = {
		up: function(speed = 1000){
			$("html, body").animate({
				scrollTop: 0
			}, speed); 
		},
		down: function(speed = 1000){
			$("html, body").animate({
				scrollTop: $(document).height()
			}, speed);     
		}
	};
})(jQuery);

(function (e) {
	e.fn.SlideContainer = function (interval) {
		
		var id = this.attr('id'); 
		
		var slides;
		var amount;
		var i;
		interval *= 1000;
		
		slides = $('#' + id).children();
		
		i = 0;
		amount = slides.length;
		setTimeout(run, interval);
		
		function run() {
			$(slides[i]).fadeOut(1000);
			i++;
			if (i >= amount) i = 0;
			$(slides[i]).fadeIn(1000);
			setTimeout(run, interval);
		}
	};

})(jQuery);


(function (e) {
	
	/*
		Pagin System Plugin
	*/
	e.fn.pagination = function(shown) {
		var appendto = this.attr('id'),
			perpage = parseInt(shown),
			table_row = $('#' + appendto).find('tbody tr'),
			rows = table_row.length,
			animationspeed = 1200,
			number_page = Math.ceil(rows/perpage),
			page = 1,
			shownonbar= 5,
			pagin_internal = '';
		

			$(table_row).each(function(current,row){
				if(current > shown -1)
					$(this).hide();
			});
			if($('#pagin_' + appendto).length == 0){
				
				$('#'+ appendto + ' tfoot tr td div').html(
						'<ul class="pagination" id="pagin_' + appendto + '">' +
						
					'</ul>'
				);
				generate(1);
			}
			
			function generate(current_page){
				
				if(number_page > 1){
					var x = 1,
					alter = Math.ceil(shownonbar / 2); 
					pagin_internal ='',
					start_pos = (current_page - alter < 0? 1:current_page - alter),
					end_pos = (current_page - alter < 0? number_page:(number_page < (current_page + alter)?number_page:current_page + alter));
					

					if(number_page > 1 && 1 < current_page)
						pagin_internal += '<li class="pagin_prev"  data-prev="' +(current_page - 1) + '" data-current="' + current_page + '"><a href="#">&laquo;</a></li>';

					for(start_pos;start_pos < end_pos + 1;start_pos++){
						if(shownonbar >= x && start_pos != 0)
							pagin_internal +='<li '+ (current_page == start_pos?'class="active"':'class="pagin_selector"') +' data-current="' + start_pos +'" ><a href="#">' + start_pos +'</a></li>';
						x++;
					}

					if(end_pos > current_page)
						pagin_internal += '<li class="pagin_next"  data-next="' + ( current_page + 1 ) + '" data-current="' +current_page + '"><a href="#">&raquo;</a></li>';
				
					$('#pagin_' + appendto).html(pagin_internal);
				}
			}
			
			$(document).on('click','.pagin_selector',function(){
				var data_current = $(this).attr('data-current');
			
				$(table_row).each(function(current,row){
					var start_pos  = (data_current - 1) * perpage;
					var end_pos = start_pos + perpage - 1;
					
					if(start_pos  <= current && end_pos >= current)
						$(this).fadeIn(animationspeed);
					else
						$(this).hide();
					
				});
				
				generate(parseInt(data_current));
			});
			$(document).on('click','.pagin_prev',function(){
				var data_current = $(this).attr('data-prev');
				
				$(table_row).each(function(current,row){
					var start_pos  = (data_current - 1) * perpage;
					var end_pos = start_pos + perpage -1;
					
					if(start_pos  <= current && end_pos >= current)
						$(this).fadeIn(animationspeed);
					else
						$(this).hide();
				});

				generate(parseInt(data_current));
			});
			
			$(document).on('click','.pagin_next',function(){
				var data_current = $(this).attr('data-next');
				
				$(table_row).each(function(current,row){
					var start_pos  = (data_current - 1) * perpage;
					var end_pos = start_pos + perpage -1;
					
					if(start_pos  <= current && end_pos >= current)
							$(this).fadeIn(animationspeed);
					else
							$(this).hide();
				});

				generate(parseInt(data_current));
			});
		};
})(jQuery);
			
	function calendarMonth(year,month){
		$.post('/jquery',{year:year,month:month,'action':'calendarmonth'},function(data){
			
			$('#calendar_events').html(data);
		});
			
	}
	
	$(function(){

	$('.mobile_bars').click(function(event){
	  event.stopPropagation();
	  event.preventDefault();
	  $(this).toggleClass("change");
	  $('nav').toggleClass("change-nav");
	  $('.mobile').slideToggle();
	});
});

var sap = {ui:{keycodes:{SPACE:32, ENTER:13 }}};
//handles clicks and keydowns on the link
function navigateLink(evt) {
    if (evt.type=="click" ||
        evt.keyCode == sap.ui.keycodes.ENTER) {
        var ref = evt.target != null ? evt.target : evt.srcElement;
		if (ref) window.open(ref.getAttribute("href"),"_self");
    }
}

function printPageContent(printContainer) {
	var DocumentContainer = document.getElementById(printContainer);
	var WindowObject = window.open('', "PrintWindow", "width=800,height=800,top=200,left=200,toolbars=no,scrollbars=no,status=no,resizable=no");
	WindowObject.document.writeln(DocumentContainer.innerHTML);
	WindowObject.document.close();
	WindowObject.focus();
	WindowObject.print();
	WindowObject.close();
}
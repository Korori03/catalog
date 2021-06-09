var confirmItem = '<div class="dyn-popup [@class]" role="alert">'+
      '<div>'+
		'<input type="hidden" value="[@id]" class="dyn_id" />'+
        '<p>[@text]</p>'+
        '<ul>'+
        '	<li><a href="#0">Yes</a></li>'+
        '<li><a href="#0">No</a></li>'+
        '</ul>'+
      '<a href="#0" class="dyn-popup-close">Close</a>'+
      '</div>'+ 
    '</div>';

var showItem = '<div class="dyn-popup [@class]" role="alert">'+
      '<div>'+
		'<input type="hidden" value="[@id]" class="dyn_id" />'+
        '<p>[@text]</p>'+
        '<ul>'+
        '	<li style="width:100%;"><a href="#0" style="    background: #fc7169;">OK</a></li>'+
        '</ul>'+
      '<a href="#0" class="dyn-popup-close">Close</a>'+
      '</div>'+ 
    '</div>';
	
jQuery(document).ready(function($){
	//open popup
  
	$('.dyn-popup-trigger').on('click', function(event){
		event.preventDefault();
		var t =  confirmItem.replace('[@text]',$(this).attr('data-text')).replace('[@class]',$(this).attr('data-class'));
		$('body').append(t);
	});
	
	//close popup
	$(document).on('click','.dyn-popup-close',function(event){
			event.preventDefault();
			$('.dyn-popup').remove();
	});
  
	$(document).on('click','.dyn-popup div ul li:last-child a ',function(event){
			event.preventDefault();
			$('.dyn-popup').remove();
	});
  
	//close popup when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which=='27'){
    		$('.dyn-popup').remove();
	    }
    });

  
  
});
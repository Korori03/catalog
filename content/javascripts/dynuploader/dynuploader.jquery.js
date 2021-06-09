    var reader = {};
    var file = {};
    var slice_size = 1000 * 1024;
	$(function(){
		$(document).on("change","#file",function() {
			readFile(this);
		});
	});
  function readFile(input) {
      if (input.files && input.files[0]) {
        reader = new FileReader();
        file = input.files[0];
		
		$.post('/jquery',{file_name:file.name,ajaxClearFile:true},function(data){
			upload_file( 0 );
		});
      }
  }
  function upload_file( start ) {
     var next_slice = start + slice_size + 1;
     var blob = file.slice( start, next_slice );

     reader.onloadend = function( event ) {
        if ( event.target.readyState !== FileReader.DONE ) {
          return;
        }
            
			
        $.ajax( {
          url: "/jquery",
          type: 'POST',
          /*dataType: 'json',*/
          data: {
            file_data: event.target.result,
			file: file.name,
			file_type: file.type,
			ajaxUploadFile:true
          },
          cache: false,
          error: function( data ) {
          },
          success: function( data ) {
			console.log(data);
            $("#imageUploadForm").addClass('loading');
            var size_done = start + slice_size;
            var percent_done = Math.floor( ( size_done / file.size ) * 100 );
            var bar_height = (( $("#uploadedImg").height()/100) * percent_done);
			
            if ( next_slice < file.size ) {
			 $( '.imageUploadForm.loading .unveil' ).attr("style","--data-bottom:" +bar_height + "px;--data-percent:"+percent_done + " Percent");
			
              upload_file( next_slice );
            } else {
				 $.post('/jquery',{file_name:file.name,ajaxMoveFile:true},function(data){
					
					 $("#imageUploadForm").addClass('loaded');
					  setTimeout(function() {
						$("#file").val('');  $("#imageUploadForm").removeClass('loading').removeClass('loaded');
					  }, 5000);
				 });
            }
          }
        } );
      };
      reader.readAsDataURL( blob );
    }
<ol class="breadcrumb">[@breadcrumb]</ol>
<div class="flex-grid">
    <div>
        <table style="width:100%;">
           <tbody>
              <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Name:</span><br/>
					<input style="width:100%;margin-bottom:5px;" value="[@name]" id="txtName" >
				 </td>
              </tr>
              <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Brand:</span><br/>
					<select style="width:100%;margin-bottom:5px;" id="cmbBrand">[@brand]</select>
				 </td>
              </tr>
              <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">System:</span><br/>
					<select style="width:100%;margin-bottom:5px;" id="cmbSystems">[@system]</select>
				 </td>
              </tr>
              <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Publisher:</span><br/>
					<div class="wrapper" style="background-color: #fff;border: 1px solid #cacfd4;border-radius: .1875em;box-shadow: none;">
						<div id="multi-select">    
							<input name="publisher" id="publisher" type="hidden" value="[@publisherrl]" />

							<div class="multiselect-wrapper">
							  <div class="tag-list-wrapper" style="padding: .5em;">
								<div class="tag-input-publisher"></div>
								<i id="add-tag" class="fas fa-plus-circle add-tag-publisher"></i>
							  </div>
								 <div class="hidden-options-publisher"style="padding: .5em;display:none;height: 160px;overflow-y: scroll;margin-right: 0;overflow-x: hidden;">
									<div class="text-enter" style="margin-bottom:5px;">
									  <label for="" style="display:block;">
										<input type="text" value="" />
									  </label>
									</div>
										[@publisherlist]
								</div>
							</div>
						  </div>
					  </div>
					
					
				 </td>
              </tr>
			<tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Developer:</span><br/>
						<div class="wrapper" style="background-color: #fff;border: 1px solid #cacfd4;border-radius: .1875em;box-shadow: none;">
						<div id="multi-select">    
							<input name="developer" id="developer" type="hidden" value="[@developerrl]" />

							<div class="multiselect-wrapper">
							  <div class="tag-list-wrapper" style="padding: .5em;">
								<div class="tag-input-developer"></div>
								<i id="add-tag" class="fas fa-plus-circle add-tag-developer"></i>
							  </div>
								 <div class="hidden-options-developer"style="padding: .5em;display:none;height: 160px;overflow-y: scroll;margin-right: 0;overflow-x: hidden;">
									<div class="text-enter" style="margin-bottom:5px;">
									  <label for="" style="display:block;">
										<input type="text" value="" />
									  </label>
									</div>
										[@developerlist]
								</div>
							</div>
						  </div>
					  </div>
				 </td>
              </tr>			  
			    <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Release Date:</span><br/>
					<input style="width:100%;margin-bottom:5px;" value="[@release_date]" id="txtReleaseDate" >
				 </td>
              </tr>
              <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Rating:</span><br/>
					<input style="width:100%;margin-bottom:5px;" value="[@rating]" id="txtRating" >
				 </td>
              </tr>
              <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Genre:</span><br/>
					
					<div class="wrapper" style="background-color: #fff;border: 1px solid #cacfd4;border-radius: .1875em;box-shadow: none;">
					<div id="multi-select">    
						<input name="genre" id="genre" type="hidden" value="[@genrerl]" />

						<div class="multiselect-wrapper">
						  <div class="tag-list-wrapper" style="padding: .5em;">
							<div class="tag-input-genre"></div>
							<i id="add-tag" class="fas fa-plus-circle add-tag-genre"></i>
						  </div>
							 <div class="hidden-options-genre"style="padding: .5em;display:none;height: 160px;overflow-y: scroll;margin-right: 0;overflow-x: hidden;">
								<div class="text-enter" style="margin-bottom:5px;">
								  <label for="" style="display:block;">
									<input type="text" value="" />
								  </label>
								</div>
									[@genrelist]
							</div>
						</div>
					  </div>
				  </div>
				 </td>
              </tr>
              <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Region:</span><br/>
					<select style="width:100%;margin-bottom:5px;" id="cmbRegion">[@region]</select>
				 </td>
              </tr>
			  
			   <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Playmode:</span><br/>
					<div style="background-color: #fff;border: 1px solid #cacfd4;border-radius: .1875em;box-shadow: none;padding:.5em;">
					[@playmode]
					</div>
				 </td>
              </tr>
			   <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Download:</span><br/>
					<input style="width:100%;margin-bottom:5px;" value="[@download]" id="txtDownload" >
				 </td>
              </tr>
			   
			   <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">VR:</span><br/>
					<label class="switch" style="margin-top:5px;" >
						<input type="checkbox" id="chkVR" aria-label="VR" value="Y" [@vr]>
						<span class="slider"></span>
					</label>
				 </td>
              </tr>
			    <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Finished:</span><br/>
					<label class="switch" style="margin-top:5px;" >
						<input type="checkbox" id="chkFinished" aria-label="Finished"  value="Y" [@finished]>
						<span class="slider"></span>
					</label>
				 </td>
              </tr>
			    <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Barcode:</span><br/>
					<input style="width:100%;margin-bottom:5px;" value="[@barcode]" id="txtBarcode" >
				 </td>
              </tr>
			    <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Cover:</span><br/>
					<label class="switch" style="margin-top:5px;" >
						<input type="checkbox" id="chkCover" aria-label="Cover"  value="Y" [@cover]>
						<span class="slider"></span>
					</label>
				 </td>
              </tr>
			    <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Instructions:</span><br/>
					<label class="switch" style="margin-top:5px;" >
						<input type="checkbox" id="chkInstructions" aria-label="Observed"  value="Y" [@instructions]>
						<span class="slider"></span>
					</label>
				 </td>
              </tr>
			    <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Box:</span><br/>
					<label class="switch" style="margin-top:5px;" >
						<input type="checkbox" id="chkBox" aria-label="Box"  value="Y" [@box]>
						<span class="slider"></span>
					</label>
				 </td>
              </tr>
			    <tr>
                 <td colspan="3" style="text-align:left;">
					<span style="font-size:12px;">Steelbook:</span><br/>
					<label class="switch" style="margin-top:5px;" >
						<input type="checkbox" id="chkSteelbook" aria-label="Steelbook"  value="Y" [@steelbook]>
						<span class="slider"></span>
					</label>
				 </td>
              </tr>
			   <tr>
                 <td colspan="3">
					<img alt="Upload Image" title="Upload Image" src="[@image]" width="200px">
					<br/><br/>
					<div class="fileupload">
						<input type="file" name="fileDL" id="fileDL" style="outline: none;">
						<span class="button" id="button">Browse for a File</span>
						<div id="uploadedImg" class="uploadedImg">
							<span class="unveil" style="--data-bottom:0px"></span>
						</div>
					</div>
					<br/>
					<progress class="percentage-loading" value="0" max="100" style="display:none;width: 100%;height: 30px;margin-left: 2%;"> 0% </progress>
				</td>
              </tr>
              <tr>
                 <td colspan="3">
					<input class="default" type="button" value="Edit Game" id="btnEdit" >
				</td>
              </tr>
              <tr>
                 <td colspan="3" style="text-align:center;">
                    <div id="loginerror"></div>
                 </td>
              </tr>
           </tbody>
        </table>
     </div>
</div>
<style>

@import url(https://fonts.googleapis.com/css?family=Roboto:300,400,500&display=swap);
@import url(https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css);

.fileupload {
   
	height: 60px;
	position: relative;
	overflow: hidden;
	background: #428bca;
	color: #fff;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	padding: 17px;
	text-align: center;
	font-weight: 700;
	font-size: 12px;
	cursor:pointer;
	z-index: 0;
}

.fileupload:hover{
	background-color: #369;
    cursor: pointer;
}

.fileupload input {
    position: absolute;
    top: 0;
    right: 0;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0);
    font-size: 300px;
    height: 60px;
    z-index: 0;
	width:100%;
	cursor:pointer;
}
.button{
	cursor:pointer;
	 background-color: unset !important;
}

input[type=checkbox]{
	 width: 20px;
	margin-left: 5px;
    margin-bottom: 5px;
    margin-right: 5px;
	display:inherit;
}

div.hidden-options-genre li.text-enter label input,
div.hidden-options-publisher li.text-enter label input,
div.hidden-options-developer li.text-enter label input {
	box-sizing: border-box;
	display: block;
	width: 100%;
	font-family: inherit;
	font-size: 16px;
	height: 40px;
	outline: 0;
	vertical-align: middle;
	background-color: #fff;
	border: 1px solid #cacfd4;
	border-radius: .1875em;
	box-shadow: none;
	padding: 0 .5em;
}

.wrapper {
	display: -webkit-box;
	display: flex;
	width: 100%;
	height: 100%;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
}

.wrapper #multi-select {
	margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
	width: 100%;
}
	
.wrapper #multi-select .multiselect-wrapper{
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
	
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper {
	position: relative;
	display: -webkit-box;
	display: flex;
	width: 100%;
	min-height: 28px;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: justify;
	justify-content: space-between;
	border-bottom: 1px solid #ebebeb;
	margin: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper .tag-input-genre,
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper .tag-input-publisher,
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper .tag-input-developer {
	display: -webkit-box;
	display: flex;
	-webkit-box-flex: 1;
	flex: 1;
	height: auto;
	-webkit-box-align: center;
	align-items: center;
	flex-wrap: wrap;
}
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper .tag-input-genre .tag,
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper .tag-input-publisher .tag,
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper .tag-input-developer .tag {
	display: -webkit-box;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	border-radius: 3px;
	background: #428bca;
	color: #FFF;
	float: left;
	margin: 3px;
	font-family: 'Roboto', sans-serif;
	font-size: 10px;
	font-weight: 200;
	vertical-align: middle;
	box-shadow: 0px 1px 4px #c6c6c6, 0px 2px 17px #d1d1d1;
}
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper .tag-input-genre .tag span.tag-title,
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper .tag-input-publisher .tag span.tag-title,
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper .tag-input-developer .tag span.tag-title {
	display: -webkit-box;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	padding: 6px;
	position: relative;
	top: 1px;
	font-weight: 600;
    font-size: 1.5em;
}
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper .tag-input-genre .tag span.close-btn-genre,
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper .tag-input-publisher .tag span.close-btn-publisher,
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper .tag-input-developer .tag span.close-btn-developer {
	display: -webkit-box;
	
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	background: #264c6d;
	padding: 6px;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
	cursor: pointer;
	padding-top: 10px;
    padding-bottom: 10px;
}
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper i.fas.add-tag-genre,
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper i.fas.add-tag-publisher,
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper i.fas.add-tag-developer  {
	background: #fff;
	position: absolute;
	top: -16px;
	right: -16px;
	font-size: 30px;
	cursor: pointer;
	-webkit-transition: .2s ease;
	transition: .2s ease;
	color: #428bca;
	border-radius: .5em;
}
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper i.fas.add-tag-genre:hover,
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper i.fas.add-tag-developer:hover,
.wrapper #multi-select .multiselect-wrapper .tag-list-wrapper i.fas.add-tag-publisher:hover {
	-webkit-transform: scale(1.5);
	transform: scale(1.5);
	-webkit-transform-origin: center;
	transform-origin: center;
}
.wrapper #multi-select ul.hidden-options-genre,
.wrapper #multi-select ul.hidden-options-publisher,
.wrapper #multi-select ul.hidden-options-developer {
	border: 1px solid #ebebeb;
	margin-top: 2px;
	height: 0;
	overflow-y: scroll;
	overflow-x: hidden;
	z-index: 10;
	opacity: 0;
	visibility: hidden;
	-webkit-transition: .2s ease;
	transition: .2s ease;
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
.wrapper #multi-select ul.hidden-options-genre.show,
.wrapper #multi-select ul.hidden-options-publisher.show,
.wrapper #multi-select ul.hidden-options-developer.show {
	opacity: 1;
	visibility: visible;
	height: 150px;
	padding-left: 0px;
}
.wrapper #multi-select ul.hidden-options-genre li,
.wrapper #multi-select ul.hidden-options-publisher li,
.wrapper #multi-select ul.hidden-options-developer li {
	border-bottom: 1px solid #ebebeb;
	padding: 10px;
	font-family: 'Roboto', sans-serif;
	text-transform: uppercase;
	-webkit-transition: .2s ease;
	transition: .2s ease;
	cursor: pointer;
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 12px;
	font: inherit;
	vertical-align: baseline;
}
.wrapper #multi-select ul.hidden-options-genre li:hover,
.wrapper #multi-select ul.hidden-options-publisher li:hover,
.wrapper #multi-select ul.hidden-options-developer li:hover {
	background: #428bca;
	color: #fff;
}
.wrapper #multi-select ul.hidden-options-genre li label,
.wrapper #multi-select ul.hidden-options-publisher li label,
.wrapper #multi-select ul.hidden-options-developer li label {
	display: -webkit-box;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	cursor: pointer;
	height: 30px;
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 12px;
	font: inherit;
	vertical-align: baseline;
}


tr{
	cursor: default;
}

td{
	padding-top:10px;
}

.progress_bar_title{
	font-weight:400;
	color:#86939e;
	line-height:1.5;
	margin:0;
	font-size:1rem;
}

input[type=button], input[type=submit] {
    font-family: "Times New Roman", Times, serif;
    background-color: #428bca;
    color: #fff;
    padding: 5px 12px;
    -moz-border-radius-bottomright: 5px;
    border-bottom-right-radius: 5px;
    -moz-border-radius-bottomleft: 5px;
    border-bottom-left-radius: 5px;
    -moz-border-radius-topright: 5px;
    border-top-right-radius: 5px;
    -moz-border-radius-topleft: 5px;
    border-top-left-radius: 5px;
    cursor: pointer;
    height: 45px;
    display: inline;
}

button:hover, input[type=button]:hover, input[type=submit]:hover {
    background-color: #369;
    cursor: pointer;
}

input,select {
    box-sizing: border-box;
    display: block;
    width: 100%;
    font-family: inherit;
    font-size: 16px;
    height: 40px;
    outline: 0;
    vertical-align: middle;
    background-color: #fff;
    border: 1px solid #cacfd4;
    border-radius: .1875em;
    box-shadow: none;
    padding: 0 .5em;
	color: #000;
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
}

.flex-grid > div {
	flex: 2;
	margin: 15px;
	padding: 15px;
	background: #fbfbfb;
	border: 1px solid #bbb;
	box-shadow: 0 0 20px -3px #bbb;
	font-size: 14px;
	cursor:pointer;
}

.flex-grid > h2 {
	margin: -15px -15px 15px -15px;
	padding: 12px 15px;
	font-size: 16px;
	font-weight: 400;
	border-bottom: 1px solid #ddd;
}

.flex-grid >li {
	padding: 0 0 0 5px;
	display: table-cell;
}

.flex-grid > div > ul{
	margin-bottom: 15px;
	display: table;
	width: 100%;
	margin-left: -5px;
	text-align: center;
}

.breadcrumb{
	margin-bottom: 0px !important;
}
</style>
<script>
$developer = {
  tag_list_wrapper: 		$('.tag-list-wrapper'),
  tag_input: 				$('.tag-list-wrapper .tag-input-developer'),
  hidden_options: 			$('div.hidden-options-developer'),
  all_chkbx: 				$('div.hidden-options-developer input'),
  collection: 				[],
  hidden_collections_list: 	$('input[type=hidden]#developer')
}
$publisher = {
  tag_list_wrapper: 		$('.tag-list-wrapper'),
  tag_input: 				$('.tag-list-wrapper .tag-input-publisher'),
  hidden_options: 			$('div.hidden-options-publisher'),
  all_chkbx: 				$('div.hidden-options-publisher input'),
  collection: 				[],
  hidden_collections_list: 	$('input[type=hidden]#publisher')
}
$genre = {
  tag_list_wrapper: 		$('.tag-list-wrapper'),
  tag_input: 				$('.tag-list-wrapper .tag-input-genre'),
  hidden_options: 			$('div.hidden-options-genre'),
  all_chkbx: 				$('div.hidden-options-genre input'),
  collection: 				[],
  hidden_collections_list: 	$('input[type=hidden]#genre')
}
$(function(){

	$( "#cmbBrand" ).change(function() {
		var d = {
			'main':'games',
			'subitem':$(this).val(),
			getsubitem2:true
		};

		$.post('/jquery',d,function(data){
			$('#cmbSystems').html(data);
		});
	});

	var array = $genre.hidden_collections_list.val().split(',');
	if(array.length > 0){
		$.each(array,function(i){
			if(array[i] !== ''){
				createTag(array[i],'genre',$genre);
				setSelectedCollection(array[i],$genre, 'add');
		   }
		});
	}
	array = $developer.hidden_collections_list.val().split(',');
	if(array.length > 0){
		$.each(array,function(i){
			if(array[i] !== ''){
				createTag(array[i],'developer',$developer);
				setSelectedCollection(array[i],$developer, 'add');
		   }
		});
	}
	
	array = $publisher.hidden_collections_list.val().split(',');
	if(array.length > 0){
		$.each(array,function(i){
			if(array[i] !== ''){
				createTag(array[i],'publisher',$publisher);
				setSelectedCollection(array[i],$publisher, 'add');
		   }
		});
	}
	
	$('#btnEdit').click(function(){
		var checkboxes_value = []; 
		$('.chkPlaymode').each(function(){  
			if(this.checked)            
				checkboxes_value.push($(this).val());                                                                               
		});                              
		var playmode = checkboxes_value.toString(); 
		var d = {
			name:			$('#txtName').val(),
			brand:			$('#cmbBrand').val(),
			systems:		$('#cmbSystems').val(),
			publisher:		$('#publisher').val(),
			developer:		$('#developer').val(),
			releaseDate:	$('#txtReleaseDate').val(),
			rating:			$('#txtRating').val(),
			genre:			$('#genre').val(),
			download:		$('#txtDownload').val(),
			playmode:		playmode,
			region: 		$('#cmbRegion').val(),
			box: 			($('#chkBox').prop('checked')?'Y':'N'),
			cover: 			($('#chkCover').prop('checked')?'Y':'N'),
			vr: 			($('#chkVR').prop('checked')?'Y':'N'),
			finished: 		($('#chkFinished').prop('checked')?'Y':'N'),
			barcode:		$('#txtBarcode').val(),
			steelbook: 		($('#chkSteelbook').prop('checked')?'Y':'N'),
			instructions: 	($('#chkInstructions').prop('checked')?'Y':'N'),
			gameid:			'[@gameid]',
			subEditGame:	true
		};
		console.log(d);
		$.post('/jquery',d,function(data){
console.log(data);
		});
		
	});
	$('.close-btn-genre').on('click', function(){
		var el = $(this).parent().attr('data-value');
		removeTag(el,'genre');
		setSelectedCollection(el,$genre, "remove");
	});
	
	$('.close-btn-publisher').on('click', function(){
		var el = $(this).parent().attr('data-value');
		removeTag(el,'publisher');
		setSelectedCollection(el,$publisher, "remove");
	});
	
	$('.close-btn-developer').on('click', function(){
		var el = $(this).parent().attr('data-value');
		removeTag(el,'developer');
		setSelectedCollection(el,$developer, "remove");
	});
	
	$('i.add-tag-genre').on('click', function(){
		$genre.hidden_options.toggleClass('show');    
	});
	
	$('i.add-tag-developer').on('click', function(){
		$developer.hidden_options.toggleClass('show');    
	});
	
	$('i.add-tag-publisher').on('click', function(){
		$publisher.hidden_options.toggleClass('show');    
	});
	
	
	$('.genrelist').on('click', function(e){
		var el = $(this);
	
		if (el.prop('checked') == true) {
			createTag(el.val(),'genre',$genre);
			setSelectedCollection(el.val(),$genre, 'add');
		} else {
			removeTag(el.val(),'genre');
			setSelectedCollection(el.val(),$genre, "remove");
		}
		
		setSelectHeight($genre,'genre');    
	});
	$('.developerlist').on('click', function(e){
		var el = $(this);
	
		if (el.prop('checked') == true) {
			createTag(el.val(),'developer',$developer);
			setSelectedCollection(el.val(),$developer, 'add');
		} else {
			removeTag(el.val(),'developer');
			setSelectedCollection(el.val(),$developer, "remove");
		}
		
		setSelectHeight($developer,'developer');    
	});
	
	$('.publisherlist').on('click', function(e){
		var el = $(this);
	
		if (el.prop('checked') == true) {
			createTag(el.val(),'publisher',$publisher);
			setSelectedCollection(el.val(),$publisher, 'add');
		} else {
			removeTag(el.val(),'publisher');
			setSelectedCollection(el.val(),$publisher, "remove");
		}
		
		setSelectHeight($publisher,'publisher');    
	});
	$('div.hidden-options-genre div.text-enter label input').on('keypress',function(e) {
		if(e.which == 13) 
			createTag($(this).val(),'genre',$genre);
	});
	
	$('div.hidden-options-developer div.text-enter label input').on('keypress',function(e) {
		if(e.which == 13) 
			createTag($(this).val(),'developer',$developer);
	});
});

function createTag(name,type,$object) {
	var html = "<div class='tag' data-value='" + name + "'><span class='tag-title'>" + name + "</span><span class='close-btn-" + type +"'><i class='fas fa-times'></i></span></div>";
	$object.tag_input.append(html);
	$('.tag .close-btn-' + type).last().on('click', function(){
		var tag_value = $(this).parent().attr('data-value');
		removeTag(tag_value,type);

		$object.all_chkbx.each(function(){    
			if ($(this).val() == tag_value) 
				this.checked = false;
		});  

		setSelectHeight($object,type);
	
	});  
}

function removeTag(name,type) {
	var all_tags = $('.tag-list-wrapper .tag-input-' + type +' .tag');
	var test = all_tags.filter(function (i, el) {
		var dataTags = $(el).data("value");    
		$(el).find('close-btn'+type).off();    
		return dataTags === name ? el : false;
	}).remove();
}

function setSelectHeight($object,type) {
  if ($('.tag-list-wrapper .tag-input-' + type + '  .tag').length <= 0) 
    $object.tag_list_wrapper.css({height: '28px'});
  else {
    $object.tag_list_wrapper.css({height: 'auto'});
    $('ul.hidden-options-genre li.check-all input').not('.check-all').prop('checked', false);
  }
}

function setSelectedCollection(name,$object, status) {
	if (status == 'add') {
		if (!$object.collection.includes(name)) 
			$object.collection.push(name);  

		$object.hidden_collections_list.val($object.collection.join());
	} 
	else{    
		console.log($object.collection);
		for (var i in $object.collection) {
			if ($object.collection[i] == name) 
				$object.collection.splice(i,1);
		}

		$object.hidden_collections_list.val($object.collection.join());
	}
}
</script>
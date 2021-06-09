<ol class="breadcrumb">
	[@breadcrumbs]
</ol>
[@admin]
<style>
.editicon:before {
    content: "\270E";
}
.deleteicon:before {
    content: "\2716";
    font-weight: bold;
}
</style>
<script>
$(function(){

	$('.single-url-link').click(function(){
		var url = $(this).attr('data-url');
		$(location).attr('href',url);
	});
});
</script>
<div class="module-item">
	<h2 class="header small">[@name]</h2>
	<div class="wrap">
	  <div class="row-item">         
			<img alt="[@slug]" title="[@slug]" src="[@img]">           
	  </div>
	  <div class="row-item">
		 <h2 class="module-header large">[@name]</h2>
		 <div class="featured-item-meta">
			<div><strong style="font-weight: 600;">Published:</strong></div>
			<div style="margin-top:3px;">[@release_date]</div>
       <br>
			<ul class="item-info">
			   <li>
				  <div><strong style="font-weight: 600;">Publisher:</strong></div>
				  <div class="wrapper" style="background-color: #fff;border-radius: .1875em;box-shadow: none;">
					<div id="multi-select">    
						<div class="multiselect-wrapper">
						  <div class="tag-list-wrapper" style="padding: .5em;">
							<div class="tag-input-genre">[@publisher]</div>
						  </div>

						</div>
					  </div></div>
			   </li>
			   <li>
				  <div><strong style="font-weight: 600;">[@secondary]</strong></div>
				  
				  <div class="wrapper" style="background-color: #fff;border-radius: .1875em;box-shadow: none;">
					<div id="multi-select">    
						<div class="multiselect-wrapper">
						  <div class="tag-list-wrapper" style="padding: .5em;">
							<div class="tag-input-genre">[@secondary_list]</div>
						  </div>

						</div>
					  </div>
			   </li>
			  
			   <li>
				  <div><strong style="font-weight: 600;">Region:</strong></div>
				  <div style="margin-top:5px;"><div class="[@region]"></div><br/></div>
			   </li>
			    <li>
				  <div><strong style="font-weight: 600;"></strong></div>
				  <div style="margin-top:5px;"></div>
			   </li>
			</ul>
			<ul class="item-info">
			   <li style="flex: 0 0 100%;">
				  <div><strong style="font-weight: 600;">Genre:</strong></div>
				  <div class="wrapper" style="background-color: #fff;border-radius: .1875em;box-shadow: none;">
					<div id="multi-select">    
						<div class="multiselect-wrapper">
						  <div class="tag-list-wrapper" style="padding: .5em;">
							<div class="tag-input-genre">[@genre]</div>
						  </div>

						</div>
					  </div>
				  </div>
			   </li>
			</ul>
		 </div>
	  </div>
	</div>
</div>


<style>

.text-warning{
	color:#00BCD4 !important;
}
.wrapper {
	display: -webkit-box;
	display: flex;
	width: 100%;
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




.module-item .header.small{
  display:none;
  font-size: 18px;
}
@media (max-width: 800px){
      ul.item-info li {
      flex: 0 0 100% !important;
  }
}
@media (max-width: 580px){

    ul.item-info li {
    flex: 0 0 100% !important;
}
  .module-item .header.small{
    display:inline;
  }
  .module-item .module-header.large{
    display:none;
  }
  
  .module-item .wrap{
      flex-direction: column;
  }
  .module-item .wrap > .row-item {
      margin-right: 0;
      max-width: 100%;
  }
   ul.item-info li {
    flex: 0 0 100%;
  }
  .module-item .wrap img{
    max-width:250px !important;
  }
}

.module-item .wrap{
    display: flex;
}

.module-item .wrap img{
      width: 225px;
}

.module-item .wrap > .row-item {
    padding: 15px;
}

ul.item-info {
    margin-top: 20px;
    display: flex;
    flex-wrap: wrap;
    list-style: none;
    margin: 0;
    padding: 0;
}

  ul.item-info li {
    flex: 0 0 50%;
    margin-bottom: 15px;
}

h2{
 margin-bottom:15px;
}

.module-item{
	margin: 30px 20px 20px 0;
    padding: 15px;
    background: #ffffff;
    border: 1px solid #bbb;
    box-shadow: 0 0 20px -3px #bbb;
	max-width:800px;
	margin-left:auto;
	margin-right:auto;
}

</style>
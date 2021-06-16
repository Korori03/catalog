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



.breadcrumb li a{
	color:#9e9e9e !important;
}
.page-content > .breadcrumb {
	padding-bottom:0px !important;
	margin-bottom:0px !important;
}


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



.row-item{
padding-bottom:0 !important;
}
.module-item .header.small{
  display:none;
  font-size: 22px;
}
@media (max-width: 825px){
      ul.item-info li {
      flex: 0 0 100% !important;
  }
  .rating-item {
      position: absolute;
      top: 360px;
    left: 50px;
  }
  .mobile_rating{
    display:inline !important;
    position: absolute;
    left: 45px;
    top: 355px;
  }
}
@media (max-width: 580px){
   .mobile_rating{
    display:inline !important;
    list-style: none;
    margin-top:0;
    margin-bottom:0;
    padding:0;
     position: unset;
     
  }
  .rating-static{
    width: 110px;
    margin-left: auto;
    margin-right: auto;
    font-size: 20px;
}
  .rating,.rating-static{
float: unset !important;
  }
.rating-item {
    position: absolute;
    top: 385px;
  left: 50px;
}
    ul.item-info li {
    flex: 0 0 100% !important;
  }
  .module-item .header.small{
    display: inline-block;
    margin-bottom:0px;
    margin-top:0px;
    text-align:center;
    width:100%;
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
    margin-left: 0px;
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
  display: inline-block;
  text-align:center;
  margin-top:0px;
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
.page-content > .breadcrumb > li {
    font-size: 11px;
    line-height: 16px;
}
.breadcrumb > li {
    display: inline-block;
}
.breadcrumb li {
    padding-top: 10px !important;
    font-size: 16px !important;
}
.breadcrumb > li {
    color: #bdbdbd;
    font-size: 11px !important;
}
.breadcrumb > li {
    display: inline-block;
}

@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

.mobile_rating li{
list-style-type: none;
}
.ribbon2 ul li,.ribbon2 ul{
  list-style-type: none; /* Remove bullets */
  padding: 0; /* Remove padding */
  margin:5px 10px; /* Remove margins */
  text-align:left;
  font-size: 17px;
}

section {
  margin: 0 auto; 
  max-width: 660px;
  padding: 0 20px;
}

.ribbon2 {

 width: 150px;
 padding: 10px 0;
 position: absolute;
 top: -6px;
 right: 25px;
 text-align: center;
 border-top-left-radius: 3px;
background-color: #7bb9ef;
}
.ribbon2:before {
 height: 0;
 width: 0;
 right: -5.5px;
 top: 0.1px;
 border-bottom: 6px solid #7bb9ef;
 border-right: 6px solid transparent;
}
.ribbon2:before, .ribbon2:after {
  content: "";
  position: absolute;
  
}
.ribbon2:after {
  
  height: 0;
  width: 0;
  bottom: -29.5px;
  left: 0;
  border-left: 75px solid #7bb9ef;
  border-right: 75px solid #7bb9ef;
  border-bottom: 30px solid transparent;
}
.mobile_rating{
    display:none;
  }
@media (max-width: 825px) {
  .rating-item{
      position: absolute;
      bottom: 0;
  }
 
  .ribbon2{
      display:none;
  }
  .ribbon2:before,.ribbon2:after{
      border:0px;
  }
  .ribbon2 ul {
    display: flex;
    justify-content: space-between;
    list-style-type: none;
    margin: -25px 10px;
    text-align: left;
    text-align: center;
    margin-right: auto;
    margin-left: auto;
    flex-direction: row; 
    flex-wrap: wrap;
  }
  .ribbon2 ul li {
     display:table-cell;
    float: left;
    flex: auto ;
   
  }
  .ribbon2 ul li:nth-child(6){
    margin-bottom:5px;
    display:inline;
  }
  .ribbon2 ul li:nth-child(-n+5){
     display:none;
  }
}
fieldset, label { margin: 0; padding: 0; }
.rating,.rating-static { 
  border: none;
  float: left;
}

.rating > input ,.rating-static > input{ display: none; } 
.rating > label:before,.rating-static > label:before { 
  margin: 1px;
  font-size: 1.07em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before, .rating-static > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label, .rating-static > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/
.rating-static > input:checked ~ label,
.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover,/* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 

.usa, .united-states {
    display: block;
    width: 30px;
    height: 5px;
    background: #cc0000;
    box-shadow: 0 0px 0 #f3f3f3, 0 8px 0 #cc0000, 0 10px 0 #f3f3f3, 0 17px 0 #cc0000, 0 20px 0 #f3f3f3, 0 25px 0 #cc0000, 0 30px 0 #f3f3f3, 0 30px 0 #cc0000;
    margin-top: 3px;
    margin-left: 3px;
}
.usa:before, .united-states:before {
    content: "";
    background: #191b6d;
    display: block;
    width: 17px;
    height: 15px;
    position: absolute;
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
<div class="page-content">
<div class="module-item" style="position: relative;">
	<h2 class="header small">[@title]</h2>
	<div class="wrap">
	  <div class="row-item" style="text-align:center;">
			<img style="box-shadow: 0 10px 16px 0 rgb(0 0 0 / 20%), 0 6px 20px 0 rgb(0 0 0 / 19%) !important;" alt="[@slug]" title="[@slug]" src="[@img]">

	  </div>
	  <div class="row-item">
		 <h2 class="module-header large">[@title]</h2>
		 <div class="featured-item-meta">
       <div>
         <ul class="mobile_rating">
          <li style="font-size:20px;">
            <fieldset class="rating-static">
              <input type="radio" id="star5" name="rating_mobile" value="5" [@rating5]><label class="full" for="star5" title="Awesome - 5 stars"></label>
              <input type="radio" id="star4half" name="rating_mobile" value="4 and a half" [@rating45]><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
              <input type="radio" id="star4" name="rating_mobile" value="4" [@rating4]><label class="full" for="star4" title="Pretty good - 4 stars"></label>
              <input type="radio" id="star3half" name="rating_mobile" value="3 and a half" [@rating35]><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
              <input type="radio" id="star3" name="rating" value="3" [@rating3]><label class="full" for="star3" title="Meh - 3 stars"></label>
              <input type="radio" id="star2half" name="rating_mobile" value="2 and a half" [@rating25]><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
              <input type="radio" id="star2" name="rating_mobile" value="2" [@rating2]><label class="full" for="star2" title="Kinda bad - 2 stars"></label>
              <input type="radio" id="star1half" name="rating_mobile" value="1 and a half" [@rating15]><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
              <input type="radio" id="star1" name="rating_mobile" value="1" [@rating1]><label class="full" for="star1" title="Sucks big time - 1 star"></label>
              <input type="radio" id="starhalf" name="rating_mobile" value="half" [@rating05]><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
            </fieldset>
          </li>
        </ul>
       </div>
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
			   </div></li>
					   <li>
				  <div><strong style="font-weight: 600;">Region:</strong></div>
				  <div style="margin-top:5px;"><div class="[@region_icon]"></div><div style="margin-left:40px;">[@region_icon]</div><br></div>
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
    <div class="row-item rating-item"> <span class="ribbon2">
        <ul>
         [@rating_list]
          <li style="font-size:20px;">
            <fieldset class="rating-static">
              <input type="radio" id="star5" name="rating" value="5" [@rating5]/><label class="full" for="star5" title="Awesome - 5 stars"></label>
              <input type="radio" id="star4half" name="rating" value="4 and a half" [@rating45] /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
              <input type="radio" id="star4" name="rating" value="4" [@rating4]/><label class="full" for="star4" title="Pretty good - 4 stars"></label>
              <input type="radio" id="star3half" name="rating" value="3 and a half" [@rating35]/><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
              <input type="radio" id="star3" name="rating" value="3" [@rating3]/><label class="full" for="star3" title="Meh - 3 stars"></label>
              <input type="radio" id="star2half" name="rating" value="2 and a half" [@rating25]/><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
              <input type="radio" id="star2" name="rating" value="2" [@rating2]/><label class="full" for="star2" title="Kinda bad - 2 stars"></label>
              <input type="radio" id="star1half" name="rating" value="1 and a half" [@rating15]/><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
              <input type="radio" id="star1" name="rating" value="1" [@rating1]/><label class="full" for="star1" title="Sucks big time - 1 star"></label>
              <input type="radio" id="starhalf" name="rating" value="half" [@rating05]/><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
            </fieldset>
          </li>
        </ul>
   </span></div>
	</div>
</div>
 </div>

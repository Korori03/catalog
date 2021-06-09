[@breadcrumb]
<div class="module-item">
	<h2 class="header small">[@name][@admin]</h2>
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
				  <div style="margin-top:5px;">[@publisher]</div>
			   </li>
			   <li>
				  <div><strong style="font-weight: 600;">Developer:</strong></div>
				  <div style="margin-top:5px;">[@developer]</div>
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
				  <div style="margin-top:5px;"><div id="tags" style="box-shadow: unset;width:100%;">[@genre]</div></div>
			   </li>
			</ul>
		 </div>
	  </div>
	</div>
</div>


<style>

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
    background: #fbfbfb;
    border: 1px solid #bbb;
    box-shadow: 0 0 20px -3px #bbb;
	max-width:800px;
	margin-left:auto;
	margin-right:auto;
}

</style>
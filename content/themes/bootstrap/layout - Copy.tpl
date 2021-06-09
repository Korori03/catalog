<!DOCTYPE html>
<html lang="zxx" class="applicationcache cors no-ie8compat history json postmessage strictmode devicemotion deviceorientation filereader localstorage sessionstorage hashchange cssgradients multiplebgs opacity cssremunit rgba fileinput formattribute placeholder hsla supports fontface generatedcontent cssscrollbar formvalidation textshadow fullscreen filesystem cssanimations backgroundsize borderradius borderimage boxshadow csscolumns csscolumns-width csscolumns-span csscolumns-fill csscolumns-gap csscolumns-rule csscolumns-rulecolor csscolumns-rulestyle csscolumns-rulewidth csscolumns-breakbefore csscolumns-breakafter csscolumns-breakinside flexbox flexboxlegacy no-overflowscrolling cssreflections csstransforms csstransforms3d csstransitions">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>Catalog</title>
      <!-- CSS -->
      <link rel="stylesheet" href="/content/themes/simple-manager/css/app.css?v[@time]">
		<!--Jquery Checker-->
      <script>(function(w,d,u){w.readyQ=[];w.bindReadyQ=[];function p(x,y){if(x=="ready"){w.bindReadyQ.push(y);}else{w.readyQ.push(x);}};var a={ready:p,bind:p};w.$=w.jQuery=function(f){if(f===d||f===u){return a}else{p(f)}}})(window,document)</script>
   </head>
   <body class="light loaded">
   
   <!--NAVIGATION ICONS-->
     [@icons]
	  
      <!-- Pre loader -->
      <div id="loader" class="loader loader-fade">
         <div class="plane-container">
            <div class="preloader-wrapper small active">
               <div class="spinner-layer spinner-blue">
                  <div class="circle-clipper left">
                     <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                     <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                     <div class="circle"></div>
                  </div>
               </div>
               <div class="spinner-layer spinner-red">
                  <div class="circle-clipper left">
                     <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                     <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                     <div class="circle"></div>
                  </div>
               </div>
               <div class="spinner-layer spinner-yellow">
                  <div class="circle-clipper left">
                     <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                     <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                     <div class="circle"></div>
                  </div>
               </div>
               <div class="spinner-layer spinner-green">
                  <div class="circle-clipper left">
                     <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                     <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                     <div class="circle"></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
	  
<!--Page-->	  
      <div id="app">
         <aside class="main-sidebar fixed offcanvas shadow" data-toggle="offcanvas">
            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height:100%px;">
               <section class="sidebar" style="overflow: hidden; width: auto;">
                  <div class="w-80px mt-3 mb-3 ml-3" style="font-size: 1.3em;">
                     <i class="icon s-18"><svg><use xlink:href="#icon-main"></use></svg> </i>
				   Catalog System
                  </div>
                  <div class="relative"></div>
				  
				  <!--Navigation-->
                  <ul class="sidebar-menu">
                     <li class="header light"><strong>MAIN NAVIGATION</strong></li>
					
					[@navigation]
                  </ul>
				  <!--End of Navigation-->
               </section>
            </div>
         </aside>
         <!--Sidebar End-->
		 
		 
         <div class="has-sidebar-left">
            <div class="pos-f-t">
               <div class="collapse" id="navbarToggleExternalContent" style="">
                  <div class="bg-dark pt-2 pb-2 pl-4 pr-2">
                     <div class="search-bar">
                        <input class="transparent s-24 text-white b-0 font-weight-lighter w-128 height-50" type="text" placeholder="start typing...">
                     </div>
                     <a href="#" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation" class="paper-nav-toggle paper-nav-white active collapsed"><i></i></a>
                  </div>
               </div>
            </div>
            <div class="sticky">
               <div class="navbar navbar-expand navbar-dark d-flex justify-content-between bd-navbar blue accent-3">
                  <div class="relative">
                     <a href="#" data-toggle="push-menu" class="paper-nav-toggle pp-nav-toggle">
                     <i></i>
                     </a>
                  </div>
                  <div style="position: absolute;left: 60px;color: #fff;font-size: 1.3em;overflow: hidden;height: 26px;width: calc(100% - 163px);">
                     [@title]
                  </div>
                  <!--Top Menu Start -->
                  <div class="navbar-custom-menu">
                     <ul class="nav navbar-nav">
                        <!-- Notifications -->
                        <li>
                           <a class="nav-link collapsed" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                           <i class=" icon-search3 "></i>
                           </a>
                        </li>
						
						[@loginicons]
                        <!-- User Account-->
                     </ul>
                  </div>
               </div>
            </div>
         </div>
         <div class="page has-sidebar-left">
            <div class="container-fluid animatedParent animateOnce">
               <div class="tab-content my-3" id="v-pills-tabContent">
                  <div class="tab-pane animated fadeInUpShort show active go" id="v-pills-all" role="tabpanel" aria-labelledby="v-pills-all-tab">
					 
					 [@content]
                  </div>
               </div>
            </div>
         </div>
      </div>

	 <script src="//code.jquery.com/jquery-3.4.1.min.js"  crossorigin="anonymous"></script>
     <script src="/content/themes/simple-manager/js/app.js?v=[@time]"></script>
   </body>
</html>
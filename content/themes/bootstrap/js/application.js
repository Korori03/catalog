
// Variables
// ------------------------------
var headerHeight = 56;

// ------------------------------
// Browser Detection Plugin
// https://github.com/gabceb/jquery-browser-plugin/
// ------------------------------
!function(a,b){"use strict";var c,d;if(a.uaMatch=function(a){a=a.toLowerCase();var b=/(opr)[\/]([\w.]+)/.exec(a)||/(chrome)[ \/]([\w.]+)/.exec(a)||/(version)[ \/]([\w.]+).*(safari)[ \/]([\w.]+)/.exec(a)||/(webkit)[ \/]([\w.]+)/.exec(a)||/(opera)(?:.*version|)[ \/]([\w.]+)/.exec(a)||/(msie) ([\w.]+)/.exec(a)||a.indexOf("trident")>=0&&/(rv)(?::| )([\w.]+)/.exec(a)||a.indexOf("compatible")<0&&/(mozilla)(?:.*? rv:([\w.]+)|)/.exec(a)||[],c=/(ipad)/.exec(a)||/(iphone)/.exec(a)||/(android)/.exec(a)||/(windows phone)/.exec(a)||/(win)/.exec(a)||/(mac)/.exec(a)||/(linux)/.exec(a)||/(cros)/i.exec(a)||[];return{browser:b[3]||b[1]||"",version:b[2]||"0",platform:c[0]||""}},c=a.uaMatch(b.navigator.userAgent),d={},c.browser&&(d[c.browser]=!0,d.version=c.version,d.versionNumber=parseInt(c.version)),c.platform&&(d[c.platform]=!0),(d.android||d.ipad||d.iphone||d["windows phone"])&&(d.mobile=!0),(d.cros||d.mac||d.linux||d.win)&&(d.desktop=!0),(d.chrome||d.opr||d.safari)&&(d.webkit=!0),d.rv){var e="msie";c.browser=e,d[e]=!0}if(d.opr){var f="opera";c.browser=f,d[f]=!0}if(d.safari&&d.android){var g="android";c.browser=g,d[g]=!0}d.name=c.browser,d.platform=c.platform,a.browser=d}(jQuery,window);


// ------------------------------
// =UTILITY BELT
// Psst: Search for '=u' to come straight here. You're welcome.
// ------------------------------
var Utility = {
    str_replace: function(c, d, b) {
        var a = c.split(d);
        return a.join(b);
    },
    str_exists: function(b, c) {
        var a = b.split(c);
        if (a[0] === b) {
            return false;
        } else {
            return true;
        }
    },
    toggle_fullscreen: function(elem) {
        // can fullscreen any element
        if ((document.fullScreenElement !== undefined && document.fullScreenElement === null) || (document.msFullscreenElement !== undefined && document.msFullscreenElement === null) || (document.mozFullScreen !== undefined && !document.mozFullScreen) || (document.webkitIsFullScreen !== undefined && !document.webkitIsFullScreen)) {
            if (elem.requestFullScreen) {
                elem.requestFullScreen();
            } else if (elem.mozRequestFullScreen) {
                elem.mozRequestFullScreen();
            } else if (elem.webkitRequestFullScreen) {
                elem.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
            } else if (elem.msRequestFullscreen) {
                elem.msRequestFullscreen();
            }
        } else {
            if (document.cancelFullScreen) {
                document.cancelFullScreen();
            } else if (document.mozCancelFullScreen) {
                document.mozCancelFullScreen();
            } else if (document.webkitCancelFullScreen) {
                document.webkitCancelFullScreen();
            } else if (document.msExitFullscreen) {
                document.msExitFullscreen();
            }
        }
    },
    getViewPort: function() {
        var e = window, a = 'inner';
        if (!('innerWidth' in window)) {
            a = 'client';
            e = document.documentElement || document.body;
        }
        return {
            width: e[a + 'Width'],
            height: e[a + 'Height']
        };
    },
    getSidebarViewportHeight: function () {
        var h;
        h = $(window).height() - headerHeight;
        return h;
    },
    sidebar_resizing: function() {
        if ($('#topnav').hasClass('navbar-fixed-top')) {
            $('.static-sidebar').css('top', headerHeight + 'px');
        } else {
            var scr = $('body').scrollTop();

            $('.static-sidebar').css('top', '0px');


            if (scr < headerHeight) {
                $('.static-sidebar').css('top',(headerHeight - scr) + 'px');
            } else {
                $('.static-sidebar').css('top','0px');
            }
        }

        Utility.initScroller();
    },
    getBrandColor: function (name) {
        // Store Brand colors in JS so it can be called from plugins
        var brandColors = {
            'default':      '#fafafa',
            'gray':         '#9e9e9e',

            'inverse':      '#757575',
            'primary':      '#03a9f4',
            'success':      '#8bc34a',
            'warning':      '#ffc107',
            'danger':       '#e51c23',
            'info':         '#00bcd4',
            
            'brown':        '#795548',
            'indigo':       '#3f51b5',
            'orange':       '#ff9800',
            'midnightblue': '#37474f',
            'teal':         '#009688',
            'pink':         '#e91e63',
            'purple':       '#9c27b0',
            'green':        '#4caf50',
            'deeppurple':   '#673ab7',
            'deeporange':   '#ff5722',
            'lime':         '#cddc39',
            'lime':         '#2196f3'
        };

        if (brandColors[name]) {
            return brandColors[name];
        } else {
            return brandColors['default'];
        }
    },
    toggle_leftbar: function() {
        var menuCollapsed = localStorage.getItem('collapsed_menu');
        
        $('body').toggleClass('sidebar-collapsed');
        Utility.switch_leftbaricons();

        if (menuCollapsed == "true")
            localStorage.setItem('collapsed_menu', "false");
        else if (menuCollapsed == "false")
            localStorage.setItem('collapsed_menu', "true");

        setTimeout(function(){                  // wait 500ms before calling resize
            $(window).trigger('resize');        // so toggle happens faster instead of
        }, 500);                                // sticking out
    }, 
    switch_leftbaricons: function() {
        if ($('body').hasClass('sidebar-collapsed')) {
            $('#trigger-sidebar i').removeClass('ti-shift-left').addClass('ti-shift-right');
        } else {
            $('#trigger-sidebar i').removeClass('ti-shift-right').addClass('ti-shift-left');
        }
    },


    // -------------------------------
    // Auto Collapse Large Menu
    // -------------------------------
    autocollapse: function() {
        var navbar = $('header.navbar');
        var menu = $('header.navbar .navbar-collapse');

        $('body').removeClass('topnav-collapsed');
        $('#topnav .navbar-left').addClass('in');
        $('#navbar-links-toggle').parent('li').hide();
        $(menu).insertAfter('header.navbar .logo-area');


        if((navbar.innerHeight() > headerHeight) || ($(window).innerWidth()<786)) { // check if we've got 2 lines Or less than 786px

            $('body').addClass('topnav-collapsed');
            $('#topnav .navbar-left').removeClass('in');
            $('#navbar-links-toggle').parent('li').show();

            navbar.append(menu.detach());
        }
    },

    initScroller: function() {
        $(".scroll-pane").nanoScroller({ paneClass: 'scroll-track',  sliderClass: 'scroll-thumb', contentClass: 'scroll-content' });
    },
    destroyScroller: function(elem) {
        $(elem).nanoScroller({ destroy: true });
    },
    animateContent: function () {
        if ($.fn.velocity) {
            $('.animated-content .info-tile, .animated-content .panel, .animated-content .widget-weather, .animated-content .widget-tasks')
            .css('visibility', 'visible')
            .velocity('transition.slideUpIn', {stagger: 50});
        }
    }
};
// ------------------------------
// =/U
// ------------------------------


// ------------------------------
// =PLUGINS. custom made shizzle, yo!
// ------------------------------
(function($) {


    // ------------------------------
    // ScrollSidebar
    // ------------------------------
    $.scrollSidebar = function(element, options) {
        var defaults = {};
        var plugin = this;

        plugin.settings = {};
        var $element = $(element),
            element = element;

    }
    $.fn.scrollSidebar = function(options) {
        return this.each(function() {
            if (undefined == $(this).data('scrollSidebar')) {
                var plugin = new $.scrollSidebar(this, options);
                $(this).data('scrollSidebar', plugin);
            };
        });
    };


    // ------------------------------
    // Sidebar Accordion Menu
    // ------------------------------
    $.sidebarAccordion = function(element, options) {
        var defaults = {};
        var plugin = this;

        plugin.settings = {};
        var $element = $(element),
            element = element;

        plugin.init = function() {
            plugin.settings = $.extend({}, defaults, options);

            var menuCollapsed = localStorage.getItem('collapsed_menu');
            if (menuCollapsed === null) {
                localStorage.setItem('collapsed_menu', "false");
            }
            if (menuCollapsed === "true") {
                $('body').addClass('sidebar-collapsed');
            }

            $('body').on('click', 'ul.acc-menu a', function() {
                var LIs = $(this).closest('ul.acc-menu').children('li');
                $(this).closest('li').addClass('clicked');
                $.each( LIs, function(i) {
                    if( $(LIs[i]).hasClass('clicked') ) {
                        $(LIs[i]).removeClass('clicked');
                        return true;
                    }
                    $(LIs[i]).find('ul.acc-menu:visible').slideToggle({duration: 100});
                    $(LIs[i]).removeClass('open');
                });

                if (!$('body').hasClass('sidebar-collapsed') || $(this).parents('ul.acc-menu').length > 1) {
                    if($(this).siblings('ul.acc-menu:visible').length>0)
                        $(this).closest('li').removeClass('open');
                    else
                        $(this).closest('li').addClass('open');
                        $(this).siblings('ul.acc-menu').slideToggle({duration: 100});
                }
            });

            var targetAnchor;
            $.each ($('ul.acc-menu a'), function() {
                if( this.href == window.location ) {
                    targetAnchor = this;
                    return false;
                };
            });

            var parent = $(targetAnchor).closest('li');
            while(true) {
                parent.addClass('active');
                parent.closest('ul.acc-menu').show().closest('li').addClass('open');
                parent = $(parent).parents('li').eq(0);
                if( $(parent).parents('ul.acc-menu').length <= 0 ) break;
            };

            var liHasUlChild = $('li').filter(function(){
                return $(this).find('ul.acc-menu').length;
            });
            $(liHasUlChild).addClass('hasChild');

        };
        plugin.init();
    }
    $.fn.sidebarAccordion = function(options) {
        return this.each(function() {
            if (undefined === $(this).data('sidebarAccordion')) {
                var plugin = new $.sidebarAccordion(this, options);
                $(this).data('sidebarAccordion', plugin);
            }
        });
    }

})(jQuery);
// ------------------------------
// =/P
// ------------------------------


// ------------------------------
// =DOM Ready
// ------------------------------
$(document).ready(function () {

    enquire.register("screen and (max-width: 767px)", {
        match : function() {
            //small
            if (!($('body').hasClass('sidebar-scroll'))) { //if not already added
                $('.static-sidebar').addClass('scroll-pane');
                $('.static-sidebar > .sidebar').addClass('scroll-content');
            }
        },  
        unmatch : function() {
            //big
            if (!($('body').hasClass('sidebar-scroll'))) { //if not already added
                console.log('here');
                $('.static-sidebar').removeClass('scroll-pane has-scrollbar');
                $('.static-sidebar > .sidebar').removeClass('scroll-content');
                $('.static-sidebar > .sidebar').css('margin-right','');
                $('.static-sidebar > .sidebar').css('right','');
                $('.static-sidebar.scroll-pane').nanoScroller({ stop: true });
            }
        }
    });

    // Add These To support nanoScroller
    if ($('body').hasClass('sidebar-scroll')) {
        $('.static-sidebar').addClass('scroll-pane');
        $('.sidebar').addClass('scroll-content');
    }


    // Scrollbar and reinitting scrollbars
    Utility.initScroller();
    $('.toolbar').on('shown.bs.dropdown', function () {Utility.initScroller();});
    $('.widget').on('shown.bs.collapse', function () {Utility.initScroller();});
    $('.widget').on('hidden.bs.collapse', function () {Utility.initScroller();});



    Utility.sidebar_resizing();

    // ------------------------------
    // Sidebar Accordion
    // ------------------------------
    $('body').sidebarAccordion();


    // ------------------------------
    // Toggling Sidebars
    // ------------------------------
    $('#trigger-sidebar>a').click(function () {
        Utility.toggle_leftbar();
    });

    $('#trigger-fullscreen').click(function () {
        Utility.toggle_fullscreen(document.documentElement);
    });

    //Extrabar
        $('#trigger-extrabar>a').click(function () {
            $('body').toggleClass('extrabar-show')
        });

        $('.extrabar-underlay').click(function(event) {
            $('body').removeClass('extrabar-show');
            event.stopPropagation();
        });

    // ------------------------------
    // Megamenu
    // This code will prevent unexpected menu close 
    // when using some components (like accordion, forms, etc)
    // ------------------------------
    $('body').on('click', '.yamm .dropdown-menu, .dropdown-menu-form', function(e) {
      e.stopPropagation()
    })
    
    // -------------------------------
    // For tabs inside dropdowns
    // -------------------------------
    $('.dropdown-menu a[data-toggle="tab"]').click(function (e) {
        e.stopPropagation();
        $(this).tab('show');
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
        $(this).closest('.dropdown').removeClass('active');        
    });

    // -------------------------------
    // Small screen
    // -------------------------------
    //enquire.register("screen and (min-width: 768px)", {
    //    match : function() {
    //        $('.static-sidebar').css('transform','');
    //    }
    //});

    // -------------------------------
    // Back to Top button
    // -------------------------------
    $('#back-to-top').click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500);
        return false;
    });

    // -------------------------------
    // Panel Collapses
    // -------------------------------
    $('a.panel-collapse').click(function() {
        $(this).children().toggleClass("fa-chevron-down fa-chevron-up");
        $(this).closest(".panel-heading").next().slideToggle({duration: 200});
        $(this).closest(".panel-heading").toggleClass('rounded-bottom');
        return false;
    });

    // -------------------------------
    // FireFox Shim
    // FireFox is the *only* browser that doesn't support position:relative for
    // block elements with display set to table-cell, which is needed for the footer.
    // TODO: Replace $.browser with Modernizer.
    // -------------------------------
    if ($.browser.mozilla) {
        $('footer').css('width',$('footer').parent().width());

        $(window).on('resize', function() {
            $('footer').css('width',$('footer').parent().width());
        });
    }

    // ---------------------------------
    // Faux Off-cavas effect on collapse
    // ---------------------------------
    enquire.register("screen and (max-width: 690px)", {
        match : function() {  //smallscreen
            $('body').addClass('sidebar-collapsed');

            // if ($('body').hasClass('sidebar-collapsed')) {
                setWidthtoContent();
            // }
            $(window).on('resize', setWidthtoContent);
        },
        unmatch : function() {  //bigscreen
            $('body').removeClass('sidebar-collapsed');

            $('.static-content').css('width','');
            $(window).off('resize', setWidthtoContent);
        }
    });
        
    function setWidthtoContent() {
        var w = $('#wrapper').innerWidth();
        //$('.static-content').css('width',(w)+'px');
    }

    // -------------------------------
    // Search on Top
    // -------------------------------
    $('#trigger-toolbar-search').click( function() {
        $("#toolbar-search").toggleClass('active');
    });

    $('#toolbar-search .remove').click( function() {
        $("#toolbar-search").toggleClass('active');
    });

    // Autocollapse
    Utility.autocollapse();

});
// ------------------------------
// =/D No more D for you.
// ------------------------------


// ------------------------------
// DOM Loaded
// ------------------------------
$(window).bind("load", function() { 
    Utility.animateContent();
    $('body').scrollSidebar();
    $(window).trigger('resize');
});


$(window).scroll(function(){
    Utility.sidebar_resizing();
});

$(window).resize(function(){
    Utility.autocollapse();
    Utility.sidebar_resizing();
    Utility.switch_leftbaricons();
});




// Wijets Reconfigured

$.wijets.registerAction( {
    handle: "colorpicker",
    html: '<div class="dropdown"><span class="button-icon has-bg dropdown-toggle" data-toggle="dropdown"><i class="ti ti-palette"></i></span>'+
    '<ul class="panel-color-list dropdown-menu arrow" role="menu">'+
        '<li><span data-style="panel-info"></span></li>'+
        '<li><span data-style="panel-primary"></span></li>'+
        '<li><span data-style="panel-blue"></span></li>'+
        '<li><span data-style="panel-indigo"></span></li>'+
        '<li><span data-style="panel-deeppurple"></span></li>'+
        '<li><span data-style="panel-purple"></span></li>'+
        '<li><span data-style="panel-pink"></span></li>'+
        '<li><span data-style="panel-danger"></span></li>'+
        '<li><span data-style="panel-teal"></span></li>'+
        '<li><span data-style="panel-green"></span></li>'+
        '<li><span data-style="panel-success"></span></li>'+
        '<li><span data-style="panel-lime"></span></li>'+
        '<li><span data-style="panel-yellow"></span></li>'+
        '<li><span data-style="panel-warning"></span></li>'+
        '<li><span data-style="panel-orange"></span></li>'+
        '<li><span data-style="panel-deeporange"></span></li>'+
        '<li><span data-style="panel-bluegray"></span></li>'+
        '<li><span data-style="panel-default"></span></li>'+
        '<li><span data-style="panel-brown"></span></li>'+
    '</ul></div>',
    onClick: function () {
    },
    onInit: function () {
        var headerStyle = $(this).getWidgetState('headerStyle');
        if (headerStyle) {
            var widget = $(this).closest('[data-widget]');
            widget.removeClass('panel-info panel-primary panel-blue panel-indigo panel-deeppurple panel-purple panel-pink panel-danger panel-teal panel-green panel-success panel-lime panel-yellow panel-warning panel-orange panel-deeporange panel-midnightblue panel-bluegray panel-bluegraylight panel-black panel-gray panel-default panel-white panel-brown')
                .addClass(headerStyle);
        }
        var button = $(this);
        $(this).find('.dropdown-menu').bind('click', function (e) {
            e.stopPropagation();
        });
        $(this).find('li span').bind('click', function (e) {
            var widget = button.closest('[data-widget]');
            widget.removeClass('panel-info panel-primary panel-blue panel-indigo panel-deeppurple panel-purple panel-pink panel-danger panel-teal panel-green panel-success panel-lime panel-yellow panel-warning panel-orange panel-deeporange panel-midnightblue panel-bluegray panel-bluegraylight panel-black panel-gray panel-default panel-white panel-brown')
                .addClass($(this).attr('data-style'));
            $(button).setWidgetState('headerStyle', $(this).attr('data-style'));
            e.stopPropagation();
        });
    }
});

$.wijets.registerAction( {
  handle: "refresh-demo",
  html: '<span class="button-icon"><i class="ti ti-reload"></i></span>',
  onClick: function () {
  var params = $(this).data('actionParameters');
    var widget = $(this).closest('[data-widget]');
    widget.append('<div class="panel-loading"><div class="panel-loader-' + params.type + '"></div></div>');
    setTimeout( function () {
      widget.find('.panel-loading').remove();
    }, 2000);
  }
});

var bootstrap_title = "Houston County Revenue :: ";
	
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
	alert: function(msg, title,button_options,options,cb){
			
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
				callback: cb
			});
			
		},
		confirm: function(msg, title,button_options,options,cb){
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
				callback: cb
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
						'<ul class="pagination" id="pagin_' + appendto + '"></ul>'
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
$(function(){
	$('#rotateImgHolder').SlideContainer(2);

	$('.propsearch_mobile, .propsearch').click(function(){
		$(location).attr('href','/Pay-Search');
	});
	
	var posts = document.getElementsByClassName("news_post");
	for(var i=0;i<posts.length;i++) {
	  posts[i].style["background-color"] = i % 2 === 0 ?  "#ffffff":"#DEE4E6";
	}
});


			
		var scrolllocation = 100;
			
		
			
		$(function(){
			
			$('#header').click(function(event){
				if(event.target.id == "header")
					$(location).attr('href','/');
			});
		
			$('.mobile_tri').click(function(event){
				 event.stopPropagation();
				event.preventDefault();
				$(this).toggleClass("change_tri");
				var text = $('.mobile_tri').text()
				$('.mobile_tri').text(text == "Dept. Navigation"?"Hide Navigation":"Dept. Navigation");
				$('.mobile_sub_dept').slideToggle();
			});
			$('.mobile_admin').click(function(event){
				 event.stopPropagation();
				event.preventDefault();
				$(this).toggleClass("change_mobileA");
				var text = $('.mobile_admin').text()
				$('.mobile_admin').text(text == "Admin Menu"?"Hide Menu":"Admin Menu");
				
				$('.m_admin').slideToggle();
			});
		});

		
		
		
	function calendarMonth(year,month){
		$.post('/jquery',{year:year,month:month,'action':'calendarmonth'},function(data){
			
			$('#calendar_events').html(data);
		});
			
	}
$(function(){
	$('#btnSearch').click(function(){
    
		if($('#txtSearch').val() !== ''){
		var	objects =$('#objects').val().split(';'),
			search =$('#txtSearch').val().replace(/\s/g,'_');
		
			$(location). attr('href', '/' + objects.join('/') + '/search/' + search); 
        }
	});
	
	$('.mobile_bars').click(function(event){
			 event.stopPropagation();
			event.preventDefault();
			$(this).toggleClass("change");
			$('.mobile').slideToggle();
        });

     
            var default_username = "Username";
            $(document).on('focus','#usernameM',function(){
                if($(this).val() == default_username)
                $(this).attr('value' ,'');
            });
            
            $(document).on('blur','#usernameM',function(){
                if($(this).val() == '')
                $(this).attr('value',default_username);
            });
            
            $(document).on('keypress keydown',"#passwordM",function(e) {
                if(e.which == 13) {
                   $(this).blur();
                   dynLogin();
                }
            });
            $(document).on("click","#btnLoginM",function(){
                dynLogin();
            });
   
});

function dynLogin(){

   var d = {
       username:$("#usernameM").val(),
       password:$("#passwordM").val(),
       remember:($('.switch').find('input').prop('checked')?'1':'0'),sublogin:1
    };

    $.post("/jquery",d,function(data) {
        console.log(data);
        if(data.status === true){
            $(location).attr("href", "/");
        }
        else
            $.jpop.alert(data.message, 'Catalog', {type:'warning'},{resizable:false,icon:'check',close:true});

    });

}

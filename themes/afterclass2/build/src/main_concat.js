$(document).ready(function() {	

    // Hide the directory navigation
    $('.division-directory').hide();


    // Show/Hide the directory navigation on-click
    $('.directory-toggle').click(function() {
        $(this).toggleClass("active");
        $('.division-directory').slideToggle();
        return false;
    });


    // For small screens - show/hide the search on-click
    $('.search-toggle').click(function() {
        $(this).toggleClass('active');
        $('.division-search').slideToggle();
        return false;
    });    


    // For small screens - show the directory
    $('.division-menu').on('click', '.has-subnav a', function() {
        $(this).next().slideToggle('slow');
        $(this).toggleClass('active');

    });

});
(function($) {
$(function() {

	var fetching = false;

	$('.calendar-view-more').on("click",function(e) {
		fetching = true;
		e.preventDefault();
		$(this).addClass('loading');
		var $t = $(this);
		$.ajax({
			url: $t.attr('href'),
			success: function(data) {
				$t.remove();
				$('#event-calendar-events').append(data);
				fetching = false;
			}

		})
	});

	/*
	$(window).scroll(function() {
		if($('.calendar-view-more').length && !fetching) {
			var offset = $('.calendar-view-more').offset();
			if($(window).scrollTop()+$(window).height() >= offset.top) {				
				$('.calendar-view-more').click();
			}			
		}
	});
	*/
});

})(jQuery);

(function($){

  	var CalendarWidget = function() {
  		this.settings = {};
  		if($.CalendarWidget) {
    		this.settings = $.CalendarWidget.settings;
    	}    	
    }

    $.extend(CalendarWidget.prototype, {

    	attachTo: function(element) {
    		this.element = element;
    	},


    	getContainer: function() {
    		return this.element;
    	},


		setMonth: function(month, year) {
    		this.month = month;
    		this.year = year;
			this.firstDay = new Date(this.year, this.month, 1);
			this.startingDay = this.firstDay.getDay();
			if($.CalendarWidget.settings.startOnMonday) {
				if(this.startingDay === 0) this.startingDay=6; else 
				this.startingDay--;
			}			
			this.monthLength = this.settings.calDaysInMonth[this.month];
			// compensate for leap year
			if (this.month == 1) { // February only!
				if((this.year % 4 == 0 && this.year % 100 != 0) || this.year % 400 == 0){
					this.monthLength = 29;
				}
			}
			
			html = this.generateHTML();
			$(this.element).html(html);			

			var calendar = this;

			$('.prev', this.element).click(function() {
				calendar.previousMonth();
			});


			$('.next', this.element).click(function() {
				calendar.nextMonth();
			});


			$('.calendar-day',this.element).click(function() {
				calendar.showDay(this);
			});


			$('.show-week', this.element).click(function() {
				calendar.showWeek(this);
			});


			$('.show-month',this.element).click(function() {
				calendar.showMonth(this);
			});
		},



		getPaddedMonth: function() {
			return this.pad(this.month+1);
		},



		setOptions: function(options) {
			$.extend(this.settings, options);
		},



    	getNextMonthYear: function() {
			var m = this.month+1;
			var y = this.year;
			if(m > 11) {
				m = 0;
				y++;
			}
			return [m, y];    		
    	},



    	getPrevMonthYear: function() {
			var m = this.month-1;
			var y = this.year;
			if(m < 0) {
				m = 11;
				y--;
			}
			return [m, y];    		
    	},



    	previousMonth: function() {
    		result = this.getPrevMonthYear();
			this.setMonth(result[0], result[1]);
			this.settings.onMonthChange(result[0]+1, result[1], this);
		},



    	nextMonth: function() {    		
    		result = this.getNextMonthYear();
			this.setMonth(result[0], result[1]);
			this.settings.onMonthChange(result[0]+1, result[1], this);
		},



		showDay: function(element) {
			this.settings.onShowDay($(element).data('date'), this);
		},



		showWeek: function(element) {
			var start = $(element).closest('tr').find('td').eq(0);
			var end = $(element).closest('tr').find('td').eq(6);
			this.settings.onShowWeek(start.data('date'), end.data('date'), this);			
		},



		showMonth: function(element) {
			month = this.getPaddedMonth();
			start = this.year + '-' + month + '-01';
			end = this.year + '-' + month + '-' + this.monthLength;
			this.settings.onShowMonth(start, end, this);
		},


		generateHTML: function() {
			// do the header
			var monthName = this.settings.calMonthsLabels[this.month]			
			var html = '<table class="calendar-widget-table">';
			html += '<thead>';
			html += '<tr><th colspan="8"><a class="prev" href="javascript:void(0);"> &laquo; </a>';
			html +=  '<a href="javascript:void(0);" class="show-month">'+monthName + "&nbsp;" + this.year + '</a>';
			html += '<a class="next" href="javascript:void(0);"> &raquo; </a></th></tr>';
			html += '</thead>';
			html += '<tbody>';
			html += '<tr class="calendar-header">';
			for(var i = 0; i <= 6; i++ ){
				html += '<td class="calendar-header-day">';
				html += this.settings.calDaysLabels[i];
				html += '</td>';
			}
			html += "<td>&nbsp;</td>"
			html += '</tr><tr>';

			var cell = 1;
			var empties = 0;
			var row_count = Math.ceil((this.monthLength+this.startingDay)/7);

			for (var i = 0; i < row_count; i++) {
				for (var j = 0; j <= 6; j++) {
					date = "";
					diff = cell-this.startingDay;
					out_of_month = false;
					if(diff < 1) {
						out_of_month = true;
						r = this.getPrevMonthYear();
						m = r[0];
						y = r[1];
						days = this.settings.calDaysInMonth[m];
						day = days + diff;					
						empties++;
					}
					else {
						day = cell-empties;
						m = this.month;
						y = this.year;
					}
					if(!out_of_month && day > this.monthLength) {
						out_of_month = true;					
						r = this.getNextMonthYear();						
						m = r[0];
						y = r[1];
						days = this.settings.calDaysInMonth[m];
						day = cell-empties-this.monthLength;
					}
					today = new Date();
					if(today.getFullYear() == this.year && today.getMonth() == m && today.getDate() == day) {
						klass = "today";
					}
					else {
						klass = out_of_month ? "out-of-month" : "in-month";
					}
					d = this.pad(day);
					m = this.pad(m+1);
					date = y+'-'+m+'-'+d;
					html += '<td data-date="'+date+'" class="calendar-day '+klass+'">'+day+'</td>';
					cell++;
					
				}
				html += "<td class='show-week'>&laquo;</td>";
				html += '</tr><tr>';
			}
			html += '</tr></tbody></table>';
			return html;
		},

		pad: function(num) {
			str = new String(num);
			return (str.length == 1) ? "0"+str : str;
		}


	});



  	$.fn.extend({
  		CalendarWidget: function(options) {
	    	return this.each(function() {
	    		var c = new CalendarWidget();
	    		c.setOptions(options);
	    		c.attachTo(this);
				var currentDate = new Date();
		    	var year = options.year ? options.year : currentDate.getFullYear();
		    	var month = options.month ? options.month : currentDate.getMonth();
		    	c.setMonth(month, year);
		    	c.settings.onInit(c);
    		});
  		}
    });

  	// Create the singleton for global settings
    $.CalendarWidget = new CalendarWidget();
    $.CalendarWidget.setOptions({
		onShowDay: function(date) {},
		onShowWeek: function(start, end) {},
		onShowMonth: function(start, end) {},
		onMonthChange: function(month, year) {},
		onInit: function(calendar) {},
		startOnMonday: false,
		calDaysInMonth: [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
		calDaysLabels: [],
		calMonthsLabels: []
    });

})( jQuery );

(function($) {
    $.CalendarWidget.setOptions({
        startOnMonday: false,
        calDaysLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        calMonthsLabels: ['January', 'February', 'March', 'April','May', 'June', 'July', 'August', 'September','October', 'November', 'December']

    })
})(jQuery);
(function($) {
$(function() {

var calendar_url = $('.calendar-widget').data('url');
var loaded_months = {};

function loadMonthJson(month, year) {
	$.ajax({
		url: calendar_url+"monthjson/"+year+month,
		async: false,
		dataType: 'json',
		success: function(data) {
			json = data;
			loaded_months[year+month] = data;			
		}
	});	
}


function applyMonthJson(month, year) {	
	json = loaded_months[year+month];
	for(date in json) {
		if(json[date].events.length) {
			$('[data-date="'+date+'"]').addClass('hasEvent').attr('title', json[date].events.join("\n"));

		}
	}			
}


function setSelection(calendar) {
	var $e = $(calendar.getContainer());
	if($e.data('start') && $e.data('end')) {
		var starts = $e.data('start').split("-");
		var ends = $e.data('end').split("-");
		var startDate = new Date(starts[0], Number(starts[1])-1, Number(starts[2]));
		var endDate = new Date(ends[0], Number(ends[1])-1, Number(ends[2]));
		var startTime = startDate.getTime();
		var endTime = endDate.getTime()+86400000;
		
		for(loopTime = startTime; loopTime < endTime; loopTime += 86400000) {
		    var loopDay=new Date(loopTime)
		    var stamp = loopDay.getFullYear()+"-"+calendar.pad(loopDay.getMonth()+1)+"-"+calendar.pad(loopDay.getDate());		    
		    $('.calendar-day[data-date="'+stamp+'"]').addClass('selected');
		    
		}		
	}

}

$('.calendar-widget').each(function() {
	var opts = {
		onShowDay: function(date) {
			window.location = calendar_url+"show/"+date;		
		},
		onShowWeek: function(start, end) {
			window.location = calendar_url+"show/"+start+"/"+end;
		},
		onShowMonth: function(start, end) {
			window.location = calendar_url+"show/"+start+"/"+end;		
		},

		onMonthChange: function(month, year, calendar) {
			var json;
			m = calendar.pad(month);
			prev_month = calendar.pad(month+1);
			next_month = calendar.pad(month-1);			
			if(!loaded_months[year+m]) {
				loadMonthJson(m, year);
			}
			json = loaded_months[year+m];
			applyMonthJson(m, year);
			applyMonthJson(prev_month, prev_year);
			applyMonthJson(next_month, next_year);
			setSelection(calendar);
		},

		onInit: function(calendar) {
			previous = calendar.getPrevMonthYear();		
			next = calendar.getNextMonthYear();

			this_month = calendar.getPaddedMonth();
			this_year = calendar.year;
			prev_month = calendar.pad(previous[0]+1);
			next_month = calendar.pad(next[0]+1);
			prev_year = previous[1];
			next_year = next[1];

			loadMonthJson(
				this_month,
				this_year
			);

			loadMonthJson(
				prev_month,
				prev_year
			);

			loadMonthJson(
				next_month,
				next_year
			);
			applyMonthJson(this_month, this_year);
			applyMonthJson(prev_month, prev_year);
			applyMonthJson(next_month, next_year);

			setSelection(calendar);
			
		}

	};	

	if($(this).data('start')) {		
		var parts = $(this).data('start').split('-');				
		opts.month = Number(parts[1])-1;
		opts.year = parts[0];

		
	}
	$(this).CalendarWidget(opts);
	
})

});
})(jQuery);

/*!
  hey, [be]Lazy.js - v1.2.2 - 2014.05.04
  A lazy loading and multi-serving image script
  (c) Bjoern Klinggaard - @bklinggaard - http://dinbror.dk/blazy
*/
(function(e){"function"===typeof define&&define.amd?define(e):window.Blazy=e()})(function(){function e(b){if(!document.querySelectorAll){var f=document.createStyleSheet();document.querySelectorAll=function(b,a,e,c,g){g=document.all;a=[];b=b.replace(/\[for\b/gi,"[htmlFor").split(",");for(e=b.length;e--;){f.addRule(b[e],"k:v");for(c=g.length;c--;)g[c].currentStyle.k&&a.push(g[c]);f.removeRule(0)}return a}}k=!0;g=[];a=b||{};a.error=a.error||!1;a.offset=a.offset||100;a.success=a.success||!1;a.selector=a.selector||".b-lazy";a.separator=a.separator||"|";a.container=a.container?document.querySelectorAll(a.container):!1;a.errorClass=a.errorClass||"b-error";a.breakpoints=a.breakpoints||!1;a.successClass=a.successClass||"b-loaded";a.src=p=a.src||"data-src";r=1<window.devicePixelRatio;c=s(t,25);q=s(u,50);u();l(a.breakpoints,function(b){if(b.width>=window.screen.width)return p=b.src,!1});v()}function v(){y(a.selector);k&&(k=!1,a.container&&l(a.container,function(b){m(b,"scroll",c)}),m(window,"resize",q),m(window,"resize",c),m(window,"scroll",c));t()}function t(){for(var b=0;b<h;b++){var f=g[b],d=f.getBoundingClientRect(),c=w+a.offset;if(0<=d.left&&d.right<=x+a.offset&&(0<=d.top&&d.top<=c||d.bottom<=c&&d.bottom>=0-a.offset)||-1!==(" "+f.className+" ").indexOf(" "+a.successClass+" "))e.prototype.load(f),g.splice(b,1),h--,b--}0===h&&e.prototype.destroy()}function z(b){if(0<b.offsetWidth&&0<b.offsetHeight){var f=b.getAttribute(p)||b.getAttribute(a.src);if(f){var f=f.split(a.separator),d=f[r&&1<f.length?1:0],f=new Image;l(a.breakpoints,function(a){b.removeAttribute(a.src)});b.removeAttribute(a.src);f.onerror=function(){a.error&&a.error(b,"invalid");b.className=b.className+" "+a.errorClass};f.onload=function(){"img"===b.nodeName.toLowerCase()?b.src=d:b.style.backgroundImage='url("'+d+'")';b.className=b.className+" "+a.successClass;a.success&&a.success(b)};f.src=d}else a.error&&a.error(b,"missing"),b.className=b.className+" "+a.errorClass}}function y(b){b=document.querySelectorAll(b);for(var a=h=b.length;a--;g.unshift(b[a]));}function u(){w=window.innerHeight||document.documentElement.clientHeight;x=window.innerWidth||document.documentElement.clientWidth}function m(b,a,d){b.attachEvent?b.attachEvent&&b.attachEvent("on"+a,d):b.addEventListener(a,d,!1)}function n(b,a,d){b.detachEvent?b.detachEvent&&b.detachEvent("on"+a,d):b.removeEventListener(a,d,!1)}function l(b,a){if(b&&a)for(var d=b.length,c=0;c<d&&!1!==a(b[c],c);c++);}function s(a,c){var d=0;return function(){var e=+new Date;e-d<c||(d=e,a.apply(g,arguments))}}var p,a,x,w,g,h,r,k,c,q;e.prototype.revalidate=function(){v()};e.prototype.load=function(b){-1===(" "+b.className+" ").indexOf(" "+a.successClass+" ")&&z(b)};e.prototype.destroy=function(){a.container&&l(a.container,function(a){n(a,"scroll",c)});n(window,"scroll",c);n(window,"resize",c);n(window,"resize",q);h=0;g.length=0;k=!0};return e});
/*
 * jQuery FlexSlider v2.1
 * http://www.woothemes.com/flexslider/
 *
 * Copyright 2012 WooThemes
 * Free to use under the GPLv2 license.
 * http://www.gnu.org/licenses/gpl-2.0.html
 *
 * Contributing author: Tyler Smith (@mbmufffin)
 */
(function(d){d.flexslider=function(j,l){var a=d(j),c=d.extend({},d.flexslider.defaults,l),e=c.namespace,q="ontouchstart"in window||window.DocumentTouch&&document instanceof DocumentTouch,u=q?"touchend":"click",m="vertical"===c.direction,n=c.reverse,h=0<c.itemWidth,s="fade"===c.animation,t=""!==c.asNavFor,f={};d.data(j,"flexslider",a);f={init:function(){a.animating=!1;a.currentSlide=c.startAt;a.animatingTo=a.currentSlide;a.atEnd=0===a.currentSlide||a.currentSlide===a.last;a.containerSelector=c.selector.substr(0,
c.selector.search(" "));a.slides=d(c.selector,a);a.container=d(a.containerSelector,a);a.count=a.slides.length;a.syncExists=0<d(c.sync).length;"slide"===c.animation&&(c.animation="swing");a.prop=m?"top":"marginLeft";a.args={};a.manualPause=!1;var b=a,g;if(g=!c.video)if(g=!s)if(g=c.useCSS)a:{g=document.createElement("div");var p=["perspectiveProperty","WebkitPerspective","MozPerspective","OPerspective","msPerspective"],e;for(e in p)if(void 0!==g.style[p[e]]){a.pfx=p[e].replace("Perspective","").toLowerCase();
a.prop="-"+a.pfx+"-transform";g=!0;break a}g=!1}b.transitions=g;""!==c.controlsContainer&&(a.controlsContainer=0<d(c.controlsContainer).length&&d(c.controlsContainer));""!==c.manualControls&&(a.manualControls=0<d(c.manualControls).length&&d(c.manualControls));c.randomize&&(a.slides.sort(function(){return Math.round(Math.random())-0.5}),a.container.empty().append(a.slides));a.doMath();t&&f.asNav.setup();a.setup("init");c.controlNav&&f.controlNav.setup();c.directionNav&&f.directionNav.setup();c.keyboard&&
(1===d(a.containerSelector).length||c.multipleKeyboard)&&d(document).bind("keyup",function(b){b=b.keyCode;if(!a.animating&&(39===b||37===b))b=39===b?a.getTarget("next"):37===b?a.getTarget("prev"):!1,a.flexAnimate(b,c.pauseOnAction)});c.mousewheel&&a.bind("mousewheel",function(b,g){b.preventDefault();var d=0>g?a.getTarget("next"):a.getTarget("prev");a.flexAnimate(d,c.pauseOnAction)});c.pausePlay&&f.pausePlay.setup();c.slideshow&&(c.pauseOnHover&&a.hover(function(){!a.manualPlay&&!a.manualPause&&a.pause()},
function(){!a.manualPause&&!a.manualPlay&&a.play()}),0<c.initDelay?setTimeout(a.play,c.initDelay):a.play());q&&c.touch&&f.touch();(!s||s&&c.smoothHeight)&&d(window).bind("resize focus",f.resize);setTimeout(function(){c.start(a)},200)},asNav:{setup:function(){a.asNav=!0;a.animatingTo=Math.floor(a.currentSlide/a.move);a.currentItem=a.currentSlide;a.slides.removeClass(e+"active-slide").eq(a.currentItem).addClass(e+"active-slide");a.slides.click(function(b){b.preventDefault();b=d(this);var g=b.index();
!d(c.asNavFor).data("flexslider").animating&&!b.hasClass("active")&&(a.direction=a.currentItem<g?"next":"prev",a.flexAnimate(g,c.pauseOnAction,!1,!0,!0))})}},controlNav:{setup:function(){a.manualControls?f.controlNav.setupManual():f.controlNav.setupPaging()},setupPaging:function(){var b=1,g;a.controlNavScaffold=d('<ol class="'+e+"control-nav "+e+("thumbnails"===c.controlNav?"control-thumbs":"control-paging")+'"></ol>');if(1<a.pagingCount)for(var p=0;p<a.pagingCount;p++)g="thumbnails"===c.controlNav?
'<img src="'+a.slides.eq(p).attr("data-thumb")+'"/>':"<a>"+b+"</a>",a.controlNavScaffold.append("<li>"+g+"</li>"),b++;a.controlsContainer?d(a.controlsContainer).append(a.controlNavScaffold):a.append(a.controlNavScaffold);f.controlNav.set();f.controlNav.active();a.controlNavScaffold.delegate("a, img",u,function(b){b.preventDefault();b=d(this);var g=a.controlNav.index(b);b.hasClass(e+"active")||(a.direction=g>a.currentSlide?"next":"prev",a.flexAnimate(g,c.pauseOnAction))});q&&a.controlNavScaffold.delegate("a",
"click touchstart",function(a){a.preventDefault()})},setupManual:function(){a.controlNav=a.manualControls;f.controlNav.active();a.controlNav.live(u,function(b){b.preventDefault();b=d(this);var g=a.controlNav.index(b);b.hasClass(e+"active")||(g>a.currentSlide?a.direction="next":a.direction="prev",a.flexAnimate(g,c.pauseOnAction))});q&&a.controlNav.live("click touchstart",function(a){a.preventDefault()})},set:function(){a.controlNav=d("."+e+"control-nav li "+("thumbnails"===c.controlNav?"img":"a"),
a.controlsContainer?a.controlsContainer:a)},active:function(){a.controlNav.removeClass(e+"active").eq(a.animatingTo).addClass(e+"active")},update:function(b,c){1<a.pagingCount&&"add"===b?a.controlNavScaffold.append(d("<li><a>"+a.count+"</a></li>")):1===a.pagingCount?a.controlNavScaffold.find("li").remove():a.controlNav.eq(c).closest("li").remove();f.controlNav.set();1<a.pagingCount&&a.pagingCount!==a.controlNav.length?a.update(c,b):f.controlNav.active()}},directionNav:{setup:function(){var b=d('<ul class="'+
e+'direction-nav"><li><a class="'+e+'prev" href="#">'+c.prevText+'</a></li><li><a class="'+e+'next" href="#">'+c.nextText+"</a></li></ul>");a.controlsContainer?(d(a.controlsContainer).append(b),a.directionNav=d("."+e+"direction-nav li a",a.controlsContainer)):(a.append(b),a.directionNav=d("."+e+"direction-nav li a",a));f.directionNav.update();a.directionNav.bind(u,function(b){b.preventDefault();b=d(this).hasClass(e+"next")?a.getTarget("next"):a.getTarget("prev");a.flexAnimate(b,c.pauseOnAction)});
q&&a.directionNav.bind("click touchstart",function(a){a.preventDefault()})},update:function(){var b=e+"disabled";1===a.pagingCount?a.directionNav.addClass(b):c.animationLoop?a.directionNav.removeClass(b):0===a.animatingTo?a.directionNav.removeClass(b).filter("."+e+"prev").addClass(b):a.animatingTo===a.last?a.directionNav.removeClass(b).filter("."+e+"next").addClass(b):a.directionNav.removeClass(b)}},pausePlay:{setup:function(){var b=d('<div class="'+e+'pauseplay"><a></a></div>');a.controlsContainer?
(a.controlsContainer.append(b),a.pausePlay=d("."+e+"pauseplay a",a.controlsContainer)):(a.append(b),a.pausePlay=d("."+e+"pauseplay a",a));f.pausePlay.update(c.slideshow?e+"pause":e+"play");a.pausePlay.bind(u,function(b){b.preventDefault();d(this).hasClass(e+"pause")?(a.manualPause=!0,a.manualPlay=!1,a.pause()):(a.manualPause=!1,a.manualPlay=!0,a.play())});q&&a.pausePlay.bind("click touchstart",function(a){a.preventDefault()})},update:function(b){"play"===b?a.pausePlay.removeClass(e+"pause").addClass(e+
"play").text(c.playText):a.pausePlay.removeClass(e+"play").addClass(e+"pause").text(c.pauseText)}},touch:function(){function b(b){k=m?d-b.touches[0].pageY:d-b.touches[0].pageX;q=m?Math.abs(k)<Math.abs(b.touches[0].pageX-e):Math.abs(k)<Math.abs(b.touches[0].pageY-e);if(!q||500<Number(new Date)-l)b.preventDefault(),!s&&a.transitions&&(c.animationLoop||(k/=0===a.currentSlide&&0>k||a.currentSlide===a.last&&0<k?Math.abs(k)/r+2:1),a.setProps(f+k,"setTouch"))}function g(){j.removeEventListener("touchmove",
b,!1);if(a.animatingTo===a.currentSlide&&!q&&null!==k){var h=n?-k:k,m=0<h?a.getTarget("next"):a.getTarget("prev");a.canAdvance(m)&&(550>Number(new Date)-l&&50<Math.abs(h)||Math.abs(h)>r/2)?a.flexAnimate(m,c.pauseOnAction):s||a.flexAnimate(a.currentSlide,c.pauseOnAction,!0)}j.removeEventListener("touchend",g,!1);f=k=e=d=null}var d,e,f,r,k,l,q=!1;j.addEventListener("touchstart",function(k){a.animating?k.preventDefault():1===k.touches.length&&(a.pause(),r=m?a.h:a.w,l=Number(new Date),f=h&&n&&a.animatingTo===
a.last?0:h&&n?a.limit-(a.itemW+c.itemMargin)*a.move*a.animatingTo:h&&a.currentSlide===a.last?a.limit:h?(a.itemW+c.itemMargin)*a.move*a.currentSlide:n?(a.last-a.currentSlide+a.cloneOffset)*r:(a.currentSlide+a.cloneOffset)*r,d=m?k.touches[0].pageY:k.touches[0].pageX,e=m?k.touches[0].pageX:k.touches[0].pageY,j.addEventListener("touchmove",b,!1),j.addEventListener("touchend",g,!1))},!1)},resize:function(){!a.animating&&a.is(":visible")&&(h||a.doMath(),s?f.smoothHeight():h?(a.slides.width(a.computedW),
a.update(a.pagingCount),a.setProps()):m?(a.viewport.height(a.h),a.setProps(a.h,"setTotal")):(c.smoothHeight&&f.smoothHeight(),a.newSlides.width(a.computedW),a.setProps(a.computedW,"setTotal")))},smoothHeight:function(b){if(!m||s){var c=s?a:a.viewport;b?c.animate({height:a.slides.eq(a.animatingTo).height()},b):c.height(a.slides.eq(a.animatingTo).height())}},sync:function(b){var g=d(c.sync).data("flexslider"),e=a.animatingTo;switch(b){case "animate":g.flexAnimate(e,c.pauseOnAction,!1,!0);break;case "play":!g.playing&&
!g.asNav&&g.play();break;case "pause":g.pause()}}};a.flexAnimate=function(b,g,p,j,l){t&&1===a.pagingCount&&(a.direction=a.currentItem<b?"next":"prev");if(!a.animating&&(a.canAdvance(b,l)||p)&&a.is(":visible")){if(t&&j)if(p=d(c.asNavFor).data("flexslider"),a.atEnd=0===b||b===a.count-1,p.flexAnimate(b,!0,!1,!0,l),a.direction=a.currentItem<b?"next":"prev",p.direction=a.direction,Math.ceil((b+1)/a.visible)-1!==a.currentSlide&&0!==b)a.currentItem=b,a.slides.removeClass(e+"active-slide").eq(b).addClass(e+
"active-slide"),b=Math.floor(b/a.visible);else return a.currentItem=b,a.slides.removeClass(e+"active-slide").eq(b).addClass(e+"active-slide"),!1;a.animating=!0;a.animatingTo=b;c.before(a);g&&a.pause();a.syncExists&&!l&&f.sync("animate");c.controlNav&&f.controlNav.active();h||a.slides.removeClass(e+"active-slide").eq(b).addClass(e+"active-slide");a.atEnd=0===b||b===a.last;c.directionNav&&f.directionNav.update();b===a.last&&(c.end(a),c.animationLoop||a.pause());if(s)q?(a.slides.eq(a.currentSlide).css({opacity:0,
zIndex:1}),a.slides.eq(b).css({opacity:1,zIndex:2}),a.slides.unbind("webkitTransitionEnd transitionend"),a.slides.eq(a.currentSlide).bind("webkitTransitionEnd transitionend",function(){c.after(a)}),a.animating=!1,a.currentSlide=a.animatingTo):(a.slides.eq(a.currentSlide).fadeOut(c.animationSpeed,c.easing),a.slides.eq(b).fadeIn(c.animationSpeed,c.easing,a.wrapup));else{var r=m?a.slides.filter(":first").height():a.computedW;h?(b=c.itemWidth>a.w?2*c.itemMargin:c.itemMargin,b=(a.itemW+b)*a.move*a.animatingTo,
b=b>a.limit&&1!==a.visible?a.limit:b):b=0===a.currentSlide&&b===a.count-1&&c.animationLoop&&"next"!==a.direction?n?(a.count+a.cloneOffset)*r:0:a.currentSlide===a.last&&0===b&&c.animationLoop&&"prev"!==a.direction?n?0:(a.count+1)*r:n?(a.count-1-b+a.cloneOffset)*r:(b+a.cloneOffset)*r;a.setProps(b,"",c.animationSpeed);if(a.transitions){if(!c.animationLoop||!a.atEnd)a.animating=!1,a.currentSlide=a.animatingTo;a.container.unbind("webkitTransitionEnd transitionend");a.container.bind("webkitTransitionEnd transitionend",
function(){a.wrapup(r)})}else a.container.animate(a.args,c.animationSpeed,c.easing,function(){a.wrapup(r)})}c.smoothHeight&&f.smoothHeight(c.animationSpeed)}};a.wrapup=function(b){!s&&!h&&(0===a.currentSlide&&a.animatingTo===a.last&&c.animationLoop?a.setProps(b,"jumpEnd"):a.currentSlide===a.last&&(0===a.animatingTo&&c.animationLoop)&&a.setProps(b,"jumpStart"));a.animating=!1;a.currentSlide=a.animatingTo;c.after(a)};a.animateSlides=function(){a.animating||a.flexAnimate(a.getTarget("next"))};a.pause=
function(){clearInterval(a.animatedSlides);a.playing=!1;c.pausePlay&&f.pausePlay.update("play");a.syncExists&&f.sync("pause")};a.play=function(){a.animatedSlides=setInterval(a.animateSlides,c.slideshowSpeed);a.playing=!0;c.pausePlay&&f.pausePlay.update("pause");a.syncExists&&f.sync("play")};a.canAdvance=function(b,g){var d=t?a.pagingCount-1:a.last;return g?!0:t&&a.currentItem===a.count-1&&0===b&&"prev"===a.direction?!0:t&&0===a.currentItem&&b===a.pagingCount-1&&"next"!==a.direction?!1:b===a.currentSlide&&
!t?!1:c.animationLoop?!0:a.atEnd&&0===a.currentSlide&&b===d&&"next"!==a.direction?!1:a.atEnd&&a.currentSlide===d&&0===b&&"next"===a.direction?!1:!0};a.getTarget=function(b){a.direction=b;return"next"===b?a.currentSlide===a.last?0:a.currentSlide+1:0===a.currentSlide?a.last:a.currentSlide-1};a.setProps=function(b,g,d){var e,f=b?b:(a.itemW+c.itemMargin)*a.move*a.animatingTo;e=-1*function(){if(h)return"setTouch"===g?b:n&&a.animatingTo===a.last?0:n?a.limit-(a.itemW+c.itemMargin)*a.move*a.animatingTo:a.animatingTo===
a.last?a.limit:f;switch(g){case "setTotal":return n?(a.count-1-a.currentSlide+a.cloneOffset)*b:(a.currentSlide+a.cloneOffset)*b;case "setTouch":return b;case "jumpEnd":return n?b:a.count*b;case "jumpStart":return n?a.count*b:b;default:return b}}()+"px";a.transitions&&(e=m?"translate3d(0,"+e+",0)":"translate3d("+e+",0,0)",d=void 0!==d?d/1E3+"s":"0s",a.container.css("-"+a.pfx+"-transition-duration",d));a.args[a.prop]=e;(a.transitions||void 0===d)&&a.container.css(a.args)};a.setup=function(b){if(s)a.slides.css({width:"100%",
"float":"left",marginRight:"-100%",position:"relative"}),"init"===b&&(q?a.slides.css({opacity:0,display:"block",webkitTransition:"opacity "+c.animationSpeed/1E3+"s ease",zIndex:1}).eq(a.currentSlide).css({opacity:1,zIndex:2}):a.slides.eq(a.currentSlide).fadeIn(c.animationSpeed,c.easing)),c.smoothHeight&&f.smoothHeight();else{var g,p;"init"===b&&(a.viewport=d('<div class="'+e+'viewport"></div>').css({overflow:"hidden",position:"relative"}).appendTo(a).append(a.container),a.cloneCount=0,a.cloneOffset=
0,n&&(p=d.makeArray(a.slides).reverse(),a.slides=d(p),a.container.empty().append(a.slides)));c.animationLoop&&!h&&(a.cloneCount=2,a.cloneOffset=1,"init"!==b&&a.container.find(".clone").remove(),a.container.append(a.slides.first().clone().addClass("clone")).prepend(a.slides.last().clone().addClass("clone")));a.newSlides=d(c.selector,a);g=n?a.count-1-a.currentSlide+a.cloneOffset:a.currentSlide+a.cloneOffset;m&&!h?(a.container.height(200*(a.count+a.cloneCount)+"%").css("position","absolute").width("100%"),
setTimeout(function(){a.newSlides.css({display:"block"});a.doMath();a.viewport.height(a.h);a.setProps(g*a.h,"init")},"init"===b?100:0)):(a.container.width(200*(a.count+a.cloneCount)+"%"),a.setProps(g*a.computedW,"init"),setTimeout(function(){a.doMath();a.newSlides.css({width:a.computedW,"float":"left",display:"block"});c.smoothHeight&&f.smoothHeight()},"init"===b?100:0))}h||a.slides.removeClass(e+"active-slide").eq(a.currentSlide).addClass(e+"active-slide")};a.doMath=function(){var b=a.slides.first(),
d=c.itemMargin,e=c.minItems,f=c.maxItems;a.w=a.width();a.h=b.height();a.boxPadding=b.outerWidth()-b.width();h?(a.itemT=c.itemWidth+d,a.minW=e?e*a.itemT:a.w,a.maxW=f?f*a.itemT:a.w,a.itemW=a.minW>a.w?(a.w-d*e)/e:a.maxW<a.w?(a.w-d*f)/f:c.itemWidth>a.w?a.w:c.itemWidth,a.visible=Math.floor(a.w/(a.itemW+d)),a.move=0<c.move&&c.move<a.visible?c.move:a.visible,a.pagingCount=Math.ceil((a.count-a.visible)/a.move+1),a.last=a.pagingCount-1,a.limit=1===a.pagingCount?0:c.itemWidth>a.w?(a.itemW+2*d)*a.count-a.w-
d:(a.itemW+d)*a.count-a.w-d):(a.itemW=a.w,a.pagingCount=a.count,a.last=a.count-1);a.computedW=a.itemW-a.boxPadding};a.update=function(b,d){a.doMath();h||(b<a.currentSlide?a.currentSlide+=1:b<=a.currentSlide&&0!==b&&(a.currentSlide-=1),a.animatingTo=a.currentSlide);if(c.controlNav&&!a.manualControls)if("add"===d&&!h||a.pagingCount>a.controlNav.length)f.controlNav.update("add");else if("remove"===d&&!h||a.pagingCount<a.controlNav.length)h&&a.currentSlide>a.last&&(a.currentSlide-=1,a.animatingTo-=1),
f.controlNav.update("remove",a.last);c.directionNav&&f.directionNav.update()};a.addSlide=function(b,e){var f=d(b);a.count+=1;a.last=a.count-1;m&&n?void 0!==e?a.slides.eq(a.count-e).after(f):a.container.prepend(f):void 0!==e?a.slides.eq(e).before(f):a.container.append(f);a.update(e,"add");a.slides=d(c.selector+":not(.clone)",a);a.setup();c.added(a)};a.removeSlide=function(b){var e=isNaN(b)?a.slides.index(d(b)):b;a.count-=1;a.last=a.count-1;isNaN(b)?d(b,a.slides).remove():m&&n?a.slides.eq(a.last).remove():
a.slides.eq(b).remove();a.doMath();a.update(e,"remove");a.slides=d(c.selector+":not(.clone)",a);a.setup();c.removed(a)};f.init()};d.flexslider.defaults={namespace:"flex-",selector:".slides > li",animation:"fade",easing:"swing",direction:"horizontal",reverse:!1,animationLoop:!0,smoothHeight:!1,startAt:0,slideshow:!0,slideshowSpeed:7E3,animationSpeed:600,initDelay:0,randomize:!1,pauseOnAction:!0,pauseOnHover:!1,useCSS:!0,touch:!0,video:!1,controlNav:!0,directionNav:!0,prevText:"Previous",nextText:"Next",
keyboard:!0,multipleKeyboard:!1,mousewheel:!1,pausePlay:!1,pauseText:"Pause",playText:"Play",controlsContainer:"",manualControls:"",sync:"",asNavFor:"",itemWidth:0,itemMargin:0,minItems:0,maxItems:0,move:0,start:function(){},before:function(){},after:function(){},end:function(){},added:function(){},removed:function(){}};d.fn.flexslider=function(j){void 0===j&&(j={});if("object"===typeof j)return this.each(function(){var a=d(this),c=a.find(j.selector?j.selector:".slides > li");1===c.length?(c.fadeIn(400),
j.start&&j.start(a)):void 0==a.data("flexslider")&&new d.flexslider(this,j)});var l=d(this).data("flexslider");switch(j){case "play":l.play();break;case "pause":l.pause();break;case "next":l.flexAnimate(l.getTarget("next"),!0);break;case "prev":case "previous":l.flexAnimate(l.getTarget("prev"),!0);break;default:"number"===typeof j&&l.flexAnimate(j,!0)}}})(jQuery);
/*
 Sticky-kit v1.0.4 | WTFPL | Leaf Corcoran 2014 | http://leafo.net
*/
(function(){var b,m;b=this.jQuery;m=b(window);b.fn.stick_in_parent=function(e){var u,n,f,s,B,l,C;null==e&&(e={});s=e.sticky_class;u=e.inner_scrolling;f=e.parent;n=e.offset_top;null==n&&(n=0);null==f&&(f=void 0);null==u&&(u=!0);null==s&&(s="is_stuck");B=function(a,e,l,v,y,p,t){var q,z,k,w,c,d,A,x,g,h;if(!a.data("sticky_kit")){a.data("sticky_kit",!0);d=a.parent();null!=f&&(d=d.closest(f));if(!d.length)throw"failed to find stick parent";q=k=!1;g=b("<div />");g.css("position",a.css("position"));A=function(){var c,
b;c=parseInt(d.css("border-top-width"),10);b=parseInt(d.css("padding-top"),10);e=parseInt(d.css("padding-bottom"),10);l=d.offset().top+c+b;v=d.height();c=k?(k=!1,q=!1,a.insertAfter(g).css({position:"",top:"",width:"",bottom:""}),g.detach(),!0):void 0;y=a.offset().top-parseInt(a.css("margin-top"),10)-n;p=a.outerHeight(!0);t=a.css("float");g.css({width:a.outerWidth(!0),height:p,display:a.css("display"),"vertical-align":a.css("vertical-align"),"float":t});if(c)return h()};A();if(p!==v)return w=void 0,
c=n,h=function(){var b,h,r,f;r=m.scrollTop();null!=w&&(h=r-w);w=r;k?(f=r+p+c>v+l,q&&!f&&(q=!1,a.css({position:"fixed",bottom:"",top:c}).trigger("sticky_kit:unbottom")),r<y&&(k=!1,c=n,"left"!==t&&"right"!==t||a.insertAfter(g),g.detach(),b={position:"",width:"",top:""},a.css(b).removeClass(s).trigger("sticky_kit:unstick")),u&&(b=m.height(),p>b&&!q&&(c-=h,c=Math.max(b-p,c),c=Math.min(n,c),k&&a.css({top:c+"px"})))):r>y&&(k=!0,b={position:"fixed",top:c},b.width="border-box"===a.css("box-sizing")?a.outerWidth()+
"px":a.width()+"px",a.css(b).addClass(s).after(g),"left"!==t&&"right"!==t||g.append(a),a.trigger("sticky_kit:stick"));if(k&&(null==f&&(f=r+p+c>v+l),!q&&f))return q=!0,"static"===d.css("position")&&d.css({position:"relative"}),a.css({position:"absolute",bottom:e,top:"auto"}).trigger("sticky_kit:bottom")},x=function(){A();return h()},z=function(){m.off("scroll",h);b(document.body).off("sticky_kit:recalc",x);a.off("sticky_kit:detach",z);a.removeData("sticky_kit");a.css({position:"",bottom:"",top:""});
d.position("position","");if(k)return a.insertAfter(g).removeClass(s),g.remove()},m.on("touchmove",h),m.on("scroll",h),m.on("resize",x),b(document.body).on("sticky_kit:recalc",x),a.on("sticky_kit:detach",z),setTimeout(h,0)}};l=0;for(C=this.length;l<C;l++)e=this[l],B(b(e));return this}}).call(this);

	var fnames = new Array();
	var ftypes = new Array();
	fnames[0] = 'EMAIL';
	ftypes[0] = 'email';
	fnames[1] = 'FNAME';
	ftypes[1] = 'text';
	fnames[2] = 'LNAME';
	ftypes[2] = 'text';
	fnames[3] = 'STUDENT';
	ftypes[3] = 'radio';
	fnames[4] = 'MMERGE4';
	ftypes[4] = 'text';
	try {
		var jqueryLoaded = jQuery;
		jqueryLoaded = true;
	} catch (err) {
		var jqueryLoaded = false;
	}
	var head = document.getElementsByTagName('head')[0];
	if (!jqueryLoaded) {
		var script = document.createElement('script');
		script.type = 'text/javascript';
		script.src = 'http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js';
		head.appendChild(script);
		if (script.readyState && script.onload !== null) {
			script.onreadystatechange = function () {
				if (this.readyState == 'complete') mce_preload_check();
			}
		}
	}
	var script = document.createElement('script');
	script.type = 'text/javascript';
	script.src = 'http://downloads.mailchimp.com/js/jquery.form-n-validate.js';
	head.appendChild(script);
	var err_style = '';
	try {
		err_style = mc_custom_error_style;
	} catch (e) {
		err_style = 'margin: 1em 0 0 0; padding: 1em 0.5em 0.5em 0.5em; background: ERROR_BGCOLOR none repeat scroll 0% 0%; font-weight: bold; float: left; z-index: 1; width: 80%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; color: ERROR_COLOR;';
	}
	var head = document.getElementsByTagName('head')[0];
	var style = document.createElement('style');
	style.type = 'text/css';
	if (style.styleSheet) {
		style.styleSheet.cssText = '.mce_inline_error {' + err_style + '}';
	} else {
		style.appendChild(document.createTextNode('.mce_inline_error {' + err_style + '}'));
	}
	head.appendChild(style);
	setTimeout('mce_preload_check();', 250);
	var mce_preload_checks = 0;
	
	function mce_preload_check() {
		if (mce_preload_checks > 40) return;
		mce_preload_checks++;
		try {
			var jqueryLoaded = jQuery;
		} catch (err) {
			setTimeout('mce_preload_check();', 250);
			return;
		}
		try {
			var validatorLoaded = jQuery("#fake-form").validate({});
		} catch (err) {
			setTimeout('mce_preload_check();', 250);
			return;
		}
		mce_init_form();
	}
	
	function mce_init_form() {
		jQuery(document).ready(function ($) {
			var options = {
				errorClass: 'mce_inline_error',
				errorElement: 'div',
				onkeyup: function () {},
				onfocusout: function () {},
				onblur: function () {}
			};
			var mce_validator = $("#mc-embedded-subscribe-form").validate(options);
			$("#mc-embedded-subscribe-form").unbind('submit'); //remove the validator so we can get into beforeSubmit on the ajaxform, which then calls the validator
			options = {
				url: 'http://uiowa.us2.list-manage.com/subscribe/post-json?u=c61b1cddac92babd42d7d628e&id=8e3635391c&c=?',
				type: 'GET',
				dataType: 'json',
				contentType: "application/json; charset=utf-8",
				beforeSubmit: function () {
					$('#mce_tmp_error_msg').remove();
					$('.datefield', '#mc_embed_signup').each(
	
					function () {
						var txt = 'filled';
						var fields = new Array();
						var i = 0;
						$(':text', this).each(
	
						function () {
							fields[i] = this;
							i++;
						});
						$(':hidden', this).each(
	
						function () {
							var bday = false;
							if (fields.length == 2) {
								bday = true;
								fields[2] = {
									'value': 1970
								}; //trick birthdays into having years
							}
							if (fields[0].value == 'MM' && fields[1].value == 'DD' && (fields[2].value == 'YYYY' || (bday && fields[2].value == 1970))) {
								this.value = '';
							} else if (fields[0].value == '' && fields[1].value == '' && (fields[2].value == '' || (bday && fields[2].value == 1970))) {
								this.value = '';
							} else {
								this.value = fields[0].value + '/' + fields[1].value + '/' + fields[2].value;
							}
						});
					});
					return mce_validator.form();
				},
				success: mce_success_cb
			};
			$('#mc-embedded-subscribe-form').ajaxForm(options);
		});
	}
	
	function mce_success_cb(resp) {
		$('#mce-success-response').hide();
		$('#mce-error-response').hide();
		if (resp.result == "success") {
			$('#mce-' + resp.result + '-response').show();
			$('#mce-' + resp.result + '-response').html(resp.msg);
			$('#mc-embedded-subscribe-form').each(function () {
				this.reset();
			});
		} else {
			var index = -1;
			var msg;
			try {
				var parts = resp.msg.split(' - ', 2);
				if (parts[1] == undefined) {
					msg = resp.msg;
				} else {
					i = parseInt(parts[0]);
					if (i.toString() == parts[0]) {
						index = parts[0];
						msg = parts[1];
					} else {
						index = -1;
						msg = resp.msg;
					}
				}
			} catch (e) {
				index = -1;
				msg = resp.msg;
			}
			try {
				if (index == -1) {
					$('#mce-' + resp.result + '-response').show();
					$('#mce-' + resp.result + '-response').html(msg);
				} else {
					err_id = 'mce_tmp_error_msg';
					html = '<div id="' + err_id + '" style="' + err_style + '"> ' + msg + '</div>';
					var input_id = '#mc_embed_signup';
					var f = $(input_id);
					if (ftypes[index] == 'address') {
						input_id = '#mce-' + fnames[index] + '-addr1';
						f = $(input_id).parent().parent().get(0);
					} else if (ftypes[index] == 'date') {
						input_id = '#mce-' + fnames[index] + '-month';
						f = $(input_id).parent().parent().get(0);
					} else {
						input_id = '#mce-' + fnames[index];
						f = $().parent(input_id).get(0);
					}
					if (f) {
						$(f).append(html);
						$(input_id).focus();
					} else {
						$('#mce-' + resp.result + '-response').show();
						$('#mce-' + resp.result + '-response').html(msg);
					}
				}
			} catch (e) {
				$('#mce-' + resp.result + '-response').show();
				$('#mce-' + resp.result + '-response').html(msg);
			}
		}
	}
/* Modernizr 2.0.6 | MIT & BSD
 * Contains: All core tests, html5shiv, yepnope, respond.js. Get your own custom build at www.modernizr.com/download/
 */
;window.Modernizr=function(a,b,c){function I(){e.input=function(a){for(var b=0,c=a.length;b<c;b++)t[a[b]]=a[b]in l;return t}("autocomplete autofocus list placeholder max min multiple pattern required step".split(" ")),e.inputtypes=function(a){for(var d=0,e,f,h,i=a.length;d<i;d++)l.setAttribute("type",f=a[d]),e=l.type!=="text",e&&(l.value=m,l.style.cssText="position:absolute;visibility:hidden;",/^range$/.test(f)&&l.style.WebkitAppearance!==c?(g.appendChild(l),h=b.defaultView,e=h.getComputedStyle&&h.getComputedStyle(l,null).WebkitAppearance!=="textfield"&&l.offsetHeight!==0,g.removeChild(l)):/^(search|tel)$/.test(f)||(/^(url|email)$/.test(f)?e=l.checkValidity&&l.checkValidity()===!1:/^color$/.test(f)?(g.appendChild(l),g.offsetWidth,e=l.value!=m,g.removeChild(l)):e=l.value!=m)),s[a[d]]=!!e;return s}("search tel url email datetime date month week time datetime-local number range color".split(" "))}function G(a,b){var c=a.charAt(0).toUpperCase()+a.substr(1),d=(a+" "+p.join(c+" ")+c).split(" ");return F(d,b)}function F(a,b){for(var d in a)if(k[a[d]]!==c)return b=="pfx"?a[d]:!0;return!1}function E(a,b){return!!~(""+a).indexOf(b)}function D(a,b){return typeof a===b}function C(a,b){return B(o.join(a+";")+(b||""))}function B(a){k.cssText=a}var d="2.0.6",e={},f=!0,g=b.documentElement,h=b.head||b.getElementsByTagName("head")[0],i="modernizr",j=b.createElement(i),k=j.style,l=b.createElement("input"),m=":)",n=Object.prototype.toString,o=" -webkit- -moz- -o- -ms- -khtml- ".split(" "),p="Webkit Moz O ms Khtml".split(" "),q={svg:"http://www.w3.org/2000/svg"},r={},s={},t={},u=[],v=function(a,c,d,e){var f,h,j,k=b.createElement("div");if(parseInt(d,10))while(d--)j=b.createElement("div"),j.id=e?e[d]:i+(d+1),k.appendChild(j);f=["&shy;","<style>",a,"</style>"].join(""),k.id=i,k.innerHTML+=f,g.appendChild(k),h=c(k,a),k.parentNode.removeChild(k);return!!h},w=function(b){if(a.matchMedia)return matchMedia(b).matches;var c;v("@media "+b+" { #"+i+" { position: absolute; } }",function(b){c=(a.getComputedStyle?getComputedStyle(b,null):b.currentStyle).position=="absolute"});return c},x=function(){function d(d,e){e=e||b.createElement(a[d]||"div"),d="on"+d;var f=d in e;f||(e.setAttribute||(e=b.createElement("div")),e.setAttribute&&e.removeAttribute&&(e.setAttribute(d,""),f=D(e[d],"function"),D(e[d],c)||(e[d]=c),e.removeAttribute(d))),e=null;return f}var a={select:"input",change:"input",submit:"form",reset:"form",error:"img",load:"img",abort:"img"};return d}(),y,z={}.hasOwnProperty,A;!D(z,c)&&!D(z.call,c)?A=function(a,b){return z.call(a,b)}:A=function(a,b){return b in a&&D(a.constructor.prototype[b],c)};var H=function(c,d){var f=c.join(""),g=d.length;v(f,function(c,d){var f=b.styleSheets[b.styleSheets.length-1],h=f.cssRules&&f.cssRules[0]?f.cssRules[0].cssText:f.cssText||"",i=c.childNodes,j={};while(g--)j[i[g].id]=i[g];e.touch="ontouchstart"in a||j.touch.offsetTop===9,e.csstransforms3d=j.csstransforms3d.offsetLeft===9,e.generatedcontent=j.generatedcontent.offsetHeight>=1,e.fontface=/src/i.test(h)&&h.indexOf(d.split(" ")[0])===0},g,d)}(['@font-face {font-family:"font";src:url("https://")}',["@media (",o.join("touch-enabled),("),i,")","{#touch{top:9px;position:absolute}}"].join(""),["@media (",o.join("transform-3d),("),i,")","{#csstransforms3d{left:9px;position:absolute}}"].join(""),['#generatedcontent:after{content:"',m,'";visibility:hidden}'].join("")],["fontface","touch","csstransforms3d","generatedcontent"]);r.flexbox=function(){function c(a,b,c,d){a.style.cssText=o.join(b+":"+c+";")+(d||"")}function a(a,b,c,d){b+=":",a.style.cssText=(b+o.join(c+";"+b)).slice(0,-b.length)+(d||"")}var d=b.createElement("div"),e=b.createElement("div");a(d,"display","box","width:42px;padding:0;"),c(e,"box-flex","1","width:10px;"),d.appendChild(e),g.appendChild(d);var f=e.offsetWidth===42;d.removeChild(e),g.removeChild(d);return f},r.canvas=function(){var a=b.createElement("canvas");return!!a.getContext&&!!a.getContext("2d")},r.canvastext=function(){return!!e.canvas&&!!D(b.createElement("canvas").getContext("2d").fillText,"function")},r.webgl=function(){return!!a.WebGLRenderingContext},r.touch=function(){return e.touch},r.geolocation=function(){return!!navigator.geolocation},r.postmessage=function(){return!!a.postMessage},r.websqldatabase=function(){var b=!!a.openDatabase;return b},r.indexedDB=function(){for(var b=-1,c=p.length;++b<c;)if(a[p[b].toLowerCase()+"IndexedDB"])return!0;return!!a.indexedDB},r.hashchange=function(){return x("hashchange",a)&&(b.documentMode===c||b.documentMode>7)},r.history=function(){return!!a.history&&!!history.pushState},r.draganddrop=function(){return x("dragstart")&&x("drop")},r.websockets=function(){for(var b=-1,c=p.length;++b<c;)if(a[p[b]+"WebSocket"])return!0;return"WebSocket"in a},r.rgba=function(){B("background-color:rgba(150,255,150,.5)");return E(k.backgroundColor,"rgba")},r.hsla=function(){B("background-color:hsla(120,40%,100%,.5)");return E(k.backgroundColor,"rgba")||E(k.backgroundColor,"hsla")},r.multiplebgs=function(){B("background:url(https://),url(https://),red url(https://)");return/(url\s*\(.*?){3}/.test(k.background)},r.backgroundsize=function(){return G("backgroundSize")},r.borderimage=function(){return G("borderImage")},r.borderradius=function(){return G("borderRadius")},r.boxshadow=function(){return G("boxShadow")},r.textshadow=function(){return b.createElement("div").style.textShadow===""},r.opacity=function(){C("opacity:.55");return/^0.55$/.test(k.opacity)},r.cssanimations=function(){return G("animationName")},r.csscolumns=function(){return G("columnCount")},r.cssgradients=function(){var a="background-image:",b="gradient(linear,left top,right bottom,from(#9f9),to(white));",c="linear-gradient(left top,#9f9, white);";B((a+o.join(b+a)+o.join(c+a)).slice(0,-a.length));return E(k.backgroundImage,"gradient")},r.cssreflections=function(){return G("boxReflect")},r.csstransforms=function(){return!!F(["transformProperty","WebkitTransform","MozTransform","OTransform","msTransform"])},r.csstransforms3d=function(){var a=!!F(["perspectiveProperty","WebkitPerspective","MozPerspective","OPerspective","msPerspective"]);a&&"webkitPerspective"in g.style&&(a=e.csstransforms3d);return a},r.csstransitions=function(){return G("transitionProperty")},r.fontface=function(){return e.fontface},r.generatedcontent=function(){return e.generatedcontent},r.video=function(){var a=b.createElement("video"),c=!1;try{if(c=!!a.canPlayType){c=new Boolean(c),c.ogg=a.canPlayType('video/ogg; codecs="theora"');var d='video/mp4; codecs="avc1.42E01E';c.h264=a.canPlayType(d+'"')||a.canPlayType(d+', mp4a.40.2"'),c.webm=a.canPlayType('video/webm; codecs="vp8, vorbis"')}}catch(e){}return c},r.audio=function(){var a=b.createElement("audio"),c=!1;try{if(c=!!a.canPlayType)c=new Boolean(c),c.ogg=a.canPlayType('audio/ogg; codecs="vorbis"'),c.mp3=a.canPlayType("audio/mpeg;"),c.wav=a.canPlayType('audio/wav; codecs="1"'),c.m4a=a.canPlayType("audio/x-m4a;")||a.canPlayType("audio/aac;")}catch(d){}return c},r.localstorage=function(){try{return!!localStorage.getItem}catch(a){return!1}},r.sessionstorage=function(){try{return!!sessionStorage.getItem}catch(a){return!1}},r.webworkers=function(){return!!a.Worker},r.applicationcache=function(){return!!a.applicationCache},r.svg=function(){return!!b.createElementNS&&!!b.createElementNS(q.svg,"svg").createSVGRect},r.inlinesvg=function(){var a=b.createElement("div");a.innerHTML="<svg/>";return(a.firstChild&&a.firstChild.namespaceURI)==q.svg},r.smil=function(){return!!b.createElementNS&&/SVG/.test(n.call(b.createElementNS(q.svg,"animate")))},r.svgclippaths=function(){return!!b.createElementNS&&/SVG/.test(n.call(b.createElementNS(q.svg,"clipPath")))};for(var J in r)A(r,J)&&(y=J.toLowerCase(),e[y]=r[J](),u.push((e[y]?"":"no-")+y));e.input||I(),e.addTest=function(a,b){if(typeof a=="object")for(var d in a)A(a,d)&&e.addTest(d,a[d]);else{a=a.toLowerCase();if(e[a]!==c)return;b=typeof b=="boolean"?b:!!b(),g.className+=" "+(b?"":"no-")+a,e[a]=b}return e},B(""),j=l=null,a.attachEvent&&function(){var a=b.createElement("div");a.innerHTML="<elem></elem>";return a.childNodes.length!==1}()&&function(a,b){function s(a){var b=-1;while(++b<g)a.createElement(f[b])}a.iepp=a.iepp||{};var d=a.iepp,e=d.html5elements||"abbr|article|aside|audio|canvas|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video",f=e.split("|"),g=f.length,h=new RegExp("(^|\\s)("+e+")","gi"),i=new RegExp("<(/*)("+e+")","gi"),j=/^\s*[\{\}]\s*$/,k=new RegExp("(^|[^\\n]*?\\s)("+e+")([^\\n]*)({[\\n\\w\\W]*?})","gi"),l=b.createDocumentFragment(),m=b.documentElement,n=m.firstChild,o=b.createElement("body"),p=b.createElement("style"),q=/print|all/,r;d.getCSS=function(a,b){if(a+""===c)return"";var e=-1,f=a.length,g,h=[];while(++e<f){g=a[e];if(g.disabled)continue;b=g.media||b,q.test(b)&&h.push(d.getCSS(g.imports,b),g.cssText),b="all"}return h.join("")},d.parseCSS=function(a){var b=[],c;while((c=k.exec(a))!=null)b.push(((j.exec(c[1])?"\n":c[1])+c[2]+c[3]).replace(h,"$1.iepp_$2")+c[4]);return b.join("\n")},d.writeHTML=function(){var a=-1;r=r||b.body;while(++a<g){var c=b.getElementsByTagName(f[a]),d=c.length,e=-1;while(++e<d)c[e].className.indexOf("iepp_")<0&&(c[e].className+=" iepp_"+f[a])}l.appendChild(r),m.appendChild(o),o.className=r.className,o.id=r.id,o.innerHTML=r.innerHTML.replace(i,"<$1font")},d._beforePrint=function(){p.styleSheet.cssText=d.parseCSS(d.getCSS(b.styleSheets,"all")),d.writeHTML()},d.restoreHTML=function(){o.innerHTML="",m.removeChild(o),m.appendChild(r)},d._afterPrint=function(){d.restoreHTML(),p.styleSheet.cssText=""},s(b),s(l);d.disablePP||(n.insertBefore(p,n.firstChild),p.media="print",p.className="iepp-printshim",a.attachEvent("onbeforeprint",d._beforePrint),a.attachEvent("onafterprint",d._afterPrint))}(a,b),e._version=d,e._prefixes=o,e._domPrefixes=p,e.mq=w,e.hasEvent=x,e.testProp=function(a){return F([a])},e.testAllProps=G,e.testStyles=v,e.prefixed=function(a){return G(a,"pfx")},g.className=g.className.replace(/\bno-js\b/,"")+(f?" js "+u.join(" "):"");return e}(this,this.document),function(a,b){function u(){r(!0)}a.respond={},respond.update=function(){},respond.mediaQueriesSupported=b;if(!b){var c=a.document,d=c.documentElement,e=[],f=[],g=[],h={},i=30,j=c.getElementsByTagName("head")[0]||d,k=j.getElementsByTagName("link"),l=[],m=function(){var b=k,c=b.length,d=0,e,f,g,i;for(;d<c;d++)e=b[d],f=e.href,g=e.media,i=e.rel&&e.rel.toLowerCase()==="stylesheet",!!f&&i&&!h[f]&&(!/^([a-zA-Z]+?:(\/\/)?(www\.)?)/.test(f)||f.replace(RegExp.$1,"").split("/")[0]===a.location.host?l.push({href:f,media:g}):h[f]=!0);n()},n=function(){if(l.length){var a=l.shift();s(a.href,function(b){o(b,a.href,a.media),h[a.href]=!0,n()})}},o=function(a,b,c){var d=a.match(/@media[^\{]+\{([^\{\}]+\{[^\}\{]+\})+/gi),g=d&&d.length||0,b=b.substring(0,b.lastIndexOf("/")),h=function(a){return a.replace(/(url\()['"]?([^\/\)'"][^:\)'"]+)['"]?(\))/g,"$1"+b+"$2$3")},i=!g&&c,j=0,k,l,m,n,o;b.length&&(b+="/"),i&&(g=1);for(;j<g;j++){k=0,i?(l=c,f.push(h(a))):(l=d[j].match(/@media ([^\{]+)\{([\S\s]+?)$/)&&RegExp.$1,f.push(RegExp.$2&&h(RegExp.$2))),n=l.split(","),o=n.length;for(;k<o;k++)m=n[k],e.push({media:m.match(/(only\s+)?([a-zA-Z]+)(\sand)?/)&&RegExp.$2,rules:f.length-1,minw:m.match(/\(min\-width:[\s]*([\s]*[0-9]+)px[\s]*\)/)&&parseFloat(RegExp.$1),maxw:m.match(/\(max\-width:[\s]*([\s]*[0-9]+)px[\s]*\)/)&&parseFloat(RegExp.$1)})}r()},p,q,r=function(a){var b="clientWidth",h=d[b],l=c.compatMode==="CSS1Compat"&&h||c.body[b]||h,m={},n=c.createDocumentFragment(),o=k[k.length-1],s=(new Date).getTime();if(a&&p&&s-p<i)clearTimeout(q),q=setTimeout(r,i);else{p=s;for(var t in e){var u=e[t];if(!u.minw&&!u.maxw||(!u.minw||u.minw&&l>=u.minw)&&(!u.maxw||u.maxw&&l<=u.maxw))m[u.media]||(m[u.media]=[]),m[u.media].push(f[u.rules])}for(var t in g)g[t]&&g[t].parentNode===j&&j.removeChild(g[t]);for(var t in m){var v=c.createElement("style"),w=m[t].join("\n");v.type="text/css",v.media=t,v.styleSheet?v.styleSheet.cssText=w:v.appendChild(c.createTextNode(w)),n.appendChild(v),g.push(v)}j.insertBefore(n,o.nextSibling)}},s=function(a,b){var c=t();if(!!c){c.open("GET",a,!0),c.onreadystatechange=function(){c.readyState==4&&(c.status==200||c.status==304)&&b(c.responseText)};if(c.readyState==4)return;c.send()}},t=function(){var a=!1,b=[function(){return new ActiveXObject("Microsoft.XMLHTTP")},function(){return new XMLHttpRequest}],c=b.length;while(c--){try{a=b[c]()}catch(d){continue}break}return function(){return a}}();m(),respond.update=m,a.addEventListener?a.addEventListener("resize",u,!1):a.attachEvent&&a.attachEvent("onresize",u)}}(this,Modernizr.mq("only all")),function(a,b,c){function k(a){return!a||a=="loaded"||a=="complete"}function j(){var a=1,b=-1;while(p.length- ++b)if(p[b].s&&!(a=p[b].r))break;a&&g()}function i(a){var c=b.createElement("script"),d;c.src=a.s,c.onreadystatechange=c.onload=function(){!d&&k(c.readyState)&&(d=1,j(),c.onload=c.onreadystatechange=null)},m(function(){d||(d=1,j())},H.errorTimeout),a.e?c.onload():n.parentNode.insertBefore(c,n)}function h(a){var c=b.createElement("link"),d;c.href=a.s,c.rel="stylesheet",c.type="text/css";if(!a.e&&(w||r)){var e=function(a){m(function(){if(!d)try{a.sheet.cssRules.length?(d=1,j()):e(a)}catch(b){b.code==1e3||b.message=="security"||b.message=="denied"?(d=1,m(function(){j()},0)):e(a)}},0)};e(c)}else c.onload=function(){d||(d=1,m(function(){j()},0))},a.e&&c.onload();m(function(){d||(d=1,j())},H.errorTimeout),!a.e&&n.parentNode.insertBefore(c,n)}function g(){var a=p.shift();q=1,a?a.t?m(function(){a.t=="c"?h(a):i(a)},0):(a(),j()):q=0}function f(a,c,d,e,f,h){function i(){!o&&k(l.readyState)&&(r.r=o=1,!q&&j(),l.onload=l.onreadystatechange=null,m(function(){u.removeChild(l)},0))}var l=b.createElement(a),o=0,r={t:d,s:c,e:h};l.src=l.data=c,!s&&(l.style.display="none"),l.width=l.height="0",a!="object"&&(l.type=d),l.onload=l.onreadystatechange=i,a=="img"?l.onerror=i:a=="script"&&(l.onerror=function(){r.e=r.r=1,g()}),p.splice(e,0,r),u.insertBefore(l,s?null:n),m(function(){o||(u.removeChild(l),r.r=r.e=o=1,j())},H.errorTimeout)}function e(a,b,c){var d=b=="c"?z:y;q=0,b=b||"j",C(a)?f(d,a,b,this.i++,l,c):(p.splice(this.i++,0,a),p.length==1&&g());return this}function d(){var a=H;a.loader={load:e,i:0};return a}var l=b.documentElement,m=a.setTimeout,n=b.getElementsByTagName("script")[0],o={}.toString,p=[],q=0,r="MozAppearance"in l.style,s=r&&!!b.createRange().compareNode,t=r&&!s,u=s?l:n.parentNode,v=a.opera&&o.call(a.opera)=="[object Opera]",w="webkitAppearance"in l.style,x=w&&"async"in b.createElement("script"),y=r?"object":v||x?"img":"script",z=w?"img":y,A=Array.isArray||function(a){return o.call(a)=="[object Array]"},B=function(a){return Object(a)===a},C=function(a){return typeof a=="string"},D=function(a){return o.call(a)=="[object Function]"},E=[],F={},G,H;H=function(a){function f(a){var b=a.split("!"),c=E.length,d=b.pop(),e=b.length,f={url:d,origUrl:d,prefixes:b},g,h;for(h=0;h<e;h++)g=F[b[h]],g&&(f=g(f));for(h=0;h<c;h++)f=E[h](f);return f}function e(a,b,e,g,h){var i=f(a),j=i.autoCallback;if(!i.bypass){b&&(b=D(b)?b:b[a]||b[g]||b[a.split("/").pop().split("?")[0]]);if(i.instead)return i.instead(a,b,e,g,h);e.load(i.url,i.forceCSS||!i.forceJS&&/css$/.test(i.url)?"c":c,i.noexec),(D(b)||D(j))&&e.load(function(){d(),b&&b(i.origUrl,h,g),j&&j(i.origUrl,h,g)})}}function b(a,b){function c(a){if(C(a))e(a,h,b,0,d);else if(B(a))for(i in a)a.hasOwnProperty(i)&&e(a[i],h,b,i,d)}var d=!!a.test,f=d?a.yep:a.nope,g=a.load||a.both,h=a.callback,i;c(f),c(g),a.complete&&b.load(a.complete)}var g,h,i=this.yepnope.loader;if(C(a))e(a,0,i,0);else if(A(a))for(g=0;g<a.length;g++)h=a[g],C(h)?e(h,0,i,0):A(h)?H(h):B(h)&&b(h,i);else B(a)&&b(a,i)},H.addPrefix=function(a,b){F[a]=b},H.addFilter=function(a){E.push(a)},H.errorTimeout=1e4,b.readyState==null&&b.addEventListener&&(b.readyState="loading",b.addEventListener("DOMContentLoaded",G=function(){b.removeEventListener("DOMContentLoaded",G,0),b.readyState="complete"},0)),a.yepnope=d()}(this,this.document),Modernizr.load=function(){yepnope.apply(window,[].slice.call(arguments,0))};

(function($) {
  $.fn.extend({
    stickyMojo: function(options) {

      // Exit if there are no elements to avoid errors:
      if (this.length === 0) {
        return this;
      }

      var settings = $.extend({
        'footerID': '',
        'contentID': '',
        'orientation': $(this).css('float')
      }, options);

      var sticky = {
        'el': $(this),
        'stickyLeft': $(settings.contentID).outerWidth() + $(settings.contentID).offset.left,
        'stickyTop2': $(this).offset().top,
        'stickyHeight': $(this).outerHeight(true),
        'contentHeight': $(settings.contentID).outerHeight(true),
        'win': $(window),
        'breakPoint': $(this).outerWidth(true) + $(settings.contentID).outerWidth(true),
        'marg': parseInt($(this).css('margin-top'), 10)
      };

      var errors = checkSettings();
      cacheElements();

      return this.each(function() {
        buildSticky();
      });

      function buildSticky() {
        if (!errors.length) {
          sticky.el.css('left', sticky.stickyLeft);

          sticky.win.bind({
            'load': stick,
            'scroll': stick,
            'resize': function() {
              sticky.el.css('left', sticky.stickyLeft);
              stick();
            }
          });
        } else {
          if (console && console.warn) {
            console.warn(errors);
          } else {
            alert(errors);
          }
        }
      }

      // Caches the footer and content elements into jquery objects
      function cacheElements() {
        settings.footerID = $(settings.footerID);
        settings.contentID = $(settings.contentID);
      }

      //  Calcualtes the limits top and bottom limits for the sidebar
      function calculateLimits() {
        return {
          limit: settings.footerID.offset().top - sticky.stickyHeight,
          windowTop: sticky.win.scrollTop(),
          stickyTop: sticky.stickyTop2 - sticky.marg
        }
      }

      // Sets sidebar to fixed position
      function setFixedSidebar() {
        sticky.el.css({
          position: 'fixed',
          top: 0
        });
        sticky.el.addClass("stuck");
      }

      // Determines the sidebar orientation and sets margins accordingly
      function checkOrientation() {
        if (settings.orientation === "left") {
          settings.contentID.css('margin-left', sticky.el.outerWidth(true));
        } else {
          sticky.el.css('margin-left', settings.contentID.outerWidth(true));
        }
      }

      // sets sidebar to a static positioned element
      function setStaticSidebar() {
        sticky.el.css({
          'position': 'static',
          'margin-left': '0px'
        });
        settings.contentID.css('margin-left', '0px');
        sticky.el.removeClass("stuck");
      }

      // initiated to stop the sidebar from intersecting the footer
      function setLimitedSidebar(diff) {
        sticky.el.css({
          top: diff
        });
      }

      //determines whether sidebar should stick and applies appropriate settings to make it stick
      function stick() {
        var tops = calculateLimits();
        var hitBreakPoint = tops.stickyTop < tops.windowTop && (sticky.win.width() >= sticky.breakPoint);

        if (hitBreakPoint) {
          setFixedSidebar();
          checkOrientation();
        } else {
          setStaticSidebar();
        }
        if (tops.limit < tops.windowTop) {
          var diff = tops.limit - tops.windowTop;
          setLimitedSidebar(diff);
        }
      }

      // verifies that all settings are correct
      function checkSettings() {
        var errors = [];
        for (var key in settings) {
          if (!settings[key]) {
            errors.push(settings[key]);
          }
        }
        ieVersion() && errors.push("NO IE 7");
        return errors;
      }

      function ieVersion() {
        if(document.querySelector) {
          return false;
        }
        else {
          return true;
        }
      }
    }
  });
})(jQuery);

// all map styles
var styles = [	 
	{
	    "stylers": [
	      { "weight": 2.7 },
	      { "saturation": -71 },
	      { "invert_lightness": true },
	      { "visibility": "on" },
	      { "hue": "#8800ff" }
	    ]
	  },{
	    "elementType": "geometry",
	    "stylers": [
	      { "weight": 1.6 },
	      { "lightness": -20 },
	      { "saturation": -13 },
	      { "gamma": 1.33 }
	    ]
	  },{
	    "featureType": "road",
	    "elementType": "geometry.fill",
	    "stylers": [
	      { "color": "#000000" },
	      { "weight": 3.6 },
	      { "hue": "#a200ff" },
	      { "lightness": 38 },
	      { "saturation": -4 }
	    ]
	  },{
	    "featureType": "water",
	    "stylers": [
	      { "hue": "#00b2ff" },
	      { "lightness": -2 },
	      { "saturation": 27 }
	    ]
	  }
];
if ( $("#truncontent").css("z-index") == 4){
	$("#truncontent > p").each(function (index) {
		if (index > 0) {
			$(this).hide();
		}
	});
	$("#truncswitch").css("display", "block");
	$("#truncswitch").on("click", function() {
		//if (flipper % 2 == 0) {
		$("#truncontent > p").each(function (index) {
			$(this).show();
		});
		$("#truncswitch").hide();
	});	
	
	$(window).resize(function() {
		if ( $("#truncontent").css("z-index") < 4){
			$("#truncontent > p").each(function (index) {
				if (index > 0) {
				$(this).show();
				}
			});
			$("#truncswitch").hide();
		} else if ($("#truncontent").css("z-index") == 4) {
			$("#truncontent > p").each(function (index) {
				if (index > 0) {
				$(this).hide();
				}
			});
			$("#truncswitch").show();
		}
	});	
}
jQuery(document).ready(function($) {

    $("#page_navigation .secondary-nav").hide();
    // $("#calendar-expand").inner
    $("#canvas").height($("#page_header").height());
    $("#canvas").width($("#page_header").width() / 2);
    $('.flexslider').flexslider({
        selector: ".slides > .slide",
        touch: false,
        animation: "slide",
        controlNav: true,
        directionNav: false,
    });

    $("#calendar-expand").click(function() {
        if ($(".secondary-nav").css('display') == 'none') {
            $("#calendar-expand").addClass("active");
        } else {
            $("#calendar-expand").removeClass("active");
        }
        $(".secondary-nav").toggle();
        return false;
    });

     $('.sidebar-sticky-content').stickyMojo({footerID: '#page_footer', contentID: '#left-column'});

     var bLazy = new Blazy();

});


function GetLocation(address) {
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({ 'address': address }, function (results, status) {
	  if (status == google.maps.GeocoderStatus.OK) {
	    //ParseLocation(results[0].geometry.location);
	    return results[0].geometry.location;
	  } else {
	    alert('error: ' + status);
	  }
	});
}
  
function initialize() {
  
    // Create a new StyledMapType object, passing it the array of styles,
    // as well as the name to be displayed on the map type control.
	var styledMap = new google.maps.StyledMapType(styles, {name: "Styled Map"});

	// Create a map object, and include the MapTypeId to add
	// to the map type control.
	var mapOptions = {
	    zoom: 11,
	    scrollwheel: false,
	    draggable: true,
	    panControl: true,
	    center: new google.maps.LatLng(55.6468, 37.581),
	    mapTypeControlOptions: {
	      mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
	    }
	  };
	jQuery('#mini-map').each(function(index, element) {
		var name = jQuery(this).data("title");
		var lat = jQuery(this).data("lat");
		var lng = jQuery(this).data("lng");
		var address = jQuery(this).data("address");
		var venueLatLng;
		var venue = this;

		if (lat && lng) {
			var place = new google.maps.LatLng(lat, lng);
			var myOptions = {zoom: 16, center: place,mapTypeId: google.maps.MapTypeId.ROADMAP };
	   		var map = new google.maps.Map(document.getElementById("mini-map"),myOptions);
	   		var geomarker = new google.maps.Marker({ map: map, position: place });
		    map.mapTypes.set('map_style', styledMap);
		    map.setMapTypeId('map_style');
		} else {
	    	var geocoder = new google.maps.Geocoder();
	  		geocoder.geocode({ 'address': address }, function (results, status) {
		        if (status == google.maps.GeocoderStatus.OK) {
			        place = results[0].geometry.location;
			        var myOptions = {zoom: 16, center: place,mapTypeId: google.maps.MapTypeId.ROADMAP };
			        var map = new google.maps.Map(document.getElementById("mini-map"),myOptions);
			        var geomarker = new google.maps.Marker({ map: map, position: place });  
					map.mapTypes.set('map_style', styledMap);
					map.setMapTypeId('map_style');
		      	}
		    });
	    }
	});
}

window.onload = initialize();
/* Global Variables */
var markerArray = [];
var infowindow = new google.maps.InfoWindow({
	content: "holding...",
	maxWidth: 340
	});	
var iowaCity = new google.maps.LatLng(41.661736, -91.540017);
//var venueCount = $("#venuesWithEvents section").length;
//var countVenue = 0;
var venueFromUser = {};
var userInitPosition;

/* Helper Functions */

//obsolete?
function error(msg) {
  var s = document.querySelector('#status');
  s.innerHTML = typeof msg == 'string' ? msg : "failed";
  s.className = 'fail';
}

//obsolete?
function makeMarker(options){
   var pushPin = new google.maps.Marker({map:map});
   pushPin.setOptions(options);
   google.maps.event.addListener(pushPin, 'click', function(){
     infoWindow.setOptions(options);
     infoWindow.open(map, pushPin);
   });
   markerArray.push(pushPin);
   return pushPin;
}

function handleNoGeolocation(errorFlag) {   	
	var userInitPosition = iowaCity;
    $('#status').text("Your location couldn't be detected. Showing events in Iowa City.");
    return userInitPosition;
}  

/* End Helper Functions */

function sortVenues() {
	// empty list to sort venues by distance
	var nearestVenues = [];
	// you can only do for-in loops on objects (as opposed to arrays) in js. who knew?
	for (var venueID in venueFromUser) {
		nearestVenues.push([venueID, venueFromUser[venueID]])
	}	
	nearestVenues.sort(function(a,b) {return a[1] - b[1]});
	$("#venuesWithEvents .clear").remove();
	for (var v=0; v < nearestVenues.length; v++) {
		//console.log('sorting...');
		var vid = nearestVenues[v];
		$("#venuesWithEvents").append( $("#" + vid) );
		$("#venuesWithEvents").append( $("<div class='clear'></div>") );
	}
}

function addEventInfo( marker, venue ) {		
	var venueName = $('#' + venue.id).data("title");
	var venueLink = $('#' + venue.id).data("link");  
	var eventsHere = [];
	var eventsHereString = '';
	var eventBubbleString = '';
	var eventLimit = 5;
	
	eventsHere.push("<a class='button tag' href='" + venueLink + "'>" + venueName + "</a>");
	
	$(venue).children('div').each(function(index, Element) {
		var eventTitle = $(this).data('title');
		var eventImage = $(this).data('image');
		var eventLink = $(this).data('link');
		var eventCost = $(this).data('cost');
		var startDate = $(this).data('startdate');
		var startTime = $(this).data('starttime');	
		var eventStringSeg = 
		"<div> <h3> <a href='" + eventLink + "'>" + eventTitle + "</a> </h3> <ul class='infobox-list'>" + 
			"<li>" + startDate + ", " + startTime + ((eventCost  !== "") ? ", Cost: " + eventCost : "") + "</li>" 
			+ "</ul></div>";
				
		eventsHere.push(eventStringSeg);

		// sets maximum number of events per bubble to eventLimit
		if (index >= eventLimit) {
			return false;
		}
	});
	
	/* string concatination for infoBubble */
	eventsHereString = eventsHere.join(' ');
	eventBubbleString = 
		"<div class='event_bubble'>" +
		eventsHereString +
		"</div>";

	/* make infoBubbles clickable */
    google.maps.event.addListener(marker, 'click', function () {
  		infowindow.setContent(eventBubbleString);
  		infowindow.open(map, this);	
  		//infowindow.maxWidth(200);
	});
}

function venueGen() {	
	//DON'T CHANGE IDs or Class Names in NearMePage.ss
	//Scans venues loaded on page for data-attributes and pulls data

	//note: geocoder used to be global variable
	var geocoder = new google.maps.Geocoder();

	$('.venue').each(function(index, element) {
		var venue = this;
		var venueID = venue.id;
		var title = $(this).data("title");
		var lat = $(this).data("lat");
		var lng = $(this).data("lng");
		var address = $(this).data("address");
		var venueLatLng;
		
		if(lat && lng) {
			//console.log('venue has coords');
			venueLatLng = new google.maps.LatLng(lat, lng);
		} else if (address != null) {
			//console.log('venue does not have coords, has address');
			geocoder.geocode( {'address': address}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
				//Geocoder returns array of information, first indice is lat/lng
				venueLatLng = results[0].geometry.location;
				}				
			});
		} else {
			//console.log("No coords or address available for " + title)
		}	

		// drops pin
		var marker = new google.maps.Marker({
			position: venueLatLng,
			map: map
		});	

		//console.log("I have " + title + " at " + venueLatLng);
		// fills 'infowindow' for each pin with list of events
		addEventInfo( marker, venue );  

		venueFromUser[venueID] = google.maps.geometry.spherical.computeDistanceBetween(userInitPosition, venueLatLng);

	});	

	/* when finished, sort venues divs on page. */
	sortVenues();

}

function getInitLocal() {
	//finds users location
	if(navigator.geolocation) {
		//console.log("Browser DOES support Geolocation");
	    var browserSupportFlag = true;
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	//console.log('geolocated');
			userInitPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
			var userDistanceFromIowaCity = google.maps.geometry.spherical.computeDistanceBetween(userInitPosition,iowaCity);	
			// If the current position is too far away from Iowa City, just default to centering around Iowa City	
			if (userDistanceFromIowaCity < 32186.9) {
				map.setCenter(userInitPosition);
				var image = 'themes/afterclass2/images/position-indicator.png';
				var initalMarker = new google.maps.Marker({
					position: userInitPosition,
					map: map,
					icon: image
				});  
				//initalMarker.setMap(map);
			} else {
				$('#mapLoaded').text("You're too far away from Iowa City. Here are events in Iowa City");
			}
			venueGen();							  
	    }, function(error) {
	    	//console.log('navigator failed');
	    	var errorFlag = false;
	    	userInitPosition = handleNoGeolocation(errorFlag)
	    	map.setCenter(userInitPosition);
	    	venueGen();
	    }, { 
	    	enableHighAccuracy: true, 
	    	timeout: 1000,
	    	maximumAge: 0
	    });	     
	} else {
		//console.log("Browser does NOT support Geolocation");
	    var browserSupportFlag = false;
	    userInitPosition = handleNoGeolocation(browserSupportFlag);
	    venueGen();
	}	
}

function genMapCanvas() {
	// generates map styles, objects, DOM objects

    var mapcanvas = document.createElement('div');	
	 mapcanvas.id = 'mapcanvas';
	 mapcanvas.class = 'map-canvas';
	 mapcanvas.style.width = '100%';	
	$('.NearMePage .map-container').append(mapcanvas);

	//afterclassMap styles located in MapStyles.js
	var afterclassMap = new google.maps.StyledMapType(styles, {name: "AfterClass Style Map"});
	var MapOptions = {
	    zoom: 16,
	    center: iowaCity,
	    panControl: false,
	    mapTypeControl: false,
	    navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
	    disableDefaultUI: false,
	    mapTypeId: google.maps.MapTypeId.ROADMAP,
	    streetViewControl: false,
	    zoomControlOptions: {
    		position: google.maps.ControlPosition.LEFT_BOTTOM
  		}
	};
	map = new google.maps.Map(document.getElementById("mapcanvas"), MapOptions);
	 map.mapTypes.set('map_style', afterclassMap);
	 map.setMapTypeId('map_style');
	
	//getInitLocal();
}

$(window).load(function() {
	if( $('.NearMePage .map-container').length ){
		genMapCanvas( getInitLocal() );
	}
});

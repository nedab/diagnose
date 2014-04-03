!function(t,e){"use strict";Foundation.libs.tooltip={name:"tooltip",version:"5.2.1",settings:{additional_inheritable_classes:[],tooltip_class:".tooltip",append_to:"body",touch_close_text:"Tap To Close",disable_for_touch:!1,hover_delay:200,tip_template:function(t,e){return'<span data-selector="'+t+'" class="'+Foundation.libs.tooltip.settings.tooltip_class.substring(1)+'">'+e+'<span class="nub"></span></span>'}},cache:{},init:function(t,e,o){Foundation.inherit(this,"random_str"),this.bindings(e,o)},events:function(e){var o=this,i=o.S;o.create(this.S(e)),t(this.scope).off(".tooltip").on("mouseenter.fndtn.tooltip mouseleave.fndtn.tooltip touchstart.fndtn.tooltip MSPointerDown.fndtn.tooltip","["+this.attr_name()+"]:not(a)",function(e){var s=i(this),n=t.extend({},o.settings,o.data_options(s)),a=!1;if(/mouse/i.test(e.type)&&o.ie_touch(e))return!1;if(s.hasClass("open"))Modernizr.touch&&/touchstart|MSPointerDown/i.test(e.type)&&e.preventDefault(),o.hide(s);else{if(n.disable_for_touch&&Modernizr.touch&&/touchstart|MSPointerDown/i.test(e.type))return;!n.disable_for_touch&&Modernizr.touch&&/touchstart|MSPointerDown/i.test(e.type)&&(e.preventDefault(),i(n.tooltip_class+".open").hide(),a=!0),/enter|over/i.test(e.type)?this.timer=setTimeout(function(){o.showTip(s)}.bind(this),o.settings.hover_delay):"mouseout"===e.type||"mouseleave"===e.type?(clearTimeout(this.timer),o.hide(s)):o.showTip(s)}}).on("mouseleave.fndtn.tooltip touchstart.fndtn.tooltip MSPointerDown.fndtn.tooltip","["+this.attr_name()+"].open",function(e){return/mouse/i.test(e.type)&&o.ie_touch(e)?!1:void(("touch"!=t(this).data("tooltip-open-event-type")||"mouseleave"!=e.type)&&("mouse"==t(this).data("tooltip-open-event-type")&&/MSPointerDown|touchstart/i.test(e.type)?o.convert_to_touch(t(this)):o.hide(t(this))))}).on("DOMNodeRemoved DOMAttrModified","["+this.attr_name()+"]:not(a)",function(){o.hide(i(this))})},ie_touch:function(){return!1},showTip:function(t){this.getTip(t);return this.show(t)},getTip:function(e){var o=this.selector(e),i=t.extend({},this.settings,this.data_options(e)),s=null;return o&&(s=this.S('span[data-selector="'+o+'"]'+i.tooltip_class)),"object"==typeof s?s:!1},selector:function(t){var e=t.attr("id"),o=t.attr(this.attr_name())||t.attr("data-selector");return(e&&e.length<1||!e)&&"string"!=typeof o&&(o=this.random_str(6),t.attr("data-selector",o)),e&&e.length>0?e:o},create:function(o){var i=this,s=t.extend({},this.settings,this.data_options(o)),n=this.settings.tip_template;"string"==typeof s.tip_template&&e.hasOwnProperty(s.tip_template)&&(n=e[s.tip_template]);var a=t(n(this.selector(o),t("<div></div>").html(o.attr("title")).html())),r=this.inheritable_classes(o);a.addClass(r).appendTo(s.append_to),Modernizr.touch&&(a.append('<span class="tap-to-close">'+s.touch_close_text+"</span>"),a.on("touchstart.fndtn.tooltip MSPointerDown.fndtn.tooltip",function(){i.hide(o)})),o.removeAttr("title").attr("title","")},reposition:function(e,o,i){var s,n,a,r,l;if(o.css("visibility","hidden").show(),s=e.data("width"),n=o.children(".nub"),a=n.outerHeight(),r=n.outerHeight(),o.css(this.small()?{width:"100%"}:{width:s?s:"auto"}),l=function(t,e,o,i,s){return t.css({top:e?e:"auto",bottom:i?i:"auto",left:s?s:"auto",right:o?o:"auto"}).end()},l(o,e.offset().top+e.outerHeight()+10,"auto","auto",e.offset().left),this.small())l(o,e.offset().top+e.outerHeight()+10,"auto","auto",12.5,t(this.scope).width()),o.addClass("tip-override"),l(n,-a,"auto","auto",e.offset().left);else{var p=e.offset().left;Foundation.rtl&&(n.addClass("rtl"),p=e.offset().left+e.outerWidth()-o.outerWidth()),l(o,e.offset().top+e.outerHeight()+10,"auto","auto",p),o.removeClass("tip-override"),i&&i.indexOf("tip-top")>-1?(Foundation.rtl&&n.addClass("rtl"),l(o,e.offset().top-o.outerHeight(),"auto","auto",p).removeClass("tip-override")):i&&i.indexOf("tip-left")>-1?(l(o,e.offset().top+e.outerHeight()/2-o.outerHeight()/2,"auto","auto",e.offset().left-o.outerWidth()-a).removeClass("tip-override"),n.removeClass("rtl")):i&&i.indexOf("tip-right")>-1&&(l(o,e.offset().top+e.outerHeight()/2-o.outerHeight()/2,"auto","auto",e.offset().left+e.outerWidth()+a).removeClass("tip-override"),n.removeClass("rtl"))}o.css("visibility","visible").hide()},small:function(){return matchMedia(Foundation.media_queries.small).matches},inheritable_classes:function(e){var o=t.extend({},this.settings,this.data_options(e)),i=["tip-top","tip-left","tip-bottom","tip-right","radius","round"].concat(o.additional_inheritable_classes),s=e.attr("class"),n=s?t.map(s.split(" "),function(e){return-1!==t.inArray(e,i)?e:void 0}).join(" "):"";return t.trim(n)},convert_to_touch:function(e){var o=this,i=o.getTip(e),s=t.extend({},o.settings,o.data_options(e));0===i.find(".tap-to-close").length&&(i.append('<span class="tap-to-close">'+s.touch_close_text+"</span>"),i.on("click.fndtn.tooltip.tapclose touchstart.fndtn.tooltip.tapclose MSPointerDown.fndtn.tooltip.tapclose",function(){o.hide(e)})),e.data("tooltip-open-event-type","touch")},show:function(t){var e=this.getTip(t);"touch"==t.data("tooltip-open-event-type")&&this.convert_to_touch(t),this.reposition(t,e,t.attr("class")),t.addClass("open"),e.fadeIn(150)},hide:function(t){var e=this.getTip(t);e.fadeOut(150,function(){e.find(".tap-to-close").remove(),e.off("click.fndtn.tooltip.tapclose touchstart.fndtn.tooltip.tapclose MSPointerDown.fndtn.tapclose"),t.removeClass("open")})},off:function(){var e=this;this.S(this.scope).off(".fndtn.tooltip"),this.S(this.settings.tooltip_class).each(function(o){t("["+e.attr_name()+"]").get(o).attr("title",t(this).text())}).remove()},reflow:function(){}}}(jQuery,this,this.document);
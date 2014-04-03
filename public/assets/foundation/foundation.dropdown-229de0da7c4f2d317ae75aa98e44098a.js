!function(t,e){"use strict";Foundation.libs.dropdown={name:"dropdown",version:"5.2.1",settings:{active_class:"open",align:"bottom",is_hover:!1,opened:function(){},closed:function(){}},init:function(t,e,i){Foundation.inherit(this,"throttle"),this.bindings(e,i)},events:function(){var i=this,n=i.S;n(this.scope).off(".dropdown").on("click.fndtn.dropdown","["+this.attr_name()+"]",function(t){var e=n(this).data(i.attr_name(!0)+"-init")||i.settings;t.preventDefault(),(!e.is_hover||Modernizr.touch)&&i.toggle(n(this))}).on("mouseenter.fndtn.dropdown","["+this.attr_name()+"], ["+this.attr_name()+"-content]",function(t){var e=n(this);if(clearTimeout(i.timeout),e.data(i.data_attr()))var s=n("#"+e.data(i.data_attr())),o=e;else{var s=e;o=n("["+i.attr_name()+"='"+s.attr("id")+"']")}var a=o.data(i.attr_name(!0)+"-init")||i.settings;n(t.target).data(i.data_attr())&&a.is_hover&&i.closeall.call(i),a.is_hover&&i.open.apply(i,[s,o])}).on("mouseleave.fndtn.dropdown","["+this.attr_name()+"], ["+this.attr_name()+"-content]",function(){var t=n(this);i.timeout=setTimeout(function(){if(t.data(i.data_attr())){var e=t.data(i.data_attr(!0)+"-init")||i.settings;e.is_hover&&i.close.call(i,n("#"+t.data(i.data_attr())))}else{var s=n("["+i.attr_name()+'="'+n(this).attr("id")+'"]'),e=s.data(i.attr_name(!0)+"-init")||i.settings;e.is_hover&&i.close.call(i,t)}}.bind(this),150)}).on("click.fndtn.dropdown",function(e){var s=n(e.target).closest("["+i.attr_name()+"-content]");if(!n(e.target).data(i.data_attr())&&!n(e.target).parent().data(i.data_attr()))return!n(e.target).data("revealId")&&s.length>0&&(n(e.target).is("["+i.attr_name()+"-content]")||t.contains(s.first()[0],e.target))?void e.stopPropagation():void i.close.call(i,n("["+i.attr_name()+"-content]"))}).on("opened.fndtn.dropdown","["+i.attr_name()+"-content]",function(){i.settings.opened.call(this)}).on("closed.fndtn.dropdown","["+i.attr_name()+"-content]",function(){i.settings.closed.call(this)}),n(e).off(".dropdown").on("resize.fndtn.dropdown",i.throttle(function(){i.resize.call(i)},50)),this.resize()},close:function(t){var e=this;t.each(function(){e.S(this).hasClass(e.settings.active_class)&&(e.S(this).css(Foundation.rtl?"right":"left","-99999px").removeClass(e.settings.active_class),e.S(this).trigger("closed",[t]))})},closeall:function(){var e=this;t.each(e.S("["+this.attr_name()+"-content]"),function(){e.close.call(e,e.S(this))})},open:function(t,e){this.css(t.addClass(this.settings.active_class),e),t.trigger("opened",[t,e])},data_attr:function(){return this.namespace.length>0?this.namespace+"-"+this.name:this.name},toggle:function(t){var e=this.S("#"+t.data(this.data_attr()));0!==e.length&&(this.close.call(this,this.S("["+this.attr_name()+"-content]").not(e)),e.hasClass(this.settings.active_class)?this.close.call(this,e):(this.close.call(this,this.S("["+this.attr_name()+"-content]")),this.open.call(this,e,t)))},resize:function(){var t=this.S("["+this.attr_name()+"-content].open"),e=this.S("["+this.attr_name()+"='"+t.attr("id")+"']");t.length&&e.length&&this.css(t,e)},css:function(t,e){if(this.clear_idx(),this.small()){var i=this.dirs.bottom.call(t,e);t.attr("style","").removeClass("drop-left drop-right drop-top").css({position:"absolute",width:"95%","max-width":"none",top:i.top}),t.css(Foundation.rtl?"right":"left","2.5%")}else{var n=e.data(this.attr_name(!0)+"-init")||this.settings;this.style(t,e,n)}return t},style:function(e,i,n){var s=t.extend({position:"absolute"},this.dirs[n.align].call(e,i,n));e.attr("style","").css(s)},dirs:{_base:function(t){var e=this.offsetParent(),i=e.offset(),n=t.offset();return n.top-=i.top,n.left-=i.left,n},top:function(t){var e=Foundation.libs.dropdown,i=e.dirs._base.call(this,t),n=t.outerWidth()/2-8;return this.addClass("drop-top"),(t.outerWidth()<this.outerWidth()||e.small())&&e.adjust_pip(n,i),Foundation.rtl?{left:i.left-this.outerWidth()+t.outerWidth(),top:i.top-this.outerHeight()}:{left:i.left,top:i.top-this.outerHeight()}},bottom:function(t){var e=Foundation.libs.dropdown,i=e.dirs._base.call(this,t),n=t.outerWidth()/2-8;return(t.outerWidth()<this.outerWidth()||e.small())&&e.adjust_pip(n,i),e.rtl?{left:i.left-this.outerWidth()+t.outerWidth(),top:i.top+t.outerHeight()}:{left:i.left,top:i.top+t.outerHeight()}},left:function(t){var e=Foundation.libs.dropdown.dirs._base.call(this,t);return this.addClass("drop-left"),{left:e.left-this.outerWidth(),top:e.top}},right:function(t){var e=Foundation.libs.dropdown.dirs._base.call(this,t);return this.addClass("drop-right"),{left:e.left+t.outerWidth(),top:e.top}}},adjust_pip:function(t,e){var i=Foundation.stylesheet;this.small()&&(t+=e.left-8),this.rule_idx=i.cssRules.length;var n=".f-dropdown.open:before",s=".f-dropdown.open:after",o="left: "+t+"px;",a="left: "+(t-1)+"px;";i.insertRule?(i.insertRule([n,"{",o,"}"].join(" "),this.rule_idx),i.insertRule([s,"{",a,"}"].join(" "),this.rule_idx+1)):(i.addRule(n,o,this.rule_idx),i.addRule(s,a,this.rule_idx+1))},clear_idx:function(){var t=Foundation.stylesheet;this.rule_idx&&(t.deleteRule(this.rule_idx),t.deleteRule(this.rule_idx),delete this.rule_idx)},small:function(){return matchMedia(Foundation.media_queries.small).matches&&!matchMedia(Foundation.media_queries.medium).matches},off:function(){this.S(this.scope).off(".fndtn.dropdown"),this.S("html, body").off(".fndtn.dropdown"),this.S(e).off(".fndtn.dropdown"),this.S("[data-dropdown-content]").off(".fndtn.dropdown")},reflow:function(){}}}(jQuery,this,this.document);
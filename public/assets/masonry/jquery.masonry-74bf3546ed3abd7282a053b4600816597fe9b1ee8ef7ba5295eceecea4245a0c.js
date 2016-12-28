/**
 * jQuery Masonry v2.1.08
 * A dynamic layout plugin for jQuery
 * The flip-side of CSS Floats
 * http://masonry.desandro.com
 *
 * Licensed under the MIT license.
 * Copyright 2012 David DeSandro
 */
!function(t,i){"use strict";/*
   * smartresize: debounced resize event for jQuery
   *
   * latest version and complete README available on Github:
   * https://github.com/louisremi/jquery.smartresize.js
   *
   * Copyright 2011 @louis_remi
   * Licensed under the MIT license.
   */
var s,e=i.event;e.special.smartresize={setup:function(){i(this).bind("resize",e.special.smartresize.handler)},teardown:function(){i(this).unbind("resize",e.special.smartresize.handler)},handler:function(t,i){var n=this,o=arguments;t.type="smartresize",s&&clearTimeout(s),s=setTimeout(function(){e.dispatch.apply(n,o)},"execAsap"===i?0:100)}},i.fn.smartresize=function(t){return t?this.bind("smartresize",t):this.trigger("smartresize",["execAsap"])},i.Mason=function(t,s){this.element=i(s),this._create(t),this._init()},i.Mason.settings={isResizable:!0,isAnimated:!1,animationOptions:{queue:!1,duration:500},gutterWidth:0,isRTL:!1,isFitWidth:!1,containerStyle:{position:"relative"}},i.Mason.prototype={_filterFindBricks:function(t){var i=this.options.itemSelector;return i?t.filter(i).add(t.find(i)):t},_getBricks:function(t){var i=this._filterFindBricks(t).css({position:"absolute"}).addClass("masonry-brick");return i},_create:function(s){this.options=i.extend(!0,{},i.Mason.settings,s),this.styleQueue=[];var e=this.element[0].style;this.originalStyle={height:e.height||""};var n=this.options.containerStyle;for(var o in n)this.originalStyle[o]=e[o]||"";this.element.css(n),this.horizontalDirection=this.options.isRTL?"right":"left";var h=this.element.css("padding-"+this.horizontalDirection),a=this.element.css("padding-top");this.offset={x:h?parseInt(h,10):0,y:a?parseInt(a,10):0},this.isFluid=this.options.columnWidth&&"function"==typeof this.options.columnWidth;var r=this;setTimeout(function(){r.element.addClass("masonry")},0),this.options.isResizable&&i(t).bind("smartresize.masonry",function(){r.resize()}),this.reloadItems()},_init:function(t){this._getColumns(),this._reLayout(t)},option:function(t){i.isPlainObject(t)&&(this.options=i.extend(!0,this.options,t))},layout:function(t,i){for(var s=0,e=t.length;e>s;s++)this._placeBrick(t[s]);var n={};if(n.height=Math.max.apply(Math,this.colYs),this.options.isFitWidth){var o=0;for(s=this.cols;--s&&0===this.colYs[s];)o++;n.width=(this.cols-o)*this.columnWidth-this.options.gutterWidth}this.styleQueue.push({$el:this.element,style:n});var h,a=this.isLaidOut&&this.options.isAnimated?"animate":"css",r=this.options.animationOptions;for(s=0,e=this.styleQueue.length;e>s;s++)h=this.styleQueue[s],h.$el[a](h.style,r);this.styleQueue=[],i&&i.call(t),this.isLaidOut=!0},_getColumns:function(){var t=this.options.isFitWidth?this.element.parent():this.element,i=t.width();this.columnWidth=this.isFluid?this.options.columnWidth(i):this.options.columnWidth||this.$bricks.outerWidth(!0)||i,this.columnWidth+=this.options.gutterWidth,this.cols=Math.floor((i+this.options.gutterWidth)/this.columnWidth),this.cols=Math.max(this.cols,1)},_placeBrick:function(t){var s,e,n,o,h,a=i(t);if(s=Math.ceil(a.outerWidth(!0)/this.columnWidth),s=Math.min(s,this.cols),1===s)n=this.colYs;else for(e=this.cols+1-s,n=[],h=0;e>h;h++)o=this.colYs.slice(h,h+s),n[h]=Math.max.apply(Math,o);for(var r=Math.min.apply(Math,n),l=0,c=0,u=n.length;u>c;c++)if(n[c]===r){l=c;break}var d={top:r+this.offset.y};d[this.horizontalDirection]=this.columnWidth*l+this.offset.x,this.styleQueue.push({$el:a,style:d});var m=r+a.outerHeight(!0),p=this.cols+1-u;for(c=0;p>c;c++)this.colYs[l+c]=m},resize:function(){var t=this.cols;this._getColumns(),(this.isFluid||this.cols!==t)&&this._reLayout()},_reLayout:function(t){var i=this.cols;for(this.colYs=[];i--;)this.colYs.push(0);this.layout(this.$bricks,t)},reloadItems:function(){this.$bricks=this._getBricks(this.element.children())},reload:function(t){this.reloadItems(),this._init(t)},appended:function(t,i,s){if(i){this._filterFindBricks(t).css({top:this.element.height()});var e=this;setTimeout(function(){e._appended(t,s)},1)}else this._appended(t,s)},_appended:function(t,i){var s=this._getBricks(t);this.$bricks=this.$bricks.add(s),this.layout(s,i)},remove:function(t){this.$bricks=this.$bricks.not(t),t.remove()},destroy:function(){this.$bricks.removeClass("masonry-brick").each(function(){this.style.position="",this.style.top="",this.style.left=""});var s=this.element[0].style;for(var e in this.originalStyle)s[e]=this.originalStyle[e];this.element.unbind(".masonry").removeClass("masonry").removeData("masonry"),i(t).unbind(".masonry")}},/*!
   * jQuery imagesLoaded plugin v1.1.0
   * http://github.com/desandro/imagesloaded
   *
   * MIT License. by Paul Irish et al.
   */
i.fn.imagesLoaded=function(t){function s(){t.call(n,o)}function e(t){var n=t.target;n.src!==a&&-1===i.inArray(n,r)&&(r.push(n),--h<=0&&(setTimeout(s),o.unbind(".imagesLoaded",e)))}var n=this,o=n.find("img").add(n.filter("img")),h=o.length,a="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==",r=[];return h||s(),o.bind("load.imagesLoaded error.imagesLoaded",e).each(function(){var t=this.src;this.src=a,this.src=t}),n};var n=function(i){t.console&&t.console.error(i)};i.fn.masonry=function(t){if("string"==typeof t){var s=Array.prototype.slice.call(arguments,1);this.each(function(){var e=i.data(this,"masonry");return e?i.isFunction(e[t])&&"_"!==t.charAt(0)?void e[t].apply(e,s):void n("no such method '"+t+"' for masonry instance"):void n("cannot call methods on masonry prior to initialization; attempted to call method '"+t+"'")})}else this.each(function(){var s=i.data(this,"masonry");s?(s.option(t||{}),s._init()):i.data(this,"masonry",new i.Mason(t,this))});return this}}(window,jQuery);
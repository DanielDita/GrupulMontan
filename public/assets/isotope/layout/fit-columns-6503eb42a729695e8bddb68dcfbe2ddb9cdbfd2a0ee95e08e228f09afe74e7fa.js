/*!
 * fitColumns layout mode for Isotope
 * http://isotope.metafizzy.co
 */
!function(t){"use strict";function e(t){var e=t.create("fitColumns");return e.prototype._resetLayout=function(){this.x=0,this.y=0,this.maxX=0},e.prototype._getItemLayoutPosition=function(t){t.getSize(),0!==this.y&&t.size.outerHeight+this.y>this.isotope.size.innerHeight&&(this.y=0,this.x=this.maxX);var e={x:this.x,y:this.y};return this.maxX=Math.max(this.maxX,this.x+t.size.outerWidth),this.y+=t.size.outerHeight,e},e.prototype._getContainerSize=function(){return{width:this.maxX}},e.prototype.needsResizeLayout=function(){return this.needsVerticalResizeLayout()},e}"function"==typeof define&&define.amd?define(["isotope/js/layout-mode"],e):e(t.Isotope.LayoutMode)}(window);
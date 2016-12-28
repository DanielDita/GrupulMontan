/*!
 * cellsByRows layout mode for Isotope
 * http://isotope.metafizzy.co
 */
!function(t){"use strict";function i(t){var i=t.create("cellsByRow");return i.prototype._resetLayout=function(){this.itemIndex=0,this.getColumnWidth(),this.getRowHeight(),this.cols=Math.floor(this.isotope.size.innerWidth/this.columnWidth),this.cols=Math.max(this.cols,1)},i.prototype._getItemLayoutPosition=function(t){t.getSize();var i=this.itemIndex%this.cols,e=Math.floor(this.itemIndex/this.cols),o=(i+.5)*this.columnWidth-t.size.outerWidth/2,s=(e+.5)*this.rowHeight-t.size.outerHeight/2;return this.itemIndex++,{x:o,y:s}},i.prototype._getContainerSize=function(){return{height:Math.ceil(this.itemIndex/this.cols)*this.rowHeight}},i}"function"==typeof define&&define.amd?define(["isotope/js/layout-mode"],i):i(t.Isotope.LayoutMode)}(window);
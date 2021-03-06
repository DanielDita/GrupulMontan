/*!
 * jQuery imagesLoaded plugin v2.0.1
 * http://github.com/desandro/imagesloaded
 *
 * MIT License. by Paul Irish et al.
 */
!function(e,i){"use strict";var t="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";e.fn.imagesLoaded=function(r){function a(){var i=e(u),t=e(g);d&&(g.length?d.reject(A,i,t):d.resolve(A)),e.isFunction(r)&&r.call(o,A,i,t)}function n(i,r){i.src!==t&&-1===e.inArray(i,c)&&(c.push(i),r?g.push(i):u.push(i),e.data(i,"imagesLoaded",{isBroken:r,src:i.src}),s&&d.notifyWith(e(i),[r,A,e(u),e(g)]),A.length===c.length&&(setTimeout(a),A.unbind(".imagesLoaded")))}var o=this,d=e.isFunction(e.Deferred)?e.Deferred():0,s=e.isFunction(d.notify),A=o.find("img").add(o.filter("img")),c=[],u=[],g=[];return A.length?A.bind("load.imagesLoaded error.imagesLoaded",function(e){n(e.target,"error"===e.type)}).each(function(r,a){var o=a.src,d=e.data(a,"imagesLoaded");return d&&d.src===o?void n(a,d.isBroken):a.complete&&a.naturalWidth!==i?void n(a,0===a.naturalWidth||0===a.naturalHeight):void((a.readyState||a.complete)&&(a.src=t,a.src=o))}):a(),d?d.promise(o):o}}(jQuery);
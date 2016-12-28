/*
 * throttledresize: special jQuery event that happens at a reduced rate compared to "resize"
 *
 * latest version and complete README available on Github:
 * https://github.com/louisremi/jquery-smartresize
 *
 * Copyright 2012 @louis_remi
 * Licensed under the MIT license.
 *
 * This saved you an hour of work? 
 * Send me music http://www.amazon.co.uk/wishlist/HNTU0468LQON
 */
!function(e){var t,n,r,i=e.event,s={_:0},h=0;t=i.special.throttledresize={setup:function(){e(this).on("resize",t.handler)},teardown:function(){e(this).off("resize",t.handler)},handler:function(o,a){var l=this,d=arguments;n=!0,r||(setInterval(function(){h++,(h>t.threshold&&n||a)&&(o.type="throttledresize",i.dispatch.apply(l,d),n=!1,h=0),h>9&&(e(s).stop(),r=!1,h=0)},30),r=!0)},threshold:0}}(jQuery);
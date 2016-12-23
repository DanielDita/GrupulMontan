(function() {
  $(function() {
    return $('#pins').imagesLoaded(function() {
      $('#pins').masonry;
      return {
        itemSelector: '.box',
        ifFitWidth: true
      };
    });
  });

}).call(this);



$(document).on("turbolinks:load", function(){
  $(function() {
    $('.slider').slick({
      // autoplay: true,
      autoplaySpeed: 7000,
      prevArrow: '<img src="/carousel-prev.png" class="prev-arrow">',
      nextArrow: '<img src="/carousel-next.png" class="next-arrow">',
      dots: true
    });
  });


  $(function(){
    var slider = "#slider"; 
    var thumbnailItem = "#thumbnail-list .thumbnail-item"; 
    
    $(thumbnailItem).each(function(){
    var index = $(thumbnailItem).index(this);
    $(this).attr("data-index",index);
    });
    
    $(slider).on('init',function(slick){
    var index = $(".slide-item.slick-slide.slick-current").attr("data-slick-index");
    $(thumbnailItem+'[data-index="'+index+'"]').addClass("thumbnail-current");
    });

    $(slider).slick({
      
      arrows: false,
      fade: true,
      infinite: false 
    });
    
    $(thumbnailItem).on('mouseover',function(){
      var index = $(this).attr("data-index");
      $(slider).slick("slickGoTo",index,false);
    });
    
    $(slider).on('beforeChange',function(event,slick, currentSlide,nextSlide){
      $(thumbnailItem).each(function(){
        $(this).removeClass("thumbnail-current");
      });
      $(thumbnailItem+'[data-index="'+nextSlide+'"]').addClass("thumbnail-current");
    });
  });
}); 
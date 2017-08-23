window.onload=function(){
    var timer=null;
    var index=0;
    // auto
   function autoplay(){
    timer=setInterval(function(){
        index++;
        if (index>3) {
            index=0
        };
        $('#banner-list a').eq(index).addClass("active").siblings().removeClass();
        $('#list li').eq(index).fadeIn().siblings().fadeOut();
    },3000)
   }

   autoplay();

     $('#banner-list a').click(function(){
        index=$(this).index();
        $(this).addClass('active').siblings().removeClass();
        $('#list li').eq(index).fadeIn().siblings().fadeOut();
     });
     $('.pos').mouseover(function(){
        clearInterval(timer);
     });
     $('.pos').mouseout(function(){
        autoplay();
     })






}
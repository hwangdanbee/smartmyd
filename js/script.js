	//intro
    $(window).on('load', function() {
        setTimeout(function(){
            $(".intro").fadeOut();
        }, 1200);
    });


var s = Splitting();

    $(document).on('mouseenter', (e) =>{
        let cursor = $('.cursor');
        cursor.removeClass("hide");
    });

    $(document).on('mouseleave', (e) =>{
        let cursor = $('.cursor');
        cursor.addClass("hide");
    });

    $(document).on('mousemove', (e) =>{
        let cursor = $('.cursor');
        TweenMax.to(cursor, .05, {
        x: e.pageX-5,
        y: e.pageY-5
        });
    });

    $(document).on('mousemove', (e) => {
        let cursor = $('.cursor-ring');
        TweenMax.to(cursor, .4, {
        x: e.pageX-12,
        y: e.pageY-12
        });
    });

    $(document).ready(() => {
    let cursor = $('.cursor');
        $('a').on("mouseover", () => {
            TweenMax.to(cursor, .20, {
        scale: 4,
        });
        cursor.addClass("hover");
        });
        $('a').on("mouseout", () => {
            TweenMax.to(cursor, .25, {
        scale: 1,
        });
        cursor.removeClass("hover");
        });
    });

    // 햄버거
    $(document).ready(function(){
        $(".menu").on('click',function(){
            $(this).find(".hambergerIcon").toggleClass("open");
        });

		 $(".head_menu > ul > li ").on('click',function(){
           $(".hambergerIcon").toggleClass("open");
        });
      });


    // arrow click
     $(".topButton").click(function(){
        $.fn.fullpage.moveTo(1);
    });


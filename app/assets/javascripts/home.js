$(document).ready(function(){
    $(window).scroll(function(){
        if($(window).scrollTop() > 5){
            $(".navbar").addClass("navbar-light bg-light");
            $(".navbar").removeClass("navbar-dark bg-dark");
        }
        else{
            $(".navbar").addClass("navbar-dark bg-dark");
            $(".navbar").removeClass("navbar-light bg-light");
        }
    });

    // $(window).scroll(function(){
    //     // alert("connor is a person");
    // });
});


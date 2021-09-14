/*global animate*/
/*global $*/
/*global url*/
/*global fadeIn*/


$(".line").animate({"width":"100%"},1500,function(){
    $(".line").css("right",0)
    $(".line").animate({"width":"0%"},function(){
        $(".up").animate({"height":"0%"})
        $(".down").animate({"height":"0%"},500,function(){
            $(".top-meet_snow").fadeIn("slow")
        });
    });
})
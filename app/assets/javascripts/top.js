/*global animate*/
/*global $*/
/*global url*/
/*global fadeIn*/


$(".line").animate({"width":"100%"},1500,function(){
    $(".line").css("right",0)
    $(".line").animate({"width":"0%"},function(){
        $(".first-meet_snow").animate({ opacity: 0 }, { duration: 400, easing: 'swing'})
        $(".up").animate({"height":"0%"})
        $(".down").animate({"height":"0%"},500,function(){
            $(".top-meet_snow").fadeIn("slow")
            $(".top-image1").delay(6000).fadeOut(2000)
            $(".none").animate({"height":"0%"},100,function(){
                $(".top-image2").fadeIn("slow").delay(15000).fadeOut(2000)
                $(".none").animate({"height":"0%"},100,function(){
                    $(".top-image3").fadeIn("slow").delay(24000).fadeOut(2000)
                    $(".none").animate({"height":"0%"},100,function(){
                        $(".top-image4").fadeIn("slow").delay(33000)
                    });
                });
            });
        });
    });
})






// $(".first-meet_snow").fadeOut(("slow"),function(){
//   $(".line").animate({"width":"100%"},1500,function(){
//     $(".line").css("right",0)
//     $(".line").animate({"width":"0%"},function(){
//         $(".up").animate({"height":"0%"})
//         $(".down").animate({"height":"0%"},500,function(){
//             $(".top-meet_snow").fadeIn("slow")
//         });
//     });
//   });
// })

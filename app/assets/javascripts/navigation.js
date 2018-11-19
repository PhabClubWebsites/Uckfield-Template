$(document).on("turbolinks:load", function() {
    $("body").on("click", "#mobile_menu", function() {
        if ($("#mobile_side_menu").hasClass("is-open")) {
             $(this).find(".fa.fa-times.fa-2x").attr("class", "fas fa-bars fa-2x")
            $("#mobile_side_menu").removeClass("is-open");
        } else {
            $(this).find(".fas.fa-bars.fa-2x").attr("class", "fa fa-times fa-2x")
            $("#mobile_side_menu").addClass("is-open");
        }
    });
    
    $("body").on("click", ".mm__item", function() {
        $(".mm__item").next("ul").slideUp(300);
        if ($(this).hasClass("open")) {
            $(this).removeClass("open")
            $(".mm__item").removeClass("open");
        } else {
            $(".mm__item").removeClass("open");
            $(this).addClass("open")  
            $(this).next("ul").slideToggle(300)
        }
         
    });
});

// $(document).ready( function() {
//     checkActiveNavBtn();
//     triggerDropdownMenu();
// });

// function checkActiveNavBtn() {
//     $("a[id^='nav_btn_'").click(function(e) {
//         $(this).addClass("active");
//         $(this).parent("li").addClass("active");
//         var active_btn = $(this).attr("id");
//         $("a[id^='nav_btn_'").each( function() {
//             if ($(this).attr("id") != active_btn) {
//                 $(this).removeClass("active");
//                 $(this).parent("li").removeClass("active");
//             }
//         });
        
//     });
// }

// function triggerDropdownMenu() {
//     $("a[id^='nav_btn_'").each(function() {
//         $(this).parent("li").on({
//             mouseenter: function () {
//                 $(this).children("ul").slideDown("fast");
//             },
//             mouseleave: function () {
//                 $(this).children("ul").slideUp("fast");
//             }
//         });
//     });
// }
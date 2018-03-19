$(document).ready( function() {
    checkActiveNavBtn();
    triggerDropdownMenu();
});

function checkActiveNavBtn() {
    $("a[id^='nav_btn_'").click(function(e) {
        $(this).addClass("active");
        $(this).parent("li").addClass("active");
        var active_btn = $(this).attr("id");
        $("a[id^='nav_btn_'").each( function() {
            if ($(this).attr("id") != active_btn) {
                $(this).removeClass("active");
                $(this).parent("li").removeClass("active");
            }
        });
        
    });
}

function triggerDropdownMenu() {
    $("a[id^='nav_btn_'").each(function() {
        $(this).parent("li").on({
            mouseenter: function () {
                $(this).children("ul").slideDown("fast");
            },
            mouseleave: function () {
                $(this).children("ul").slideUp("fast");
            }
        });
    });
}
$(document).ready( function() {
    addContentBlock();
})

function addContentBlock() {
    $("#more_content").click(function(e) {
        e.preventDefault();
        if ($("#block_2").css("display") == "none") {
            $("#block_2").slideToggle("fast");
        } else if ($("#block_3").css("display") == "none") {
            $("#block_3").slideToggle("fast");
            $("#more_content").attr("disabled", true);
        }
    });
    
}
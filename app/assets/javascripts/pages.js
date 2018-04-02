$(document).ready( function() {
    addContentBlock();
    addImageFile();
})

function addContentBlock() {
    $("#more_content").click(function() {
        if ($("#block_2").css("display") == "none") {
            $("#block_2").slideToggle("fast");
        } else if ($("#block_3").css("display") == "none") {
            $("#block_3").slideToggle("fast");
            $("#more_content").attr("disabled", true);
        }
    });
    
}

function addImageFile() {
    $("#another_image").click(function(e) {
        e.preventDefault();
        if ($("#image_2").css("display") == "none") {
            $("#image_2").slideToggle("fast");
        }
    });
}
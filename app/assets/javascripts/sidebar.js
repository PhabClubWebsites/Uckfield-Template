$(document).on("turbolinks:load", function() {
  $("body").on("click", "#contact_btn", function() {
    console.log("hello");
    if (isSidebarOpen() && $("#contact_block").is(":visible")) {
      $("#contact_block").fadeOut("slow");
      closeSidebar();
    } else if (isSidebarOpen() && $("#address_block").is(":visible")) {
      $("#address_block").hide();
      $("#contact_block").fadeIn("fast");
    } else {
      $("#contact_block").show();
      openSidebar();
    }
  });
  $("body").on("click", "#address_btn", function() {
    if (isSidebarOpen() && $("#address_block").is(":visible")) {
      $("#address_block").fadeOut("slow");
      closeSidebar();
    } else if (isSidebarOpen() && $("#contact_block").is(":visible")) {
      $("#contact_block").hide();
      $("#address_block").fadeIn("fast");
    } else {
      $("#address_block").show();
      openSidebar();
    }
  })
  $("body").on("click", "#facebook_btn, #twitter_btn, #donate_btn", function() {
    if (isSidebarOpen()) {
      closeSidebar();
      setTimeout(function() {
        $("#contact_block, #address_block").hide();
      }, 500);
    }
  })
});
  
function isSidebarOpen() {
  if ($("#sidebar_block").hasClass("sidebar-open")) {
    return true;
  } else {
    return false;
  }
}
  
function openSidebar() {
  $(".sidebar").css("left", "0px")
  $("#sidebar_block").addClass("sidebar-open");
  // $("#icon_bar").css("left", "200px");
}
  
function closeSidebar() {
  $(".sidebar").css("left", "-200px");
  $("#sidebar_block").removeClass("sidebar-open");
  // $("#icon_bar").css("left", "0");
}
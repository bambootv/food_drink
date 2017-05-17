$(function() {
  var button = $("#loginButton");
  var box = $("#loginBox");
  var form = $("#loginForm");
  button.removeAttr("href");
  button.mouseup(function(login) {
    box.toggle();
    button.toggleClass("active");
  });
  form.mouseup(function() {
    return false;
  });
  $(this).mouseup(function(login) {
    if(!($(login.target).parent("#loginButton").length > 0)) {
      button.removeClass("active");
      box.hide();
    }
  });
});


new WOW().init();


$(document).ready(function() {
  $("#slider").fwslider({
        auto:     true,  //auto start
        speed:    300,   //transition speed
        pause:    4000,  //pause duration
        panels:   5,     //number of image panels
        width:    1680,
        height:   500,
        nav:      true   //show navigation
      });
});

$(window).load(function() {
  $("#flexiselDemo3").flexisel({
    visibleItems: 4,
    animationSpeed: 1000,
    autoPlay: true,
    autoPlaySpeed: 3000,
    pauseOnHover: true,
    enableResponsiveBreakpoints: true,
    responsiveBreakpoints: {
      portrait: {
        changePoint:480,
        visibleItems: 1
      },
      landscape: {
        changePoint:640,
        visibleItems: 2
      },
      tablet: {
        changePoint:768,
        visibleItems: 2
      }
    }
  });
});

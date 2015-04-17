(function() {
  (function($) {
    "use strict";
    var appOhmpieng;
    appOhmpieng = {
      main_func: function() {
        return $(window).bind("load resize", function() {
          if ($(this).width() < 768) {
            $("div.sidebar-collapse").addClass("collapse");
          } else {
            $("div.sidebar-collapse").removeClass("collapse");
          }
        });
      },
      initialization: function() {
        appOhmpieng.main_func();
      }
    };
    $.noty.defaults = {
      layout: "bottomRight",
      theme: "relax",
      type: "alert",
      dismissQueue: true,
      template: "<div class=\"noty_message\"><span class=\"noty_text\"></span><div class=\"noty_close\"></div></div>",
      animation: {
        open: 'animated fadeInRight',
        close: 'animated fadeOutRight',
        easing: "swing",
        speed: 500
      },
      timeout: 5000,
      maxVisible: 10,
      closeWith: ["click"],
      callback: {
        onShow: function() {},
        afterShow: function() {},
        onClose: function() {},
        afterClose: function() {},
        onCloseClick: function() {}
      }
    };
    $(document).ready(function() {
      appOhmpieng.main_func();
    });
  })(jQuery);

  NProgress.configure({
    showSpinner: true,
    ease: 'ease',
    speed: 500
  });

  $(document).on("page:fetch", function() {
    NProgress.start();
  });

  $(document).on("page:change", function() {
    NProgress.done();
  });

  $(document).on("page:restore", function() {
    NProgress.remove();
  });

}).call(this);

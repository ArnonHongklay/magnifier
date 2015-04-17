(function() {
  $(document).ready(function() {
    $('[data-toggle=tooltip]').tooltip();
    $('[data-toggle=popover]').popover();
    $('.dropdown-toggle').dropdown();
    $('.dropdown.hover').hover((function() {
      return $(this).find('.dropdown-menu').stop(true, true).fadeIn();
    }), function() {
      return $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeOut();
    });
    $('#toggle').click(function() {
      $('#dock .launcher a').toggle();
      return $('#dock li.launcher').each(function() {
        return $(this).find('.dropdown-menu').css('top', $(this).position().top + 33);
      });
    });
    return $('[data-toggle=toolbar-tooltip]').tooltip({
      placement: 'bottom'
    });
  });

  window.ohmpieng = angular.module("ohmpieng", ['gettext', 'angulartics', 'angulartics.google.analytics', 'nprogress-rails']);

  ohmpieng.config(function($locationProvider) {
    return $locationProvider.html5Mode(true).hashPrefix('!');
  });

  ohmpieng.controller('AppCtrl', function($scope) {});

  ohmpieng.controller('AuthCtrl', function($scope) {
    $scope.name = "auth";
    return console.log($scope.name);
  });

}).call(this);
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
(function() {
  ohmpieng.directive('responsive', function($window) {
    return {
      link: function(scope, element, attrs) {
        var respond;
        respond = function() {
          var width;
          width = $window.innerWidth;
          return scope.device = (function() {
            switch (false) {
              case !(width < 600):
                return 'phone';
              case !(width < 1200):
                return 'tablet';
              default:
                return 'desktop';
            }
          })();
        };
        respond();
        return angular.element($window).on('resize', function() {
          return scope.$applyAsync(function() {
            return respond();
          });
        });
      }
    };
  });

}).call(this);
(function() {


}).call(this);
(function() {


}).call(this);
(function() {


}).call(this);
(function() {


}).call(this);
(function() {


}).call(this);

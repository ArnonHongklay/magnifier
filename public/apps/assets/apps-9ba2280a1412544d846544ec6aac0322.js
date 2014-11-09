(function() {
  var console, isAndroid, msViewportStyle, nua;

  window.console || (console = {
    log: function() {}
  });

  if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
    msViewportStyle = document.createElement("style");
    msViewportStyle.appendChild(document.createTextNode("@-ms-viewport{width:auto!important}"));
    document.querySelector("head").appendChild(msViewportStyle);
  }

  nua = navigator.userAgent;

  isAndroid = nua.indexOf("Mozilla/5.0") > -1 && nua.indexOf("Android ") > -1 && nua.indexOf("AppleWebKit") > -1 && nua.indexOf("Chrome") === -1;

  if (isAndroid) {
    $("select.form-control").removeClass("form-control").css("width", "100%");
  }

  $(document).ready(function() {
    var settings, sprObject;
    $("a[href^=#]").click(function(e) {
      e.preventDefault();
    });
    hljs.initHighlightingOnLoad();
    $("body").sprFlat({
      colors: {
        white: "#fff",
        dark: "#79859b",
        red: "#f68484",
        blue: "#75b9e6",
        green: "#71d398",
        yellow: "#ffcc66",
        orange: "#f4b162",
        purple: "#af91e1",
        pink: "#f78db8",
        lime: "#a8db43",
        mageta: "#eb45a7",
        teal: "#97d3c5",
        black: "#000",
        brown: "#d1b993",
        gray: "#f3f5f6"
      },
      customScroll: {
        color: "#999",
        railColor: "#eee",
        size: "5px",
        opacity: "0.5",
        alwaysVisible: false
      },
      header: {
        fixed: true
      },
      breadcrumbs: {
        auto: true
      },
      sidebar: {
        fixed: true,
        rememberToggle: true,
        offCanvas: false
      },
      sideNav: {
        hover: false,
        showNotificationNumbers: "onhover",
        showArrows: true,
        sideNavArrowIcon: "en-arrow-down5",
        showIndicator: false,
        notificationColor: "red",
        subOpenSpeed: 300,
        subCloseSpeed: 400,
        animationEasing: "linear",
        absoluteUrl: false,
        subDir: ""
      },
      tile: {
        countNumbers: true
      },
      panels: {
        refreshIcon: "im-spinner6",
        toggleIcon: "im-minus",
        collapseIcon: "im-plus",
        closeIcon: "im-close",
        showControlsOnHover: true,
        overlayRefreshIcon: "im-spinner5",
        rememberSortablePosition: true
      },
      forms: {
        checkAndRadioTheme: "blue"
      },
      tooltips: true,
      tables: {
        responsive: true,
        customscroll: true
      },
      alerts: {
        animation: true,
        closeEffect: "bounceOutDown"
      },
      backToTop: {
        active: true,
        scrolltime: 800,
        imgsrc: "assets/img/backtop.png",
        width: 48,
        place: "bottom-right",
        fadein: 500,
        fadeout: 500,
        opacity: 0.5,
        marginX: 1,
        marginY: 2
      },
      dropdownMenu: {
        animation: true,
        openEffect: "fadeInDown"
      }
    });
    sprObject = $("body").data("sprFlat");
    settings = sprObject.settings;
    $("[data-toggle=tooltip]").tooltip({
      container: "body"
    });
    $(".tip").tooltip({
      placement: "top",
      container: "body"
    });
    $(".tipR").tooltip({
      placement: "right",
      container: "body"
    });
    $(".tipB").tooltip({
      placement: "bottom",
      container: "body"
    });
    $(".tipL").tooltip({
      placement: "left",
      container: "body"
    });
    $("[data-toggle=popover]").popover();
    tinymce.init({
      selector: ".wysiwyg",
      menubar: false,
      plugins: ["advlist autolink lists link image charmap print preview anchor", "searchreplace visualblocks code fullscreen", "insertdatetime media table contextmenu paste"],
      toolbar: "bold italic strikethrough bullist numlist blockquote hr alignleft aligncenter alignright alignjustify link unlink code image media fullscreen"
    });
    $(".tags1").tagsInput({
      width: "auto"
    });
  });

}).call(this);

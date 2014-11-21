# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# = require landing/jquery-1.10.2
# = require landing/bootstrap.min
# = require landing/jquery.easing.min
# = require landing/classie
# = require landing/cbpAnimatedHeader
# = require landing/jquery.appear
# = require landing/businessplus
# = require landing/jquery.flexslider-min
# = require landing/jquery.isotope.min


# jQuery for page scrolling feature - requires jQuery Easing plugin
$(document).ready ->

  # Highlight the top nav as scrolling occurs

  # Floating label headings for the contact form

  #home section image size to window size.

  #Flex slider in home section
  initialize = ->
    mapProp =
      center: new google.maps.LatLng(51.508742, -0.120850)
      zoom: 5
      mapTypeId: google.maps.MapTypeId.ROADMAP

    map = new google.maps.Map(document.getElementById("googleMap"), mapProp)
    return
  $(".page-scroll a").bind "click", (event) ->
    $anchor = $(this)
    $("html, body").stop().animate
      scrollTop: $($anchor.attr("href")).offset().top
    , 1500, "easeInOutExpo"
    event.preventDefault()
    return

  $("#content").scrollspy target: ".navbar-fixed-top"
  $("body").on("input propertychange", ".floating-label-form-group", (e) ->
    $(this).toggleClass "floating-label-form-group-with-value", !!$(e.target).val()
    return
  ).on("focus", ".floating-label-form-group", ->
    $(this).addClass "floating-label-form-group-with-focus"
    return
  ).on "blur", ".floating-label-form-group", ->
    $(this).removeClass "floating-label-form-group-with-focus"
    return

  $appeared = $("#appeared")
  $disappeared = $("#disappeared")
  $(".animateup").appear()
  $(document.body).on "appear", ".animateup", (e, $affected) ->
    $affected.each ->
      $(this).addClass "animated fadeInUp"
      return

    return

  $(".animateleft").appear()
  $(document.body).on "appear", ".animateleft", (e, $affected) ->
    $affected.each ->
      $(this).addClass "animated fadeInLeft"
      return

    return

  $(".animateright").appear()
  $(document.body).on "appear", ".animateright", (e, $affected) ->
    $affected.each ->
      $(this).addClass "animated fadeInRight"
      return

    return

  height = $(window).height()
  $(".home").css "height", height
  $(".home_wrap").css "height", height
  $(".home").css "max-width", "100%"
  $(".flexslider").flexslider
    animation: "slide"
    direction: "vertical"
    controlNav: false
    directionNav: false
    start: (slider) ->
      $("body").removeClass "loading"
      return


  # google.maps.event.addDomListener(window, 'load', initialize);

  #Javascript for portfolio
  $container = $("#container")
  $container.isotope
    itemSelector: ".element"
    masonry:
      columnWidth: 0

    masonryHorizontal:
      rowHeight: 0

    cellsByRow:
      columnWidth: 0
      rowHeight: 0

    cellsByColumn:
      columnWidth: 0
      rowHeight: 0

    getSortData:
      symbol: ($elem) ->
        $elem.attr "data-symbol"

      category: ($elem) ->
        $elem.attr "data-category"


  #  number : function( $elem ) {
  #          return parseInt( $elem.find('.number').text(), 10 );
  #        },
  #        weight : function( $elem ) {
  #          return parseFloat( $elem.find('.weight').text().replace( /[\(\)]/g, '') );
  #        },
  #        name : function ( $elem ) {
  #          return $elem.find('.name').text();
  #        }
  #
  $sortBy = $("#sort-by")
  $("#shuffle a").click ->
    $container.isotope "shuffle"
    $sortBy.find(".selected").removeClass "selected"
    $sortBy.find("[data-option-value=\"random\"]").addClass "selected"
    false


  #Portfolio JS

  # init Isotope
  $container = $(".isotope").isotope(
    itemSelector: ".element-item"
    layoutMode: "fitRows"
    getSortData:
      name: ".name"
      symbol: ".symbol"
      number: ".number parseInt"
      category: "[data-category]"
      weight: (itemElem) ->
        weight = $(itemElem).find(".weight").text()
        parseFloat weight.replace(/[\(\)]/g, "")
  )

  # filter functions
  filterFns =

    # show if number is greater than 50
    numberGreaterThan50: ->
      number = $(this).find(".number").text()
      parseInt(number, 10) > 50


    # show if name ends with -ium
    ium: ->
      name = $(this).find(".name").text()
      name.match /ium$/


  # bind filter button click
  $("#filters").on "click", "button", ->
    filterValue = $(this).attr("data-filter")

    # use filterFn if matches value
    filterValue = filterFns[filterValue] or filterValue
    $container.isotope filter: filterValue
    return


  # change is-checked class on buttons
  $(".filter_group").each (i, buttonGroup) ->
    $buttonGroup = $(buttonGroup)
    $buttonGroup.on "click", "button", ->
      $buttonGroup.find(".active").removeClass "active"
      $(this).addClass "active"
      return

    return

  return

$(window).resize ->

  #home section image size to window size.
  height = $(window).height()
  $(".home").css "height", height
  $(".home_wrap").css "height", height
  $(".home").css "max-width", "100%"
  return

$(window).load ->
  jQuery("#portfolio #filters .filter.active").click()

  #//code for closing the navbar
  $(".nav").click ->
    $(".navbar-collapse").removeClass "in"
    return

  return

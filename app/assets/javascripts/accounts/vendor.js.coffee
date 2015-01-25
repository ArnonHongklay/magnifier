# = require jquery
# = require jquery-ui
# = require jquery_ujs
# = require turbolinks
# = require angular
# = require bootstrap-sprockets
# = require nprogress
# = require nprogress-angular

# = require apps/Chart.min
# = require apps/jquery.noty.packaged.min

#= require accounts/dashboard
#= require accounts/report
#= require accounts/monitoring_tools
#= require accounts/ticket_support

window.hg = angular.module 'ohmpieng', [
	'nprogress-rails'
]

NProgress.configure({
  showSpinner: true,
  ease: 'ease',
  speed: 500
});

$(document).on "page:fetch", ->
  NProgress.start()
  return

$(document).on "page:change", ->
  NProgress.done()
  return

$(document).on "page:restore", ->
  NProgress.remove()
  return

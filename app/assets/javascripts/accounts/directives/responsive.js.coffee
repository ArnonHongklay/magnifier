
# ohmpieng.directive 'responsive', ($window) ->
#   link: (scope, element, attrs) ->
#     respond = ->
#       width = $window.innerWidth
#       scope.device = switch
#         when width < 600 then  'phone'
#         when width < 1200 then 'tablet'
#         else                   'desktop'
#     respond()
#     angular.element($window).on 'resize', -> scope.$applyAsync -> respond()

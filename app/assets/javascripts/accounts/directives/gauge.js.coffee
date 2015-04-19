ohmpieng.directive 'gauge', ->
  restrict: 'E'
  replace: true
  scope:
    label: '@'
    min: '='
    max: '='
    value: '='
  link: (scope, element, attrs) ->
    config =
      size: 300
      label: attrs.label
      min: if undefined != scope.min then scope.min else 0
      max: if undefined != scope.max then scope.max else 100
      minorTicks: 5
    range = config.max - config.min
    config.yellowZones = [ {
      from: config.min + range * 0.75
      to: config.min + range * 0.9
    } ]
    config.redZones = [ {
      from: config.min + range * 0.9
      to: config.max
    } ]
    scope.gauge = new Gauge(element[0], config)
    scope.gauge.render()
    scope.gauge.redraw scope.value
    scope.$watch 'value', ->
      if scope.gauge
        scope.gauge.redraw scope.value
      # return
    # return

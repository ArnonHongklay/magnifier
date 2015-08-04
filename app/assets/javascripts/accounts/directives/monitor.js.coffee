ohmpieng.directive 'monitor', ->
  template: '<div></div>'
  scope: chart: '='
  restrict: 'E'
  replace: true
  link: (scope, element) ->

    chart = new google.charts.Line(element[0])

    draw = (datas) ->
      data = new google.visualization.DataTable()
      data.addColumn(datas.column_vertical.type,      datas.column_vertical.text)
      data.addColumn(datas.column_horizontal.type,    datas.column_horizontal.text)
      if datas.column_horizontal2
        data.addColumn(datas.column_horizontal2.type,   datas.column_horizontal2.text)

      data.addRows(datas.data)

      options =
        chart:
          title: datas.chart.title
          subtitle: datas.chart.subtitle
        width: '90%'
        height: 300
      chart.draw data, options

    scope.$watch 'chart', (datas) ->
      if datas and datas.data
        draw datas

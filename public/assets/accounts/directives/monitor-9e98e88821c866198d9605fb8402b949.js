(function() {
  ohmpieng.directive('monitor', function() {
    return {
      template: '<div></div>',
      scope: {
        chart: '='
      },
      restrict: 'E',
      replace: true,
      link: function(scope, element) {
        var draw, lineChart;
        lineChart = new google.visualization.LineChart(element[0]);
        draw = function(chart) {
          var chartOptions, data, i, item, last, max, min, table, value, view;
          data = chart.data;
          table = new google.visualization.DataTable;
          table.addColumn('datetime');
          table.addColumn('number');
          table.addRows(data.length);
          view = new google.visualization.DataView(table);
          i = 0;
          while (i < data.length) {
            item = data[i];
            table.setCell(i, 0, new Date(item.timestamp));
            value = parseFloat(item.value);
            table.setCell(i, 1, value);
            i++;
          }
          last = data[data.length - 1];
          max = new Date(last.timestamp);
          min = new Date(last.timestamp - chart.max * 1000);
          chartOptions = {
            legend: 'none',
            vAxis: {
              minValue: 0,
              maxValue: 100
            },
            hAxis: {
              viewWindow: {
                min: min,
                max: max
              }
            }
          };
          return lineChart.draw(view, chartOptions);
        };
        return scope.$watch('chart', function(chart) {
          if (chart && chart.data && chart.max) {
            return draw(chart);
          }
        });
      }
    };
  });

}).call(this);

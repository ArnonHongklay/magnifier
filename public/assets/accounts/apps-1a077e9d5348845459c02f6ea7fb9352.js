(function() {
  window.ohmpieng = angular.module("ohmpieng", ['ui.router', 'ui.bootstrap', 'ngAnimate', 'ngCookies', 'ngResource', 'ngTable', 'gettext', 'angulartics', 'templates', 'nprogress-rails']);

  ohmpieng.config(function($stateProvider, $urlRouterProvider, $locationProvider, $analyticsProvider) {
    $stateProvider.state('profile', {
      url: '/profile',
      templateUrl: 'accounts/profile',
      controller: 'ProfileCtrl',
      resolve: {
        profile: function($http, $stateParams) {
          return $http.get("/profile.json");
        }
      }
    }).state('account', {
      url: '/:userId',
      templateUrl: 'accounts/nav',
      controller: 'AccountCtrl',
      resolve: {
        account: function($http, $stateParams) {
          return $http.get("/" + $stateParams.userId + ".json");
        }
      }
    }).state('account.index', {
      url: '/index',
      templateUrl: 'accounts/index',
      controller: 'IndexCtrl'
    }).state('account.dashboard', {
      url: '/dashboard',
      templateUrl: 'accounts/dashboard',
      controller: 'DashboardCtrl'
    }).state('account.report', {
      url: '/report',
      templateUrl: 'accounts/report',
      controller: 'ReportCtrl'
    }).state('account.setting', {
      url: '/setting',
      templateUrl: 'accounts/setting',
      controller: 'SettingCtrl'
    });
    $urlRouterProvider.otherwise('/');
    return $locationProvider.html5Mode(true).hashPrefix('!');
  });

  ohmpieng.controller('AppCtrl', function($scope, $rootScope) {
    $scope.$on('$stateChangeStart', NProgress.start);
    $scope.$on('$stateChangeSuccess', NProgress.done);
    $scope.$on('$stateChangeError', NProgress.done);
    return $scope.$on('$stateChangeSuccess', function(e, toState) {
      return $scope.stateName = toState.name;
    });
  });

}).call(this);
(function() {


}).call(this);
(function() {
  ohmpieng.directive('meter', function() {
    return {
      template: '<div></div>',
      scope: {
        chart: '='
      },
      restrict: 'E',
      replace: true,
      link: function(scope, element) {
        var draw, gauge;
        gauge = new google.visualization.Gauge(element[0]);
        draw = function(datas) {
          var chartOptions, view;
          view = new google.visualization.arrayToDataTable([['Label', 'Value'], [datas.data.text, datas.data.value]]);
          chartOptions = {
            height: 150,
            redFrom: 90,
            redTo: 100,
            yellowFrom: 75,
            yellowTo: 90,
            minorTicks: 5
          };
          return gauge.draw(view, chartOptions);
        };
        return scope.$watch('chart', function(datas) {
          if (datas && datas.data && datas.max) {
            return draw(datas);
          }
        });
      }
    };
  });

}).call(this);
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
  ohmpieng.controller('AccountCtrl', function($scope, $state, $stateParams, account) {
    $scope.user = account.data.user;
    $scope.isCollapsed = function() {
      $('#dock .launcher a').toggle();
    };
    $scope.isHoverIn = function(e) {
      angular.element(e.currentTarget).find('.dropdown-menu').stop(true, true).fadeIn();
    };
    return $scope.isHoverOut = function(e) {
      angular.element(e.currentTarget).find('.dropdown-menu').stop(true, true).delay(100).fadeOut();
    };
  });

}).call(this);
(function() {
  ohmpieng.controller('DashboardCtrl', function($scope, account) {
    var dispatcher, items;
    $scope.user = account.data.user;
    dispatcher = new WebSocketRails("127.0.0.1:10000/websocket");
    dispatcher.on_open = function(data) {
      return console.log(data);
    };
    dispatcher.bind('tasks.create_success', function(task) {
      console.log('successfully created ' + task.name);
    });
    items = [];
    items.push({
      timestamp: 20,
      value: 82
    });
    $scope.chart = {
      data: items,
      max: 30
    };
    $scope.ram = {
      data: {
        text: "Ram",
        value: 80
      },
      max: 30
    };
    $scope.cpu = {
      data: {
        text: "CPU",
        value: 33
      },
      max: 30
    };
    $scope.disk = {
      data: {
        text: "Disk",
        value: 50
      },
      max: 30
    };
    $scope.$on('tooltipShow.directive', function(angularEvent, event) {
      angularEvent.targetScope.$parent.event = event;
      angularEvent.targetScope.$parent.$digest();
    });
    $scope.exampleData = [
      {
        'key': 'CPU',
        'color': '#2ABB9B',
        'values': [[0, 1233], [10, 2312], [20, 3123], [30, 123], [40, 12312], [50, 1231]]
      }
    ];
    return $scope.isAreaExampleData = [
      {
        'key': 'x1',
        'color': '#2ABB9B',
        'values': [[0, 1233], [10, 2312], [20, 3123], [30, 123], [40, 12312], [50, 1231]]
      }, {
        'key': 'x2',
        'color': '#2574A9',
        'values': [[0, 123], [10, 3123], [20, 2345], [30, 456], [40, 456], [50, 765]]
      }, {
        'key': 'x3',
        'color': '#F62459',
        'values': [[0, 12], [10, 213], [20, 313], [30, 123], [40, 12], [50, 1231]]
      }
    ];
  });

}).call(this);
(function() {
  ohmpieng.controller('IndexCtrl', function($scope, $state, $stateParams, $http, account) {
    return $scope.user = account.data.user;
  });

}).call(this);
(function() {


}).call(this);
(function() {
  ohmpieng.controller('ProfileCtrl', function($scope, profile) {
    $scope.account = profile.data.account;
    return console.log($scope.account);
  });

}).call(this);
(function() {
  ohmpieng.controller('ReportCtrl', function($scope, $http, $filter, ngTableParams, account) {
    $scope.user = account.data.user;
    return $scope.xxx = [
      {
        name: "Moroni",
        age: 50
      }, {
        name: "Tiancum",
        age: 43
      }, {
        name: "Jacob",
        age: 27
      }, {
        name: "Nephi",
        age: 29
      }, {
        name: "Enos",
        age: 34
      }
    ];
  });

}).call(this);
(function() {
  ohmpieng.controller('SettingCtrl', function($scope, account) {
    return console.log($scope.user = account.data.user);
  });

}).call(this);
(function() {


}).call(this);

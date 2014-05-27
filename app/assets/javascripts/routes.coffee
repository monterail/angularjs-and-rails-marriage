angular.module('SampleApp').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/');

  $stateProvider.state('home', {
    url: '/',
    controller: 'PagesCtrl',
    templateUrl: 'pages/index.html'
  })

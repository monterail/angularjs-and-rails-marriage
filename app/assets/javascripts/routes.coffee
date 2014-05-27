angular.module('SampleApp').config ($stateProvider, $urlRouterProvider, Rails) ->
  $urlRouterProvider.otherwise('/');

  $stateProvider.state('home', {
    url: '/',
    controller: 'PagesCtrl',
    templateUrl: Rails.templates['pages/index.html']
  })

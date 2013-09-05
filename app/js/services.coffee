angular.module("app", ['ngRoute', 'restangular'])

angular.module("app").factory "Wines", (Restangular) ->
  Restangular.all('wines')

angular.module("app").config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)

  $routeProvider.when "/wines",
    templateUrl: "welcome.html"

  $routeProvider.when "/wines/:id",
    templateUrl: "wine-details.html"
    controller: "WineDetailCtrl"

  $routeProvider.otherwise redirectTo: "/wines"

.run ($rootScope, $location) ->
  $rootScope.addWine = -> $location.path("/wines/add")

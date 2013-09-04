angular.module("app", ['ngRoute', 'ngResource'])

angular.module("app").factory "WineFactory", ($resource) ->
  $resource "/api/wines/:id"

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

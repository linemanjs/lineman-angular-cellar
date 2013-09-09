angular.module("app", ["ngRoute"])

angular.module("app").factory "WineService", ($http) ->
  url = "/api/wines"

  get: (id) ->
    $http.get("#{url}/#{id}")

  all: ->
    $http.get(url)

  save: (wine) ->
    $http.post("#{url}", wine)

  remove: (wine) ->
    $http.delete("#{url}/#{wine.id}")

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

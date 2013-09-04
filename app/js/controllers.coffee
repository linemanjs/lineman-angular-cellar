root = this

root.WineListCtrl = (WineFactory, $scope) ->
  $scope.wines = WineFactory.query()
  $scope.$on "updateWines", (e, wines) ->
    $scope.wines = wines

root.WineDetailCtrl = (WineFactory, $routeParams, $scope, $location, $rootScope) ->
  $scope.wine = if $routeParams.id == "add" then nullWine() else WineFactory.get(id: $routeParams.id)

  $scope.saveWine = ->
    WineFactory.save($scope.wine).$promise.then (wine) ->
      $scope.wine = wine
      $rootScope.$broadcast("updateWines", WineFactory.query())

  $scope.deleteWine = ->
    WineFactory.delete(id: $scope.wine.id).$promise.then ->
      $rootScope.$broadcast("updateWines", WineFactory.query())
      $location.path("/wines")

nullWine = ->
  picture: "generic.jpg"


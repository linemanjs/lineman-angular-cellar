root = this

root.WineListCtrl = (Wines, $scope) ->
  $scope.wines = Wines.getList()
  $scope.$on "updateWines", (e, wines) ->
    $scope.wines = wines

root.WineDetailCtrl = (Wines, $routeParams, $scope, $location, $rootScope) ->
  window.Wines = Wines
  $scope.wine = if $routeParams.id == "add" then nullWine() else Wines.one($routeParams.id).get()

  $scope.saveWine = ->
    Wines.putElement($scope.wine.id, $scope.wine).then ->
      $rootScope.$broadcast("updateWines", Wines.getList())

  $scope.deleteWine = ->
    Wines.one($scope.wine.id).remove().then ->
      $rootScope.$broadcast("updateWines", Wines.getList())
      $location.path("/wines")

nullWine = ->
  picture: "generic.jpg"


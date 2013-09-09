root = this

root.WineListCtrl = (WineService, $scope) ->
  WineService.all().then (wines) ->
    $scope.wines = wines.data

  $scope.$on "winesUpdated", (e, wines) ->
    $scope.wines = wines
    undefined

root.WineDetailCtrl = (WineService, $routeParams, $scope, $location, $rootScope) ->
  if $routeParams.id == "add"
    $scope.wine = nullWine()
  else
    WineService.get($routeParams.id).then (wine) ->
      $scope.wine = wine.data

  updateWines = ->
    WineService.all().then (wines) ->
      $rootScope.$broadcast "winesUpdated", wines.data

  $scope.saveWine = ->
    WineService.save($scope.wine).then(updateWines).then ->
      alert('Wine Saved!')

  $scope.deleteWine = ->
    WineService.remove($scope.wine).then(updateWines).then ->
      $location.path("/wines")

nullWine = ->
  picture: "generic.jpg"


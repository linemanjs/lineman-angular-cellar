root = this

root.WineListCtrl = (Wines, $scope) ->
  $scope.wines = Wines.getList()

root.WineDetailCtrl = (Wines, $routeParams, $scope, $location, Restangular) ->
  Wines.one($routeParams.id).get().then (wine) ->

  $scope.wine = if $routeParams.id == "add" then nullWine() else Wines.one($routeParams.id).get()

  $scope.saveWine = ->
    $scope.wine.then (wine) ->
      wine.customPUT().then ->
        $location.path('/wines')

  $scope.deleteWine = ->
    $scope.wine.then (wine) ->
      wine.remove().then ->
        $location.path('/wines')

nullWine = ->
  picture: "generic.jpg"


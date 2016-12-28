/* global angular */

angular.module("app").controller("beerCtrl", function($scope, $http) {

  $scope.setup = function() {
    $http.get("http://localhost:3000/api/v1/beers").then(function(response) {
      $scope.beers = response.data;
      $scope.orderAttribute = 'name';
      $scope.isOrderDescending = false;
    });
  };

  $scope.addBeer = function(inputName, inputStyle, inputAlcohol) {
    var newBeer = {
      name: inputName,
      style: inputStyle,
      alcohol: inputAlcohol
    };
    $http.post("/api/v1/beers", newBeer).then(function(response) {
      $scope.beers.push(response.data);
    }, function(error) {
      $scope.errors = error.data.errors;
    });
  };

  $scope.updateBeer = function(inputBeer) {
    var index = $scope.beers.indexOf(inputBeer);
    if (index !== -1) {
      var currentBeer = {
      };
      $http.patch("/api/v1/beers", currentBeer);
    }
  };

  $scope.deleteBeer = function(inputBeer) {
    $http.delete("/api/v1/beers/" + inputBeer.id).then(function(response) {
      var index = $scope.beers.indexOf(inputBeer);
      $scope.beers.splice(index, 1);
    });
  };

  $scope.changeOrderAttribute = function(inputAttribute) {
    if (inputAttribute === $scope.orderAttribute) {
      $scope.isOrderDescending = !$scope.isOrderDescending;
    } else {
      $scope.isOrderDescending = false;
    }
    $scope.orderAttribute = inputAttribute;
  };

  $scope.getSortIcon = function(inputAttribute) {
    if (inputAttribute === $scope.orderAttribute) {
      if ($scope.isOrderDescending) {
        return "\u2193";
      } else {
        return "\u2191";
      }
    }
  };

// For debugging in the browser
  window.$scope = $scope;

});
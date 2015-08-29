/**
*  Module
*
* Description
*/
angular.module('RSociety')
  .controller('CategoryController', function($scope, $routeParams) {
    $scope.name = $routeParams.name;
  });

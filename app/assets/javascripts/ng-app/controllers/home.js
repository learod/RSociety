angular.module('RSociety')
  .controller('HomeController', ['$scope', 'ArtService', function($scope, artService) {
    $scope.arts = artService.getArts();
  }]);

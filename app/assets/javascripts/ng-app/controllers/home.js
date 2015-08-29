angular.module('RSociety')
  .controller('HomeController', ['$scope', 'ArtService', function($scope, artService) {
    artService.getArts().success(function(data) { $scope.arts = data;});
  }]);

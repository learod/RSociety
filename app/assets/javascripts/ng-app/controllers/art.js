/**
*  Module
*
* Description
*/
angular.module('RSociety')
  .controller('ArtController', ['$scope', '$stateParams', 'ArtService', function($scope, $stateParams, artService) {
      $scope.art = artService.getArt($stateParams.id);
  }]);

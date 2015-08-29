angular.module('RSociety')
    .service('ArtService', ['$http', function ($http) {

        var urlBase = '/api/customers';

        this.getArt = function () {
            return $http.get(urlBase);
        };

        this.getArtsByCategory = function (id) {
            return $http.get(urlBase + '/' + id);
        };

        this.getCategories = function() {
            return $http.get(urlBase);
        };

        this.getArts = function() {
            return $http.get(urlBase);
        };
    }]);

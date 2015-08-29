angular.module('RSociety')
    .service('ArtService', ['$http', function ($http) {

        var urlBase = '/arts/todas';

        this.getArt = function (id) {
            return $http.get(urlBase + id);
        };

        this.getArts = function() {
            return $http.get(urlBase);
        };
    }]);

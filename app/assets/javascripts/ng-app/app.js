angular.module('RSociety', [
    'ui.router'
  ])
  .config(function($stateProvider, $urlRouterProvider) {
    // For any unmatched url, redirect to /state1
    $urlRouterProvider.otherwise("/");
    //
    // Now set up the states
    $stateProvider
      .state('home', {
        url: "/",
        templateUrl: "templates/home.html",
        controller: 'HomeController'
      })
      .state('art', {
        url: "/art/:id",
        controller: "ArtController",
        templateUrl: "templates/art.html"
      });
  });

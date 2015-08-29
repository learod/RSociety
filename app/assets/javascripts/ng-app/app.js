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
      .state('categories', {
        url: "/categories",
        templateUrl: "templates/categories.html",
        controller: "CategoriesController"
      })
      .state('category', {
        url: "/category/:name",
        templateUrl: "templates/category.html",
        controller: "CategoryController"
      })
      .state('art', {
        url: "/art/:id",
        controller: "ArtController",
        templateUrl: "templates/art.html"
      });
  });

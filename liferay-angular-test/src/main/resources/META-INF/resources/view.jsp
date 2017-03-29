<%@ include file="/init.jsp" %>

<script src="/o/liferay-angular-test/js/angular.min.js"></script>

<p>
	<b><liferay-ui:message key="liferay-angular-test.caption"/> 1.0.8</b>
</p>


<div id="<portlet:namespace/>App1" ng-app="<portlet:namespace/>listCities" ng-controller="<portlet:namespace/>CitiesController">
    <h1>Your cities</h1>
    <div id="<portlet:namespace/>repeat" ng-repeat="item in items">
      <span>{{item.city_name}}</span>
      <span>{{item.state}}</span>
      <button ng-click="remove($index);">Remove</button>
    </div>
  </div>

  <div id="<portlet:namespace/>App2" ng-app="<portlet:namespace/>usersList" ng-controller="<portlet:namespace/>UsersController">
    <h1>List of Users</h1>
      	<p>User ID :	{{users.body.userId}}</p>
		<p>First Name :  {{users.body.firstName}}</p>
		<p>Last Name :  {{users.body.lastName}}</p>
		<p>Location :  {{users.body.city}}</p>
  </div>


<script>
	var citiesModule = angular.module("<portlet:namespace/>listCities", [])
	citiesModule.controller("<portlet:namespace/>CitiesController",
	 function($scope) {
	   $scope.items = [{
		   city_name: "Cyberjaya",
	     state: "Selangor"
	   }, {
		   city_name: "Dengkil",
	     state: "Selangor"
	   }, {
		   city_name: "Sepang",
	     state: "Selangor"
	   }];
	   $scope.remove = function(index) {
	     $scope.items.splice(index, 1);
	   }
	 }
	);

	
	var namesModule = angular.module("<portlet:namespace/>usersList", [])
	namesModule.controller("<portlet:namespace/>UsersController",
			function($scope, $http) {
		 $http.get('http://localhost:9000/find').
	        then(function(response) {
	            $scope.users = response.data;
	        });
	    });
	
	
	
	
	angular.element(document).ready(function() {
	 angular.bootstrap(document.getElementById("<portlet:namespace/>App2"), ['<portlet:namespace/>usersList']);
	});
</script>


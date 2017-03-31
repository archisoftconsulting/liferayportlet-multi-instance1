<%@ include file="/init.jsp" %>


<script src="/o/liferay-angular-test/js/angular.min.js"></script>
<script src="/o/liferay-angular-test/js/angular-route.min.js"></script>

<p>
	<b><liferay-ui:message key="angular-multi-test.caption"/> 1.0.14</b>
</p>

<div id="<portlet:namespace/>App1" ng-app="<portlet:namespace/>listCities" ng-controller="<portlet:namespace/>CitiesController">
    <h1>Your cities</h1>
    <div id="<portlet:namespace/>repeat" ng-repeat="item in items">
      <span>{{item.city_name}}</span>
      <span>{{item.state}}</span>
      <button ng-click="remove($index);">Remove</button>
    </div>
  </div>
  
<br/>

<br/>

<div id="<portlet:namespace/>">

	<div ng-controller="<portlet:namespace/>RouteController">
	
			<p>User ID : {{users.body.userId}}</p>
			<p>First Name :  {{users.body.firstName}}</p>
			<p>Last Name :  {{users.body.lastName}}</p>
			<p>Location :  {{users.body.city}}</p>
	 
	</div>
</div>


<script>
    var <portlet:namespace/>module = angular.module("<portlet:namespace/>sampleApp", []);

    <portlet:namespace/>module.controller("<portlet:namespace/>RouteController", function($scope, $http) {
    	 $http.get('http://localhost:9000/find').
	        then(function(response) {
	            $scope.users = response.data;
	        });
    });
    
  
    var <portlet:namespace/>App1module = angular.module("<portlet:namespace/>sampleApp1", []);

    <portlet:namespace/>App1module.controller("<portlet:namespace/>CitiesController",
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
  
    angular.bootstrap(document.getElementById("<portlet:namespace/>"), ['<portlet:namespace/>sampleApp']);
    angular.bootstrap(document.getElementById("<portlet:namespace/>App1"), ['<portlet:namespace/>sampleApp1']);
    
</script>
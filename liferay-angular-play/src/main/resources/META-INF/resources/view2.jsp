<%@ include file="/init.jsp" %>

<script src="/o/liferay-angular-test/js/angular.min.js"></script>

<p>
	<b><liferay-ui:message key="liferay-angular-play.caption"/> 1.0.1</b>
</p>

<div id="<portlet:namespace/>AddUser" ng-app="<portlet:namespace/>user" ng-controller="<portlet:namespace/>AddUserController">

	<label id="dialNewCustomerName">Add User</label>

    <label class="lblPopUp">User ID</label>
    <input type="text" id="userId" class="form-control" ng-model="user.userId" />

    <label class="lblPopUp">First Name</label>
    <input type="text" id="firstName" class="form-control" ng-model="user.firstName" />

    <label class="lblPopUp">Last Name</label>
    <input type="text" id="lastName" class="form-control" ng-model="user.lastName" />

    <label class="lblPopUp">City</label>
    <input type="text" id="city" class="form-control" ng-model="user.city" />

    
    <br />
    <button class="btn btn-default" type="submit" ng-click="add()">Validate</button>
</div>
<script>
	var addUserModule = angular.module("<portlet:namespace/>user", [])
	addUserModule.controller("<portlet:namespace/>AddUserController",
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

	
	var addUserModule = angular.module("<portlet:namespace/>user", [])
	addUserModule.controller("<portlet:namespace/>AddUserController",
			function($scope, $http) {
		$scope.customer = {};
		$scope.customers.push({id: $scope.email, phone: $scope.phone, isActivated: $scope.activation, name: $scope.name, roleType: $scope.roleType});
		 $http.get('http://localhost:9000/find').
	        then(function(response) {
	            $scope.users = response.data;
	        });
	    });
	
</script>
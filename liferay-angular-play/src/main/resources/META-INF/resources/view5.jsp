<%@ include file="/init.jsp" %>

<script src="/o/liferay-angular-test/js/angular.min.js"></script>

<p>
	<b><liferay-ui:message key="liferay-angular-play.caption"/> 1.0.7</b>
</p>

<div id="<portlet:namespace/>AddUser" ng-app="<portlet:namespace/>user" >
	<form name="saveTemplateData" ng-submit="submit_form()" ng-controller="<portlet:namespace/>FormCtrl">
		<label id="dialNewCustomerName">Add User</label>
		<br/><br/>
	    <label class="lblPopUp">User ID</label>
	    <input type="text" id="userId" class="form-control" ng-model="user.userId" />
	
	    <label class="lblPopUp">First Name</label>
	    <input type="text" id="firstName" class="form-control" ng-model="user.firstName" />
	
	    <label class="lblPopUp">Last Name</label>
	    <input type="text" id="lastName" class="form-control" ng-model="user.lastName" />
	
	    <label class="lblPopUp">City</label>
	    <input type="text" id="city" class="form-control" ng-model="user.city" />
	
	    
	    <br />
	    <input type="submit" ngClick="Submit">
	</form>
</div>
<script>
	
	var addUser = angular.module("<portlet:namespace/>user", [])
	addUser.controller("<portlet:namespace/>FormCtrl",
			function($scope, $http) {
		$scope.submit_form = function()
        {
            $http({
                    url: "http://localhost:9000/add",
                    method: "POST",
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    data: $.param($scope.formAdata)
                }).success(function(data, status, headers, config) {
                    $scope.status = status;
                    console.log("Success....");
                }).error(function(data, status, headers, config) {
                    $scope.status = status;
                    console.log("Error....");
                });
        }
		    }); 


</script>
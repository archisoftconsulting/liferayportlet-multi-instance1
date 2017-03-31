<%@ include file="/init.jsp" %>

<script src="/o/liferay-angular-test/js/angular.min.js"></script>

<p>
	<b><liferay-ui:message key="liferay-angular-play.caption"/> 1.0.8</b>
</p>


<div ng-app="postserviceApp" ng-controller="postserviceCtrl">
	<div>
		User ID : <input ng-model="userId" /><br/><br/>
		First Name : <input ng-model="firstName" /><br/><br/>
		Last Name : <input ng-model="lastName" /><br/><br/>
		City : <input ng-model=city /><br/><br/>
		<input type="button" value="Send" ng-click="postdata(userId, firstName, lastName, city)" /> <br/><br/>
	</div>
	<p>Output Message : {{msg}}</p>
	<p>StatusCode: {{statusval}}</p>
	<p>Status: {{statustext}}</p>
	<p>Response Headers: {{headers}}</p>
</div>
<script>
	
	var app = angular.module('postserviceApp', []);
	app.controller('postserviceCtrl', function ($scope, $http) {
		$scope.userId = null;
		$scope.firstName = null;
		$scope.lastName = null;
		$scope.city = null;
		$scope.lblMsg = null;
		$scope.postdata = function (userId, firstName, lastName, city) {
			var data = {
					userId: userId,
					firstName: firstName,
					lastName: lastName,
					city: city
		};
		//Call the services
		$http.post('http://localhost:9000/add', JSON.stringify(data)).then(function (response) {
		if (response.data)
			$scope.msg = "Post Data Submitted Successfully!";
		}, function (response) {
			$scope.msg = "Service not Exists";
			$scope.statusval = response.status;
			$scope.statustext = response.statusText;
			$scope.headers = response.headers();
		});
		};
	});

</script>
<%@ include file="/init.jsp" %>

<script src="/o/liferay-angular-test/js/angular.min.js"></script>

<p>
	<b><liferay-ui:message key="liferay-angular-play.caption"/> 1.0.12</b>
</p>


<div ng-app="myApp">

    <div  ng-controller="sendForm">
		<form method="post" ng-submit="saveData()">
			 <div>
			 	<label>User ID</label>
			 	<input ng-model="data.userId">
			 </div>
			 <div>
			 	<label>First Name</label>
			 	<input ng-model="data.firstName">
			 </div>
			 <div>
			 	<label>Last Name</label>
			 	<input ng-model="data.lastName">
			 </div>
			 <div class="md-block" flex-gt-xs>
			 	<label>City</label>
			 	<input ng-model="data.city">
			 </div>
			 <div class="form-group">
			 	<button type="submit" class="btn btn-default">Save</button>
			 </div>
	 	</form>
	 </div>
	
	<p>Output Message : {{msg}}</p>
	<p>StatusCode: {{statusval}}</p>
	<p>Status: {{statustext}}</p>
	<p>Response Headers: {{headers}}</p>
</div>
<script>
	
	var app = angular.module("myApp" , []);
	app.controller("sendForm" , function($scope, $http){
		$scope.saveData= function(){
			$scope.signError = false;
			$scope.signSuccess = false;
			var request = $http({
				method: "post",
				url:  "http://localhost:9000/add",
				data: $.param($scope.data),  // pass in data as strings
				headers : { 'Content-Type': 'application/x-www-form-urlencoded',
				'X-Requested-With' : 'XMLHttpRequest'
				}
			// set the headers so angular passing info as form data (not request payload)
			});
			
			request.success(function (res) {
				console.log(res);
			});
			request.error(function(serverResponse, status, headers, config) {
			/* Error loading data */
				console.log(serverResponse,status.headers,config);
			}); 
		};
	});

</script>
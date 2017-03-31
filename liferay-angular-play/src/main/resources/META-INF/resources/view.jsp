<%@ include file="/init.jsp" %>

<script src="/o/liferay-angular-test/js/angular.min.js"></script>

<p>
	<b><liferay-ui:message key="liferay-angular-play.caption"/> 1.0.20</b>
</p>


<div id="<portlet:namespace/>Add">
    <div  ng-controller="<portlet:namespace/>sendForm">
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
	
</div>

<br/><br/>

<div id="<portlet:namespace/>Display">
    <div  ng-controller="<portlet:namespace/>DisplayUser">
    <h1>Users</h1>
       <table id="<portlet:namespace/>repeat" >
		    <tr>
		        <th >User ID</th>
		        <th >First Name</th>
		        <th >Last Name</th>
		        <th >City</th>
		    </tr>
		    <tr ng-repeat="user in users">
		        <td >{{user.userId}}</td>
		        <td >{{user.firstName}}</td>
		        <td >{{user.lastName}}</td>
		        <td >{{user.city}}</td>
		    </tr>
		</table>

	
</div>

<script>
	
	//var app = angular.module("myApp" , []);
	var <portlet:namespace/>Addmodule = angular.module("<portlet:namespace/>AddApp", []);
	<portlet:namespace/>Addmodule.controller("<portlet:namespace/>sendForm" , function($scope, $http){
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
	 angular.bootstrap(document.getElementById("<portlet:namespace/>Add"), ['<portlet:namespace/>AddApp']);
	    

	 var <portlet:namespace/>Displaymodule = angular.module("<portlet:namespace/>DisplayApp", []);

	    <portlet:namespace/>Displaymodule.controller("<portlet:namespace/>DisplayUser",
	    		 function($scope, $http) {
	    	$http.get('http://localhost:9000/all').
	        then(function(response) {
	            $scope.users = response.data.body;
	        });
	    		 }

		);
	    angular.bootstrap(document.getElementById("<portlet:namespace/>Display"), ['<portlet:namespace/>DisplayApp']);
		 
</script>
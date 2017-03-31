<%@ include file="/init.jsp" %>

<script src="/o/liferay-angular-test/js/angular.min.js"></script>

<p>
	<b><liferay-ui:message key="liferay-angular-play.caption"/> 1.0.9</b>
</p>


<div ng-app="myApp">

    <form ng-controller="FormCtrl" ng-submit="submitForm()">
        User ID:    <br/><input type="text" ng-model="form.userid">    <br/><br/>
        First Name:    <br/><input type="text" ng-model="form.firstname">    <br/><br/>
        Last Name:    <br/><input type="text" ng-model="form.lastname">    <br/><br/>
        City: <br/><input type="text" ng-model="form.city"> <br/><br/>
        <!-- Description:<br/> <textarea rows="3" cols="25" ng-model="form.textareacontent"></textarea> -->
            <br/>
       
            <br/>
        <input type="submit" ngClick="Submit" >
    </form>

	<p>Output Message : {{msg}}</p>
	<p>StatusCode: {{statusval}}</p>
	<p>Status: {{statustext}}</p>
	<p>Response Headers: {{headers}}</p>
</div>
<script>
	
	var app = angular.module('myApp', []);
	
	app.controller('FormCtrl', function ($scope, $http) {
	
		var formData = {
		    userid: "default",
		    firstname: "default",
		    lastname: "default",
		    city: "default"
		};
		
		
		$scope.submitForm = function() {
		
		    $http({
		
		        url: "http://localhost:9000/add",
		        data: $scope.form,
		        method: 'POST',
		        headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
		
		    }).success(function(data){
		    	$scope.msg = "Post Data Submitted Successfully!";
		        console.log("OK", data)
		
		    }).error(function(err){"ERR", console.log(err)})
		};
	
	});

</script>
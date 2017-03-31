<%@ include file="/init.jsp" %>


<script src="/o/liferay-angular-test/js/angular.min.js"></script>
<script src="/o/liferay-angular-test/js/angular-route.min.js"></script>

<p>
	<b><liferay-ui:message key="angular-multi-test.caption"/> 1.0.9</b>
</p>

<portlet:renderURL var="template2">
	<portlet:param name="mvcPath" value="/o/liferay-angular-test/route1.jsp"/>
</portlet:renderURL>

<portlet:renderURL var="template1">
	<portlet:param name="mvcPath" value="/o/liferay-angular-test/route2.jsp" />
</portlet:renderURL>


<div id="<portlet:namespace/>">

	<div ng-controller="<portlet:namespace/>RouteController">
	
	
		<a href="/<portlet:namespace/>route1">Route 1</a> &nbsp;
		<a href="/<portlet:namespace/>route2">Route 2</a> &nbsp;
		
		<div ng-view></div>
	 
	</div>
</div>


<script>
    var <portlet:namespace/>module = angular.module("<portlet:namespace/>sampleApp", ['ngRoute']);

    <portlet:namespace/>module.config(['$routeProvider','$locationProvider',
        function($routeProvider,$locationProvider) {
	    	$routeProvider.
	        when('/<portlet:namespace/>route1', {                    
                   templateUrl: '${template1}',
                   controller: '<portlet:namespace/>RouteController'
               }).
            when('/<portlet:namespace/>route2', {
                templateUrl: '${template2}',
                controller: '<portlet:namespace/>RouteController'
            });
      }]);

    <portlet:namespace/>module.controller("<portlet:namespace/>RouteController", function($scope) {
    });
    
  
  <portlet:namespace/>module.run(['$rootScope', '$location','$route',
                function ($rootScope, $location,$route) {                   
                    $rootScope.$on('$locationChangeSuccess', function (event, next, current) {                     	
                   	
                   	 var result= <portlet:namespace/>isValidURL($location.path());           	 
                    	if(!result){                    		
                    		$route.current=current;             		 
                    	}  
                              
                    });

            }]);             
   
    function  <portlet:namespace/>isValidURL(nextURL){
    	var isValidURL=false;
    	var validURL = ["/<portlet:namespace/>route1","/<portlet:namespace/>route2"];
    	for (var urlIndex=0; urlIndex<validURL.length;urlIndex++) {    		
            if (nextURL.indexOf(validURL[urlIndex])!=-1){        	
            	isValidURL=true;
            }
        }
    	return isValidURL;
    } 
    angular.bootstrap(document.getElementById("<portlet:namespace/>"), ['<portlet:namespace/>sampleApp']);
    
</script>
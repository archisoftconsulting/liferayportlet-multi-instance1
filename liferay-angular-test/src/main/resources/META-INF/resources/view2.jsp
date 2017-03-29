<%@ include file="/init.jsp" %>

<script src="/o/liferay-angular-test/js/angular.min.js"></script>

<p>
	<b><liferay-ui:message key="liferay-angular-test.caption"/>1.0.1</b>
</p>


<div id="<portlet:namespace />main"  ng-cloak>
      <div ui-view></div>
</div>


<script>
      var config = {namespace:'<portlet:namespace />main'};
      bootstrap(config); 
      
      function bootstrap(config) {
    	  /** Initialize app module **/
    	  var app = angular.module(config.namespace, ['ui.router']);
    	 
    	  /** Configure routers **/
    	  app.config(['$stateProvider', '$urlRouterProvider',
    	   function($stateProvider, $urlRouterProvider) {
    	     $urlRouterProvider.otherwise('/'); 
    	     $stateProvider
    	       .state('users', {
    	          url: '/',
    	          templateUrl: path + '/users.jsp',
    	          controller: 'PeopleCtrl'}) 
    	       .state('usersdetails', { 
    	          url: '/' + config.namespace + '/usersdetails/:groupName/:id',
    	          templateUrl: path + '/partials/usersdetails.jsp', 
    	          controller: 'PersonDetailsCtrl' 
    	       });
    	   }]
    	  );
    	 
    	  /** Load controllers and services **/
    	  loadControllers(app, config);
    	 
    	  
    	  angular.bootstrap('<portlet:namespace />main', '<portlet:namespace />');
    	}
</script>


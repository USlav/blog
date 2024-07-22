component{
	this.name = "blog" 
	this.applicationTimeout = createTimespan(0,2,0,0)
	this.datasource = "blog"
	this.sessionManagement = true
	this.setClientCookies = true 
 	this.sessionTimeout = createTimespan(0,0,30,0)
	//on application start method
	boolean function onApplicationStart(){
		application.posts = createObject("component", "cfc.posts")
		application.comments = createObject("component", "cfc.comments")
		application.authentication = createObject("component", "cfc.authentication")
		return true;
	}
	//onRequestStart() method 
	boolean function onRequestStart(required string targetPage){
		if (structKeyExists(url, "restartApp")){
			this.onApplicationStart() 
		}
		return true;
	}
}

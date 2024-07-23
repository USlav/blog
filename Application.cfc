component{
	this.name = "blog";
	this.applicationTimeout = createTimespan(0,2,0,0);
	this.sessionManagement = true;
	this.setClientCookies = true;
 	this.sessionTimeout = createTimespan(0,0,30,0);
	//on application start method
	boolean function onApplicationStart(){
		record = deserializeJSON(fileRead("c:/PIA/blog/config.json", "utf-8"));
		application.datasource = record.datasource;
		application.dateMask = "dd-mm-yyyy";
		application.posts = createObject("component", "cfc.posts");
		application.comments = createObject("component", "cfc.comments");
		application.authentication = createObject("component", "cfc.authentication");
		return true;
	}
	//onRequestStart() method 
	boolean function onRequestStart(required string targetPage){
		if (structKeyExists(url, "restartApp")){
			this.onApplicationStart();
		}
		return true;
	}
	
	public void function onError(required any exception, required string eventName) {
        writeDump(var=arguments, label="arguments");
		abort;
		return;
    } 
}

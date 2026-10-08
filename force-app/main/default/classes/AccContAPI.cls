@RestResource(Urlmapping='/AccountContactAPI')
global class AccContAPI {
	
    @httpPost
    global static void saveAccConFromExtSys(){
        
        //initiate req and res objs
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        //Parse JSON body to understandable structure
        String body = req.requestBody.toString();//{"Customer Name": "Salesforce" , "isAccount": "true"}
        MyJSONClass myobj = (MyJSONClass) JSON.deserialize(body,MyJSONClass.class);
        
        system.debug('__' + myobj.CustomerName + '---' + myobj.isAccount);
        
        //logic
        if(myobj.isAccount==true){
            Account acc = new Account(Name =myobj.CustomerName);
            insert acc;
        }
        else if (myobj.isAccount==false){
            Contact con = new Contact(Lastname=myobj.CustomerName);
            insert con;
        }
    }
    
}
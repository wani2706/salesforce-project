public class ApexRESTCalloutDemo {
    public static void getUsersFormExternalSystems(){
        /*
        //GET method
        HTTP httpobj = new HTTP();
        HTTPRequest req = new HTTPRequest();
        
        req.setEndpoint('https://reqres.in/api/my-app/collections/todos/records');
        req.setHeader('Content-Type','application/json');
        req.setMethod('GET');
        //req.setBody('');

		HTTPResponse res = new HTTPResponse();
        res = httpobj.send(req);
		system.debug('....response body---' + res.getBody());
        */
        
        //Create USer
        HTTP httpobj = new HTTP();
        HTTPRequest req = new HTTPRequest();
        
        req.setEndpoint('https://reqres.in/api/my-app/collections/todos/records');
        req.setHeader('Content-Type','application/json');
        req.setMethod('POST');
        req.setBody('{"firstName": "Shiwani", "lastName":"Wasu"}');
        
        HTTPResponse res = new HTTPResponse();
        res = httpobj.send(req);
        
    }
}
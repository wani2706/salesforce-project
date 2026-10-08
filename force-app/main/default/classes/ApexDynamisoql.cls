public class ApexDynamisoql {
    public static void myMethod(){
        
        //Dynamic SOQL
        String s = 'SELECT Name, Phonenumber FROM Account';
       List<sObject> acclist =  Database.query(s);
        
        //creating the query string dynamically
        String s1 = 'SELECT ID';
        List<string> s3 = new List<string>();
        
        s3.add('Name');
        s3.add('NumberOfEmployees');
        s3.add('Phone');
        
        for( string s4 : s3){
            s1 = s1 + ', '+ s4;
        }
        
        String objName = 'Account';
        
        s1 = s1 + ' FROM ' + objName;
        
        List<sObject> s5 = Database.query(s1);
        
    }
}
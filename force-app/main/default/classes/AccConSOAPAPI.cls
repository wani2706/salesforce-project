global class AccConSOAPAPI {

   webservice static String createAccConFromSOAP(String name, Boolean isAccount){
       if(isAccount==true){
           Account acc = new Account(Name=name);
           insert acc;
           return acc.Id;
       }
       else if(isAccount==false){
           Contact con = new Contact(Lastname = name);
           insert con;
           return con.id;
       }
       return null;
    }
    
}
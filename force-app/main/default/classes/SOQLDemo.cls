public with sharing class SOQLDemo {
    
    public static void parentToChildDemo(){
        List<Account> accList = [SELECT Id, Name, 
                                (SELECT Id, FirstName, LastName from Contacts) 
                                 from Account];
        for(Account acc: accList){
            system.debug('Account Name : ' +acc.name);
            for(Contact con : acc.Contacts){
                system.debug(con.firstName + ' ' + con.lastName);
            }
        }
        
    }
    public static void queryDemo() {
        
        String s = 'test';
        integer a;
        List<Account> accList = [SELECT id, Name 
                                 FROM Account
                                 WHERE Name LIKE :s] ;
        for(Account acc : accList){
            system.debug(acc);
        }
        
        
    }
}
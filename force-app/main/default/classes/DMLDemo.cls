public class DMLDemo {
    
    public static void databaseClassDemo(){
        List<Contact> conList = new List<Contact>{
            new Contact(FirstName='Joe', LastName='Smith', Department='Finance'),
            new Contact(FirstName='Kathy', LastName='Smith', Department='Technology'),
            new Contact(FirstName='Caroline', LastName='Roth', Department='Finance'),
            new Contact()};
        
      Database.SaveResult[] srList = Database.insert(conList, false);
      
        //iterate through each returned result
        for(Database.SaveResult sr : srList){
            if(sr.isSuccess()){
                //operation was successful, so get the id of the record that was processed
                system.debug('Successfully inserted conytact. Contact ID : '+sr.getId());
            }
            else{
                //operation failed, so get all errors
                for(Database.Error err : sr.getErrors()){
                    system.debug('The following error has occurred.');
                    system.debug(err.getStatusCode() + ': '+ err.getMessage());
                    system.debug('Contact fields that affected this error: ' + err.getFields());
                }
            }
        }
                
                
    }
    
    public static void tryAndCatchDemo(){
        List<Account> accList = new List<Account>();
        accList = [select id, Name from Account where Name like 'Upsert %'];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Industry = 'Energy';
            } 
        }
        try{
            for(integer i=11; i<21; i++){
                Account acc = new Account();
                //acc.Name = 'Upsert  ' + i;
                acc.Active__c = 'Yes';
                accList.add(acc);
            }
        }
            catch(DMLException e){
                system.debug(e);
            }
        
    }
    
    public static void undeleteDemo(){
        List<Account> accList = new List<account>();
        accList = [select id, Name from Account where Name like 'Upsert %' ALL ROWS];
        
        if(!accList.isEmpty()){
            undelete accList;
        }
    }
    
    public static void deleteDemo(){
        List<Account> accList = new List<Account>();
        accList = [select id, Name from Account where Name like 'Upsert %'];
        
        if(!accList.isEmpty()){
            delete accList;
        }
        
    }
    
    public static void upsertDemo(){
        List<Account> accList = new List<Account>();
        accList = [select id, Name, Industry from Account where Rating = 'Hot'];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Industry = 'Energy';
            } 
        }
        
        for(integer i=0; i<10; i++){
            Account acc = new Account();
            acc.Name = 'Upsert  ' + i;
            acc.Active__c = 'Yes';
            accList.add(acc);
        } 
        
        if(!accList.isEmpty()){
            upsert accList;
        }
    }
    
    
    public static void updateDemo(){
        List<Account> accList = new List<Account>();
        accList = [select id, Name, Industry from Account where Rating = 'Hot'];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Industry = 'Energy';
            }
            update accList;
        }
        
    }
    
    public static void insertDemo(){
        List<Account> accList = new List<Account>();
        
        for(integer i=0; i<150; i++){
            Account acc = new Account();
            acc.Name = 'Testing  ' + i;
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        
        insert accList;
        
      /*  Account acc1 = new Account();
        acc1.Name = 'test 106';
        acc1.Active__c = 'Yes';
        accList.add(acc1);
        
        insert accList;
        
        List<Contact> conList = new List<Contact>();
        Contact con = new Contact();
        con.FirstName = acc.Name;
        con.LastName = acc.Name;
        con.AccountId = accList[0].id ; 
        conList.add(con);
        
        Contact con1 = new Contact();
        con1.FirstName = acc1.Name;
        con1.LastName = acc1.Name;
        con1.AccountId = accList[1].id;
        conList.add(con1);
        
        insert conList; */
        
    }
}
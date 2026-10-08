public class DatabaseOperations {
    public static void createAccountRecords(){
        Account acc1 = new Account(Name = 'First Account', AnnualRevenue = 60000);
        Account acc2 = new Account(AnnualRevenue = 70000);
        List<Account> accList = new List<Account>{acc1, acc2};
            Database.insert(accList,false);
    }
    
    public static void createTaskAndLinkWithAccount(string accountName){
        List<Account> accToLink = [select id from Account where name =: accountName limit 1];
        Task t = new Task();
        t.Subject = 'Follow Up';
        t.Status = 'Not started';
        t.Priority = 'Normal';
        if(accToLink.size()==1){
            t.WhatId = accToLink[0].id ; 
        }
        
        Database.insert(t,false);
    }
    
    public static void createTaskForServiceRep(string serviceRepName){
        List<Contact> serviceRep = [select id from Contact
                                    where name=:serviceRepName
                                    limit 1];
        
        task t = new task();
        t.Subject = 'Visit Premise';
        t.Status = 'Not Started';
        t.Priority = 'High';
        if(serviceRep.size() ==1 ){
            t.WhoId = serviceRep[0].id;
        }
        
        
        Database.insert(t,false);
    }
    
    public static void updateCaseAsClosed(string caseStatus){
        List<Case> cases = [select id from case 
                            where status=: caseStatus];
        if(cases.size()!=0){
            for(case c : cases){
                c.status = 'Closed';
            }
            
            Database.update(cases);
            
        }else{
            system.debug('No cases found having this status.');
        }
    }
    
    public static void upsertAccountRecords(){
        
        list<Account> accToUpsert= new list<Account>();
        list<Account> accRecords = [select id, AccountNumber from account];
        for(Account acc :accRecords){
            if(acc.AccountNumber !=null){
                acc.Rating = 'Hot';
                accToUpsert.add(acc);
            }  
        }
        for(integer i=0; i<3; i++){
            Account a = new Account();
            a.Name = 'Test'+i;
            a.Industry = 'Cold';
            a.Active__c = 'Yes';
            accToUpsert.add(a);
        }
        
        
        list<id> successful = new list<id>();
        List<string> errorResponseList = new list<string>();
        
        list<Database.UpsertResult> resultArray = Database.upsert(accToUpsert, false);
        for(Database.UpsertResult saveRes : resultArray){
            if(saveRes.isSuccess()){
                successful.add(saveRes.getid());
            }
            else{
                for(Database.Error errorResponse : saveRes.getErrors()){
                    errorResponseList.add(errorResponse.getFields() + ' - ' + errorResponse.getMessage());
                }
            }
        }
        
        system.debug('Successfully inserted : ' +successful );
         system.debug('Successfully failed : ' +errorResponseList );
        
    }
    
    public static void handleOppDeletion(string stageName){
        List<Opportunity> oppList = [select id from opportunity
                                     where Stagename=: stageName];
        if(!oppList.isEmpty()){
            Database.delete(oppList,false);
        }
        
    }
    
    public static void recoverLostOpoo(){
        List<Opportunity> oppList = [select id, stagename, isdeleted from opportunity where isdeleted = true and lastmodifieddate = today all rows];
        //system.debug(opplist);
        if(!oppList.isEmpty()){
            Database.undelete(oppList,false);
        }
    }
    
    
    
}
public class AccountTriggerHandler {

    public static void preventDuplicateAccountCreation(List<Account> accToBeChecked){ 

			Set<String> incomingNames = new Set<string>();
            
            //list of new incoming accounts names
            for(Account a : accToBeChecked){
                if(a.Name != null){
                   incomingNames.add(a.Name.trim().toLowerCase()); 
                }
            }
            
            //check if the name already exists in the DB
            Map<string, Id> existingAccounts = new Map<String, Id>();
            for(Account acc: [Select id, Name From Account where Name IN : incomingNames] ){
                if(acc.Name !=null){
                   existingAccounts.put(acc.Name.trim().toLowerCase(), acc.Id);
                }
            }
            
            //compare both, if duplicate found, throw error
            for(Account acc: accToBeChecked){
                if(existingAccounts.containsKey(acc.Name)){
                if(acc.id ==null || acc.id != existingAccounts.get(acc.Name)){
                    //Account existing = existingAccounts.get(acc.Name.trim().toLowerCase());
                    
                        acc.addError('Erorrrrrr');
                    
                }
            } 
    }
    
    }    
    
    public static void createConAndUpdateAcc(List<Account> accToUpdate){
        for(Account acc : accToUpdate){
            if(acc.Type == 'Customer'){
                
            } 
        }   
    }
    
    public static void preventDeletionOfAccount(List<Account> accToDelete){
        set<Id> accIds = new Set<Id>();
        for(Account acc: accToDelete){
            accIds.add(acc.Id);
        }
        
        Set<Id> oppIds = new set<id>();
        for(Opportunity opp : [select accountId from Opportunity where AccountId=:accIds]){
            oppIds.add(opp.AccountId);
        }
        
        for(Account acc : accToDelete){
            if(oppIds.contains(acc.id)){
                acc.addError('Account cannot be deleted as it has a related opportunity');
            }
        }
        
    }
    
    public static void afterInsertActivities(List<Account> accRecords){
        List<Contact> conList = new List<Contact>();
        for(Account acc : accRecords){
            if(acc.Create_N_Contacts__c != null){
                for(integer i=0; i < acc.Create_N_Contacts__c; i++){
                    Contact con = new Contact();
                    con.LastName = acc.Name;
                    con.AccountId = acc.Id;
                    conList.add(con);
                }
                //mapOfAccWithContactSize.put(acc.id, acc.); 
            }
            
            if(!conList.isEmpty()){
                insert conList;
            }
            
        }
        
    }
    
    public static void afterUpdateActivities(List<Account> accRecords, Map<Id,Account> oldMapRecords){
        
        List<Contact> conList = new List<Contact>();
        for(Account acc : accRecords){
            
            if((oldMapRecords.get(acc.id).Create_N_Contacts__c != null && acc.Create_N_Contacts__c !=null) && (acc.Create_N_Contacts__c > oldMapRecords.get(acc.Id).Create_N_Contacts__c )){
                integer moreContactsToCreate = acc.Create_N_Contacts__c.intValue() - oldMapRecords.get(acc.id).Create_N_Contacts__c.intValue() ; 
                
                for(integer i=0; i< moreContactsToCreate ; i++){
                    Contact con = new Contact();
                    con.LastName = acc.Name;
                    con.AccountId = acc.Id;
                    conList.add(con);
                } 
            }
        }
        if(!conList.isEmpty()){
            insert conList;
        }
        
    }
    
    public static void updateWebsiteOnChild(List<Account> accList, Map<Id,Account> accOldMap){
        Map<Id,String> addAccToWebsiteMap = new Map<Id,String>();
        
        for(Account acc : accList){
            if(accOldMap.get(acc.Id).Website != acc.Website){
                addAccToWebsiteMap.put(acc.id, acc.Website);  
            }
        }  
        
        if(addAccToWebsiteMap.keySet().size() >0){
            List<Contact> addConToWebsite = new List<Contact>();
            List<Contact> conList = [SELECT Id, FirstName, Website__c, AccountId  FROM Contact WHERE AccountId IN :addAccToWebsiteMap.keyset()];
            for(Contact con : conList){
                con.Website__c = addAccToWebsiteMap.get(con.AccountId);
                addConToWebsite.add(con);
            }
            
            if(addConToWebsite.size() > 0){
                update addConToWebsite;
            }
        }
    }
    
    public static void restrictOwnership(List<Account> accList, Map<Id,Account> accOldMap){
        for(Account acc: accList){
            if((acc.Industry == 'Agriculture' && acc.Type == 'Prospect')){
                if((acc.Ownership == 'Private') && (accOldMap.get(acc.Id).ownership != acc.Ownership)){
                    acc.addError('Ownership cannot be set to Private. Kindly change it to something else');
                }
            }
        }
    }
    
    
    public static boolean handleAccount(List<Account> accList){
        if(Trigger.isExecuting){
            system.debug('Trigger is executing: ' + Trigger.isExecuting); 
        }else{
            system.debug('Without Trigger'); 
        }
        return Trigger.isExecuting;
        
    }
    
    public static void updateAccount(List<Account> accList, Map<Id, Account> accOldMap){
        List<Account> accToBeUpdated = new List<Account>();
        for(Account acc : accList){
            Account a = new Account();
            a.id = acc.Id ;
            a.Description = 'Test Recurrsion';
            accToBeUpdated.add(a);
        }
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        }
        
    }
    
    public static void preventDeletion(List<Account> accList){
        
        Profile p = [SELECT Id FROM Profile
                     WHERE Name = 'System Administration'];
        
        for(Account acc : accList){
            if(acc.Active__c == 'Yes' || UserInfo.getProfileId() != p.id){
                // acc.addError('Active accounts cannot be deleted');
                acc.addError(Label.Prevent_Account_Deletion);
            }
        }
    }
    
    public static void updateRelatedContact(List<Account> accList , Map<Id, Account> accOldMap){
        List<Contact> conList = new List<Contact>();
        Map<Id, Account> accMap = new Map<ID,Account>();
        
        
        for(Account acc : accList){
            if(acc.Phone != accOldMap.get(acc.Id).phone){
                accMap.put(acc.id, acc); // stores accounts where phone is updated. 
            }
        }
        
        for(Contact con : [select id, HomePhone, AccountId from Contact
                           where AccountId IN :accMap.keyset()]) {
                               if(accMap.containskey(con.accountid)){
                                   con.HomePhone = accMap.get(con.AccountId).phone;
                                   conList.add(con);
                               }
                           } 
        if(!conList.isEmpty()){
            update conList;
        }
    }
    
    public static void populateRating(List<Account> accList, Map<ID, Account> accMap){
        for(Account acc : accList){
            if((accMap == null && acc.Industry !=null && acc.Industry=='Media')
               || (acc.Industry != accMap.get(acc.Id).Industry) && acc.Industry=='Media'){
                   acc.Rating = 'Hot'; 
               } 
        }
    }
    
    public static void updatePhone(List<Account> accList, Map<Id,Account> accMap){
        for(Account acc: accList){
            if(acc.phone != accMap.get(acc.Id).phone){
                acc.Description = 'Phone is updated | old value = '
                    + accMap.get(acc.Id).phone + ' New Value = ' + acc.Phone;
            }
        }
    }
    
    public static void createOpp(List<Account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc: accList){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.CloseDate = system.today();
            opp.StageName ='Prospecting'; 
            opp.AccountId = acc.Id ; 
            opp.Amount = 110000;
            oppList.add(opp);
        }
        
        
        Database.SaveResult[] srList = Database.insert(oppList, false);
        // Iterate through each returned result
        for (integer i=0; i<srlist.size(); i++) {
            if (!srList[i].isSuccess()) {
                // Operation failed, so get all errors 
                String errors = '';               
                for(Database.Error err :srList[i].getErrors()) {
                    errors = errors + err.getMessage();
                }
                accList[i].addError(errors);
            }
        }
        
    }
    
    public static void updateDesc(List<Account> accList){
        for(Account acc: accList){
            acc.Description = 'Account is created';
        } 
    }
}
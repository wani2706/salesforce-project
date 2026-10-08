public class ContactTriggerHandler {
    
    public static void shareContactToGroup(List<Contact> newRecords){
        List<ContactShare> addRecordToList = new List<ContactShare>();
        Id conPublicInnov = [Select id,Name from Group where Name = 'Contact Innovators' Limit 1].id;
        for(Contact conRecord : newRecords){
             ContactShare cons = new ContactShare();
            cons.contactid = conRecord.id;
            cons.RowCause = 'Manual';
            cons.UserOrGroupId = conPublicInnov;
            addRecordToList.add(cons);
        }
        
        if(!addRecordToList.isempty()){
            insert addRecordToList;
        }

    }
    public static void checkEmailPhoneLastName(List<contact> newRecords){
       List<Contact> existingContacts = [SELECT Id, Email, Phone, LastName FROM Contact LIMIT 50000];
                          
        for(Contact con : newRecords){
           for(Contact existingCon : existingContacts){
                if(existingCon.Email == con.Email &&
                   existingCon.Phone == con.Phone &&
                  existingCon.LastName == con.LastName){
                    con.addError('Duplicate Contact found with same Email, Phone and Last Name');
                }
            }

           } 
        }

    
   
    public static void afterInsertActivities(List<Contact> conRecords){
        for(Contact con : conRecords){
            if(con.Create_N_Contacts__c != null){
                
            }
        }
        
    }
    
    public static void checkParent(List<Contact> conList){
        for(Contact con : conList){
            if(con.AccountId == null){
               //throw error
               con.addError('Parent Information is mandatory for contact creation');
            }
                
        }
    }
    
    public static void totalContactAccount(List<Contact> conList){
         set<ID> accIds = new set<Id>();
        List<Account> accList = new List<Account>();
        
        for(Contact con : conList){
            if(con.AccountId != null){
                accIds.add(con.AccountId);
            }
        }
        
        for(Account acc : [select Id, (select Id from Contacts) 
                           from Account where Id IN: accIds]){
            acc.total_Contact__c = acc.Contacts.size();
            accList.add(acc);                   
        }
        
        if(!accList.isEmpty()){
            update accList;
        }
    }
    
   
    
}
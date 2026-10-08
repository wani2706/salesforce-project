trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete) {
    
    if(Trigger.isAfter && Trigger.isInsert){
        AccountTriggerHandler.createConAndUpdateAcc(Trigger.New);
    }
    
    if(Trigger.isBefore && Trigger.isDelete){
        AccountTriggerHandler.preventDeletionOfAccount(Trigger.old);
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){

        List<id> accIds = new List<id>();
        for(Account acc: Trigger.New){
            Account oldAcc = Trigger.oldMap.get(acc.id);
            if(!acc.equals(oldAcc)){
                accIds.add(acc.id);
            }
        }

        if(!accIds.isEmpty()){
            EmailNotification.sendEmailNotification(accIds);
        }
            
        }

    if(Trigger.isAfter){
        if(Trigger.isInsert){
            AccountTriggerHandler.afterInsertActivities(Trigger.New);
        } else if (Trigger.isUpdate){
            AccountTriggerHandler.afterUpdateActivities(Trigger.New, Trigger.oldMap);
        } 
    }
        
        
        if(Trigger.isUpdate && Trigger.isAfter){
            AccountTriggerHandler.updateWebsiteOnChild(Trigger.New, Trigger.oldMap);
        }
        
        
        if(Trigger.isUpdate && Trigger.isBefore){
            AccountTriggerHandler.restrictOwnership(Trigger.New,Trigger.oldMap);
        }
        
        if(Trigger.isInsert){
            if(Trigger.isBefore){
                AccountTriggerHandler.updateDesc(Trigger.New);
                //AccountTriggerHandler.populateRating(Trigger.New, null);
            }
            else if(Trigger.isAfter){
                AccountTriggerHandler.createOpp(Trigger.New);
                boolean b = AccountTriggerHandler.handleAccount(Trigger.New);
            }
        }
        
        if(Trigger.isUpdate){
            if(Trigger.isBefore){
                // AccountTriggerHandler.updatePhone(Trigger.New, Trigger.oldMap);
                // AccountTriggerHandler.populateRating(Trigger.New, Trigger.oldMap); 
            } else if(Trigger.isAfter){
                // AccountTriggerHandler.updateRelatedContact(Trigger.New, Trigger.oldMap);
                if(!preventRecursion.firstCall){
                    preventRecursion.firstCall = true; 
                    AccountTriggerHandler.updateAccount(Trigger.New, Trigger.oldMap);
                }
            }
        }
        
        if(Trigger.isUpdate){
            if(Trigger.isBefore){
                // AccountTriggerHandler.preventDeletion(Trigger.old);
            }
        }
    
		
    if(Trigger.isBefore){
        if(Trigger.isUpdate || Trigger.isInsert){
            AccountTriggerHandler.preventDuplicateAccountCreation(Trigger.new);
        }
    }

    
        
    }
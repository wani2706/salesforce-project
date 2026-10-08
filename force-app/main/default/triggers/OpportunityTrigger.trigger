trigger OpportunityTrigger on Opportunity (before insert,before update, after update) {
  
    if(Trigger.isAfter&& Trigger.isUpdate){
       // OpportunityTriggerHandler.afterUpdateActivity(Trigger.New);
    }
        
    


    if(Trigger.isInsert){
        if(Trigger.isBefore){
            //OpportunityTriggerHandler.showError(Trigger.New);
        }
    }
    
    if(Trigger.isUpdate){
        if(Trigger.isAfter){
            OpportunityTriggerHandler.updateDescription(Trigger.New, Trigger.oldMap);
            OpportunityTriggerHandler.removeTeamMembers(Trigger.New);
        }
    }
}
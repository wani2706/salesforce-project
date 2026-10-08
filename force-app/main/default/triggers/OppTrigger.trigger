trigger OppTrigger on Opportunity (before update, after update, after delete) {
    if(Trigger.isUpdate && Trigger.isBefore){
        OppTriggerHandler.updateOppAmt(Trigger.New, Trigger.oldMap);
    }
    
    
    if(Trigger.isUpdate && Trigger.isAfter){
        OppTriggerHandler.handleActivitiesAfterUpdate(Trigger.New);
       }
    
    if(Trigger.isDelete && Trigger.isAfter){
        OppTriggerHandler.afterDeleteActivity(Trigger.old);
    }
}
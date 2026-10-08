trigger ContactTrigger on Contact (before insert, after insert) {
    
    
    
    if(Trigger.isInsert){
        if(Trigger.isBefore){
        ContactTriggerHandler.checkParent(Trigger.New);
        ContactTriggerHandler.checkEmailPhoneLastName(Trigger.New);
    }   
}
    
    if(Trigger.isInsert){
        if(Trigger.isAfter){
        ContactTriggerHandler.afterInsertActivities(Trigger.New);
        ContactTriggerHandler.shareContactToGroup(Trigger.New);    
    }
}


}
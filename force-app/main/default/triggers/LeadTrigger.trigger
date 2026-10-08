trigger LeadTrigger on Lead (before update, after insert, before delete) {
    
    if(Trigger.isUpdate && Trigger.isAfter){
        LeadTriggerHandler.convertLeadAutomatically(Trigger.New, Trigger.oldMap);
    }
    
    if(Trigger.isDelete && Trigger.isBefore){
        LeadTriggerHandler.beforeDeleteActivity(Trigger.old);
    }

//when a lead is updated, set the lead status to Working-contacted

    if(Trigger.isUpdate && Trigger.isBefore){
        for(Lead l : trigger.New){
            l.Status = 'Working-Contacted';
            if(l.Industry == 'HealthCare'){
                l.LeadSource = 'Purchased List';
                l.SICCode__c = '1100';
                l.Primary__c = 'Yes';
            }
        }
    }
    
    if(Trigger.isInsert && Trigger.isAfter){
        LeadTriggerHandler.afterLeadCreation(Trigger.New);
        
    }
 
    
    
    
}
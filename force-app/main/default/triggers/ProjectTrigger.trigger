trigger ProjectTrigger on Project__c (before insert) {
	if(Trigger.isbefore && Trigger.isInsert){
        List<Project__c> newProjects = Trigger.New;
        system.enqueueJob(new ProjectTriggerQueueableHandler(newProjects));
    }
}
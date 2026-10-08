trigger CaseTrigger on Case (after update) {
	
    if(Trigger.isAfter && Trigger.isUpdate){
        CaseTriggerAsyncQueueableHandler.createTask(Trigger.New);
    }
   
}
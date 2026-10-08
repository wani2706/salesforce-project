trigger TaskTrigger on Task (after update, before insert) {
    
    if(trigger.isafter && trigger.isupdate)
    {
        AsyncFutureCase.handleTaskCheckbox(Trigger.new);
    }

    if(Trigger.isbefore && Trigger.isInsert){
        TaskTriggerHandler.beforeInsertTask(Trigger.New);
    }


}
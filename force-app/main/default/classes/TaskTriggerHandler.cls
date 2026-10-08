public with sharing class TaskTriggerHandler {

    public static void beforeInsertTask(List<Task> taskRecords){

        for(Task newTask : taskRecords){
            if(newTask.ActivityDate <= system.Today()){
                newTask.ActivityDate = system.Today()+12;
            }
        }
    }

}
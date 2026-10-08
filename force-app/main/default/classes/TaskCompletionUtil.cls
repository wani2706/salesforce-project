public class TaskCompletionUtil {

    @InvocableMethod(label='Close Tasks per Account Util')
    public static List<String> closedTasksForAccount(List<Id> accountIds){


        system.debug('Account Ids: ' + accountIds);
    List<string> returnString = new List<string>();
     try{
        List<Task> taskList = [SELECT Id, Status FROM Task WHERE WhatId IN: accountIds];
        system.debug('Query Rows returned: ' + taskList);
     for(Task eachTask : taskList){
        eachTask.Status = 'Completed';
     }

     update taskList;
     return new List<string>{'Success'};
    }
    catch(Exception e){
       return new List<string>{'Error: ' + e.getMessage()};
    }
     }   
     
}
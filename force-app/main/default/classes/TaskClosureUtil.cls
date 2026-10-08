public class TaskClosureUtil {

@InvocableMethod(label='Close Tasks per Account Util')
public static List<string> closeTasksforAccount(List<Id> accountIds){

    List<string> returnString = new List<String>();
    try{
        List<Task> tasksList  = [select id, status from Task where WhatId IN : accountIds];
    for(Task eachTask : tasksList){
        eachTask.Status = 'Completed';
    }

    update tasksList;
    return new List<string>{'Success'};
    }
    catch(Exception e){
        return new List<string>{'Failure'};
    }
}
}
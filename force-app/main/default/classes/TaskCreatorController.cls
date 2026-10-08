public class TaskCreatorController {

    @AuraEnabled
    public static string createTaskRecord(String subject, string description, date duedate){

        try{
            List<Task> taskList = new List<Task>();
            Task t = new Task(
            Subject = subject,
            Status = 'New',
            Priority = 'High',
            ActivityDate = duedate,
            Description = description
        );
            taskList.add(t);

        if(!taskList.isEmpty()){
            Database.insert(taskList,false);
        }
        return 'Success';
        }
        catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
        
    }
}
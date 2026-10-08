public class AsyncQueueableCase implements Queueable {

   
    public static list<Case> cases = new List<Case>();
    
    public AsyncQueueableCase(List<Case> caseRecords){
        cases = caseRecords;
    }


    public static void execute(QueueableContext context){
        list<task> taskList = new List<Task>();
        for(Case cs : cases){
            Task t = new Task();
            t.subject = 'Follow up on Case: ';
            t.status = 'Not Started';
            t.priority = 'High';
            t.whatId = cs.Id;
            t.ownerId = cs.ownerId;
            t.activityDate = system.today()+30;
            taskList.add(t);
        }

        if(!taskList.isEmpty()){
            insert taskList;
        }
    }
}
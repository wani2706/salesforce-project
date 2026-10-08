public class CaseTriggerAsyncQueueableHandler {
    
    public static void createTask(List<Case> caseRecords){
        
        List<Case> caseList = new List<Case>();
        
        if(!caseRecords.isEmpty()){
            for(Case cases : caseRecords){
                if(cases.status == 'Escalating'){
                    caseList.add(cases);
                }
            }
            
            if(!caseList.isEmpty()){
               system.enqueueJob(new AsyncQueueableCase(caseList));
            }
           
        }
    }
}
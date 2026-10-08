public class OppTriggerHandler {
    
    public static void afterDeleteActivity(List<Opportunity> oldRecords){
        List<Task>  tlist = new List<Task>();
        for(Opportunity opp : oldRecords){
            Task t = new Task();
            t.Description = 'Please investigate why the opportunity is deleted';
            t.Priority = 'High';
            t.OwnerId = opp.OwnerId;
            t.Status = 'Not Started';
            t.Subject = 'Follow up'; 
            //t.WhatId = opp.Id;
            tlist.add(t);
        }
        
        if(!tlist.isEmpty()){
            insert tlist;
        }
    }
    
    public static void updateOppAmt(List<Opportunity> newRecords, Map<Id,Opportunity> oldMap){
        for(Opportunity newOpp: newRecords){
            if(oldMap.get(newOpp.Id).StageName != newOpp.StageName){
                newOpp.Amount = newOpp.Probability * newOpp.ExpectedRevenue; 
            }
        }
    }
    
    public static void handleActivitiesAfterUpdate(List<Opportunity> newRecords){
        List<Task> taskList = new List<Task>();
        for(Opportunity opp : newRecords){
            if(opp.StageName == 'Closed Won'){
                Task t = new Task();
                t.Priority = 'High';
                t.OwnerId = opp.OwnerId; 
                t.Description = 'Please split the revenue among teammates';
                t.Status = 'Not Started';
                t.Subject = 'Split Revenue';
                t.WhatId = opp.Id ; 
                taskList.add(t);
            } 
        }
        
        if(!taskList.isEmpty()){
            insert taskList;
        }
    } 
}
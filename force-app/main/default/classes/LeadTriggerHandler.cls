public class LeadTriggerHandler {
    
    public static void convertLeadAutomatically(List<Lead> newLeadRecords, Map<Id, Lead> oldMapRecords){
        List<Database.LeadConvert> leadsToUpdate= new List<Database.LeadConvert>();
        
        for(Lead leads : newLeadRecords){
            if(leads.Rating != oldMapRecords.get(leads.id).Rating && leads.Status != oldMapRecords.get(leads.id).Status){
                if(leads.Rating == 'Hot' && leads.Status =='Qualified'){
                    Database.LeadConvert lc = new Database.LeadConvert();
                    lc.setLeadId(leads.id);
                    lc.setDoNotCreateOpportunity(false);
                    lc.setConvertedStatus('Closed - Converted');
                    leadsToUpdate.add(lc);
                }
            }
        }
        
        if(!leadsToUpdate.isEmpty()){
            try{
                List<Database.LeadConvertResult> results = Database.convertLead(leadsToUpdate, false);
                for(Database.LeadConvertResult res : results){
                    if(!res.isSuccess()){
                        system.debug('Lead conversion failed: '+res.getErrors()[0].getMessage());
                    }                    
                }
            }
            catch(Exception e){
                System.debug('Exception during lead conversion: ' + e.getMessage());
            }
        }
    }
    
    public static void beforeDeleteActivity(List<Lead> newLeads){
        
        for(Lead l : newLeads){
            system.debug('found  a lead');
            if(l.Status == 'Working-Contacted'){
                l.addError('Cannot delete as the status is Working-contacted');
            }
        }
    }
    
    
    public static void afterLeadCreation(List<Lead> leadRecords){
        
        List<Task> taskList = new List<Task>();
        for(Lead l : leadRecords){
            Task t = new Task();
                t.Priority = 'High';
                t.OwnerId = l.OwnerId; 
                t.Description = 'Please split the revenue among teammates';
                t.Status = 'Not Started';
                t.Subject = 'Split Revenue';
                t.WhoId = l.Id ; 
                taskList.add(t);
        }
        
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }
    
    
    
}
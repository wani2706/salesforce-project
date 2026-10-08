public class OppProcessor implements Database.Batchable<sObject>, Database.stateful {
    
    public integer recordCount=0;

    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT ID, LeadSource FROM Opportunity]);
    }

    public void execute(Database.BatchableContext bc, List<Opportunity> opps){
        if(!opps.isempty()){
            for(Opportunity opp : opps){
                opp.LeadSource = 'Web';
            }
            update opps;
            recordCount = recordCount + opps.size();
        }
    }

    public void finish(Database.BatchableContext bc){
        system.debug('Total records processed: ' + recordCount); 
    }
    
    
}
public class InactiveContactsCleanup implements Database.Batchable<sObject>, Database.stateful {

    public integer recordCount=0;

    public Database.QueryLocator start(Database.BatchableContext bc){
        Date twoYearsAgo = System.today().addYears(-2);
        list<Id> deadContactIds = new List<Id>();

        for(Task t : [select WhoId from task where ActivityDate <= :twoYearsAgo AND whoid !=null]){
            if(t.whoid !=null){
                deadContactIds.add(t.whoid);
            }
        }

        for(Event e : [select whoid from event where ActivityDate <= :twoYearsAgo AND whoid !=null]){
            if(e.whoid !=null){
                deadContactIds.add(e.whoid);
            }
        }

        for(Case c : [select contactId from case where createdDate <= :twoYearsAgo AND ContactId !=null]){
            if(c.ContactId !=null){
                deadContactIds.add(c.ContactId);
            }
        }

        return Database.getQueryLocator([SELECT Id, Name, Inactive__C FROM Contact
                                            WHERE Id In: deadContactIds AND (Inactive__C = false OR Inactive__C = null)]);
    }

    public void execute(Database.BatchableContext bc, List<Contact> conList){
        List<Contact> recordsToBeUpdated = new List<Contact>();
        if(!conList.isempty()){
            for(Contact con : conList){
                con.Inactive__C = true;
                recordsToBeUpdated.add(con);
            }
            if(!recordsToBeUpdated.isEmpty()){
                update recordsToBeUpdated;
                recordCount = recordCount + recordsToBeUpdated.size();
            }
        }
    }

    public void finish(Database.BatchableContext bc){
        system.debug('Total records processed: ' + recordCount);

        //send email summary
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.settoAddresses(new string[]{'shiwaniwasu2706@gmail.com'});
        mail.setsubject('Inactive Contacts Cleanup Summary');
        mail.setplainTextBody('Total Inactive Contacts marked: ' + recordCount);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
    
}
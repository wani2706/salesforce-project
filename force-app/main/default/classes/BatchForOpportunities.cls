public class BatchForOpportunities implements Database.Batchable<sObject>, Database.Stateful, Database.AllowsCallouts{
    
    public integer count =0;

    //create start, execute and finish methods
    public Database.QueryLocator start(Database.BatchableContext context){

         system.debug('Batch process started');

        //string query = 'select id, name from opportunity where stagename = \'Needs Analysis\' && closeddate > LAST_N_DAYS:7';
        string baseQuery = 'select Id, Name, AccountId, Account.OwnerId from opportunity ';
        string filterQuery = 'where stagename = \'Needs Analysis\' AND closedate < LAST_N_DAYS:7';
        string finalQuery = baseQuery + filterQuery;
        return Database.getQueryLocator(finalQuery);
    }

    public void execute(Database.BatchableContext context, List<Opportunity> scope){

        List<Task> taskToInsert = new List<Task>();
        count++;
        //system.debug(opp.Name);

        for(Opportunity opp : scope){
           if(opp.AccountId != null && opp.Account.OwnerId !=null){
                Task t = new Task(
                    WhatId = opp.AccountId,
                    OwnerId = opp.Account.OwnerId,
                    Subject = 'Congratualte on opportunity closure',
                    Status = 'Not Started',
                    Priority = 'Normal'
                );

            taskToInsert.add(t);

            }
        }

        if(!taskToInsert.isEmpty()){
            insert taskToInsert;
            system.debug('Tasks inserted: ' + taskToInsert.size()) ;
        }
    }

    public void finish(Database.BatchableContext context){
        system.debug('Batch process finished');
    }


}
public class OpportunityTriggerHandler {

    public static void afterUpdateActivity(List<Opportunity> oppRecords, Map<Id,Opportunity> oldMapRecords){

        List<Opportunity> oppList = new List<Opportunity>();
        for(Opportunity opp : oppRecords){
            if(opp.stageName != oldMapRecords.get(opp.id).stageName && opp.stageName == 'Closed Won'){
                oppList.add(opp);
            }
        }
        if(!oppList.isEmpty()){
           // insert oppList;
            System.enqueueJob(new ClosedWonOppFollowup(oppList));
        }
    }


public static void removeTeamMembers(List<Opportunity> newRecords){
    List<id> listOppId = new List<Id>();
    List<OpportunityTeamMember> deleteMemberList = new List<OpportunityTeamMember>();
    for(Opportunity opp : newRecords){
        listOppId.add(opp.id);
    }
    List<OpportunityTeamMember> teamMembersToRemove = [select id, OpportunityId from OpportunityTeamMember where OpportunityId in :listOppId];
    for(Opportunity opp : newRecords){
        if(opp.stageName == 'Closed Lost'){
            for(OpportunityTeamMember teamMember : teamMembersToRemove){
                if(teamMember.OpportunityId == opp.id){
                    deleteMemberList.add(teamMember);   
                }
            }
        }
    }

    if(!deleteMemberList.isEmpty()){
        delete deleteMemberList;
    }
} 



public static void showError(List<Opportunity> oppList){
    for(Opportunity opp : oppList){
        if(opp.Amount == null){
            opp.addError('Please populate Amount on opportunity');
        }
    }
}

public static void updateDescription(List<Opportunity> oppList, Map<Id, opportunity> oppOldMap){
    List<Opportunity> oppListNew = new List<Opportunity>();
    
    for(Opportunity opp : oppList){
        Opportunity o = new Opportunity();
        o.id = opp.id;
        if(opp.StageName != oppOldMap.get(opp.id).stageName){
            if(opp.StageName == 'Closed Won'){ 
                o.Description = ' Opportuity is Closed Won';
            }else if(opp.StageName == 'Closed Lost'){
                o.Description = 'Opportunity is Closed Lost';
            }  
            oppListNew.add(o);
        }  
    }
    if(!oppListNew.isEmpty()){
        update oppListNew;
    }
    
}
}
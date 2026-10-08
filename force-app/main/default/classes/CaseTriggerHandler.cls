public class CaseTriggerHandler {
    public static void beforeDeleteActivity(List<Case> oldRecords){
        Id currentUserId = UserInfo.getProfileId();
        Id sysAdminProfileId = [select id, Name from Profile where Name = 'System Administrator' LIMIT 1].id;
        for(Case caseRecord: oldRecords){
            if(currentUserId != sysAdminProfileId){
            caseRecord.addError('You dont have enough rights!');
        }
        }
        
    }
}
public class LoopDemo {
    
    public static void showSet(){
        List<Account> accList = new List<Account>();
        Set<Id> accset = new Set<Id>();
        Map<Id, Account> accmap = new Map<Id, Account>();
        
        accList = [select id, Name from Account limit 5];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                system.debug(acc.id + ' - ' + acc.Name);
                accset.add(acc.id);
                accmap.put(acc.Id, acc);  
            }
            if(!accmap.isEmpty()){
                for(Id accId : accmap.keySet()){  
                    system.debug(accId);
                }
            }
        }        
        
    }     
    public static void showList(){
        List<Account> accList = new List<Account>();
        accList = [select id, Name from account limit 5];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                system.debug(acc.id + ' - ' + acc.Name);
            }
        }
    }
}
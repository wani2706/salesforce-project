public class ApexScenariosDemo {
    
    public static void scenario5(){
        List<Contact> conList = new List<Contact>();
        conList = [select id, MobilePhone, Account.Phone
                   from Contact];
        
        if(!conList.isEmpty()){
            for(Contact con : conList){
                if(con.MobilePhone == null && con.Account.Phone!= null){
                    con.MobilePhone = con.Account.Phone;
                }
            }
        }
        update conList;
    }
    
    public static void scenario4(){
        List<Account> accList = new List<Account>();
        accList = [select id, CreatedDate, Total_Contact__c, (select id from Contacts) 
                   from Account where CreatedDate = This_Year];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Total_Contact__c = acc.Contacts.size();
            }
        }
        update accList;
    }
    
    public static void scenario3(){
        List<Opportunity> oppList = new List<Opportunity>();
        oppList = [select id, StageName 
                   from Opportunity where CreatedDate = THIS_YEAR];
        if(!oppList.isEmpty()){
            for(Opportunity opp : oppList){
                if(opp.StageName == 'Closed Won'){
                    opp.Description = 'Opportunity is Closed Won';
                }
                else if(opp.StageName == 'Closed Lost'){
                    opp.Description = 'Opportunity is Closed Lost';
                }
                else{
                    opp.Description = 'Opportunity is Open';
                }
            }
        }
        update oppList;  
    }
    
    public static void scenario2(){
        List<Account> accList = new List<Account>();
        accList = [select id, Name, (select id, Amount from Opportunities)
                   from Account where Phone != null];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                Decimal total =0;
                for(Opportunity opp : acc.Opportunities){
                    if(opp.Amount!= null){
                        total = opp.Amount + total;
                    }
                }
                system.debug(acc.Name + ' has ' +total+' worth Opportunities');
            }
        }
        
    }
    
    public static void scenario1(){
        List<Account> accList = new List<Account>();
        accList = [select id, Name, (select id from Contacts)
                   from Account where phone != null];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                system.debug(acc.Name + ' has ' + acc.Contacts.size()+' Contacts related');
            }
        }
    }
}
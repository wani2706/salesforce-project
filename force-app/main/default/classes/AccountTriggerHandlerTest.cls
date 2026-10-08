@isTest
public class AccountTriggerHandlerTest {
	
    @isTest
    public static void avoidDeletion(){
        Account accRec = new Account(Name = 'Delete Account',Active__c = 'Yes');
        insert accRec;
        
        Opportunity opp = new Opportunity(Name='TestOpp', StageName='Prospecting',CloseDate=Date.today().addDays(30), AccountId=accRec.Id );
        insert opp;
        
        Test.startTest();
        try{
            delete accRec;
            
        }
        catch(Exception e){
            system.assert(e.getMessage().contains('Account cannot be deleted'), 'Account cannot be deleted');
        }
    }
    
    
    @isTest
    public static void createOppTest(){
        List<Account> accList = new List<Account>();
        
        for(integer i=0; i<10; i++){
            Account acc = new Account();
            acc.Name = 'Test ' +i;
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        
        Test.startTest();
        Database.insert(accList, true);
        Test.stopTest();
        
        List<Opportunity> oppList = [SELECT Id FROM Opportunity
                                     WHERE AccountId=: accList[0].id];
        system.assert(oppList!=null, 'Opportunity is not created');
        
    }
    
}
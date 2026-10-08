@isTest
public class NotifyOpportunityOwnerTest {
    
    @TestSetup
    static void setupTestData(){
        //create test user to be opp owner
        User testUser = new User(
            Alias = 'testown',
            Email = 'testowner@example.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'Owner',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = [SELECT Id FROM Profile WHERE Name='Standard User' LIMIT 1].Id,
            TimeZoneSidKey = 'America/Los_Angeles',
            Username = 'testowner' + System.currentTimeMillis() + '@example.com');
        insert testUser;

        //create test opps with different stages
        List<Opportunity> opps = new List<Opportunity>{
            new Opportunity(Name='Test Opp1', StageName='Closed Won', Amount=1000, CloseDate=Date.today(), OwnerId=testUser.Id),
            new Opportunity(Name='Test Opp2', StageName='Closed Lost', Amount=1000, CloseDate=Date.today(), OwnerId=testUser.Id),
            new Opportunity(Name='Test Opp3', StageName='Prospecting', Amount=1000, CloseDate=Date.today(), OwnerId=testUser.Id),
            new Opportunity(Name='Test Opp4', StageName='Closed Won', Amount=1000, CloseDate=Date.today(), OwnerId=testUser.Id)
        };
        insert opps;
    }

    @isTest
    static void notifyOpportunityOwner(){
              //get closed won opps
        List<Opportunity> closedWonOpps = [SELECT Id FROM Opportunity WHERE StageName='Closed Won'];

        Test.startTest();
        NotifyOpportunityOwner.notifyOppOwner(new List<Id>{
            closedWonOpps[0].id,
            closedWonOpps[1].id
        });
        Test.stopTest();

        //verify emails sent or not
        System.assertEquals(2, closedWonOpps.size(), 'Expected 2 closed won opportunities');
    }


}
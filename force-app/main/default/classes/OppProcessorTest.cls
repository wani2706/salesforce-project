@isTest
public class OppProcessorTest {

    @isTest
    static void testBatchClass(){
        List<Opportunity> opps = new List<Opportunity>();
        for(integer i=0; i<500; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opp' + i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today().addDays(30);
            opp.Amount = 1000+i;
            opps.add(opp);
        }

        Test.startTest();
        insert opps;

        OppProcessor batch = new OppProcessor();
        Database.executeBatch(batch, 500);
        Test.stopTest();

        //verify the reults
        List<Opportunity> updatedOpp = [SELECT Id FROM Opportunity
                                         WHERE LeadSource = 'Web'];

        System.assertEquals(500, updatedOpp.size(), 'Logic is not correct' );                                
    }
}
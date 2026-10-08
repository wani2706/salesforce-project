public class AccountRecord {
    
    public static void insertAccountWithOppAndCon(string name, string rating, string active){
        Account acc = new Account();
        acc.Name = name;
        acc.Rating = rating;
        acc.Active__c = active;
        insert acc;  //inserts acc into obj Account
        
       
        Contact con = new Contact(FirstName = 'Sangita', LastName = 'Hude');
        con.AccountId = acc.Id;
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Opp1';
        opp.CloseDate = system.today();
        opp.StageName = 'Prospecting';
        opp.AccountId = acc.Id;
        insert opp; 
        
    }
    
}
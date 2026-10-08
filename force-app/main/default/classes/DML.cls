public class DML {
 public static void myMethod(){
	Account a = new Account(Name='My New Account' , NumberOfEmployees=3000);
    insert a;
    
    //assosciated contacts
    Contact c = new Contact(firstName='Max', lastName='Brown', accountId=a.Id);
    Contact c1 = new Contact(firstName='Jeff', lastName='Brown', accountId=a.Id);
    List<Contact> con = new List<Contact>();
    con.add(c);
    con.add(c1);
    insert con;
    
    //assosciated Opporutnities
    Date d = Date.today() +20;
    Opportunity o = new Opportunity(Name='Sell Tyres', StageName='Prospecting', CloseDate= d, accountId=a.Id);
    Opportunity o1 = new Opportunity(Name='Sell Papers', StageName='Prospecting', CloseDate= d, accountId=a.Id);
	List<Opportunity> opp = new List<Opportunity>();
    opp.add(o);
    opp.add(o1);
    insert opp;
        
    }  
}
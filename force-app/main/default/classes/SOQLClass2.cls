public class SOQLClass2 {
    public static void myMethod(String s){
        
       // List<Contact> cont = [SELECT firstName, lastName, email FROM Contact where firstName='John'];
       // 
        List<Contact> cont = [SELECT firstName, lastName, email FROM Contact where firstName= :s];
        
        AggregateResult ar1 = [SELECT sum(Amount)from Opportunity];
        
        AggregateResult ar2 = [Select Max(Amount) from opportunity];
        
        Integer a = [select Count() from opportunity];
        
      //  Integer a1 = [select Count(Amount) from opportunity];
        
       // Integer a2 = [select Count_distinct(Amount) from opportunity];
        
      //  Integer i1 = a2.get('expr0');

        List<opportunity> l1 = [Select Name, Amount from Opportunity order by amount];
        
        //List<opportunity> l2 = [Select StageName from Opportunity group by Stagename];
        
        List<Account> l3 = [Select Name from Account Limit 10];
        
    }
}
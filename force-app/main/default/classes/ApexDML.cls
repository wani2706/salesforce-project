public class ApexDML {
    public static void myMethod(){
     List<Account> acc =  [select Name, NumberofEmployees, Type from Account where type='Customer - Direct'];
         for(Account a : acc){
             a.NumberofEmployees = 1400;
             //update a;  never use DML inside loop
         }
        update acc;
   }
}
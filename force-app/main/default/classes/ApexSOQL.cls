public class ApexSOQL {
    public static void myMethod(){
        List<Account> myAccounts = [SELECT Name, Industry FROM Account WHERE Industry !=null order by Name DESC];
        for(Account a : myAccounts){
            system.debug(a);
        }
    }
}
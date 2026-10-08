public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList = [select Name, AnnualRevenue from Account];
        for(Account a : accountsList){
          String acctRev = 'Account Name: ' + a.name + ', Annual Revenue: '+ a.annualRevenue;
            system.debug(acctRev);
        }
    }
}
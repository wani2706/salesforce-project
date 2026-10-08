public class ApexSOQLClass1 {
    public static void soql(){
        List<Account> acc =  [Select Name, NumberOfEmployees FROM Account];
        for(integer i=0; i<acc.size(); i++){
            system.debug(acc[i].numberOfEmployees);  // system.debug(acc[i]);
        }
        
        for(Account a : acc){
            system.debug('Account name =' +a.name + 'Number of Employees = '+ a.numberOfEmployees);
        }
    }
}
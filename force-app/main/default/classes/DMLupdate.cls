public class DMLupdate {
    public static void myMethod(){
        List<Opportunity> opp = [select Name, Amount, CloseDate from Opportunity where CreatedDate= LAST_90_days];
        Date d = System.today() + 90;
        for(Opportunity opp1 :opp){
            opp1.closeDate = d;
        }
        update opp;
    }
}
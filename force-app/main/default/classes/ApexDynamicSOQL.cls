public class ApexDynamicSOQL {
    public static void myMethod(){
        Boolean isOpen=true;
        String criteria ='';
        if(isOpen){
            criteria = 'closedDate>today';
        }
        else{
            criteria = 'closedDate<today';
        }
        
       List<Case> myCases =  Database.query('select status, closedDate from Case where ' + criteria);
        system.debug(myCases);
    }
}
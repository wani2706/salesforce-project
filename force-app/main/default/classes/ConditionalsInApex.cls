public class ConditionalsInApex {
    
    public static void handleCollections(){
        
        List<String> mfFavBooks = new List<String>{'The monk who sold his ferrari', 'Ekank', 'Ikigai'};
        set<String> myCurrencies = new Set<String>{'INR','CAD','USD','INR'};
            Map<String, String> employeeDetails = new Map<String, String>();
            employeeDetails.put('101', 'Ross Geler');   
        	employeeDetails.put('102', 'Monica Geler'); 
        system.debug(employeeDetails);
        employeeDetails.remove('102');
        system.debug(employeeDetails);
         employeeDetails.put('101', 'Joey Tribbiani');   
        system.debug(employeeDetails);
        
        system.debug('Keys are: ' + employeeDetails.keyset());
        system.debug('Values are: ' + employeeDetails.values());
                
         system.debug(mycurrencies);      
        
    }
    public static void handleCustomerInteractions(String typeOfCustomer, decimal purchaseAmount, boolean isNewCustomer) {
       if(purchaseAmount > 0 ){
            System.debug('Congratulations, your purchase is successful.');
       }
        
        if(typeOfCustomer == 'Premium'){
           system.debug('Thanks for the purchase, here\'s a coupon of 45%'); 
        } 
    }
    
    public static void handleSchedule(integer timeInHours){
        switch on timeInHours{
            when 9{
                system.debug('Breakfast');
            }
            when 13{
                system.debug('study');
            }
            when else{
                system.debug('free time');
            }
        }
    }
}
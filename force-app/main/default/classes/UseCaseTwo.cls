public class UseCaseTwo {
    public static decimal calculateInterest(decimal principal, decimal interestRate, decimal years){
        
        if(principal!= null && interestRate!=null && years!=null){
            
            decimal interest = (principal * interestRate * years) / 100; 
            
            return interest;
        }
        return 0;
    }
}
public class ConditionalStatementDemo {
    
    public static void nullCheckdemo(){
        List<Account> acc = new List<Account>();
        acc = [select id from Account limit 5];
        
        if(!acc.isEmpty()){
            system.debug('list contains : ' + acc); 
        }
    }
    
    public static void elseIfLadderDemo(integer num){
        if(num > 0){
            system.debug('Positive');
        }
        else if(num< 0){
            system.debug('Negative');
        }
        else{
            system.debug('Zero');
        }
    }
    
    public static void max(integer num1, integer num2){
        //integer num1 = 20, num2 = 40;
        integer result; 
        result = num1 > num2 ? num1 : num2;
        system.debug('max is: ' + result);
        
        
        /*  if(num1>num2){
system.debug('1 > 2');
}
else{
system.debug('2 > 1');
}
*/
    } 
    
    public static void checkEligibility(integer age){
        if(age>=18){
            system.debug('You are eligible to vote');
        }
        else{
            system.debug('You are not eligible to vote');
        }
    }
    
    public static void checkEvenOdd(integer num){
        if((Math.mod(num,2)) == 0){
            system.debug('Even');
        }
        else{
            system.debug('Odd');
        }
        
    }
    
}
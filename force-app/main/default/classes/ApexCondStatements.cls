public class ApexCondStatements {
    public static void nestedIfElse(){
        integer a=20;
        string s;
        
        if(a>100){
            s='a is greater than 100';
        }else{
            if(a>50){
                s='a is greater than 50';
            }else{
                if(a>30){
                    s='a is greater than 30';
                }else{
                    if(a>10){
                        s='a is greater than 10';
                    }else{
                        s='a is less than or equal to 10';
                    }
                }
            }   
        }
        system.debug('the value of s = '+s);
    }
    
    public static void ternaryOperator(){
        integer k=6;
        string s;
        
        s = k>5 ? 'K is greater than 5' : 'K is less than 5';
        system.debug(s);
        
    }
    
    public static void switch(){
        string card= 'Black';
        integer discount;
        
        switch on card{
            when 'Platinum'{
                discount = 20;
            }
            when 'Gold'{
                discount = 15;
            }
            when 'Silver'{
                discount = 10;
            }
            when else {
                discount = 0;
            }
        }
        system.debug('Based on card type, the discount offered is ' +discount +'% ');
        
    }
    
}
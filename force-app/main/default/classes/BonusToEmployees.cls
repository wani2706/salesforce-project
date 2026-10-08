public class BonusToEmployees {
    public static decimal bonusAmountCalculated(string employeeType){
        decimal bonusAmount = 25000;
        
        switch on employeeType {
            when 'Manager'{
                bonusAmount += 5000;
            }
            when 'Region Head'{
                bonusAmount += 10000;
            }
            when 'SVP'{
                bonusAmount += 20000;
            }
            when 'VP'{
                bonusAmount += 15000;
            }
            when else{
                bonusAmount = +30000;
            }
    }
    return bonusAmount;
}
}
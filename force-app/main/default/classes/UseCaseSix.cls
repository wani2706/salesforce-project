public class UseCaseSix {
    public static void checkVotingAge(Date dateofBirth){
        Date todaysDate = Date.today();
        Integer age = todaysDate.year() - dateofBirth.year();
        if(age >=18){
            system.debug('Eligible to vote');
        }
        else{
            system.debug('Not eligible to vote');
        }

    }
}
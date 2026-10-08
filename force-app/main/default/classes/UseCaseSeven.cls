public  class UseCaseSeven {
    public static decimal splitPerPerson(Integer noOfPeople, Decimal billAmount){
        if(billAmount != null && noOfPeople >0){
            Decimal splitPerPerson = billAmount / noOfPeople;
            return splitPerPerson;
        }
        return null;
    }
}
public class UseCaseFive {
    public static boolean checkAccountContact(string accountName, String contactName){
        //accept account and contact names
        //check if the account and contact is realted 
        //if yes, then return true else false
        List<Contact> contacts = [select id, name from contact where account.name =: accountName and name =: contactName limit 1];
        if(contacts.size() == 1){
            return true;
        }
        else{
            return false;
        }
    }
}
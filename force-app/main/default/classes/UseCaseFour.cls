public class UseCaseFour {
    public static List<String> getEmailAddresses(string accountName){

        List<String> emailAddresses = new List<String>();

        if(!string.isBlank(accountName)){
                List<Contact> contacts = [select id,  email from contact where account.name=: accountName];
                if(!contacts.isEmpty()){
                    for(Contact con: contacts){
                        if(!string.isBlank(con.Email)){
                            emailAddresses.add(con.Email);
                        }
                    }

                }
            }
        return emailAddresses;
    }
}
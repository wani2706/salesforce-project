public class UseCaseThirteen {
    public static string generateFirstAndLastName(string emailAddress){
        //List<string> name = [select id,name, email from Contact where email=: emailAddress];
        
        String fullName = '';
        string extractedString = emailAddress.substringBefore('@');
        if(!string.isBlank(extractedString)){
            if(extractedString.contains('_')){
               fullName = extractedString.replace('_', ' '); 
            }
        }
        return fullName;
    }
}
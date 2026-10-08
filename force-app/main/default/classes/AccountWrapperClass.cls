public class AccountWrapperClass {

    public static wrapper method(){
        
        List<Contact> con = [select id from Contact];
        List<Account> acc = [select id from Account];
        
        wrapper w = new wrapper();
        w.accList = new List<Account>(acc);
        w.conList = new List<Contact>(con);
        return w;
		        
    }
    
    public class wrapper{
        List<Account> accList;
        List<Contact> conList; 
        
    }
    
}
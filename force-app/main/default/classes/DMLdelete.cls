public class DMLdelete {
	public static void main(){
        List<Account> l = [select name from Account where name like 'insert%'];
        system.debug(l);
        delete l;
        
        
    }
}
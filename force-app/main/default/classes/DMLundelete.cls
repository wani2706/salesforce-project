public class DMLundelete {
    public static void main(){
        List<Account> l = [select name from Account where name like 'test%' ALL ROWS];
        system.debug(l);
        undelete l;
    }
}
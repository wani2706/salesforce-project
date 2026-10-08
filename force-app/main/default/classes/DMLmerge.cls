public class DMLmerge {
    public static void main(){
        List<Account> acc = [select name from account where name like 'U%' Limit 3];
        Account a = acc[0];
        Account b = acc[1];
        Account c = acc[2];
        
        List<Account> mergelist =new List<Account>();
        mergelist.add(acc[1]);
        mergelist.add(acc[2]);
        
        merge a mergelist;
        
    }
}
public class TransactionAndRollback {
    public static void main(){
        savepoint sp = Database.setSavepoint();
        try{
            opportunity o = [select name, account.id, Amount, ownerId from opportunity where name like 'genePoint%'];
        Decimal commission = o.Amount*0.2 ; 
        o.Amount = o.Amount + commission;
        update o;
        
        Commission__c c = new commission__c();
        c.commission_amount__c = commission;
        c.Name = o.ownerId; 
       
        }
        catch(Exception e)
        {
            Database.rollback(sp);
        }
    }
}
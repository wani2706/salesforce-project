public class ExceptionalExceptions {
    public static void handleMyExceptions(){
        try{
            Account accId = [select name, Rating from Account where name = 'GenePoint' limit 1];
            accId.Rating = 'Cold';
            update  accId;
          }
        catch(Exception e){
            system.debug(e.getMessage() + '----' + e.getLineNumber() + '------' + e.getStackTraceString());
        }
        finally{
            system.debug('I am here in the finally block');
        }
    }
}
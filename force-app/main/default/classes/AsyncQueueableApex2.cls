public class AsyncQueueableApex2 implements Queueable{
    
    public static void execute(QueueableContext context){
        system.debug('Second Queueable statement');
    }
}
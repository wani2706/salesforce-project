public class AsyncQueueableApex implements Queueable{

    public static void execute(QueueableContext context){
        system.debug('First queueable statement');
        system.enqueueJob(new AsyncQueueableApex2());
    }

}
trigger AccountTestTrigger on Account (before update) {
    if(Trigger.isbefore && Trigger.isupdate){
        system.debug(Trigger.new);
        system.debug(Trigger.old);
    }
}
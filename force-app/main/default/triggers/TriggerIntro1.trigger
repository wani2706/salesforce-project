//trigger TriggerIntro1 on Account (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
trigger TriggerIntro1 on Account (before insert, before update){
    if(Trigger.isBefore){
        system.debug('Before insert Trigger on Account fired');
        system.debug('Before update Trigger on Account fired');
        system.debug('Before delete Trigger on Account fired');
    }
    
    if(Trigger.isAfter){
        system.debug('after insert Trigger on Account fired');
        system.debug('after update Trigger on Account fired');
        system.debug('after delete Trigger on Account fired');
        system.debug('after undelete Trigger on Account fired');
    }
}
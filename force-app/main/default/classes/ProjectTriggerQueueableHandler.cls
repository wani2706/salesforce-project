public class ProjectTriggerQueueableHandler implements Queueable{
    
    private List<Project__c> projects;
    
    public ProjectTriggerQueueableHandler(List<Project__c> newProjects){
        this.projects = newProjects;
    }
    
    public void execute(QueueableContext qc){
        try{
            
            set<Id> projManagerIds = new set<Id>();
            for(User u : [select id, Name, Profile.Name from User where Profile.Name='System Administrator']){
                projManagerIds.add(u.id);
            }
            
            
            List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
            
            for(Project__c project : projects){
                for(Id recepientId : projManagerIds){
                    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                    email.setSubject('New Project Created: ' + project.Name);
                    email.setPlainTextBody('A new Project "'+ project.Name+ '" has been created!');
                    email.setSaveAsActivity(false);
                    email.setTargetObjectId(recepientId);
                    //email.setToAddress(new string[] {user.email});
                    emails.add(email);
                }
            } 
            
            if(!emails.isEmpty()){
                Messaging.sendEmail(emails);
            }
            
        }
        catch(Exception e){
            system.debug('Error sending email notifications for projects: '+e.getMessage());
        }
    }
}
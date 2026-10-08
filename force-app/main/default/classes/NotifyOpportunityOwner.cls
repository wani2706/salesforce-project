public class NotifyOpportunityOwner {

    @future
    public static void notifyOppOwner(List<id> oppIds){
    
    List<Opportunity> oppList = [SELECT Id, Name, Amount, Owner.Email, Owner.Name, StageName
                                FROM Opportunity WHERE Id In: oppIds
                                AND stageName = 'Closed Won' AND Owner.Email !=null];

    
        List<Messaging.SingleEmailMessage> emailsToBeSent = new List<Messaging.SingleEmailMessage>();
        for(Opportunity opp : oppList){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new string[] {opp.owner.Email});
            mail.setSubject('Opportunity Closed Won!! : ' +opp.Name);
            mail.setPlainTextBody(
                'Hi ' + opp.owner.Name + ',\n\n'+
                'Great Job! The Opportunity "'+ opp.Name +'" has been marked as Closed Won!\n' +
                'Amount: $' + opp.Amount + '\n\n' +
                'Keep up the great work! \n\n - Salesforce Team'
            );
            mail.setSaveAsActivity(false);
            emailsToBeSent.add(mail);
        }

        if(!emailsToBeSent.isEmpty()){
            Messaging.sendEmail(emailsToBeSent);
            system.debug('Sent '+emailsToBeSent.size()+ ' closed won notification emails.');
        }
        else{
            system.debug('No valid emails to send.');
        }

    }

}
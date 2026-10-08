public  class EmailNotification {
    
    @future
    public static void sendEmailNotification(List<Id> accIds){
        List<Account> accounts = [SELECT Id, Name, Owner.Email, Owner.Name 
                                  FROM Account WHERE Id In : accIds 
                                  AND owner.Email != null];

        List<Messaging.SingleEmailMessage> emailsToBeSent = new List<Messaging.SingleEmailMessage>();

        for(Account acc: accounts){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new string[] {acc.Owner.Email});
            mail.setSubject('Account Updated:  ' + acc.Name);
            mail.setPlainTextBody('Hello Owner ' +acc.Owner.Name + '\n\nThe account "'+ acc.Name+ '" has been updated.\n\nRegards,\nSalesforce');
            emailsToBeSent.add(mail);
        }

        if(!emailsToBeSent.isEmpty()){
            Messaging.sendEmail(emailsToBeSent);
        }
    }
}
public  class UseCaseThree {
    public static void sendAnEmail(string emailAddress){

        if(!String.isBlank(emailAddress)){

         list<String> emailsList = new list<String>{emailAddress};
          Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
          mail.setSubject('URGENT: Take a look');
          mail.setPlainTextBody('This is a notification triggered by salesforce via Apex for you');
          mail.setToAddresses(emailsList);

          Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});

        }
    }
}
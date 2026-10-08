@isTest
public class ProjectTriggerTest {
    
    @testSetup
    static void setupTestData(){
        
        //create project manager role
        UserRole manRole = new UserRole(Name='Project Manager');
        insert manRole;
        
        //users as Project managers  
        List<User> projMans = new List<User>();
        for(integer i=0; i<2; i++){
            Profile p = [select id from Profile where Name='System Administrator'];
            User pm = new User(
                Alias = 'pm' + i, Email = 'projectmanager' + i + '@example.com',
                EmailEncodingKey = 'UTF-8', LastName = 'ProjectManager' + i,
                LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US',
                ProfileId = p.Id, TimeZoneSidKey = 'America/Los_Angeles',
                UserName = 'projectmanager' + i + '@example.com',
                UserRoleId = manRole.Id
            );
            projMans.add(pm);
        }
        insert projMans;
        
        EmailTemplate emailTemplate = new EmailTemplate(
            Name = 'Project Notification',
            DeveloperName = 'Project_Notification',
            TemplateType = 'text',
            Subject = 'New Project Created: {!Project__c.Name}',
            HtmlValue = 'A new project, {!Project__c.Name}, has been created. Details: <br/> Name: {!Project__c.Name} <br/> Status: {!Project__c.Status__c}'
        );
        insert emailTemplate;
    }
    
    @isTest
    static void testProjectQueuebaleSendsEmail(){
        
      //get projman role and users
      UserRole projectManagerRole = [select id from UserRole where Name='Project Manager' LIMIT 1];
      List<User> projectManagers = [select id, email from User where UserRoleId =:projectManagerRole.id];
      //atleast one manager should be there for testing
      system.assertNotEquals(0,projectManagers.size(),'At least one Project Manager should exist for testing');
       
      Test.startTest();
       List<Project__c> projects = new List<Project__c>();
        for (Integer i = 0; i < 2; i++) {
            projects.add(new Project__c(Name = 'Test Project ' + i));
        }
        insert projects;
        
        Test.stopTest();
        System.assertEquals(2, Limits.getEmailInvocations(),'Two emails should have been invoked, one for each project' );
        
        List<Messaging.SendEmailResult> results = Messaging.sendEmail(new List<Messaging.SingleEmailMessage>(), false);
         for(Messaging.SendEmailResult result : results){
            System.assertEquals(true, result.isSuccess(), 'Email sending should be successful');
        }
    }
}
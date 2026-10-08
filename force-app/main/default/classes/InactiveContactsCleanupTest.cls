@isTest
public class InactiveContactsCleanupTest {
    
    @isTest
    static void testInactiveContactsCleanup(){
        List<Contact> contacts = new List<Contact>();
        for(integer i=0; i<5; i++){
            contacts.add(new Contact(FirstName='Test', LastName='Contact'+i));
        }
        insert contacts;

        //create tasks, events and cases for the contacts
        List<Task> tasks = new List<Task>();
        List<Event> events = new List<Event>();
        List<Case> cases = new List<Case>();

        Date twoYearsAgo = System.today().addYears(-2);

        for(Contact con : contacts){
            tasks.add(new Task(whoid = con.id, Subject='Test Task', ActivityDate=twoYearsAgo));
            events.add(new Event(whoid = con.id, Subject='Test Event', ActivityDate=twoYearsAgo, DurationInMinutes=60, StartDateTime=system.now().addYears(-2)));
            //cases.add(new Case(ContactId = con.id, Subject='Test Case', status='New', Origin='Web'));
        }

        insert tasks;
        insert events;
        //insert cases;

        Test.startTest();
        InactiveContactsCleanup inactiveCons = new InactiveContactsCleanup();
        Database.executeBatch(inactiveCons, 5);
        Test.stopTest();

        //verify if cons are marked inactive or not
        List<Contact> updatedContacts = [SELECT Id, Inactive__C FROM Contact
                                         WHERE Inactive__C = true];

         System.assertEquals(5, updatedContacts.size(), 'Logic is not correct');

    }
}
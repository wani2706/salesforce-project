public  class UseCaseOne {
    public static void createContact(string firstname, string lastname, string emailAddress){

        list<Contact> conList = new list<Contact>();
        Contact newCon = new Contact();
        if(!string.isBlank(lastname)){
        newCon.FirstName = firstname;
        newCon.LastName = lastname;
        newCon.Email = emailAddress;
        conList.add(newCon);
        }
        
        if(!conList.isEmpty()){
            insert(conList);
        } 
    }
}
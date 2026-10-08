public class SearchContactsController {
    public string searchKey{get;set;}
    public List<contact> conList{get;set;}
    
    public void searchContacts(){
        if(!string.isBlank(searchKey)){
            searchKey = searchKey + '%';
            conList = [select id, firstname, lastname, email from Contact where (firstname like : searchKey or lastname like : searchKey)];
        }
    }
    
}
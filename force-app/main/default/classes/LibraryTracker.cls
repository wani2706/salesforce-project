public class LibraryTracker {
    
    public static List<String> bookRepo = new List<String>();
    public static Map<String, String> borrowerMapping = new Map<String, String>(); 
    
    public static void bookRepository(String booksToBeAdded){
        bookRepo.add(booksToBeAdded);
    }
    
    //user borrorwed a book
    public static void bookBorrowed(String bookName, String personName){
        borrowerMapping.put(bookName, personName);
        integer index = bookRepo.indexOf(bookName);
            if(index != -1){
              bookRepo.remove(index);
            }else {
                System.debug('Book not found in repository.');
            }
    }
    
    public static Map<String, String> displayBooksBorrowed(){
        system.debug(borrowerMapping); 
        return borrowerMapping;       
    }
    
    public static List<String> myBookRepostory(){
        system.debug(bookRepo); 
        return bookRepo;
    }
    
}
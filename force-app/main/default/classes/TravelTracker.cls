public class TravelTracker {
    
    public static Map<Integer, list<string>> placesVisitedDirectory = new Map<Integer, list<string>>();
    public static List<string> myWishlist = new List<String>();
    
    public static Map<Integer, list<string>> captureLocations(String countryName, Integer dateVisited){
        if(placesVisitedDirectory.containsKey(dateVisited) ){
           List<String>countryVisited= placesVisitedDirectory.get(dateVisited);
        	countryVisited.add(countryName);
            placesVisitedDirectory.put(dateVisited,countryVisited);
        }
        else{
            placesVisitedDirectory.put(dateVisited, new list<string>{countryName});
        }
       return  placesVisitedDirectory;
        
    }
    
    //add values to list or view list
    public static list<string> wishlist(String countriesWantToVisit){
        myWishlist.add(countriesWantToVisit);
        return myWishlist;
    }
    
    public static List<String> showCountriesVisited(integer datevisited){
       List<String> countriesVisited = placesVisitedDirectory.get(datevisited);
        return countriesVisited;
    }
    
    public static integer visitedCountryCount(integer dateVisited){
      return  (placesVisitedDirectory.get(dateVisited)).size();
    }
}
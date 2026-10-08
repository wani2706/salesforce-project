public class DMLduplicateRemoval {
    public static void main(){
        List<Contact> con = [select Name from Contact];
        Map<String, Id>mMap = new Map<String, Id>();
        
        for(contact c : con){
            mMap.put(c.Name , c.Id);
        }
        
        List<Contact> uniqlist = new List<Contact>();
        List<Contact> dellist = new List<Contact>();
        
        set<string> s1 = mMap.keyset();
        set<id> uniqset = new set<id>();
        
        for(string s : s1){
            uniqset.add(mMap.get(s));
        }
        
        for(contact c: con){
            if ((uniqset.contains(c.id)))
                uniqlist.add(c);
            else
                dellist.add(c);
        }
        
        delete dellist;
        
    }
}
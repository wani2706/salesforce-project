public class StringArrayTest {
    public static list<string> generateStringArray(Integer n){
	List<string> l1 = new List<string>();
        for(integer i=0; i<n; i++){
            l1.add('Test ' + i);
        } 
        system.debug(l1);
        return l1;
    }
}
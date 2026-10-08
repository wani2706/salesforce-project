public class ApexCollections {
    
    public static void listFunction(){
        
        list<integer> li = new list<integer>();
        
        for(integer a=0; a<10; a++){
            integer k = Integer.valueof(Math.random() * 10); 
            li.add(k);
        }
        
        for(integer a=0; a<10; a++){
            system.debug(li[a]);
        }
        
    }
    
    public static void listFunction2(){
        
        list<integer> li = new list<integer>();
        integer a; 
        
        do{
            integer k = Integer.valueof(Math.random() * 10); 
            li.add(k);
            a=k;
        }while(a>0);
        
        
        for(a=0; a<li.size(); a++){
            system.debug(li[a]);
        }
        
    }
    
    public static void set(){
        
        set<integer> s = new set<integer>();
        integer a; 
        
        do{
            integer k = Integer.valueof(Math.random() * 10); 
            s.add(k);
            a=k;
        }while(a>0);
        
         system.debug(s);
    }
    
    public static void ListSet(){
        
        set<integer> s = new set<integer>();
         list<integer> li = new list<integer>();
        integer a; 
        
        do{
            integer k = Integer.valueof(Math.random() * 10); 
            s.add(k);
            li.add(k);
            a=k;
        }while(a>0);
        
         system.debug('set...'+s);
        system.debug('List...' +li);
    }

    public static void MapFunction(){
        
        map<integer, string> m = new map<integer, string>();
        m.put(0,'Shiw');
        m.put(1,'wani');
        m.put(2,'wasu');
        
        for(integer i=0; i<m.size(); i++){
            system.debug(m.get(i));
        }
        
    }
    
    public static void ForEachLoop(){
        
        List <integer> li = new List<integer> ();
        integer k=0;
        
        do{
            integer a = integer.valueof(Math.random()*10);
            li.add(a);
            k=a;
        }while(K>0);
        
        for(integer i : li){
            system.debug(i);
        }
        
    }
    
}
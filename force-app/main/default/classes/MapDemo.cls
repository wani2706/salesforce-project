public class MapDemo {
    
    public static void sObjectDemo(){
        list<Account> accList = [select id, Name from account limit 5];
        map<id,Account> mapAcc = new map<id,Account>();
        mapAcc.putAll(accList);
        system.debug('Map contains = '+ mapAcc);
       
    }
    
    public static void demoWithoutLoop(){
       // list<Account> accList = new list<Account>();
        map<id,Account> mapAcc = new map<id,Account>([select Name from account limit 5]);
        
        //mapAcc.putAll(accList);
        system.debug('Map contains = '+ mapAcc);
        system.debug('Map keys = '+ mapAcc.keySet());
        system.debug('Map values = '+ mapAcc.values());
    }
    
    public static void demoWithLoop(){
        list<Account> accList = new list<Account>();
        accList = [select Name from Account limit 5];
        map<id,Account> mapAcc = new map<id,Account>();
        
        for(Account acc : accList){
            mapAcc.put(acc.id,acc);
        }

        system.debug('Map contains = '+ mapAcc);
        system.debug('Map keys = '+ mapAcc.keySet());
        system.debug('Map values = '+ mapAcc.values());
    }
    
    public static void demo(){
        Map<integer, string> colors = new Map<integer, string>();
        colors.put(1,'Green');
        colors.put(2,'blue');
        colors.put(3,'red');
        colors.put(4,'blue');
        system.debug('Map contains = ' + colors);
        colors.put(2,'yellow');
        system.debug('Map contains = ' + colors);
        
        Map<integer, string> moreColors = new Map<integer,string>();
        moreColors.put(5,'pink');
        moreColors.put(6,'cyan');
        moreColors.put(1,'black');
		system.debug('Map contains = ' + moreColors);        
        colors.putAll(moreColors);
        system.debug('Map contains = ' + colors);
        colors.remove(1);
        system.debug('Map contains = ' + colors);
        system.debug('Map contains = ' + colors.size());
        system.debug('Map contains = ' + colors.values());
        //colors.clear();
        //system.debug('Map contains = ' + colors);
        
        map<integer,string> clonedMapp = new map<integer,string>();
        clonedMapp= colors.clone();
        system.debug('Map contains = ' + clonedMapp);
        system.debug('Map contains = ' + clonedMapp.containsKey(1));
        system.debug('Map contains = ' + clonedMapp.equals(colors));
        system.debug('Map contains = ' + clonedMapp.equals(moreColors));
        system.debug('Map contains = ' + clonedMapp.get(2));
        system.debug('Map contains = ' + clonedMapp.isEmpty());
        system.debug('Map contains = ' + clonedMapp.keySet());
        
        set<integer> intset = clonedMapp.keySet();
        list<string> strlist = clonedMapp.values();
        system.debug('set contains = '+intset);
        system.debug('list contains = '+strlist);
        
    }
}
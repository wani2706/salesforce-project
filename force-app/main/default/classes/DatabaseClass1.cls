public class DatabaseClass1 {
    
    public static void deleteRecord(){
      List<Opportunity> oppList =[select id from opportunity
                                 where stagename = 'Closed Lost'];
        if(oppList.size()>0){
            delete oppList;
        }
    }
    
    public static void handleContactUpdates(id contactId){
       // contactId = 003J100000ACalfIAD;
        
        Contact con = [select id, title, department from contact where id =: contactId];
            if(con.title == 'VP' ){
                con.Department = 'Procurement';
            }
        update con;
  }
    
    public static void main(){
        List<Account> acc = new List<Account>();
        for(integer i=1;i<=20;i++){
            Account a = new Account(Name='Test Account '+ i);
            acc.add(a);
        }
        
        //Insert
        
        //acc.add(new Account());
      //  insert acc;
        
        //Database.insert(acc);
        
        //Database.insert(acc,false);
        
        
        //update
        
       for( Account a : acc){
            a.Name = 'Update ' + a.Name;
        }
        Database.update(acc,false);
        
      //upsert
        
        for(integer i=0;i<=10;i++){
            Account a = new Account(Name='Upsert '+i);
                acc.add(a);
        }
        Database.upsert(acc,false);
        
           
        //delete
         Database.delete(acc,false);
        
        //undelete
        Database.undelete(acc,false);
        
        //merge
        Account a= acc[0];
        Account b= acc[1];
        Database.merge(a,b);
        
        //emptyRecycleBin
        List<Account> a1 = [select id from account where isDeleted=true ALL ROWS];
        Database.emptyRecycleBin(a1 );
        
        //Count query
        Integer i = Database.countQuery('Select count() from Contact');
        system.debug(i);
        //Integer i1 = Database.countQuery('Select count(Id) from Contact');        
    	//system.debug(i1);
    	
        //Lead Conversion
 		Lead l = [select name from lead where name like 'Sh%' limit 1];
        Database.leadConvert lc = new Database.leadConvert();
        lc.setLeadId(l.id);
        lc.convertedStatus='Closed - Converted';
        lc.ownerId = '00Q5g00000Gm9lCEAR';
        Database.leadConvertResult lcr = Database.ConvertLead(lc);
        
        }
        
    }
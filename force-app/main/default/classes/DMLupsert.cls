public class DMLupsert {
    public static void myMethod(){
       List<Product2> prod = [select Name from Product2];
        for(Product2 p: prod){
            p.Name = p.Name +' 18';
        }
        
       
        Product2 p1 = new Product2(Name='Tenda Wifi Dongle 18');
        Product2 p2 = new Product2(Name='Tenda Wireless switch 18');
 
		prod.add(p1);
		prod.add(p2);
        
        upsert prod;

		system.debug(prod);        
    }
}
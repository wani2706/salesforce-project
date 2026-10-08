public class ApexVariables {
    
    Integer a=5;
    Integer b=10;
    Integer c;
    
    public void add(){
        Integer k=1; 
        k=a+b;
        c=k;
            system.debug('The value of k is '+k);
        //this.c;
        	system.debug('The value of c is '+c);
        }
    
    public void subtract(){
        c=a-b;
        system.debug('The subtraction is '+c);
    }
    
    public void multiply(){
        c=a*b;
        system.debug('The product is '+c);
    }
    
}
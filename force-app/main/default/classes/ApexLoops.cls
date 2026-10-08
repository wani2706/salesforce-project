public class ApexLoops {
    public static void whileLoop(){
        integer i=0;
        while(i<10){
            system.debug(i);
            i++;
        }
    }
    
    public static void doWhileLoop(){
        integer i=0;
        do{
            system.debug(i);
            i++;
        }while(i<10);
    }
    
    public static void forLoop(){
        for(integer i=0; i<10; i++){
            system.debug(i);
        }        
    }
    
}
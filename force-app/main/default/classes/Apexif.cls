public class Apexif {
    public static void myMethod(){
        Integer num;
        boolean check;
        
        if(check==false){
            num=1;
        }
        else if(check==true){
            num=2;
        }
        else if (check==null){
            num=3;
        }
        else if(check !=null){
            num=4;
        }
        else{
            num=5;
        }
        
        system.debug(num);
    }
}
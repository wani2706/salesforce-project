public class ApexSwitch {
    public static void myMethod(){
        Integer num=1;
        switch on num{
            when 8{
                system.debug('value is 8');
            }
            when 7{
                system.debug('value is 7');
            }
            when else{
                system.debug('neither 7 nor 8');
            }
        }
    }
}
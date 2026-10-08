public class ApexInto1 {
    public void methodOne(){
        system.debug('Method One Executed');
        
        methodThree();
    }
     void methodTwo(){
        system.debug('Method Two Executed');
    }
    Private void methodThree(){
        system.debug('Method Three Executed');
        methodTwo();
    }
}
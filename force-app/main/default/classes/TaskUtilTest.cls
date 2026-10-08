@isTest
public class TaskUtilTest {
    
    @isTest
    public static void testTaskPriority(){
        string priorityResult = TaskUtil.getTaskPriority('NY');
        system.assertEquals('Normal', priorityResult);
    }
    
    @isTest
    public static void testTaskHighPriority(){
        string priorityResult = TaskUtil.getTaskPriority('CA');
        system.assertEquals('High', priorityResult);
    }
    
    @isTest
    public static void testTaskPriorityInvalid(){
        string priorityResult = TaskUtil.getTaskPriority('Montana');
        system.assertEquals(null, priorityResult);
    }
}
public class TaskUtil {
    
    public static string getTaskPriority(string leadState){
        if(string.isBlank(leadState) || leadState.length() > 2){
            return null;
        }
        
        String taskPriority;
        if(leadState =='CA'){
            taskPriority = 'High';
        }
        else{
            taskPriority = 'Normal';
        }
        return taskPriority;  
    }
}
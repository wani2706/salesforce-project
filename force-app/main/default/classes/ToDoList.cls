public class ToDoList {
    private List<String> toDoList = new List<String>();
    private List<String> doneList = new List<String>();

    public void addTask(string task){
        toDoList.add(task);
        system.debug('Added to todolist : '+ task);
    }
    
    public void markTaskAsDone(string task){
        if(toDoList.contains(task)){
            integer index = todoList.indexOf(task); 
            if(index != -1){
                toDoList.remove(index);
            }
            doneList.add(task);
            system.debug('Task marked as done : '+ task);  
        }else{
            system.debug('Task not found in the to-do list : '+ task);
        }
    }
    
    public void removeDoneTask(String task){
        if(doneList.contains(task)){
            integer index = todoList.indexOf(task); 
            if(index != -1){
                doneList.remove(index);
            }
            system.debug('Removed task : '+ task);  
        }else{
            system.debug('Task not found in the to-do list : '+ task);
        } 
    }
    
    public void showTasks(){
        this.addTask('Reading');
        this.addTask('Driving');
        this.addTask('Cycling');
        this.markTaskAsDone('Reading');
        this.markTaskAsDone('Driving');
        this.removeDoneTask('Reading');
        system.debug('To do list: ' + toDoList);
        system.debug('done list: ' + doneList);
    }
}
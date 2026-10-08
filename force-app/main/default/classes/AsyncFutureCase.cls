public  class AsyncFutureCase {

    public static void handleTaskCheckbox(List<Task> tasks){
        List<string> ownerIds = new List<string>();
    
        for(Task task : tasks){
            if(task.Status == 'Completed'){
                ownerIds.add(task.OwnerId);
            }
        }
        updateUserTasks(ownerIds); 
    }

    public static void updateUserTasks(List<string> ownerIds){
        List<User> users = [select id from user where id=: ownerIds];
        for(user usr : users){
            usr.City = 'New City';
        }

        update users;
    }


    @future
    public static void handleEmailNotifications(){
       createTasks();
       system.debug('1st future method called');
    }

    @future
    public static void createTasks(){
        system.debug('2nd future method called');
    }
}
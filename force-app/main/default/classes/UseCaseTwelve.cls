public class UseCaseTwelve {
    public static List<Task> returnLatestTask(){
        return [select id, subject, status, priority, createdDate
                            from Task where createdDate = Today 
                			order by createdDate desc 
                			limit 5];
    }
}
public class TaskUtil {
    public static string getTaskPriority(String leadState){
        //validate input first.
        if(String.isBlank(leadState) || leadState.length() > 2){
            return null;
             }
        String taskPriority;
        if(leadState == 'CA'){
            taskPriority = 'High';
            }
        else{ 
        taskPriority = 'Normal';
        }
        return taskPriority;
    }

}
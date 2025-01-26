@isTest
private class TaskUtilTest {
    @isTest static void testTaskPriority(){
        string pri = TaskUtil.getTaskPriority('NY');
        System.assertEquals('Normal',pri);
    }
    @isTest static void testTaskHighPriority(){
        string pri = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }
    @isTest static void testTaskPriorityinvalid(){
        string pri = TaskUtil.getTaskPriority('Montana');
        System.assertEquals(null, pri);
    }
}
@isTest
private class TestVerifyDate{
    @isTest static void testcheckDates(){
        Date date1= Date.today();
        Date date2= date1.addDays(29);
        Date pri = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2,pri);
    }
    @isTest static void testfailcheckDates(){
        Date date1= Date.today();
        Date date2 = date1.addDays(31);
        Date i = VerifyDate.CheckDates(date1, date2);
        System.assertNotEquals(date1,i);
    }
}
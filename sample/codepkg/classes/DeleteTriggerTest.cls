public class DeleteTriggerTest {
    public static void MethodTest(){
    List<Campaign> TestList= [select Name FROM Campaign Where Junk__c = false];
    for(campaign c: TestList)
    {  
     c.Junk__c = true;
        }
    integer count = [Select Count() from campaign where junk__c = true];
    system.debug('Number of junk records = '+count);
        update TestList;
    }
    
}
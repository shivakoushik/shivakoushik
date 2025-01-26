@isTest
public class DailyLeadProcessorTest {

    @isTest
    static void testDailyLeadProcessor() {
        // Create 200 test lead records with blank LeadSource
        List<Lead> testLeads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            testLeads.add(new Lead(
                FirstName = 'Test Lead ' + i,
                LastName = 'Last Name ' + i,
                Company = 'test'
            ));
        }
        insert testLeads;

        // Schedule the DailyLeadProcessor to run
        Test.startTest();
        String cronExp = '0 0 0 * * ?'; // Schedule to run daily at midnight
        System.schedule('Daily Lead Processor Job', cronExp, new DailyLeadProcessor());
        Test.stopTest();

        // Check that all Lead records were updated correctly
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size());
    }
}
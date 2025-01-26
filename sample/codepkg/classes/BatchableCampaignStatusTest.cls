@isTest
public class BatchableCampaignStatusTest{
       
    @testSetup
    static void setup(){
       List<Campaign> newList = new List<campaign>();
        Campaign camp1 = new Campaign();
          camp1.Name = 'WelcomeTest1';
          camp1.EndDate = date.today().addDays(-2);
          camp1.Status = 'In progress';
       	  camp1.Type = 'Customer Outreach';
        insert camp1;
         Campaign camp2 = new Campaign();
          camp2.Name = 'WelcomeTest1';
          camp2.EndDate = date.today().addDays(2);
          camp2.Status = 'In progress';
       	  camp2.Type = 'Customer Outreach';
        insert camp2;
         Campaign camp3 = new Campaign();
          camp3.Name = 'WelcomeTest1';
          camp3.EndDate = date.today().addDays(-2);
          camp3.Status = 'Completed';
       	  camp3.Type = 'Customer Outreach';
        insert camp3;
         Campaign camp4 = new Campaign();
          camp4.Name = 'WelcomeTest1';
          camp4.EndDate = date.today().addDays(-2);
          camp4.Status = 'In progress';
       	  camp4.Type = 'Live Webcast';
        insert camp4;
         Campaign camp5 = new Campaign();
          camp5.Name = 'WelcomeTest1';
          camp5.EndDate = date.today().addDays(2);
          camp5.Status = 'In progress';
       	  camp5.Type = 'Live Webcast';
        insert camp5;
        newList.add(camp1);
		newList.add(camp2);
		newList.add(camp3);
		newList.add(camp4);
		newList.add(camp5);
    }
           Static testMethod void test(){
           Test.StartTest();
        BatchableCampaignStatus campaignbatch = new BatchableCampaignStatus();
        string status = 'completed';
        string Campaigntype = 'Customer Outreach';
        campaignbatch.Query = 'SELECT ID, Name FROM Campaign WHERE EndDate <= Yesterday AND status!=\''+status+'\' AND type=\''+Campaigntype+'\'';
        Database.executeBatch(campaignbatch);
           Test.stopTest();
           }			
     
}
@isTest
private class JunkCampaignDeleteTriggerTest {   
public static testMethod void JunkCampaignDeleteTest()
{  
    campaign camp = new campaign(Name='Test'); 
	insert camp;
    camp.Junk__c = true;
    update camp;
}
}
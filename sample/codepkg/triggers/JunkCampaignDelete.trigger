trigger JunkCampaignDelete on Campaign (after update) { 
List<Campaign> TriggerDelete = [Select Id,Name FROM Campaign WHERE Junk__c = True];
integer count = [SELECT Count() from Campaign where junk__c = true];
    delete TriggerDelete;  
System.debug('Number of records deleted ='+count);
}
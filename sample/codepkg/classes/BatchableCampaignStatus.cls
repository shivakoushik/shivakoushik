global class BatchableCampaignStatus implements Database.Batchable <SObject> ,Database.Stateful
{
    global String Query;
    global string status = 'completed';
    global string Campaigntype = 'Customer Outreach';
    global Database.QueryLocator start (Database.BatchableContext bc)
    {	
        query = 'SELECT ID, Name FROM Campaign WHERE EndDate <= Yesterday AND status!=\''+status+'\' AND type=\''+Campaigntype+'\'';
        return Database.getQueryLocator(Query);
    }
    global void execute (Database.BatchableContext bc, List<Campaign> Query){
        List<Campaign> StatusUpdated = New List<Campaign>();    
        for(Campaign c : Query){
            c.Status = 'Completed';
            StatusUpdated.add(c);
        }
        update StatusUpdated;
    }  
        global void finish(Database.BatchableContext bc){
    }
 }
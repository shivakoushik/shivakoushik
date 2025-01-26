global class SchedulableCampaignStatus implements Schedulable {
   global void execute(SchedulableContext sc)
   {
       BatchableCampaignStatus Scheduled = new BatchableCampaignStatus();
       Scheduled.Query = 'SELECT ID, Name FROM Campaign WHERE EndDate <= Yesterday AND Name Like Test%' ;
       Id batchJobId = Database.executeBatch(Scheduled);
   }
}
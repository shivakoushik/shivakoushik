global class LeadProcessor implements Database.Batchable <SObject> ,Database.Stateful
{
    global String Query;
    global Database.QueryLocator start (Database.BatchableContext bc)
    {
        Query = 'Select ID,leadsource from lead';
        return Database.getQueryLocator(Query);
    }
    global void execute (Database.BatchableContext bc, List<lead> Query){  
        for(lead l : Query){
            l.leadsource = 'dreamforce';
        }
        update query;
    }  
    global void finish(Database.BatchableContext bc){
    }
}
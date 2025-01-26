@isTest
public class leadprocessortest{
    
    @testSetup
    static void setup(){
        list<lead> sk = new list<lead>();
        for(integer i =0; i<176; i++){
            lead l = new lead(firstname = 'Test'+i, LastName = 'Shiva'+i,company ='Tst'+i, State='New York');
            sk.add(l);
        }
        insert sk;
    }
    Static testMethod void test(){
        Test.StartTest();
        LeadProcessor Leadsource = new LeadProcessor();
        //string status = 'completed';
        //string Campaigntype = 'Customer Outreach';
        Leadsource.Query = 'Select ID,leadsource from lead';
        Database.executeBatch(Leadsource);
        Test.stopTest();
    }			
    
}
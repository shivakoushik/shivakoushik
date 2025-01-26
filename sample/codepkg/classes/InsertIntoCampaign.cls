public class InsertIntoCampaign {
    public static void campaign(){
    List<Campaign> Camp = New List<Campaign>();
    {
        for(integer i=0;i<200;i++)
        {
            campaign c = new campaign(Name='Example' +i, EndDate = date.Today().addDays(+i-10));
        camp.add(c);
       
        }
         
        
        insert camp;
        
    }
}
}
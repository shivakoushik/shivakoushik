public class newobjectdetail {

@AuraEnabled
    public static String getIconName(String sObjectName1){
        String u;
        List<Schema.DescribeTabSetResult> tabSetDesc = Schema.describeTabs();
        List<Schema.DescribeTabResult> tabDesc = new List<Schema.DescribeTabResult>();
        List<Schema.DescribeIconResult> iconDesc = new List<Schema.DescribeIconResult>();

        for(Schema.DescribeTabSetResult tsr : tabSetDesc) { tabDesc.addAll(tsr.getTabs()); }

        for(Schema.DescribeTabResult tr : tabDesc) {
            system.debug('getSobjectName...'+tr.getSobjectName());
            if( sObjectName1 == tr.getSobjectName() ) {
                if( tr.isCustom() == true ) {
                    iconDesc.addAll(tr.getIcons());
                } else {
                    u = 'standard:' + sObjectName1.toLowerCase();
                }
            }
        }
        
            System.debug('iconDesc..'+iconDesc);
        for (Schema.DescribeIconResult ir : iconDesc) {
            system.debug('getContentType...'+ir.getContentType());
            if (ir.getContentType() == 'image/svg+xml'){
                u = 'custom:' + ir.getUrl().substringBetween('custom/','.svg').substringBefore('_');
                break;
            }
        }
        System.debug('uu....'+u);
        return u;
    }
    @AuraEnabled
    public static List<String> getObjectlist()
    { list<String> objlist=new list<String>();
      List<Schema.DescribeTabSetResult> tabSetDesc = Schema.describeTabs();
      List<Schema.DescribeTabResult> tabDesc = new List<Schema.DescribeTabResult>();
         for(Schema.DescribeTabSetResult tsr : tabSetDesc) { tabDesc.addAll(tsr.getTabs()); }
      for(Schema.DescribeTabResult tr : tabDesc) 
     {
         objlist.add(tr.getSobjectName());
     }
     
     System.debug('.........'+objlist);
    return objlist;
        
    }
    
}
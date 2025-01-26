public class DuplicateReverse {
    public static void Val(string original){
        string revOrg='';
        for(integer i =original.length()-1;i>=0;i--){
            revOrg+=original.substring(i,i+1);
        }
        system.debug(revOrg);
            
    }
}
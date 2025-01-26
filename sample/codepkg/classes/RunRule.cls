public class RunRule {
    public static void RunAssignmentRule(List<Lead>trigger1,Map<Id,Lead>trigger2){
        List<Lead> ls = new List<Lead>();

    for (Lead l : Trigger1) {
    
    String oldVal = trigger2.get(l.id).Status;
    
        if (l.Status == 'Open/Requalified' && oldVal <> 'Open/Requalified') {
            ls.add(new Lead(id = l.id));
        }
    }
    
    if (ls.size() > 0) {
    Database.DMLOptions dmo = new Database.DMLOptions();
    dmo.assignmentRuleHeader.useDefaultRule = true;
    Database.update(ls, dmo);
}
    }
}
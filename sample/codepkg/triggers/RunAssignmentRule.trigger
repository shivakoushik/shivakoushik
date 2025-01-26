trigger RunAssignmentRule on Lead (after update) {
    map<Id,Lead> LeadMapping = new map<Id,Lead>();
    for(lead l : trigger.old){
    LeadMapping.put(l.id,l);    
    }
   RunRule.RunAssignmentRule(trigger.new,LeadMapping);

}
public class AccountProcessor {
    @future
    public static void countContacts(List<Id>accountIdList){
        Map<Id,List<Contact>> accountContactMap = new Map<Id,List<Contact>>();
        for(string s : accountIdList){
            accountContactMap.put(s,([select id from contact where AccountId=:s]));
        }
        list<Account> accToUpdate = new list<Account>();
        for(string accId : accountContactMap.keyset()){
            account a = new account(Id = accId);
            a.Number_Of_Contacts__c = accountContactMap.get(accId).size();
            accToUpdate.add(a);
        }
        if(accToUpdate.size() > 0){
            update accToUpdate;
        }
    }
}
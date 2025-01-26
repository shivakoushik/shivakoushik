@isTest
public class AccountProcessorTest {
    @isTest
    static void  countContactsTest(){
    account acc = new account();
    acc.Name = 'testData';
   	insert acc;
    contact c = new contact();
    c.FirstName = 'test data';
    c.LastName = 'success';
    c.AccountId = acc.Id;
    insert c;
        list<Id> accountContactList = new list<Id>();
        accountContactList.add(acc.Id);
        test.startTest();
        AccountProcessor.countContacts(accountContactList);
        test.stopTest();
    }
}
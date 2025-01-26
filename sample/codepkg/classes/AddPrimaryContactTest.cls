@isTest
public class AddPrimaryContactTest {
    @isTest
    static void testAddPrimaryContact() {
        // Insert 50 Account records for BillingState NY
        List<Account> nyAccounts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            nyAccounts.add(new Account(Name = 'NY Account ' + i, BillingState = 'NY'));
        }
        insert nyAccounts;

        // Insert 50 Account records for BillingState CA
        List<Account> caAccounts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            caAccounts.add(new Account(Name = 'CA Account ' + i, BillingState = 'CA'));
        }
        insert caAccounts;

        // Create an instance of the AddPrimaryContact class
        // and enqueue the job for BillingState CA
        Contact contactToAdd = new Contact(FirstName = 'John', LastName = 'Doe');
        String stateAbbreviation = 'CA';
        System.enqueueJob(new AddPrimaryContact(contactToAdd, stateAbbreviation));

        // Ensure the queueable job executes synchronously
        Test.startTest();
        Test.stopTest();

        // Assert that a Contact record was inserted for each of the 50 Accounts with the BillingState of CA
        Integer expectedContactCount = 50;
        Integer actualContactCount = [SELECT COUNT() FROM Contact WHERE Account.BillingState = :stateAbbreviation];
        System.assertEquals(expectedContactCount, actualContactCount);
    }
}
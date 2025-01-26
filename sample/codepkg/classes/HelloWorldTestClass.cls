@isTest
private class HelloWorldTestClass {
    static testMethod void validateHelloWorld(){
        book__c b = new book__c(Name='Behind the Cloud', Price__c =100);
        system.debug('Price before inserting new book:' + b.Price__c);
        insert b;
        b = [SELECT Price__c FROM book__c WHERE Id =: b.Id];
        System.assertEquals(90,b.price__c);
        
     }
}
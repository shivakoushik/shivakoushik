trigger HelloWorldTrigger on book__c (before insert) {
book__c[] books = Trigger.new;
    MyHelloWorld.applyDiscount(books);
}
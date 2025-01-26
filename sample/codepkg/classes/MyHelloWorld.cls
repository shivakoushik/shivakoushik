public class MyHelloWorld {
    public static void applyDiscount(book__c[] books){
        for (book__c b :books){
            b.Price__c*=0.9;
        }
    }
}
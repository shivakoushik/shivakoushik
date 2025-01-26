public class Insertbook {
    public static void thr(String name, Integer p){
    book__c b = new book__c(Name = name, Price__c = p);  
    Insert b;
    }
    
}
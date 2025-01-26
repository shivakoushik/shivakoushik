@isTest
private class TestRestrictContactByName {
    @isTest static void NewContact(){
        Contact c = new Contact(FirstName='Shiva', LastName= 'Rachapudi');
        insert c;     
      Test.startTest();
        try{
            insert c;
            }
        Catch(Exception e){
            Test.stopTest();
      }
   }
}
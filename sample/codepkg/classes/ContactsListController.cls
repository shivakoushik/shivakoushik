public class ContactsListController {
    private string sortOrder = 'LastName';
    public List<Contact> getContacts(){
        List<Contact> results = database.query('Select Id, FirstName, LastName , Title, Email FROM Contact ORDER BY ' +SortOrder+ ' ASC limit 10');
        return results;
    }
    public void sortByLastName() {
        this.sortOrder = 'LastName';
    }
    
    public void sortByFirstName() {
        this.sortOrder = 'FirstName';
    }
}
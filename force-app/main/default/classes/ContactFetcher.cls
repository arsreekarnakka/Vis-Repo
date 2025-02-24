public class ContactFetcher {

    public static List<Contact> getContacts() {
        try {
            List<Contact> contacts = [SELECT Id, Name, Email FROM Contact LIMIT 10]; // Limit to 10 for simplicity. Remove limit for all.
            return contacts;
        } catch (QueryException e) {
            System.debug('Error fetching contacts: ' + e.getMessage());
            return new List<Contact>(); // Return an empty list in case of an error.
        }
    }
}
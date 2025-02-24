public with sharing class ContactFetcher {

    private ContactFetcher() {
        // Private constructor to prevent instantiation.
    }

    public static List<Contact> getContacts() {
        try {
            return [SELECT Id, Name, Email FROM Contact LIMIT 10]; // Directly return the query result.
        } catch (QueryException e) {
            System.debug('Error fetching contacts: ' + e.getMessage());
            return new List<Contact>(); // Return an empty list in case of an error.
        }
    }
}
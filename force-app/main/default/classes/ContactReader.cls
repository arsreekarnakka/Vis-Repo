public with sharing class ContactReader {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        try {
            return [SELECT Id, FirstName, LastName, Email, Phone, AccountId FROM Contact LIMIT 50];
        } catch (Exception e) {
            System.debug('Error fetching Contacts: ' + e.getMessage());
            return new List<Contact>();
        }
    }
}
@isTest
public class ContactReaderTest {
    @testSetup
    static void setupTestData() {
        // Creating a test Account to associate with Contacts
        Account testAccount = new Account(Name = 'Test Account', Industry = 'Finance');
        insert testAccount;
 
        // Creating test Contact records
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 1; i <= 5; i++) {
            contacts.add(new Contact(FirstName = 'Test', LastName = 'Contact ' + i, Email = 'test' + i + '@example.com', Phone = '9876543210', AccountId = testAccount.Id));
        }
        insert contacts;
    }
 
    @isTest
    static void testGetContacts() {
        Test.startTest();
        List<Contact> result = ContactReader.getContacts();
        Test.stopTest();
 
        // Asserting that some records are returned
        System.assertNotEquals(null, result, 'Result should not be null');
        System.assert(result.size() > 0, 'Contact list should not be empty');
    }
}
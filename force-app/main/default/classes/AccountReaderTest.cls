@isTest
public class AccountReaderTest {
    @testSetup
    static void setupTestData() {
        // Creating test Account records
        List<Account> accounts = new List<Account>();
        for (Integer i = 1; i <= 5; i++) {
            accounts.add(new Account(Name = 'Test Account ' + i, Industry = 'Technology', Phone = '1234567890', Type = 'Customer'));
        }
        insert accounts;
    }
 
    @isTest
    static void testGetAccounts() {
        Test.startTest();
        List<Account> result = AccountReader.getAccounts();
        Test.stopTest();
 
        // Asserting that some records are returned
        System.assertNotEquals(null, result, 'Result should not be null');
        System.assert(result.size() > 0, 'Account list should not be empty');
    }
}
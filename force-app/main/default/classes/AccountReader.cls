public with sharing class AccountReader {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        try {
            return [SELECT Id, Name, Industry, Phone, Type FROM Account LIMIT 50];
        } catch (Exception e) {
            System.debug('Error fetching Accounts: ' + e.getMessage());
            return new List<Account>();
        }
    }
}
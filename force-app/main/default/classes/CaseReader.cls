public with sharing class CaseReader {
    
    // Singleton instance
    private static CaseReader instance;
    
    // Private constructor to prevent instantiation
    private CaseReader() {}
    
    // Method to get the singleton instance
    public static CaseReader getInstance() {
        if (instance == null) {
            instance = new CaseReader();
        }
        return instance;
    }
    
    // Method to get a list of cases based on status
    public List<Case> getCasesByStatus(String caseStatus) {
        if (!hasPermission()) {
            throw new SecurityException('Insufficient permissions to access cases.');
        }
        return [SELECT Id, CaseNumber, Status, Subject FROM Case WHERE Status = :caseStatus];
    }
    
    // Method to get a single case by CaseNumber
    public Case getCaseByNumber(String caseNumber) {
        if (!hasPermission()) {
            throw new SecurityException('Insufficient permissions to access cases.');
        }
        List<Case> cases = [SELECT Id, CaseNumber, Status, Subject FROM Case WHERE CaseNumber = :caseNumber LIMIT 1];
        return cases.isEmpty() ? null : cases[0];
    }
    
    // Method to check if the user has the necessary permissions
    private Boolean hasPermission() {
        // Implement your permission check logic here
        return true; // Placeholder, replace with actual permission check
    }
}
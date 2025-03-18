public with sharing class OpportunityReader {
    
    // Singleton instance
    private static OpportunityReader instance;
    
    // Private constructor to prevent instantiation
    private OpportunityReader() {}
    
    // Method to get the singleton instance
    public static OpportunityReader getInstance() {
        if (instance == null) {
            instance = new OpportunityReader();
        }
        return instance;
    }
    
    // Method to get a list of opportunities based on stage
    public List<Opportunity> getOpportunitiesByStage(String stageName) {
        if (!hasPermission()) {
            throw new SecurityException('Insufficient permissions to access opportunities.');
        }
        return [SELECT Id, Name, StageName, Amount FROM Opportunity WHERE StageName = :stageName];
    }
    
    // Method to get a single opportunity by Opportunity Name
    public Opportunity getOpportunityByName(String opportunityName) {
        if (!hasPermission()) {
            throw new SecurityException('Insufficient permissions to access opportunities.');
        }
        List<Opportunity> opportunities = [SELECT Id, Name, StageName, Amount FROM Opportunity WHERE Name = :opportunityName LIMIT 1];
        return opportunities.isEmpty() ? null : opportunities[0];
    }
    
    // Method to check if the user has the necessary permissions
    private Boolean hasPermission() {
        // Implement your permission check logic here
        return true; // Placeholder, replace with actual permission check
    }
}
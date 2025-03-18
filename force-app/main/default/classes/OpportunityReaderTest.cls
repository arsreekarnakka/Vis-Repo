@isTest
public class OpportunityReaderTest {
    
    private static final String STAGE_CLOSED_WON = 'Closed Won';
    private static final String STAGE_PROSPECTING = 'Prospecting';
    
    @testSetup
    static void setupTestData() {
        // Create sample opportunities
        List<Opportunity> opportunityList = new List<Opportunity>{
            new Opportunity(Name = 'Opportunity 1', StageName = STAGE_PROSPECTING, Amount = 10000),
            new Opportunity(Name = 'Opportunity 2', StageName = STAGE_CLOSED_WON, Amount = 20000),
            new Opportunity(Name = 'Opportunity 3', StageName = STAGE_PROSPECTING, Amount = 15000)
        };
        insert opportunityList;
    }
    
    @isTest
    static void testGetOpportunitiesByStage() {
        Test.startTest();
        
        // Fetch opportunities with stage 'Prospecting'
        List<Opportunity> prospectingOpportunities = OpportunityReader.getInstance().getOpportunitiesByStage(STAGE_PROSPECTING);
        
        Test.stopTest();
        
        System.assertNotEquals(0, prospectingOpportunities.size(), 'Opportunities with stage Prospecting should be returned');
        for (Opportunity o : prospectingOpportunities) {
            System.assertEquals(STAGE_PROSPECTING, o.StageName, 'All returned opportunities should have stage Prospecting');
        }
    }
    
    @isTest
    static void testGetOpportunityByName() {
        // Fetch a test opportunity from setup data
        Opportunity testOpportunity = [SELECT Name FROM Opportunity LIMIT 1];
 
        Test.startTest();
        
        Opportunity retrievedOpportunity = OpportunityReader.getInstance().getOpportunityByName(testOpportunity.Name);
        
        Test.stopTest();
        
        System.assertNotEquals(null, retrievedOpportunity, 'Opportunity should be found');
        System.assertEquals(testOpportunity.Name, retrievedOpportunity.Name, 'Opportunity Name should match');
    }
}
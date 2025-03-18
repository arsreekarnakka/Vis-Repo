@isTest
public class CaseReaderTest {
    
    private static final String STATUS_NEW = 'New';
    private static final String STATUS_CLOSED = 'Closed';
    
    @testSetup
    static void setupTestData() {
        // Create sample cases
        List<Case> caseList = new List<Case>{
            new Case(Status = STATUS_NEW, Subject = 'Test Case 1'),
            new Case(Status = STATUS_CLOSED, Subject = 'Test Case 2'),
            new Case(Status = STATUS_NEW, Subject = 'Test Case 3')
        };
        insert caseList;
    }
    
    @isTest
    static void testGetCasesByStatus() {
        Test.startTest();
        
        // Fetch cases with status 'New'
        List<Case> newCases = CaseReader.getInstance().getCasesByStatus(STATUS_NEW);
        
        Test.stopTest();
        
        System.assertNotEquals(0, newCases.size(), 'Cases with status New should be returned');
        for (Case c : newCases) {
            System.assertEquals(STATUS_NEW, c.Status, 'All returned cases should have status New');
        }
    }
    
    @isTest
    static void testGetCaseByNumber() {
        // Fetch a test case from setup data
        Case testCase = [SELECT CaseNumber FROM Case LIMIT 1];
 
        Test.startTest();
        
        Case retrievedCase = CaseReader.getInstance().getCaseByNumber(testCase.CaseNumber);
        
        Test.stopTest();
        
        System.assertNotEquals(null, retrievedCase, 'Case should be found');
        System.assertEquals(testCase.CaseNumber, retrievedCase.CaseNumber, 'Case Number should match');
    }
}
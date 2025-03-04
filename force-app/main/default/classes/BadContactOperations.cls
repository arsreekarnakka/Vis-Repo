public class BadContactOperations {

    public static void processContacts(List<Id> contactIds) {
        List<Contact> contacts = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Id IN :contactIds];

        for (Contact c : contacts) {
            if (c.Email != null) {
                String[] parts = c.Email.split("@");
                String domain = parts[1]; // Potential ArrayIndexOutOfBoundsException

                if (domain.equals("example.com")) {
                    c.LastName = 'Invalid Domain';
                    update c; // DML inside loop - very bad!
                }
            }
        }
    }

    public static Contact findContact(String firstName, String lastName) {
        Contact contact;
        try {
            contact = [SELECT Id, FirstName, LastName FROM Contact WHERE FirstName = :firstName]; // Missing LastName in WHERE clause
        } catch (Exception e) {
            System.debug('Error: ' + e.getMessage()); // Generic exception handling - not good!
        }
        return contact; // Potential null return
    }

    public static void updateContactEmail(Id contactId, String newEmail) {
        Contact c = new Contact(Id = contactId);
        c.Email = newEmail;
        update c; // No try-catch block!
    }

    public static void deleteContacts(List<Contact> contacts) {
        delete contacts; // No null or empty check
    }

    public static void someUnusedMethod(String someString) {
        String unusedString = someString + "test"; // Unused variable
    }

    public static void longMethod() {
        // ... Imagine many, many lines of code here ...
        // ... Very hard to read and maintain ...
        // ... Duplicated logic ...
        // ... No clear purpose ...
        // ... No comments ...
        // ... Magic numbers ...
        // ... Deeply nested if statements ...
        // ... And more ...
    }
}
public class ContactReader {

    // Method to retrieve all Contact records
    public static List<Contact> getAllContacts() {
        List<Contact> contacts;

        try {
            contacts = [SELECT Id, FirstName, LastName, Email, Phone, AccountId FROM Contact];
        } catch (QueryException e) {
            System.debug('Error retrieving contacts: ' + e.getMessage());
            contacts = null; // Or handle the exception in a way that suits your needs
        }

        return contacts;
    }

    // Method to retrieve a Contact by ID
    public static Contact getContactById(Id contactId) {
        Contact contact;

        try {
            contact = [SELECT Id, FirstName, LastName, Email, Phone, AccountId FROM Contact WHERE Id = :contactId];
        } catch (QueryException e) {
            System.debug('Contact not found: ' + e.getMessage());
            contact = null; // Or handle the exception
        }

        return contact;
    }

    // Method to retrieve Contacts by last name
    public static List<Contact> getContactsByLastName(String lastName) {
        List<Contact> contacts;

        try {
            contacts = [SELECT Id, FirstName, LastName, Email, Phone, AccountId FROM Contact WHERE LastName = :lastName];
        } catch (QueryException e) {
            System.debug('Error retrieving contacts by last name: ' + e.getMessage());
            contacts = null; // Or handle the exception
        }

        return contacts;
    }

    // Method to print contact details to the debug log
    public static void printContactDetails(List<Contact> contacts) {
        if (contacts != null && !contacts.isEmpty()) {
            for (Contact contact : contacts) {
                System.debug('Contact ID: ' + contact.Id);
                System.debug('First Name: ' + contact.FirstName);
                System.debug('Last Name: ' + contact.LastName);
                System.debug('Email: ' + contact.Email);
                System.debug('Phone: ' + contact.Phone);
                System.debug('Account ID: ' + contact.AccountId);
                System.debug('--------------------');
            }
        } else {
            System.debug('No contacts found or an error occurred.');
        }
    }

    // Example usage (Execute Anonymous):
    public static void exampleUsage() {
        // Get all contacts and print their details
        List<Contact> allContacts = getAllContacts();
        printContactDetails(allContacts);

        // Get a contact by ID and print their details. Replace '003...' with a real Contact ID
        Contact singleContact = getContactById('003xxxxxxxxxxxxxxx');
        printContactDetails(new List<Contact>{singleContact}); // Pass the single contact in a list

        // Get contacts by last name and print their details. Replace 'Smith' with a real last name
        List<Contact> smithContacts = getContactsByLastName('Smith');
        printContactDetails(smithContacts);
    }
}
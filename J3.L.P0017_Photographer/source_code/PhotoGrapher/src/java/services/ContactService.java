package services;

import entity.Contact;
import dao.ContactDao;

public class ContactService {

    private final ContactDao contactDao;

    public ContactService() {
        contactDao = new ContactDao();
    }

    public Contact getContact()
            throws Exception {
        return contactDao.getContact();
    }

}

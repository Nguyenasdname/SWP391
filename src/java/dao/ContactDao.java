/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.Contact;

/**
 *
 * @author Admin
 */
public interface ContactDao {
    Contact getContactByID(int contactId);
    ArrayList<Contact> getAllListContact();
    ArrayList<Contact> getAllListDetailsContact();
    Contact getDetailsContactByContactID(int contactId);
    void addContact(Contact contact); 
    void updateContact(Contact contact);
    void removeContactByID(int contactId);
    void setSeenContactByID(int contactId);
    void setRefundedContactByID(int contactId);
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.imp;

import dao.ContactDao;
import database.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Booking;
import model.Contact;

/**
 *
 * @author Admin
 */
public class ContactDaoImp implements ContactDao {

    @Override
    public Contact getContactByID(int contactId) {
        Contact c = null;
        String sql = "Select * From Contact Where ContactID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, contactId);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    c = new Contact(
                            resultSet.getInt("ContactID"),
                            resultSet.getInt("UserID"),
                            resultSet.getString("ContactTitle"),
                            resultSet.getString("ContactContent"),
                            resultSet.getString("ContactStatus"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getString("RefundStatus")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

    @Override
    public ArrayList<Contact> getAllListContact() {
        ArrayList<Contact> contactList = new ArrayList();
        String sql = "Select * From Contact";

        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    Contact c = new Contact(
                            resultSet.getInt("ContactID"),
                            resultSet.getInt("UserID"),
                            resultSet.getString("ContactTitle"),
                            resultSet.getString("ContactContent"),
                            resultSet.getString("ContactStatus"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getString("RefundStatus")
                    );

                    contactList.add(c);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return contactList;
    }

    @Override
    public ArrayList<Contact> getAllListDetailsContact() {
        ArrayList<Contact> contactList = new ArrayList();
        String sql = "SELECT * FROM Contact c JOIN Users u ON c.UserID = u.UserID";

        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    Contact c = new Contact(
                            resultSet.getInt("ContactID"),
                            resultSet.getInt("UserID"),
                            resultSet.getString("ContactTitle"),
                            resultSet.getString("ContactContent"),
                            resultSet.getString("ContactStatus"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getString("RefundStatus")
                    );
                    c.setUserFullName(resultSet.getString("UserLastName") + " " + resultSet.getString("UserFirstName"));
                    c.setUserEmail(resultSet.getString("UserEmail"));
                    contactList.add(c);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return contactList;
    }

    @Override
    public Contact getDetailsContactByContactID(int contactId) {
        Contact c = null;
        String sql = "SELECT * FROM \n"
                + "Contact c JOIN Users u ON c.UserID = u.UserID\n"
                + "Where c.ContactID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, contactId);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    c = new Contact(
                            resultSet.getInt("ContactID"),
                            resultSet.getInt("UserID"),
                            resultSet.getString("ContactTitle"),
                            resultSet.getString("ContactContent"),
                            resultSet.getString("ContactStatus"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getString("RefundStatus")
                    );
                    c.setUserFullName(resultSet.getString("UserLastName") + " " + resultSet.getString("UserFirstName"));
                    c.setUserEmail(resultSet.getString("UserEmail"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

    @Override
    public void addContact(Contact contact) {
        String sql = "Insert Into Contact(UserID, ContactTitle, ContactContent, RefundStatus)\n"
                + "Values(?, ?, ?, ?)";

        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, contact.getUserId());
            preStatement.setString(2, contact.getContactTitle());
            preStatement.setString(3, contact.getContactContent());
            preStatement.setString(4, contact.getRefundStatus());

            preStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateContact(Contact contact) {
        String sql = "Update Contact Set "
                + "ContactTitle = ?, "
                + "ContactContent = ?, "
                + "ContactStatus = ? "
                + "Where ContactID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setString(1, contact.getContactTitle());
            preStatement.setString(2, contact.getContactContent());
            preStatement.setString(3, contact.getContactStatus());
            preStatement.setInt(4, contact.getContactId());

            preStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeContactByID(int contactId
    ) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void setSeenContactByID(int contactId) {
        String sql = "Update Contact set ContactStatus = 'Seen' Where ContactID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, contactId);

            preStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void setRefundedContactByID(int contactId) {
        String sql = "Update Contact set RefundStatus = 'Refunded' Where ContactID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, contactId);

            preStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}

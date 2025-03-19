/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.imp;

import com.sun.jdi.connect.spi.Connection;
import dao.PaymentDao;
import database.ConnectionDatabase;
import java.util.ArrayList;
import model.Payment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class PaymentDaoImp implements PaymentDao {

    @Override
    public Payment getPaymentByID(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Payment> getAllPaymentList() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void addPayment(Payment payment) {
        String sql = "INSERT INTO Payments (UserID, BookingID, PaymentAmount, PaymentMethod, PaymentStatus, PromotionID, PaymentDescription) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (
                java.sql.Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, payment.getUserId());
            preStatement.setInt(2, payment.getBookingId());
            preStatement.setDouble(3, payment.getPaymentAmount());
            preStatement.setString(4, payment.getPaymentMethod());
            preStatement.setString(5, payment.getPaymentStatus());

            if (payment.getPromotionId() > 0) {
                preStatement.setInt(6, payment.getPromotionId());
            } else {
                preStatement.setNull(6, java.sql.Types.INTEGER);
            }

            preStatement.setString(7, payment.getPaymentDescription());

            preStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updatePayment(Payment payment) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void removePaymentById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Payment getPaymentByPaymentDesc(String paymentDescription) {
        Payment p = null;
        String sql = "Select * from Payments\n"
                + "Where PaymentDescription Like ?";

        try (
                java.sql.Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            preStatement.setString(1, "%" + paymentDescription + "%");

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    p = new Payment(
                            resultSet.getInt("PaymentID"),
                            resultSet.getInt("UserID"),
                            resultSet.getInt("BookingID"),
                            resultSet.getDouble("PaymentAmount"),
                            resultSet.getString("PaymentMethod"),
                            resultSet.getString("PaymentStatus"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getInt("PromotionID"),
                            resultSet.getString("PaymentDescription")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    @Override
    public ArrayList<Payment> getListPaymentByUserId(int userId) {
        ArrayList<Payment> paymentList = new ArrayList();
        String sql = "Select * from Payments Where UserID = ?";
        try (
                java.sql.Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, userId);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    Payment p = new Payment(
                            resultSet.getInt("PaymentID"),
                            resultSet.getInt("UserID"),
                            resultSet.getInt("BookingID"),
                            resultSet.getDouble("PaymentAmount"),
                            resultSet.getString("PaymentMethod"),
                            resultSet.getString("PaymentStatus"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getInt("PromotionID"),
                            resultSet.getString("PaymentDescription")
                    );
                    paymentList.add(p);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return paymentList;
    }

}

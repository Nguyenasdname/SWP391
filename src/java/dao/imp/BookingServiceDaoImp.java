/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.imp;

import dao.BookingServiceDao;
import database.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import model.BookingService;

/**
 *
 * @author Admin
 */
public class BookingServiceDaoImp implements BookingServiceDao {

    @Override
    public BookingService getBookingServiceByID(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<BookingService> getAllBookingServiceList() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void addBookingService(BookingService bookingService) {
        String sql = "Insert into BookingService(BookingID ,ServiceID, Quantity, TotalPrice) Values(? , ?, ?, ?)";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);){
            
            preStatement.setInt(1, bookingService.getBookingId());
            preStatement.setInt(2 ,bookingService.getServiceId());
            preStatement.setInt(3, bookingService.getQuantity());
            preStatement.setDouble(4, bookingService.getTotalPrice());
            
            preStatement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void updateBookingService(BookingService bookingService) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void removeBookingServiceById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<BookingService> getListBookingServiceByUserId(int userId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}

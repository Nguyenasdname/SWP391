/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.imp;

import dao.BookingServiceDao;
import database.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.BookingService;

/**
 *
 * @author Admin
 */
public class BookingServiceDaoImp implements BookingServiceDao {
    
    @Override
    public BookingService getBookingServiceByID(int bookingId, int serviceId) {
        String sql = "SELECT * FROM BookingService WHERE BookingID = ? and ServiceID = ?";
        BookingService bookingService = null;
        
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, bookingId);
            preStatement.setInt(2, serviceId);
            
            ResultSet rs = preStatement.executeQuery();
            
            if (rs.next()) {
                bookingService = new BookingService();
                bookingService.setBookingId(rs.getInt("BookingID"));
                bookingService.setServiceId(rs.getInt("ServiceID"));
                bookingService.setQuantity(rs.getInt("Quantity"));
                bookingService.setTotalPrice(rs.getDouble("TotalPrice"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return bookingService;
    }
    
    @Override
    public ArrayList<BookingService> getAllBookingServiceList() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public void addBookingService(BookingService bookingService) {
        String sql = "Insert into BookingService(BookingID ,ServiceID, Quantity, TotalPrice) Values(? , ?, ?, ?)";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            
            preStatement.setInt(1, bookingService.getBookingId());
            preStatement.setInt(2, bookingService.getServiceId());
            preStatement.setInt(3, bookingService.getQuantity());
            preStatement.setDouble(4, bookingService.getTotalPrice());
            
            preStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public void updateBookingService(BookingService bookingService) {
        String sql = "UPDATE BookingService SET  Quantity = ?, TotalPrice = ? WHERE BookingId = ? and ServiceID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            
            preStatement.setInt(1, bookingService.getQuantity());
            preStatement.setDouble(2, bookingService.getTotalPrice());
            preStatement.setInt(3, bookingService.getBookingId());
            preStatement.setInt(4, bookingService.getServiceId());
            
            preStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public void removeBookingServiceById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public ArrayList<BookingService> getListBookingServiceByUserId(int userId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public ArrayList<BookingService> getListBookingServiceDetailsByBookingId(int bookingId) {
        ArrayList<BookingService> bookingServiceList = new ArrayList<>();
        String sql = "SELECT bs.BookingID, bs.ServiceID, s.ServiceName, bs.Quantity, bs.TotalPrice, s.ServicePrice\n"
                + "FROM BookingService bs\n"
                + "JOIN Services s ON bs.ServiceID = s.ServiceID\n"
                + "WHERE bs.BookingID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            
            preStatement.setInt(1, bookingId);
            
            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    BookingService bs = new BookingService(resultSet.getInt("BookingID"),
                            resultSet.getInt("ServiceID"),
                            resultSet.getInt("Quantity"),
                            resultSet.getDouble("TotalPrice")
                    );
                    bs.setServiceName(resultSet.getString("ServiceName"));
                    bs.setServicePrice(resultSet.getDouble("ServicePrice"));
                    bookingServiceList.add(bs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookingServiceList;
    }
    
}

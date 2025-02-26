/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.imp;

import dao.BookingDao;
import database.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Booking;
import java.time.LocalDate;
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class BookingDaoImp implements BookingDao {

    @Override
    public Booking getBookingByID(int id) {
        Booking b = null;
        String sql = "Select * From Booking Where BookingID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, id);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    b = new Booking(resultSet.getInt("BookingID"),
                            resultSet.getInt("UserID"),
                            resultSet.getInt("VillaID"),
                            resultSet.getDate("CheckIn"),
                            resultSet.getDate("CheckOut"),
                            resultSet.getString("BookingStatus"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getDouble("BookingTotal"),
                            resultSet.getInt("NumberOfGuest")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public ArrayList<Booking> getAllBookingList() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean addBooking(Booking booking) {
        String sql = "INSERT INTO Booking (UserID, VillaID, CheckIn, CheckOut, BookingStatus, BookingTotal, NumberOfGuest) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            java.sql.Date checkInDate = new java.sql.Date(booking.getCheckIn().getTime());
            java.sql.Date checkOutDate = new java.sql.Date(booking.getCheckOut().getTime());

            preStatement.setInt(1, booking.getUserId());
            preStatement.setInt(2, booking.getVillaId());
            preStatement.setDate(3, checkInDate);
            preStatement.setDate(4, checkOutDate);
            preStatement.setString(5, booking.getBookingStatus());
            preStatement.setDouble(6, booking.getBookingTotal());
            preStatement.setInt(7, booking.getNumberOfGuest());

            int rowsAffected = preStatement.executeUpdate();

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void updateBooking(Booking booking) {
        String sql = "UPDATE Booking SET UserID = ?, VillaID = ?, CheckIn = ?, CheckOut = ?, BookingTotal = ?, BookingStatus = ?, NumberOfGuest = ? WHERE BookingID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, booking.getUserId());
            preStatement.setInt(2, booking.getVillaId());
            preStatement.setDate(3, new java.sql.Date(booking.getCheckIn().getTime()));
            preStatement.setDate(4, new java.sql.Date(booking.getCheckOut().getTime()));
            preStatement.setDouble(5, booking.getBookingTotal());
            preStatement.setString(6, booking.getBookingStatus());
            preStatement.setInt(7, booking.getNumberOfGuest());
            preStatement.setInt(8, booking.getBookingId());

            preStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeBookingById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Booking getUserBookingVilla(int userId, int villaId, String bookingStatus) {
        Booking b = null;
        String sql = "Select * From Booking Where UserID = ? and VillaID = ? and BookingStatus = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, userId);
            preStatement.setInt(2, villaId);
            preStatement.setString(3, bookingStatus);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    b = new Booking(resultSet.getInt("BookingID"),
                            resultSet.getInt("UserID"),
                            resultSet.getInt("VillaID"),
                            resultSet.getDate("CheckIn"),
                            resultSet.getDate("CheckOut"),
                            resultSet.getString("BookingStatus"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getDouble("BookingTotal"),
                            resultSet.getInt("NumberOfGuest")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public Booking getBookingByUserId(int userId) {
        Booking b = null;
        String sql = "Select * From Booking Where UserID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, userId);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    b = new Booking(resultSet.getInt("BookingID"),
                            resultSet.getInt("UserID"),
                            resultSet.getInt("VillaID"),
                            resultSet.getDate("CheckIn"),
                            resultSet.getDate("CheckOut"),
                            resultSet.getString("BookingStatus"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getDouble("BookingTotal"),
                            resultSet.getInt("NumberOfGuest")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public Booking getBookingStatus(int userId, String bookingStatus) {
        Booking b = null;
        String sql = "Select * From Booking Where UserID = ? and BookingStatus = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, userId);
            preStatement.setString(2, bookingStatus);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    b = new Booking(resultSet.getInt("BookingID"),
                            resultSet.getInt("UserID"),
                            resultSet.getInt("VillaID"),
                            resultSet.getDate("CheckIn"),
                            resultSet.getDate("CheckOut"),
                            resultSet.getString("BookingStatus"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getDouble("BookingTotal"),
                            resultSet.getInt("NumberOfGuest")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public ArrayList<Booking> getListBookingByUserId(int userId) {
        ArrayList<Booking> bookingList = new ArrayList<>();
        String sql = "SELECT b.BookingID, b.VillaID, b.UserID, b.CheckIn, b.CheckOut, b.BookingStatus, b.CreateDate,  b.BookingTotal, v.VillaName, b.NumberOfGuest\n"
                + "FROM Booking b  \n"
                + "JOIN Villas v ON b.VillaID = v.VillaID \n"
                + "WHERE b.UserID = ? ORDER BY b.CreateDate DESC";

        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, userId);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    Booking b = new Booking(
                            resultSet.getInt("BookingID"),
                            resultSet.getInt("UserID"),
                            resultSet.getInt("VillaID"),
                            resultSet.getDate("CheckIn"),
                            resultSet.getDate("CheckOut"),
                            resultSet.getString("BookingStatus"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getDouble("BookingTotal"),
                            resultSet.getInt("NumberOfGuest")
                    );
                    b.setVillaName(resultSet.getString("VillaName"));
                    bookingList.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookingList;
    }

    @Override
    public Booking getBookingDetailByID(int bookingId) {
        Booking b = null;
        String sql = "SELECT b.BookingID, b.VillaID, b.UserID, b.CheckIn, b.CheckOut, b.BookingStatus, b.CreateDate,  b.BookingTotal, v.VillaName, b.NumberOfGuest\n"
                + "FROM Booking b  \n"
                + "JOIN Villas v ON b.VillaID = v.VillaID \n"
                + "WHERE b.BookingID = ? ORDER BY b.CreateDate DESC";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, bookingId);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    b = new Booking(resultSet.getInt("BookingID"),
                            resultSet.getInt("UserID"),
                            resultSet.getInt("VillaID"),
                            resultSet.getDate("CheckIn"),
                            resultSet.getDate("CheckOut"),
                            resultSet.getString("BookingStatus"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getDouble("BookingTotal"),
                            resultSet.getInt("NumberOfGuest")
                    );
                    b.setVillaName(resultSet.getString("VillaName"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public void setBookingStatusCancel(int bookingId) {
        String sql = "Update Booking \n"
                + "Set BookingStatus = 'Cancelled' Where BookingID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, bookingId);

            preStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.BookingService;

/**
 *
 * @author Admin
 */
public interface BookingServiceDao {
    BookingService getBookingServiceByID(int id);
    ArrayList<BookingService> getAllBookingServiceList(); 
    void addBookingService(BookingService bookingService);
    void updateBookingService(BookingService bookingService); 
    void removeBookingServiceById(int id);
    ArrayList<BookingService> getListBookingServiceByUserId(int userId);
}

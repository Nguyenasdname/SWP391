/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package emailService;

import java.util.ArrayList;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import model.Booking;
import model.BookingService;
import model.User;

/**
 *
 * @author Admin
 */
public interface JavaMail {
    String generatedOTP();
    boolean sendVerifyOTP(User user);
    boolean sendForgotPassword(User user);
    boolean sendDiscountNotification(String messageContent, User user);
    boolean sendConfirmBooking(Booking booking, User user, ArrayList<BookingService> bookingServiceList);
    boolean sendReplyContact(String title, String Content, String userEmail, String userContact);
    boolean sendPaymentConfirmation(Booking booking, User user, ArrayList<BookingService> bookingServiceList);
}

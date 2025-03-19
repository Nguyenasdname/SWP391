package emailService;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Booking;
import model.BookingService;
import model.User;

public class JavaMailImp implements JavaMail {

    private static final String OTP_CHARACTERS = "0123456789";
    private static final int OTP_LENGTH = 6;

    @Override
    public String generatedOTP() {
        SecureRandom random = new SecureRandom();
        StringBuilder otp = new StringBuilder(OTP_LENGTH);
        for (int i = 0; i < OTP_LENGTH; i++) {
            int index = random.nextInt(OTP_CHARACTERS.length());
            otp.append(OTP_CHARACTERS.charAt(index));
        }
        return otp.toString();
    }

    private Session getMailSession() {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", EmailProperty.HOST_NAME);
        props.put("mail.smtp.socketFactory.port", EmailProperty.SSL_PORT);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.port", EmailProperty.SSL_PORT);

        return Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EmailProperty.APP_EMAIL, EmailProperty.APP_PASSWORD);
            }
        });
    }

    private boolean sendEmail(MimeMessage message) {
        try {
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean sendVerifyOTP(User user) {
        try {
            Session session = getMailSession();
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getUserEmail()));
            message.setSubject("Verify Your Account");

            String verificationLink = "http://localhost:8080/BookingResort/verify.jsp";
            String emailBody = "<html>"
                    + "<head>"
                    + "<meta charset='UTF-8'>"
                    + "<meta name='viewport' content='width=device-width, initial-scale=1.0'>"
                    + "<title>Email Verification</title>"
                    + "<style>"
                    + "body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; }"
                    + ".container { max-width: 600px; margin: 30px auto; background: #ffffff; padding: 30px; border-radius: 10px; box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1); text-align: center; }"
                    + ".header { padding-bottom: 20px; }"
                    + ".header img { max-width: 150px; margin-bottom: 10px; }"
                    + ".header h2 { color: #2E86C1; margin: 0; font-size: 24px; }"
                    + ".content { padding: 20px; }"
                    + ".content p { font-size: 16px; color: #555; line-height: 1.5; }"
                    + ".otp { font-size: 28px; font-weight: bold; color: #E74C3C; margin: 20px 0; display: inline-block; padding: 12px 24px; background: #fce4e4; border-radius: 5px; letter-spacing: 2px; }"
                    + ".btn { display: inline-block; padding: 14px 24px; margin-top: 20px; background: #28A745; color: #fff; text-decoration: none; font-size: 18px; font-weight: bold; border-radius: 5px; transition: background 0.3s; }"
                    + ".btn:hover { background: #218838; }"
                    + ".footer { margin-top: 30px; font-size: 14px; color: #777; text-align: center; border-top: 1px solid #ddd; padding-top: 15px; }"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<div class='header'>"
                    + "<img src='https://i.imgur.com/UH6GGZ6.png' alt='Logo'>"
                    + "<h2>Account Verification</h2>"
                    + "</div>"
                    + "<div class='content'>"
                    + "<p>Dear " + user.getUserName() + ",</p>"
                    + "<p>Please use the OTP code below to verify your email:</p>"
                    + "<div class='otp'>" + user.getUserCode() + "</div>"
                    + "<p>This OTP is valid for <strong>10 minutes</strong>.</p>"
                    + "<a href='' class='btn'>Verify Account</a>"
                    + "</div>"
                    + "<div class='footer'>"
                    + "<p>If you did not request this, please ignore this email.</p>"
                    + "<p>&copy; 2025 Your Company. All rights reserved.</p>"
                    + "</div>"
                    + "</div>"
                    + "</body>"
                    + "</html>";

            message.setContent(emailBody, "text/html; charset=utf-8");
            return sendEmail(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean sendForgotPassword(User user) {
        try {
            Session session = getMailSession();
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getUserEmail()));
            message.setSubject("Password Reset Request");

            String emailBody = "<html>"
                    + "<head>"
                    + "<meta charset='UTF-8'>"
                    + "<meta name='viewport' content='width=device-width, initial-scale=1.0'>"
                    + "<title>Email Verification</title>"
                    + "<style>"
                    + "body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; }"
                    + ".container { max-width: 600px; margin: 30px auto; background: #ffffff; padding: 30px; border-radius: 10px; box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1); text-align: center; }"
                    + ".header { padding-bottom: 20px; }"
                    + ".header img { max-width: 150px; margin-bottom: 10px; }"
                    + ".header h2 { color: #2E86C1; margin: 0; font-size: 24px; }"
                    + ".content { padding: 20px; }"
                    + ".content p { font-size: 16px; color: #555; line-height: 1.5; }"
                    + ".otp { font-size: 28px; font-weight: bold; color: #E74C3C; margin: 20px 0; display: inline-block; padding: 12px 24px; background: #fce4e4; border-radius: 5px; letter-spacing: 2px; }"
                    + ".btn { display: inline-block; padding: 14px 24px; margin-top: 20px; background: #28A745; color: #fff; text-decoration: none; font-size: 18px; font-weight: bold; border-radius: 5px; transition: background 0.3s; }"
                    + ".btn:hover { background: #218838; }"
                    + ".footer { margin-top: 30px; font-size: 14px; color: #777; text-align: center; border-top: 1px solid #ddd; padding-top: 15px; }"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<div class='header'>"
                    + "<img src='https://i.imgur.com/UH6GGZ6.png' alt='Logo'>"
                    + "<h2>Account Verification</h2>"
                    + "</div>"
                    + "<div class='content'>"
                    + "<p>Dear " + user.getUserName() + ",</p>"
                    + "<p>Please use the OTP code below to verify your email:</p>"
                    + "<div class='otp'>" + user.getUserCode() + "</div>"
                    + "<p>This OTP is valid for <strong>10 minutes</strong>.</p>"
                    + "<a href='' class='btn'>Verify Account</a>"
                    + "</div>"
                    + "<div class='footer'>"
                    + "<p>If you did not request this, please ignore this email.</p>"
                    + "<p>&copy; 2025 Your Company. All rights reserved.</p>"
                    + "</div>"
                    + "</div>"
                    + "</body>"
                    + "</html>";

            message.setContent(emailBody, "text/html; charset=utf-8");
            return sendEmail(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean sendDiscountNotification(String messageContent, User user) {
        try {
            Session session = getMailSession();
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getUserEmail()));
            message.setSubject("Exclusive Discount Just for You!");

            String emailBody = "<html><body><h2>Special Discount!</h2><p>" + messageContent + "</p></body></html>";

            message.setContent(emailBody, "text/html; charset=utf-8");
            return sendEmail(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean sendConfirmBooking(Booking booking, User user, ArrayList<BookingService> bookingServiceList) {
        try {
            Session session = getMailSession();
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getUserEmail()));
            message.setSubject("Comfirm Your Booking");
            String customerName = booking.getUserFullName().equals("null null") ? booking.getUserName() : booking.getUserFullName();
            String bookingLink = "http://localhost:8080/BookingResort/bookingDetails?bookingId=" + booking.getBookingId();
            String serviceRows = "";
            String companyWebsite = "http://localhost:8080/BookingResort/";
            for (BookingService bookingService : bookingServiceList) {
                serviceRows += "<tr>"
                        + "<td>" + bookingService.getServiceName() + "</td>"
                        + "<td>" + bookingService.getQuantity() + "</td>"
                        + "<td>" + bookingService.getServicePrice() + "</td>"
                        + "<td>" + bookingService.getTotalPrice() + "</td>"
                        + "</tr>";
            }
            String emailBody = "<html>"
                    + "<head>"
                    + "<meta charset='UTF-8'>"
                    + "<meta name='viewport' content='width=device-width, initial-scale=1.0'>"
                    + "<title>Booking Confirmation</title>"
                    + "<style>"
                    + "body { font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px; margin: 0; }"
                    + ".container { max-width: 600px; margin: auto; background: #ffffff; padding: 20px; border-radius: 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); }"
                    + ".header { text-align: center; padding-bottom: 20px; border-bottom: 2px solid #ddd; }"
                    + ".header h2 { color: #2E86C1; margin: 0; }"
                    + ".content { padding: 20px 0; }"
                    + ".table { width: 100%; border-collapse: collapse; margin-top: 20px; }"
                    + ".table th, .table td { border: 1px solid #ddd; padding: 10px; text-align: left; }"
                    + ".table th { background: #2E86C1; color: #ffffff; }"
                    + ".footer { margin-top: 20px; text-align: center; font-size: 14px; color: #555; border-top: 1px solid #ddd; padding-top: 10px; }"
                    + ".button { display: inline-block; padding: 10px 20px; margin-top: 15px; background: #2E86C1; color: white; text-decoration: none; border-radius: 5px; }"
                    + ".highlight { font-weight: bold; color: #2E86C1; }"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<div class='header'>"
                    + "<h2>🎉 Booking Confirmed! 🎉</h2>"
                    + "<p>Dear <span class='highlight'>" + customerName + "</span>,</p>"
                    + "<p>We are pleased to confirm your booking at our luxurious villa. Here are the details:</p>"
                    + "</div>"
                    + "<div class='content'>"
                    + "<h3>🏡 Booking Details</h3>"
                    + "<table class='table'>"
                    + "<tr><th>Villa Name</th><th>Guests</th><th>Check-in</th><th>Check-out</th><th>Total Price</th></tr>"
                    + "<tr>"
                    + "<td>" + booking.getVillaName() + "</td>"
                    + "<td>" + booking.getNumberOfGuest() + "</td>"
                    + "<td>" + booking.getCheckIn() + "</td>"
                    + "<td>" + booking.getCheckOut() + "</td>"
                    + "<td>" + booking.getBookingTotal() + "</td>"
                    + "</tr>"
                    + "</table>"
                    + "<h3>🛎️ Additional Services</h3>"
                    + "<table class='table'>"
                    + "<tr><th>Service Name</th><th>Quantity</th><th>Price</th><th>Total Price</th></tr>"
                    + serviceRows
                    + "</table>"
                    + "<h3>📌 Check-in Information</h3>"
                    + "<p>🏡 <strong>Villa Address:</strong> FPT Urban Area, Ngu Hanh Son District, Da Nang City</p>"
                    + "<h3>📞 Need Help?</h3>"
                    + "<p>If you have any questions, feel free to contact us at:</p>"
                    + "<p>📧 Email: <a href='mailto:bookingresortse18c02@gmail.com'>bookingresortse18c02@yourcompany.com</a></p>"
                    + "<p>📞 Phone: +123 456 7890</p>"
                    + "<p>🌍 Website: <a href='" + companyWebsite + "' target='_blank'>" + companyWebsite + "</a></p>"
                    + "<div style='text-align: center; margin-top: 20px;'>"
                    + "<a href='" + bookingLink + "' class='button'>View My Booking</a>"
                    + "</div>"
                    + "</div>"
                    + "<div class='footer'>"
                    + "<p>Thank you for choosing our service. We look forward to welcoming you! 🏡✨</p>"
                    + "<p>&copy; 2025 Booking Resort. All rights reserved.</p>"
                    + "</div>"
                    + "</div>"
                    + "</body>"
                    + "</html>";

            message.setContent(emailBody, "text/html; charset=utf-8");
            return sendEmail(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean sendReplyContact(String title, String Content, String userEmail, String userContact) {
        try {
            Session session = getMailSession();
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
            message.setSubject(title);

            String emailBody = "<html>"
                    + "<head>"
                    + "<meta charset='UTF-8'>"
                    + "<meta name='viewport' content='width=device-width, initial-scale=1.0'>"
                    + "<title>Contact Reply Details</title>"
                    + "<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css' rel='stylesheet'>"
                    + "<style>"
                    + "body { background-color: #eef2f5; }"
                    + ".container { max-width: 700px; margin-top: 50px; }"
                    + ".card { border-radius: 12px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }"
                    + ".card-header { background: linear-gradient(135deg, #007bff, #00d4ff); color: white; font-size: 1.2rem; font-weight: bold; text-align: center; padding: 15px; border-radius: 12px 12px 0 0; }"
                    + ".message-box, .reply-box { padding: 15px; border-radius: 8px; box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.1); }"
                    + ".message-box { background-color: #fff; }"
                    + ".reply-box { background: linear-gradient(135deg, #28a745, #8bc34a); color: white; }"
                    + ".contact-info { margin-top: 20px; padding: 10px; background: #fff; border-radius: 8px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); text-align: center; }"
                    + ".contact-info a { color: #007bff; font-weight: bold; text-decoration: none; }"
                    + ".contact-info a:hover { text-decoration: underline; }"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<div class='card'>"
                    + "<div class='card-header'>Contact Reply</div>"
                    + "<div class='card-body'>"
                    + "<h5 class='card-title'>Your Contact</h5>"
                    + "<div class='message-box'>" + userContact + "</div>"
                    + "<hr>"
                    + "<h5 class='card-title'>Reply</h5>"
                    + "<div class='reply-box'>" + Content + "</div>"
                    + "<hr>"
                    + "<h3>📞 Need Help?</h3>"
                    + "<p>If you have any questions, feel free to contact us at:</p>"
                    + "<p>📧 Email: <a href='mailto:bookingresortse18c02@gmail.com'>bookingresortse18c02@yourcompany.com</a></p>"
                    + "<p>📞 Phone: +123 456 7890</p>"
                    + "<p>🌍 Website: <a href='http://localhost:8080/BookingResort/' target='_blank'>http://localhost:8080/BookingResort/</a></p>"
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js'></script>"
                    + "</body>"
                    + "</html>";

            message.setContent(emailBody, "text/html; charset=utf-8");
            return sendEmail(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean sendPaymentConfirmation(Booking booking, User user, ArrayList<BookingService> bookingServiceList) {
        try {
            Session session = getMailSession();
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getUserEmail()));
            message.setSubject("Payment Confirmation Your Booking");

            String customerName = booking.getUserFullName().equals("null null") ? booking.getUserName() : booking.getUserFullName();
            String bookingLink = "http://localhost:8080/BookingResort/bookingDetails?bookingId=" + booking.getBookingId();
            String companyWebsite = "http://localhost:8080/BookingResort/";

            // Tạo hàng dịch vụ bổ sung
            String serviceRows = "";
            for (BookingService bookingService : bookingServiceList) {
                serviceRows += "<tr>"
                        + "<td>" + bookingService.getServiceName() + "</td>"
                        + "<td>" + bookingService.getQuantity() + "</td>"
                        + "<td>" + bookingService.getServicePrice() + "</td>"
                        + "<td>" + bookingService.getTotalPrice() + "</td>"
                        + "</tr>";
            }

            // Nội dung email HTML
            String emailBody = "<html>"
                    + "<head>"
                    + "<meta charset='UTF-8'>"
                    + "<meta name='viewport' content='width=device-width, initial-scale=1.0'>"
                    + "<title>Payment Confirmation</title>"
                    + "<style>"
                    + "body { font-family: 'Segoe UI', Arial, sans-serif; background-color: #f0f4f8; margin: 0; padding: 20px; }"
                    + ".container { max-width: 650px; margin: auto; background: #ffffff; border-radius: 15px; box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1); overflow: hidden; }"
                    + ".header { background: linear-gradient(135deg, #28A745, #34C759); padding: 30px; text-align: center; color: #ffffff; }"
                    + ".header h1 { margin: 0; font-size: 28px; font-weight: 600; }"
                    + ".header p { margin: 5px 0 0; font-size: 16px; opacity: 0.9; }"
                    + ".content { padding: 25px; }"
                    + ".content h3 { color: #2E86C1; font-size: 20px; margin-bottom: 15px; }"
                    + ".table { width: 100%; border-collapse: collapse; margin: 20px 0; }"
                    + ".table th, .table td { border: 1px solid #e0e0e0; padding: 12px; text-align: left; }"
                    + ".table th { background: #2E86C1; color: #ffffff; font-weight: 600; }"
                    + ".table td { background: #fafafa; }"
                    + ".highlight { font-weight: bold; color: #28A745; }"
                    + ".button { display: inline-block; padding: 12px 25px; margin-top: 20px; background: #2E86C1; color: #ffffff; text-decoration: none; border-radius: 8px; font-weight: 600; transition: background 0.3s; }"
                    + ".button:hover { background: #1F618D; }"
                    + ".footer { background: #f8f9fa; padding: 20px; text-align: center; font-size: 14px; color: #666; border-top: 1px solid #e0e0e0; }"
                    + ".footer a { color: #2E86C1; text-decoration: none; }"
                    + ".footer a:hover { text-decoration: underline; }"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<div class='header'>"
                    + "<h1>✅ Payment Confirmed!</h1>"
                    + "<p>Thank you for your payment, <span class='highlight'>" + customerName + "</span>!</p>"
                    + "</div>"
                    + "<div class='content'>"
                    + "<p>Dear " + customerName + ",</p>"
                    + "<p>We are excited to inform you that your payment for Booking #" + booking.getBookingId() + " has been successfully processed. Below are the details of your booking:</p>"
                    + "<h3>🏡 Booking Details</h3>"
                    + "<table class='table'>"
                    + "<tr><th>Villa Name</th><th>Guests</th><th>Check-in</th><th>Check-out</th><th>Total Paid</th></tr>"
                    + "<tr>"
                    + "<td>" + booking.getVillaName() + "</td>"
                    + "<td>" + booking.getNumberOfGuest() + "</td>"
                    + "<td>" + booking.getCheckIn() + "</td>"
                    + "<td>" + booking.getCheckOut() + "</td>"
                    + "<td class='highlight'>" + booking.getBookingTotal() + "</td>"
                    + "</tr>"
                    + "</table>"
                    + "<h3>🛎️ Additional Services</h3>"
                    + "<table class='table'>"
                    + "<tr><th>Service Name</th><th>Quantity</th><th>Price</th><th>Total Price</th></tr>"
                    + serviceRows
                    + "</table>"
                    + "<h3>📍 Check-in Information</h3>"
                    + "<p><strong>Villa Address:</strong> FPT Urban Area, Ngu Hanh Son District, Da Nang City</p>"
                    + "<p>We look forward to welcoming you! If you need to review your booking, click the button below:</p>"
                    + "<div style='text-align: center;'>"
                    + "<a href='" + bookingLink + "' class='button'>View My Booking</a>"
                    + "</div>"
                    + "</div>"
                    + "<div class='footer'>"
                    + "<p>Need assistance? Contact us at:</p>"
                    + "<p>📧 <a href='mailto:bookingresortse18c02@gmail.com'>bookingresortse18c02@yourcompany.com</a> | 📞 +123 456 7890</p>"
                    + "<p>🌍 <a href='" + companyWebsite + "'>" + companyWebsite + "</a></p>"
                    + "<p>© 2025 Booking Resort. All rights reserved.</p>"
                    + "</div>"
                    + "</div>"
                    + "</body>"
                    + "</html>";

            message.setContent(emailBody, "text/html; charset=utf-8");
            return sendEmail(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}

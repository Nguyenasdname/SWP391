/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package emailService;

import java.security.SecureRandom;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import models.User;

/**
 *
 * @author Admin
 */
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

    @Override
    public boolean send(String to, String subject, String messageContent, String emailType, User user) {
        // Get properties object
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", EmailProperty.HOST_NAME);
        props.put("mail.smtp.socketFactory.port", EmailProperty.SSL_PORT);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.port", EmailProperty.SSL_PORT);

        // get Session
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EmailProperty.APP_EMAIL, EmailProperty.APP_PASSWORD);
            }
        });

        // compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getUserEmail()));

            String emailBody = null;

            switch (emailType) {
                case "Verify_OTP":
//                    String verificationLink = "http://localhost:8080/TestProject2/VerifyNewAccount?email="
//                            + to + "&verifyCode=" + user.getUserCode();
                    
                    String verificationLink = "http://localhost:8080/BookingResort/verify.jsp";
                    message.setSubject(subject);
                    emailBody = "<html>"
                            + "<body style='font-family: Arial, sans-serif;'>"
                            + "<h2 style='color: #2E86C1;'>Account Verification</h2>"
                            + "<p>Thank you for signing up. Please use the OTP code below to verify your email:</p>"
                            + "<h3 style='color: #E74C3C;'>" + user.getUserCode() + "</h3>"
                            + "<p>This OTP is valid for <strong>10 minutes</strong>.</p>"
                            + "<a href='"+ verificationLink + "' style='padding: 10px 20px; background-color: #28A745; color: #fff; text-decoration: none;'>Verify Account</a>"
                            + "<p>If you did not request this, please ignore this email.</p>"
                            + "</body></html>";
                    break;
                case "Forgot_Password":
                    message.setSubject(subject);
                    emailBody = "<html>"
                            + "<body style='font-family: Arial, sans-serif;'>"
                            + "<h2 style='color: #2E86C1;'>Account Verification</h2>"
                            + "<p>Thank you for signing up. Please use the OTP code below to verify your email:</p>"
                            + "<h3 style='color: #E74C3C;'>" + messageContent + "</h3>"
                            + "<p>This OTP is valid for <strong>10 minutes</strong>.</p>"   
                            + "<a href='#' style='padding: 10px 20px; background-color: #28A745; color: #fff; text-decoration: none;'>Verify Account</a>"
                            + "<p>If you did not request this, please ignore this email.</p>"
                            + "</body></html>";
                    break;
                case "Discount_notification":
                    message.setSubject(subject);
                    message.setText(messageContent);
                    break;
                default:
                    message.setSubject(subject);
                    message.setText(messageContent);
                    break;
            }
            message.setContent(emailBody, "text/html; charset=utf-8");

            // send message
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}

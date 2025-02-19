/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package emailService;

import model.User;

/**
 *
 * @author Admin
 */
public interface JavaMail {
    boolean send(String to, String subject, String message, String emailType, User user);
    String generatedOTP();
}

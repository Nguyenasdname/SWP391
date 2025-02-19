/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;
import java.util.ArrayList;
import models.Feedback;
/**
 *
 * @author Admin
 */
public interface FeedbackDao {
    Feedback getFeedbackByID(int id);
    ArrayList<Feedback> getAllFeedbackList();
    void addFeedback(Feedback feedback);
    void updateFeedback(Feedback feedback);
    void removeFeedbackById(int id); 
}

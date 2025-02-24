/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.imp;

import dao.FeedbackDao;
import database.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Feedback;

/**
 *
 * @author Admin
 */
public class FeedbackDaoImp implements FeedbackDao {

    @Override
    public Feedback getFeedbackByID(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Feedback> getAllFeedbackList() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void addFeedback(Feedback feedback) {
        String sql = "Insert Into Feedback(UserID, VillaID, Rating, Comment) Values(?, ?, ?, ?)";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, feedback.getUserId());
            preStatement.setInt(2, feedback.getVillaId());
            preStatement.setInt(3, feedback.getRating());
            preStatement.setString(4, feedback.getComment());

            preStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateFeedback(Feedback feedback) {
        String sql = "Update Feedback Set UserID = ?, VillaID = ?, Rating = ?, Comment = ?, CreateDate = GETDATE() Where FeedbackID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, feedback.getUserId());
            preStatement.setInt(2, feedback.getVillaId());
            preStatement.setInt(3, feedback.getRating());
            preStatement.setString(4, feedback.getComment());
            preStatement.setInt(5, feedback.getFeedbackId());
            
            preStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeFeedbackById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Feedback> getAllFeedBackListByVillaID(int villaId) {
        ArrayList<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT \n"
                + "    f.FeedbackID,\n"
                + "    f.UserID,\n"
                + "    f.VillaID,\n"
                + "    f.Rating,\n"
                + "    f.Comment,\n"
                + "    f.CreateDate,\n"
                + "    u.UserName,\n"
                + "    u.UserIMG\n"
                + "FROM Feedback f\n"
                + "JOIN Users u ON f.UserID = u.UserID\n"
                + "WHERE f.VillaID = ?\n"
                + "ORDER BY f.CreateDate DESC;";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            preStatement.setInt(1, villaId);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    Feedback f = new Feedback(resultSet.getInt("FeedbackID"),
                            resultSet.getInt("UserID"),
                            resultSet.getInt("VillaID"),
                            resultSet.getInt("Rating"),
                            resultSet.getString("Comment"),
                            resultSet.getDate("CreateDate")
                    );
                    f.setUserName(resultSet.getString("UserName"));
                    f.setUserIMG(resultSet.getString("UserIMG"));
                    feedbackList.add(f);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

}

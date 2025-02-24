/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Feedback {
    private int feedbackId;
    private int userId;
    private int villaId;
    private int rating;
    private String comment;
    private Date createDate;
    private String userName;
    private String userIMG;

    public Feedback(int feedbackId, int userId, int villaId, int rating, String comment, Date createDate) {
        this.feedbackId = feedbackId;
        this.userId = userId;
        this.villaId = villaId;
        this.rating = rating;
        this.comment = comment;
        this.createDate = createDate;
    }

    public Feedback() {
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getVillaId() {
        return villaId;
    }

    public void setVillaId(int villaId) {
        this.villaId = villaId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserIMG() {
        return userIMG;
    }

    public void setUserIMG(String userIMG) {
        this.userIMG = userIMG;
    }
    
    @Override
    public String toString() {
        return "FeedBack{" + "feedbackId=" + feedbackId + ", userId=" + userId + ", villaId=" + villaId + ", rating=" + rating + ", comment=" + comment + ", createDate=" + createDate + '}';
    }
    
    
}

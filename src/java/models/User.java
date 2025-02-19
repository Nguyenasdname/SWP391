/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class User {
    private int userId;
    private String userName;
    private String userEmail;
    private String userPass;
    private String userPhone;
    private String userIMG;
    private String userAddress;
    private String userFirstName;
    private String userLastName;
    private String userStatus;
    private int roleId;
    private Date createDate;
    private String userCode;

    public User(int userId, String userName, String userEmail, String userPass, String userPhone, String userIMG, String userStatus, int roleId, Date createDate, String userAddress, String userFirstName, String userLastName) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPass = userPass;
        this.userPhone = userPhone;
        this.userIMG = userIMG;
        this.userStatus = userStatus;
        this.roleId = roleId;
        this.createDate = createDate;
        this.userAddress = userAddress;
        this.userFirstName = userFirstName;
        this.userLastName = userLastName;
    }

    public User() {
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserFirstName() {
        return userFirstName;
    }

    public void setUserFirstName(String userFirstName) {
        this.userFirstName = userFirstName;
    }

    public String getUserLastName() {
        return userLastName;
    }

    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }
    
    
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserIMG() {
        return userIMG;
    }

    public void setUserIMG(String userIMG) {
        this.userIMG = userIMG;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public String getFullName(){
        return userFirstName + " " + userLastName;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPass=" + userPass + ", userPhone=" + userPhone + ", userIMG=" + userIMG + ", userAddress=" + userAddress + ", userFirstName=" + userFirstName + ", userLastName=" + userLastName + ", userStatus=" + userStatus + ", roleId=" + roleId + ", createDate=" + createDate + ", userCode=" + userCode + '}';
    }

  

    
    
}

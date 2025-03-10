/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.imp;

import dao.UserDao;
import database.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author Admin
 */
public class UserDaoImp implements UserDao {

    @Override
    public User validateUser(String userName, String userPass) {
        User u = null;
        String sql = "SELECT * FROM Users WHERE (UserName = ? OR UserEmail = ?) AND UserPass = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            preStatement.setString(1, userName);
            preStatement.setString(2, userName);
            preStatement.setString(3, userPass);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    u = new User(resultSet.getInt("UserID"),
                            resultSet.getString("UserName"),
                            resultSet.getString("UserEmail"),
                            resultSet.getString("UserPass"),
                            resultSet.getString("UserPhone"),
                            resultSet.getString("UserIMG"),
                            resultSet.getString("UserStatus"),
                            resultSet.getInt("RoleID"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getString("UserAddress"),
                            resultSet.getString("UserFirstName"),
                            resultSet.getString("UserLastName")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    @Override
    public User getUserByID(int id) {
        User u = new User();
        String sql = "Select * From Users Where UserID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            preStatement.setInt(1, id);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    u = new User(resultSet.getInt("UserID"),
                            resultSet.getString("UserName"),
                            resultSet.getString("UserEmail"),
                            resultSet.getString("UserPass"),
                            resultSet.getString("UserPhone"),
                            resultSet.getString("UserIMG"),
                            resultSet.getString("UserStatus"),
                            resultSet.getInt("RoleID"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getString("UserAddress"),
                            resultSet.getString("UserFirstName"),
                            resultSet.getString("UserLastName")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    @Override
    public ArrayList<User> getAllUserList() {
        ArrayList<User> userList = new ArrayList();
        String sql = "Select * From Users";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    User u = new User(resultSet.getInt("UserID"),
                            resultSet.getString("UserName"),
                            resultSet.getString("UserEmail"),
                            resultSet.getString("UserPass"),
                            resultSet.getString("UserPhone"),
                            resultSet.getString("UserIMG"),
                            resultSet.getString("UserStatus"),
                            resultSet.getInt("RoleID"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getString("UserAddress"),
                            resultSet.getString("UserFirstName"),
                            resultSet.getString("UserLastName")
                    );
                    userList.add(u);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public void addUser(User user) {
        String sql = "INSERT INTO Users (UserName, UserEmail, UserPass, UserPhone, UserIMG, RoleID) VALUES (?, ?, ?, ?, ?, ?)";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setString(1, user.getUserName());
            preStatement.setString(2, user.getUserEmail());
            preStatement.setString(3, user.getUserPass());
            preStatement.setString(4, user.getUserPhone());
            preStatement.setString(5, user.getUserIMG());
            preStatement.setInt(6, user.getRoleId());

            preStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateUser(User user) {
        String sql = "UPDATE Users SET UserName = ?, UserEmail = ?, UserPass = ?, UserPhone = ?, UserIMG = ?, UserStatus = ?, RoleID = ?, UserAddress = ?, UserFirstName = ?, UserLastName = ? WHERE UserID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setString(1, user.getUserName());
            preStatement.setString(2, user.getUserEmail());
            preStatement.setString(3, user.getUserPass());
            preStatement.setString(4, user.getUserPhone());
            preStatement.setString(5, user.getUserIMG());
            preStatement.setString(6, user.getUserStatus());
            preStatement.setInt(7, user.getRoleId());
            preStatement.setString(8, user.getUserAddress());
            preStatement.setString(9, user.getUserFirstName());
            preStatement.setString(10, user.getUserLastName());
            preStatement.setInt(11, user.getUserId());

            preStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeUserById(int id) {
        String sql = "DELETE FROM Users WHERE UserID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, id);
            preStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public User isUserExists(String userName, String userEmail) {
        User u = null;
        String sql = "Select * From Users Where UserName = ? Or UserEmail = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            preStatement.setString(1, userName);
            preStatement.setString(2, userEmail);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    u = new User(resultSet.getInt("UserID"),
                            resultSet.getString("UserName"),
                            resultSet.getString("UserEmail"),
                            resultSet.getString("UserPass"),
                            resultSet.getString("UserPhone"),
                            resultSet.getString("UserIMG"),
                            resultSet.getString("UserStatus"),
                            resultSet.getInt("RoleID"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getString("UserAddress"),
                            resultSet.getString("UserFirstName"),
                            resultSet.getString("UserLastName")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    @Override
    public User getUserByUserName(String userName) {
        User u = null;
        String sql = "Select * From Users Where UserName = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            preStatement.setString(1, userName);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    u = new User(resultSet.getInt("UserID"),
                            resultSet.getString("UserName"),
                            resultSet.getString("UserEmail"),
                            resultSet.getString("UserPass"),
                            resultSet.getString("UserPhone"),
                            resultSet.getString("UserIMG"),
                            resultSet.getString("UserStatus"),
                            resultSet.getInt("RoleID"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getString("UserAddress"),
                            resultSet.getString("UserFirstName"),
                            resultSet.getString("UserLastName")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    @Override
    public ArrayList<User> getAllDetailsUserList() {
        ArrayList<User> userList = new ArrayList();
        String sql = "Select * from Users u\n"
                + "Join Roles r on u.RoleID = r.RoleID";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    User u = new User(resultSet.getInt("UserID"),
                            resultSet.getString("UserName"),
                            resultSet.getString("UserEmail"),
                            resultSet.getString("UserPass"),
                            resultSet.getString("UserPhone"),
                            resultSet.getString("UserIMG"),
                            resultSet.getString("UserStatus"),
                            resultSet.getInt("RoleID"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getString("UserAddress"),
                            resultSet.getString("UserFirstName"),
                            resultSet.getString("UserLastName")
                    );
                    u.setRoleName(resultSet.getString("RoleName"));
                    userList.add(u);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }

}

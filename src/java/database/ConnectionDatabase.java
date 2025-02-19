/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class ConnectionDatabase {
    
    public static Connection getConnection() throws SQLException {
        Connection connection = null;
        try{
            Class.forName(ConnectionProperty.driverName);
            connection = DriverManager.getConnection(ConnectionProperty.url, 
                    ConnectionProperty.user, 
                    ConnectionProperty.pass);
        } catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        return connection;
    }
}

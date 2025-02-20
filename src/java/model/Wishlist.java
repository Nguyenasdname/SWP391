/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Wishlist {
    private int userId;
    private int villaId;

    public Wishlist(int userId, int villaId) {
        this.userId = userId;
        this.villaId = villaId;
    }

    public Wishlist() {
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

    @Override
    public String toString() {
        return "Wishlist{" + "userId=" + userId + ", villaId=" + villaId + '}';
    }
    
    
}

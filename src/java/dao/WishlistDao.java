/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.Wishlist;

/**
 *
 * @author Admin
 */
public interface WishlistDao {
    Wishlist getWishlistByID(int id); 
    ArrayList<Wishlist> getAllWishlist();
    void addWishlist(Wishlist wishlist); 
    void updateWishlist(Wishlist wishlist); 
    void removeWishlistById(int id);
}

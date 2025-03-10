/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.Role;

/**
 *
 * @author Admin
 */
public interface RoleDao {
    Role getRoleByID(int id); 
    ArrayList<Role> getAllRoleList(); 
    void addRole(Role role); 
    void updateRole(Role role); 
    void removeRoleById(int id);
}

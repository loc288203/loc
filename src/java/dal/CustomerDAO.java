/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Customer;

/**
 *
 *@author admin
 */
public class CustomerDAO extends DBContext {

    public Customer getByUserNamePassword(String username, String password) {
        try {
            String sql = "Select * from Customers where username = ? and password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Customer account = new Customer();
                account.setId(rs.getString(1));
                account.setUsername(rs.getString(2));
                account.setFullname(rs.getString(3));
                account.setPassword(rs.getString(4));
                account.setPhone(rs.getString(5));
                account.setAddress(rs.getString(6));
                account.setRoleId(rs.getString(7));

                return account;
            }
            rs.close();
        } catch (SQLException ex) {
        }
        return null;
    }

    public void inserUser(String username, String fullname, String password, String phone, String address) {
        String sql = "INSERT INTO [dbo].[Customers]\n"
                + "           ([Username]\n"
                + "           ,[Fullname]\n"
                + "           ,[Password]\n"
                + "           ,[Phone]\n"
                + "           ,[Address]\n"
                + "           ,[RoleId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,'US')";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, fullname);
            ps.setString(3, password);
            ps.setString(4, password);
            ps.setString(5, address);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public boolean isUsernameExists(String username) {
    boolean exists = false;
    try {
        String sql = "SELECT COUNT(*) AS count FROM Customers WHERE Username = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            int count = rs.getInt("count");
            if (count > 0) {
                exists = true;
            }
        }
        rs.close();
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return exists;
    }

    public static void main(String[] args) {
        CustomerDAO d = new CustomerDAO();
        Customer c = d.getByUserNamePassword("admin", "123");
        System.out.println(c.toString());
    }
}

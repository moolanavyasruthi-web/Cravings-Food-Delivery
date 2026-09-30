package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.UserDAO;
import com.tap.Model.User;
import com.tap.utility.DBConnection;

public class UserDAOImpl implements UserDAO {
    public static final String INSERT_QUERY = "insert into `user`(userName, email, password, address, role, createdDate, lastLoginDate, phone) values(?,?,?,?,?,?,?,?)";
    public static final String SELECT_QUERY = "SELECT * FROM `user` WHERE userId = ?";
    public static final String UPDATE_QUERY = "UPDATE `user` SET userName=?, email=?, password=?, address=?, role=?, createdDate=?, lastLoginDate=?, phone=? WHERE userId=?";
    public static final String DELETE_QUERY = "DELETE FROM `user` WHERE userId = ?";
    public static final String SELECT_ALL_QUERY = "SELECT * FROM `user`";
    public static final String SELECT_BY_MAIL_QUERY = "SELECT * FROM `user` WHERE email=?";

    @Override
    public int addUser(User user) {
        try (Connection con = DBConnection.getConnetion();
             PreparedStatement ps = con.prepareStatement(INSERT_QUERY)) {
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getRole());
            ps.setTimestamp(6, Timestamp.valueOf(LocalDateTime.now()));
            ps.setTimestamp(7, Timestamp.valueOf(LocalDateTime.now()));
            ps.setString(8, user.getPhone());
            return ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
        return 0;
    }

    @Override
    public User getUser(int userId) {
        try (Connection con = DBConnection.getConnetion(); PreparedStatement ps = con.prepareStatement(SELECT_QUERY)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("userId")); u.setUserName(rs.getString("userName"));
                u.setEmail(rs.getString("email")); u.setPassword(rs.getString("password"));
                u.setAddress(rs.getString("address")); u.setRole(rs.getString("role"));
                u.setPhone(rs.getString("phone"));
                u.setCreatedDate(rs.getTimestamp("createdDate"));
                u.setLastLoginDate(rs.getTimestamp("lastLoginDate"));
                return u;
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public User getUserByEmail(String email) {
        try (Connection con = DBConnection.getConnetion(); PreparedStatement ps = con.prepareStatement(SELECT_BY_MAIL_QUERY)) {
            ps.setString(1, email.toLowerCase().trim());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("userId")); u.setUserName(rs.getString("userName"));
                u.setEmail(rs.getString("email")); u.setPassword(rs.getString("password"));
                u.setAddress(rs.getString("address")); u.setRole(rs.getString("role"));
                u.setPhone(rs.getString("phone"));
                return u;
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    @Override public List<User> getAllUser() { 
        List<User> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnetion(); PreparedStatement ps = con.prepareStatement(SELECT_ALL_QUERY)) {
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                User u = new User();
                u.setUserId(rs.getInt("userId")); u.setUserName(rs.getString("userName"));
                u.setEmail(rs.getString("email")); u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role")); u.setPhone(rs.getString("phone"));
                list.add(u);
            }
        } catch(SQLException e){ e.printStackTrace(); }
        return list;
    }
    @Override
    public void updateUser(User user) {
        try (Connection con = DBConnection.getConnetion();
             PreparedStatement ps = con.prepareStatement(UPDATE_QUERY)) {

            ps.setString(1, user.getUserName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getRole());
            ps.setTimestamp(6, user.getCreatedDate());
            ps.setTimestamp(7, user.getLastLoginDate());
            ps.setString(8, user.getPhone());
            ps.setInt(9, user.getUserId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void deleteUser(int userId) {
        try (Connection con = DBConnection.getConnetion();
             PreparedStatement ps = con.prepareStatement(DELETE_QUERY)) {

            ps.setInt(1, userId);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
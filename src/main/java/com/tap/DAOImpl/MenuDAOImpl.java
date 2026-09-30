package com.tap.DAOImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.tap.utility.DBConnection;
import com.tap.Model.Menu;

public class MenuDAOImpl {

    public List<Menu> getMenuByRestaurantId(int restaurantId) {
        List<Menu> list = new ArrayList<>();
        String sql = "SELECT * FROM menu WHERE restaurantId = ?";
        try (Connection con = DBConnection.getConnetion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, restaurantId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Menu m = extract(rs);
                list.add(m);
            }
        } catch(SQLException e){ e.printStackTrace(); }
        return list;
    }

    public Menu getMenuById(int menuId) {
        String sql = "SELECT * FROM menu WHERE menuId = ?";
        try (Connection con = DBConnection.getConnetion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, menuId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) return extract(rs);
        } catch(Exception e){ e.printStackTrace(); }
        return null;
    }

    public void addMenu(Menu m) {
        String sql = "INSERT INTO menu (restaurantId, itemName, description, price, isAvailable, imagePath) VALUES (?,?,?,?,?,?)";
        try (Connection con = DBConnection.getConnetion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, m.getRestaurantId());
            ps.setString(2, m.getItemName());
            ps.setString(3, m.getDescription());
            ps.setFloat(4, m.getPrice());
            ps.setBoolean(5, m.isAvailable());
            ps.setString(6, m.getImagePath());
            ps.executeUpdate();
        } catch(SQLException e){ e.printStackTrace(); }
    }

    public void updateMenu(Menu m) {
        String sql = "UPDATE menu SET itemName=?, description=?, price=?, isAvailable=?, imagePath=? WHERE menuId=?";
        try (Connection con = DBConnection.getConnetion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, m.getItemName());
            ps.setString(2, m.getDescription());
            ps.setFloat(3, m.getPrice());
            ps.setBoolean(4, m.isAvailable());
            ps.setString(5, m.getImagePath());
            ps.setInt(6, m.getMenuId());
            ps.executeUpdate();
        } catch(Exception e){ e.printStackTrace(); }
    }

    public void deleteMenu(int menuId) {
        String sql = "DELETE FROM menu WHERE menuId=?";
        try (Connection con = DBConnection.getConnetion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, menuId);
            ps.executeUpdate();
        } catch(Exception e){ e.printStackTrace(); }
    }

    // helper
    private Menu extract(ResultSet rs) throws SQLException {
        Menu m = new Menu();
        m.setMenuId(rs.getInt("menuId"));
        m.setRestaurantId(rs.getInt("restaurantId"));
        m.setItemName(rs.getString("itemName"));
        m.setDescription(rs.getString("description"));
        m.setPrice(rs.getFloat("price"));
        m.setAvailable(rs.getBoolean("isAvailable"));
        m.setImagePath(rs.getString("imagePath"));
        return m;
    }

    public List<Menu> searchMenu(String keyword){
        List<Menu> list = new ArrayList<>();
        String sql = "SELECT * FROM menu WHERE itemName LIKE ? OR description LIKE ?";
        try(Connection con = DBConnection.getConnetion();
            PreparedStatement ps = con.prepareStatement(sql)){
            
            String like = "%"+keyword+"%";
            ps.setString(1, like);
            ps.setString(2, like);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(extract(rs)); // FIXED: now restaurantId will come correctly
            }
        }catch(SQLException e){ e.printStackTrace(); }
        return list;
    }
    
    public List<Menu> getAllMenuByRestaurant(int restaurantId) {
        List<Menu> list = new ArrayList<>();
        String sql = "SELECT * FROM menu WHERE restaurantId =?";
        try (Connection con = DBConnection.getConnetion(); 
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, restaurantId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extract(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    

    public Menu getMenu(int menuId) {
        Menu menu = null;
        String sql = "SELECT * FROM menu WHERE menuId =?";
        try (Connection con = DBConnection.getConnetion(); 
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, menuId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                menu = extract(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menu;
    }

}
     

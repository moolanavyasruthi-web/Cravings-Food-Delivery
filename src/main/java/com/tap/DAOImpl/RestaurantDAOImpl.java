package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.Model.Restaurant;
import com.tap.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {
	public static final String INSERT_QUERY = "INSERT INTO restaurant(resName, cuisineType, deliveryTime, address, rating, isActive, imagePath) VALUES(?,?,?,?,?,?,?) ";
	public static final String SELECT_QUERY = "SELECT* FROM restaurant WHERE restaurantId = ?";
	public static final String UPDATE_QUERY = "UPDATE restaurant SET resName = ?, cuisineType = ?, deliveryTime = ?, address = ?, rating = ?, isActive = ?, imagePath = ? WHERE restaurantId = ?";
	public static final String DELETE_QUERY = "DELETE FROM restaurant WHERE restaurantId = ?";
	public static final String SELECT_ALL_QUERY= "SELECT*FROM restaurant";

	@Override
	public void addRestaurant(Restaurant res) {
		try(Connection con = DBConnection.getConnetion()){
			PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);
			pstmt.setString(1, res.getResName());
			pstmt.setString(2, res.getCuisineType());
			pstmt.setString(3, res.getDeliveryTime());
			pstmt.setString(4, res.getAddress());
			pstmt.setFloat(5, res.getRating());
			pstmt.setBoolean(6, res.isActive());
			pstmt.setString(7, res.getImagePath());
			pstmt.executeUpdate();
		}catch(SQLException e){ e.printStackTrace(); }
	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {
		try(Connection con = DBConnection.getConnetion()){
			PreparedStatement pstmt = con.prepareStatement(SELECT_QUERY);
			pstmt.setInt(1, restaurantId);
			ResultSet r = pstmt.executeQuery();
			while(r.next()) {
				Restaurant rest = new Restaurant(r.getInt("restaurantId"), r.getString("resName"), r.getString("cuisineType"), r.getString("deliveryTime"), r.getString("address"), r.getFloat("rating"), r.getBoolean("isActive"), r.getString("imagePath"));
				return rest;
			}
		}catch(SQLException e){ e.printStackTrace(); }
		return null;
	}

	@Override
	public void updateRestaurant(Restaurant res) {
		try(Connection con = DBConnection.getConnetion()){
			PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);
			pstmt.setString(1, res.getResName());
			pstmt.setString(2, res.getCuisineType());
			pstmt.setString(3, res.getDeliveryTime());
			pstmt.setString(4, res.getAddress());
			pstmt.setFloat(5, res.getRating());
			pstmt.setBoolean(6, res.isActive());
			pstmt.setString(7, res.getImagePath());
			pstmt.setInt(8,res.getRestaurantId());
			pstmt.executeUpdate();
		}catch(Exception e){ e.printStackTrace(); }
	}

	@Override
	public void deleteRestaurant(int restaurantId) {
		try(Connection con = DBConnection.getConnetion()){
			PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, restaurantId);
			pstmt.executeUpdate();
		}catch(Exception e){ e.printStackTrace(); }
	}
	
	@Override
	public List<Restaurant> getAllRestaurants() {
		List<Restaurant> restaurants = new ArrayList<>();
		try(Connection con = DBConnection.getConnetion()){
			PreparedStatement pstmt = con.prepareStatement(SELECT_ALL_QUERY);
			ResultSet r = pstmt.executeQuery();
			while(r.next()) {
				Restaurant rest = new Restaurant(r.getInt("restaurantId"), r.getString("resName"), r.getString("cuisineType"), r.getString("deliveryTime"), r.getString("address"), r.getFloat("rating"), r.getBoolean("isActive"), r.getString("imagePath"));
				restaurants.add(rest);
			}
		}catch(SQLException e){ e.printStackTrace(); }
		return restaurants;
	}
	
	public Restaurant getRestaurantById(int restaurantId) {
	    return getRestaurant(restaurantId);
	}
	
	// FIXED METHOD FOR YOUR TABLE STRUCTURE
	public int addRestaurantAndGetId(Restaurant r){
		  String sql = "INSERT INTO restaurant(resName, cuisineType, deliveryTime, address, rating, isActive, imagePath) VALUES(?,?,?,?,?,?,?)";
		  try(Connection con = DBConnection.getConnetion();
		      PreparedStatement ps = con.prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS)){
		    ps.setString(1, r.getResName());
		    ps.setString(2, r.getCuisineType());
		    ps.setString(3, r.getDeliveryTime()!=null?r.getDeliveryTime():"30 mins");
		    ps.setString(4, r.getAddress());
		    ps.setFloat(5, r.getRating());
		    ps.setBoolean(6, true);
		    ps.setString(7, r.getImagePath());
		    ps.executeUpdate();
		    ResultSet rs = ps.getGeneratedKeys();
		    if(rs.next()) return rs.getInt(1);
		  }catch(SQLException e){ e.printStackTrace(); }
		  return 0;
	}
}
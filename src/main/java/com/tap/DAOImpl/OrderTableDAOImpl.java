package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderTableDAO;
import com.tap.Model.OrderTable;
import com.tap.utility.DBConnection;

public class OrderTableDAOImpl implements OrderTableDAO{
	
	// CHANGE column names exactly as in DB - check yours
	public static final String INSER_QUERY = "INSERT INTO order_table(userId, orderDate, totalamount, status, paymentMethod, restaurantId) VALUES(?,?,?,?,?,?)";
	public static final String SELECT_QUERY = "SELECT * FROM order_table WHERE orderId = ?";
	public static final String DELETE_QUERY = "DELETE FROM order_table WHERE orderId = ?";
	public static final String UPDATE_QUERY = "UPDATE order_table SET userId = ?, orderDate = ?, totalAmount = ?, status = ?, paymentMethod = ?, restaurantId =? WHERE orderId = ?";
	public static final String SELECT_ALL_QUERY = "SELECT * FROM order_table";

	@Override
	public int addOrder(OrderTable order) {
		int orderId = 0;
		try(Connection con = DBConnection.getConnetion()){
			PreparedStatement pstmt = con.prepareStatement(INSER_QUERY, Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, order.getUserId());
			pstmt.setTimestamp(2, order.getOrderDate());
			pstmt.setFloat(3, order.getTotalAmount());
			pstmt.setString(4, order.getStatus());
			pstmt.setString(5, order.getPaymentMethod());
			pstmt.setInt(6, order.getRestaurantId());
			
			int rows = pstmt.executeUpdate(); // YOU MISSED THIS LINE
			System.out.println("Rows inserted: " + rows);
			
			if(rows > 0) {
				ResultSet rs = pstmt.getGeneratedKeys();
				if(rs.next()) {
					orderId = rs.getInt(1);
				}
			}
			System.out.println("Generated OrderId: " + orderId);
		 }
		catch(SQLException e) {
			e.printStackTrace(); // See console for error
		}
		return orderId;
	}

	@Override
	public OrderTable getOrder(int orderId) {
		try(Connection con = DBConnection.getConnetion()){
			PreparedStatement pstmt = con.prepareStatement(SELECT_QUERY);
			pstmt.setInt(1, orderId);
			ResultSet res = pstmt.executeQuery();
			if(res.next()) {
				OrderTable order = new OrderTable();
				order.setOrderId(res.getInt("orderId"));
				order.setUserId(res.getInt("userId"));
				order.setOrderDate(res.getTimestamp("orderDate"));
				order.setTotalAmount(res.getFloat("totalAmount"));
				order.setStatus(res.getString("status"));
				order.setPaymentMethod(res.getString("paymentMethod"));
				order.setRestaurantId(res.getInt("restaurantId"));
				return order;
			}
		 }
		catch(SQLException e) { e.printStackTrace(); }
		return null;
	}
	@Override
	public void updateOrder(OrderTable order) {
		try(Connection con = DBConnection.getConnetion()){
			PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);
			pstmt.setInt(1, order.getUserId());
			pstmt.setTimestamp(2, order.getOrderDate());
			pstmt.setFloat(3, order.getTotalAmount());
			pstmt.setString(4, order.getStatus());
			pstmt.setString(5, order.getPaymentMethod());
			pstmt.setInt(6, order.getRestaurantId());
			pstmt.setInt(7, order.getOrderId());
			pstmt.executeUpdate();
		 }
		catch(Exception e) { e.printStackTrace(); }
	}
	@Override
	public void deleteOrder(int orderId) {
		try(Connection con = DBConnection.getConnetion()){
			PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, orderId);
			pstmt.executeUpdate();
		 }
		catch(Exception e) { e.printStackTrace(); }
	}
	@Override
	public List<OrderTable> order() {
		List<OrderTable> orders = new ArrayList<>();
		try(Connection con = DBConnection.getConnetion()){
			PreparedStatement pstmt = con.prepareStatement(SELECT_ALL_QUERY);
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				OrderTable order = new OrderTable(res.getInt("userId"), res.getTimestamp("orderDate"),res.getFloat("totalAmount"), res.getString("status"), res.getString("paymentMethod"),res.getInt("restaurantId"));
				orders.add(order);
			}
		 }
		catch(SQLException e) { e.printStackTrace(); }
		return orders;
	}
	
	public List<OrderTable> getOrdersByUserId(int userId) {
	    List<OrderTable> orders = new ArrayList<>();
	    try(Connection con = DBConnection.getConnetion()){
	        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM order_table WHERE userId = ? ORDER BY orderId DESC");
	        pstmt.setInt(1, userId);
	        ResultSet res = pstmt.executeQuery();
	        while(res.next()) {
	            OrderTable order = new OrderTable();
	            order.setOrderId(res.getInt("orderId"));
	            order.setUserId(res.getInt("userId"));
	            order.setOrderDate(res.getTimestamp("orderDate"));
	            order.setTotalAmount(res.getFloat("totalAmount"));
	            order.setStatus(res.getString("status"));
	            order.setPaymentMethod(res.getString("paymentMethod"));
	            order.setRestaurantId(res.getInt("restaurantId"));
	            orders.add(order);
	        }
	    }catch(SQLException e){ e.printStackTrace(); }
	    return orders;
	}
	
	public java.util.List<com.tap.Model.Menu> getMenuByRestaurantId(int restaurantId) {
        java.util.List<com.tap.Model.Menu> list = new java.util.ArrayList<>();
        String sql = "SELECT * FROM menu WHERE restaurantId = ?";
        try (java.sql.Connection con = DBConnection.getConnetion();
             java.sql.PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, restaurantId);
            java.sql.ResultSet rs = ps.executeQuery();
            while(rs.next()){
                com.tap.Model.Menu m = new com.tap.Model.Menu();
                m.setMenuId(rs.getInt("menuId"));
                m.setRestaurantId(rs.getInt("restaurantId"));
                m.setItemName(rs.getString("itemName"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getFloat("price"));
                m.setAvailable(rs.getBoolean("isAvailable"));
                m.setImagePath(rs.getString("imagePath"));
                list.add(m);
            }
        } catch(SQLException e){ e.printStackTrace(); }
        return list;
    }
	public java.util.List<com.tap.Model.OrderTable> getOrdersByRestaurantId(int restaurantId) {
	    java.util.List<com.tap.Model.OrderTable> list = new java.util.ArrayList<>();
	    String sql = "SELECT * FROM ordertable WHERE restaurantId = ? ORDER BY orderId DESC";
	    try (java.sql.Connection con = DBConnection.getConnetion();
	         java.sql.PreparedStatement ps = con.prepareStatement(sql)) {
	        
	        ps.setInt(1, restaurantId);
	        java.sql.ResultSet rs = ps.executeQuery();
	        
	        while(rs.next()){
	            com.tap.Model.OrderTable o = new com.tap.Model.OrderTable();
	            o.setOrderId(rs.getInt("orderId"));
	            o.setRestaurantId(rs.getInt("restaurantId"));
	            o.setUserId(rs.getInt("userId"));
	            o.setTotalAmount(rs.getFloat("totalAmount"));
	            o.setStatus(rs.getString("status"));
	            o.setPaymentMethod(rs.getString("paymentMethod"));
	            // if you have orderDate column, uncomment:
	            // o.setOrderDate(rs.getTimestamp("orderDate"));
	            list.add(o);
	        }
	    } catch(SQLException e){ 
	        e.printStackTrace(); 
	    }
	    return list;
	}
}
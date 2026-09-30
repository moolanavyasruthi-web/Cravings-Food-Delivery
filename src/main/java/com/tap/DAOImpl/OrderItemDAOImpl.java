package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderItemDAO;
import com.tap.Model.OrderItem;
import com.tap.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO{
	public static final String INSERT_QUERY = "INSERT INTO orderitem (orderId, quantity, itemTotal, menuId) VALUES (?, ?, ?, ?)";
	public static final String SELECT_QUERY = "SELECT * FROM orderitem WHERE orderItemId = ?";
	public static final String SELECT_ALL_QUERY = "SELECT * FROM orderitem WHERE orderId = ?";
	public static final String DELETE_QUERY = "DELETE FROM orderitem WHERE orderItemId = ?";
	
	@Override
	public void addOrderItem(OrderItem order) {
		try(Connection con = DBConnection.getConnetion()){
			PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);
			pstmt.setInt(1, order.getOrderId());
			pstmt.setInt(2, order.getQuantity());
			pstmt.setFloat(3, order.getItemTotal());
			pstmt.setInt(4, order.getMenuId());
			int i = pstmt.executeUpdate();
            System.out.println(i + " row inserted");
		 }
		catch(SQLException e) { e.printStackTrace(); }
	}

	@Override
	public OrderItem getOrderItemById(int orderItemId) {
		try(Connection con = DBConnection.getConnetion()){
			PreparedStatement pstmt = con.prepareStatement(SELECT_QUERY);
			pstmt.setInt(1, orderItemId);
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				OrderItem order = new OrderItem(res.getInt("orderId"), res.getInt("quantity"), res.getFloat("itemTotal"), res.getInt("menuId") );
				order.setOrderItemId(res.getInt("orderItemId"));
				return order;
			}
		 }
		catch(SQLException e) { e.printStackTrace(); }
		return null;
	}

	@Override
	public List<OrderItem> getOrderItemByOrderId(int orderId) {
		List<OrderItem> orders = new ArrayList<>();
		try(Connection con = DBConnection.getConnetion()){
			PreparedStatement pstmt = con.prepareStatement(SELECT_ALL_QUERY);
			pstmt.setInt(1, orderId);
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				OrderItem order = new OrderItem();
				order.setOrderItemId(res.getInt("orderItemId"));
				order.setOrderId(res.getInt("orderId"));
				order.setQuantity(res.getInt("quantity"));
				order.setItemTotal(res.getFloat("itemTotal"));
				order.setMenuId(res.getInt("menuId"));
				orders.add(order);
			}
		 }
		catch(SQLException e) { e.printStackTrace(); }
		return orders; // NOT NULL
	}

	@Override
	public void deleteOrderItem(int orderItemId) {
		try(Connection con = DBConnection.getConnetion()){
			PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, orderItemId);
			pstmt.executeUpdate();
		 }
		catch(SQLException e) { e.printStackTrace(); }
	}
}
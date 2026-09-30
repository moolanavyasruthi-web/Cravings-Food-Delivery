package com.tap.Model;

import java.sql.Timestamp;

public class OrderTable {
	private int userId;
	private int orderId;
	private Timestamp orderDate;
	private float totalAmount;
	private String status;
	private String paymentMethod;
	private int restaurantId;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public float getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	/**
	 * @param userId
	 * @param orderDate
	 * @param totalAmount
	 * @param status
	 * @param paymentMethod
	 * @param restaurantId
	 */
	public OrderTable(int userId, Timestamp orderDate, float totalAmount, String status, String paymentMethod,
			int restaurantId) {
		super();
		this.userId = userId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.restaurantId = restaurantId;
	}
	/**
	 * 
	 */
	public OrderTable() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "OrderTable [userId=" + userId + ", orderId=" + orderId + ", orderDate=" + orderDate + ", totalAmount="
				+ totalAmount + ", status=" + status + ", paymentMethod=" + paymentMethod + ", restaurantId="
				+ restaurantId + "]";
	}
	
}

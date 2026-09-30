package com.tap.DAO;

import java.util.List;

import com.tap.Model.OrderItem;

public interface OrderItemDAO {
void addOrderItem(OrderItem order);
OrderItem getOrderItemById(int orderItemId);
List<OrderItem> getOrderItemByOrderId(int orderId);
void deleteOrderItem(int orderItemId);
}

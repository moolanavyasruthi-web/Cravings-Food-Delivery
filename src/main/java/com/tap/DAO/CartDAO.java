package com.tap.DAO;

import java.util.List;

import com.tap.Model.Cart;

public interface CartDAO {
	Cart getCart(int userId);
	void addCart(Cart cart);
	void deleteCart(int cartId);
	void updateCart(Cart cart);
	List<Cart> getAllCarts();
	
}

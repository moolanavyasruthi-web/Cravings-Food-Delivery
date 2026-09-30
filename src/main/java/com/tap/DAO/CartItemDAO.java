package com.tap.DAO;

import java.util.List;

import com.tap.Model.CartItem;

public interface CartItemDAO {
void addCartItem(CartItem cart);
CartItem getCartItem(int cartItemId);
void updateQuantity(CartItem cart);
void deleteCartItem(int cartItemId);
List<CartItem> getAllCartItems();
}

// Cart.java
package com.tap.Model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	private Map<Integer, CartItem> items = new HashMap<>();
	private int restaurantId;

	public Map<Integer, CartItem> getItems() {
		return items;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int id) {
		this.restaurantId = id;
	}

	public void addItem(Menu m, int qty) {
		if (items.containsKey(m.getMenuId())) {
			items.get(m.getMenuId()).setQuantity(items.get(m.getMenuId()).getQuantity() + qty);
		} else {
			CartItem ci = new CartItem();
			ci.setMenuId(m.getMenuId());
			ci.setItemName(m.getItemName());
			ci.setPrice(m.getPrice());
			ci.setQuantity(qty);
			ci.setRestaurantId(m.getRestaurantId());
			ci.setImagePath(m.getImagePath());
			items.put(m.getMenuId(), ci);
		}
	}

	public void updateItem(int menuId, int qty) {
		if (qty <= 0)
			items.remove(menuId);
		else if (items.containsKey(menuId))
			items.get(menuId).setQuantity(qty);
	}

	public void deleteItem(int menuId) {
		items.remove(menuId);
	}

	public void clear() {
		items.clear();
	}
}
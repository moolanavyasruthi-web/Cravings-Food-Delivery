// CartItem.java
package com.tap.Model;

public class CartItem {
	private int menuId;
	private String itemName;
	private float price;
	private int quantity;
	private int restaurantId;
	private String imagePath;

	// getters setters
	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int id) {
		this.menuId = id;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String n) {
		this.itemName = n;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float p) {
		this.price = p;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int q) {
		this.quantity = q;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int r) {
		this.restaurantId = r;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String s) {
		this.imagePath = s;
	}
}
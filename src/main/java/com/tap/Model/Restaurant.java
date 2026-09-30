package com.tap.Model;

public class Restaurant {
	private int restaurantId;
	private String resName;
	private String cuisineType;
	private String deliveryTime;
	private String address;
	private float rating;
	private boolean isActive; 
	private String imagePath;
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getCuisineType() {
		return cuisineType;
	}
	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}
	public String getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(String deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	/**
	 * @param resName
	 * @param cuisineType
	 * @param deliveryTime
	 * @param address
	 * @param rating
	 * @param isActive
	 * @param imagePath
	 */
	public Restaurant(int restaurantId, String resName, String cuisineType, String deliveryTime, String address, float rating,
			boolean isActive, String imagePath) {
		super();
		this.restaurantId = restaurantId;
		this.resName = resName;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.address = address;
		this.rating = rating;
		this.isActive = isActive;
		this.imagePath = imagePath;
	}
	/**
	 * 
	 */
	public Restaurant() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId + ", resName=" + resName + ", cuisineType=" + cuisineType
				+ ", deliveryTime=" + deliveryTime + ", address=" + address + ", rating=" + rating + ", isActive="
				+ isActive + ", imagePath=" + imagePath + "]";
	}
	
}

package com.tap.DAO;

import java.util.List;

import com.tap.Model.Restaurant;

public interface RestaurantDAO {
	void addRestaurant(Restaurant res);
	Restaurant getRestaurant(int restaurantId);
	void updateRestaurant(Restaurant res);
	void deleteRestaurant(int restaurantId);
	List<Restaurant>getAllRestaurants();

	
}

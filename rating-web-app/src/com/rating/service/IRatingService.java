package com.rating.service;

import java.util.ArrayList;

import com.rating.model.Rating;

public interface IRatingService {

	public void addRating(Rating rating);

	public ArrayList<Rating> getRatings();

	public ArrayList<Rating> getRatingById(String ratingId);

	public void updateRating(String ratingId, Rating rating);

	public void deleteRating(String ratingId);

}

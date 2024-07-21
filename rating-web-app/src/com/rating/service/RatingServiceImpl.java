package com.rating.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.rating.model.Rating;
import com.rating.util.CommonConstants;
import com.rating.util.CommonUtil;
import com.rating.util.DBConnection;
import com.rating.util.QueryUtil;

/**
 * @author HMC
 *
 */
public class RatingServiceImpl implements IRatingService {

	private static Connection connection;
	private static Statement stmt;
	private static PreparedStatement preparedStatement;

	/* Create table */

	static {
		createRatingTable();
	}
	// Create the Rating table if it doesn't exist

	public static void createRatingTable() {
		try {
			connection = DBConnection.getDBConnection();

			stmt = connection.createStatement();

			stmt.execute(QueryUtil.queryById(CommonConstants.QUERY_ID_CREATE_RATING_TABLE));

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println("Create Table Exception" + e.getMessage());
		} finally {
			try {

				if (connection != null) {
					connection.close();
				}

				if (stmt != null) {
					stmt.close();
				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

//Add Rating

	@Override
	public void addRating(Rating rating) {
		// Generate a unique rating ID
		String ratingId = CommonUtil.genarateRatingIds(getRatingIDs());

		try {

			connection = DBConnection.getDBConnection();

			preparedStatement = connection
					.prepareStatement(QueryUtil.queryById(CommonConstants.QUERY_ID_INSERT_RATING));
			connection.setAutoCommit(false);

			rating.setRatingId(ratingId);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, rating.getRatingId());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, rating.getStarno());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, rating.getComment());

			preparedStatement.executeLargeUpdate();
			connection.commit();

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} finally {
			try {

				if (connection != null) {
					connection.close();
				}

				if (preparedStatement != null) {
					preparedStatement.close();
				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}

	}

//Get Rating to Retrieve part

	@Override
	public ArrayList<Rating> getRatings() {

		ArrayList<Rating> ratingList = new ArrayList<Rating>();

		try {

			connection = DBConnection.getDBConnection();

			preparedStatement = connection
					.prepareStatement(QueryUtil.queryById(CommonConstants.QUERY_ID_GET_ALL_RATINGS));

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				Rating rt = new Rating();

				rt.setRatingId(rs.getString(CommonConstants.COLUMN_INDEX_ONE));
				rt.setStarno(rs.getString(CommonConstants.COLUMN_INDEX_TWO));
				rt.setComment(rs.getString(CommonConstants.COLUMN_INDEX_THREE));

				ratingList.add(rt);
			}

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} finally {
			try {

				if (connection != null) {
					connection.close();
				}

				if (preparedStatement != null) {
					preparedStatement.close();
				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}

		return ratingList;
	}

	@Override
	public ArrayList<Rating> getRatingById(String ratingId) {

		ArrayList<Rating> ratingList = new ArrayList<Rating>();

		try {

			connection = DBConnection.getDBConnection();

			preparedStatement = connection
					.prepareStatement(QueryUtil.queryById(CommonConstants.QUERY_ID_GET_RATING_BY_ID));
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, ratingId);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				Rating rt = new Rating();

				rt.setRatingId(rs.getString(CommonConstants.COLUMN_INDEX_ONE));
				rt.setStarno(rs.getString(CommonConstants.COLUMN_INDEX_TWO));
				rt.setComment(rs.getString(CommonConstants.COLUMN_INDEX_THREE));

				ratingList.add(rt);
			}

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} finally {
			try {

				if (connection != null) {
					connection.close();
				}

				if (preparedStatement != null) {
					preparedStatement.close();
				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}

		return ratingList;
	}

	@Override
	public void updateRating(String ratingId, Rating rating) {

		try {

			connection = DBConnection.getDBConnection();

			preparedStatement = connection
					.prepareStatement(QueryUtil.queryById(CommonConstants.QUERY_ID_UPDATE_RATING));
			connection.setAutoCommit(false);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, rating.getStarno());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, rating.getComment());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, rating.getRatingId());

			preparedStatement.executeLargeUpdate();
			connection.commit();

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} finally {
			try {

				if (connection != null) {
					connection.close();
				}

				if (preparedStatement != null) {
					preparedStatement.close();
				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	@Override
	public void deleteRating(String ratingId) {

		if (ratingId != null && !ratingId.isEmpty()) {

			try {
				connection = DBConnection.getDBConnection();

				preparedStatement = connection
						.prepareStatement(QueryUtil.queryById(CommonConstants.QUERY_ID_DELETE_RATING));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, ratingId);

				preparedStatement.execute();

			} catch (SQLException | SAXException | IOException | ParserConfigurationException
					| ClassNotFoundException e) {
				System.out.println(e.getMessage());
			} finally {
				try {

					if (connection != null) {
						connection.close();
					}

					if (preparedStatement != null) {
						preparedStatement.close();
					}

				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
		}

	}

	public ArrayList<String> getRatingIDs() {

		ArrayList<String> ids = new ArrayList<String>();

		try {

			connection = DBConnection.getDBConnection();

			preparedStatement = connection
					.prepareStatement(QueryUtil.queryById(CommonConstants.QUERY_ID_GET_RATING_IDS));

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ids.add(rs.getString(CommonConstants.COLUMN_INDEX_ONE));
			}

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} finally {
			try {

				if (connection != null) {
					connection.close();
				}

				if (preparedStatement != null) {
					preparedStatement.close();
				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return ids;
	}

}

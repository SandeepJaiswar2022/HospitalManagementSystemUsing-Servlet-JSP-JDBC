package com.dao;

import com.db.DBUtil;
import com.entity.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

	public static boolean saveUserInDatabase(Users user) {
		boolean savedOrNot = false;
		Connection connection = null;
		PreparedStatement pStatement = null;

		try {
			connection = DBUtil.getConnection();
			String query = "insert into user(username,email,password) values(?,?,?);";
			pStatement = connection.prepareStatement(query);
			pStatement.setString(1, user.getUsernameString());
			pStatement.setString(2, user.getEmailString());
			pStatement.setString(3, user.getPasswordString());

			int rowsAffected = pStatement.executeUpdate();
			if (rowsAffected == 1) {
				savedOrNot = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.closeResources(connection, pStatement);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return savedOrNot;
	}

	public static Users doesExists(String emailString, String passwordString) {
		Connection connection = null;
		PreparedStatement pStatement = null;
		Users user = null;

		try {
			connection = DBUtil.getConnection();
			String query = "select * from user where email=? and password=?;";
			pStatement = connection.prepareStatement(query);
			pStatement.setString(1, emailString);
			pStatement.setString(2, passwordString);

			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				user = new Users();
				user.setEmailString(emailString);
				user.setPasswordString(passwordString);
				user.setIdInteger(resultSet.getInt("id"));
				user.setUsernameString(resultSet.getString("username"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.closeResources(connection, pStatement);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return user;
	}

	public static int getUsersCount() {
		int usersCount = 0;
		Connection connection = null;
		PreparedStatement pStatement = null;

		try {
			connection = DBUtil.getConnection();
			String query = "SELECT COUNT(*) AS total FROM user";
			pStatement = connection.prepareStatement(query);

			ResultSet resultSet = pStatement.executeQuery();
			if (resultSet.next()) {
				usersCount = resultSet.getInt("total");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.closeResources(connection, pStatement);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return usersCount;
	}

	public static boolean isOldPasswordCorrect(String oldPasswordString, int userId) {
		boolean isOldPasswordCorrect = false;
		Connection connection = null;
		PreparedStatement pStatement = null;

		try {
			connection = DBUtil.getConnection();
			String query = "select password from user where id=?;";
			pStatement = connection.prepareStatement(query);
			pStatement.setInt(1, userId);

			ResultSet resultSet = pStatement.executeQuery();
			if(resultSet.next()) {
			isOldPasswordCorrect = oldPasswordString.equals(resultSet.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.closeResources(connection, pStatement);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isOldPasswordCorrect;
	}
	
	public static boolean isNewPasswordUpdated(String newPassworString, int userId)
	{
		boolean isNewPasswordUpdated = false;
		Connection connection = null;
		PreparedStatement pStatement = null;

		try {
			connection = DBUtil.getConnection();
			String query = "update user set password=? where id=?;";
			pStatement = connection.prepareStatement(query);
			pStatement.setString(1, newPassworString);
			pStatement.setInt(2, userId);

			int rowsAffected = pStatement.executeUpdate();
			if (rowsAffected == 1) {
				isNewPasswordUpdated = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.closeResources(connection, pStatement);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return isNewPasswordUpdated;
	}

}

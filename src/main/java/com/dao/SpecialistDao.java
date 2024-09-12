package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.DBUtil;
import com.entity.Specialities;

public class SpecialistDao {

	public SpecialistDao() {

	}

	public static boolean saveSpecialistInDatabase(Specialities speciality) {
		boolean savedOrNot = false;
		Connection connection = null;
		PreparedStatement pStatement = null;

		try {
			connection = DBUtil.getConnection();
			String query = "insert into specialist(speciality) values(?);";
			pStatement = connection.prepareStatement(query);
			pStatement.setString(1, speciality.getSpecialityString());

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

	public static List<Specialities> GetAllSpecialization() {
		Connection connection = null;
		PreparedStatement pStatement = null;
		Specialities spec = null;
		List<Specialities> specialitiesList = new ArrayList<Specialities>();

		try {
			connection = DBUtil.getConnection();
			String query = "select * from specialist;";
			pStatement = connection.prepareStatement(query);

			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				spec = new Specialities();
				spec.setIdInteger(resultSet.getInt("id"));
				spec.setSpecialityString(resultSet.getString("speciality"));
				specialitiesList.add(spec);
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

		return specialitiesList;
	}
	public static int getSpecializationCount()
	{
		Connection connection = null;
		PreparedStatement pStatement = null;
		int specializationCount=0;
		
		try {
			connection = DBUtil.getConnection();
			String query = "SELECT COUNT(*) AS total FROM specialist";
			pStatement = connection.prepareStatement(query);

			ResultSet resultSet = pStatement.executeQuery();
			if (resultSet.next()) {
				specializationCount=resultSet.getInt("total");
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
		return specializationCount;
	}

}

package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;

import com.db.DBUtil;
import com.entity.Doctors;
import com.entity.Specialities;

public class DoctorDao {

	public static boolean saveDoctorInDatabase(Doctors doctor) {
		boolean savedOrNot = false;
		Connection connection = null;
		PreparedStatement pStatement = null;

		try {
			connection = DBUtil.getConnection();
			String query = "insert into doctor(full_name,qualification,specialization,email,mobile_number,password) values(?,?,?,?,?,?);";
			pStatement = connection.prepareStatement(query);
			pStatement.setString(1, doctor.getFullNameString());
			pStatement.setString(2, doctor.getQualificationString());
			pStatement.setString(3, doctor.getSpecializationString());
			pStatement.setString(4, doctor.getEmailString());
			pStatement.setString(5, doctor.getMobileNumberString());
			pStatement.setString(6, doctor.getPasswordString());

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

	public static Doctors getDoctorById(int doctorId) {
		Connection connection = null;
		PreparedStatement pStatement = null;
		Doctors doctor = null;

		try {
			connection = DBUtil.getConnection();
			String query = "select * from doctor where doctor_id=?;";
			pStatement = connection.prepareStatement(query);
			pStatement.setInt(1, doctorId);

			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				doctor = new Doctors();
				doctor.setId(resultSet.getInt("doctor_id"));
				doctor.setFullNameString(resultSet.getString("full_name"));
				doctor.setQualificationString(resultSet.getString("qualification"));
				doctor.setSpecializationString(resultSet.getString("specialization"));
				doctor.setEmailString(resultSet.getString("email"));
				doctor.setMobileNumberString(resultSet.getString("mobile_number"));
				doctor.setPasswordString(resultSet.getString("password"));
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

		return doctor;
	}

	public static List<Doctors> getAllDoctors() {
		Connection connection = null;
		PreparedStatement pStatement = null;
		Doctors doctor = null;
		List<Doctors> doctorsList = new ArrayList<Doctors>();

		try {
			connection = DBUtil.getConnection();
			String query = "select * from doctor;";
			pStatement = connection.prepareStatement(query);

			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				doctor = new Doctors();
				doctor.setId(resultSet.getInt("doctor_id"));
				doctor.setFullNameString(resultSet.getString("full_name"));
				doctor.setQualificationString(resultSet.getString("qualification"));
				doctor.setSpecializationString(resultSet.getString("specialization"));
				doctor.setEmailString(resultSet.getString("email"));
				doctor.setMobileNumberString(resultSet.getString("mobile_number"));
				doctor.setPasswordString(resultSet.getString("password"));
				doctorsList.add(doctor);
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

		return doctorsList;
	}

	public static void displayDoctorsOnConsole() {
		List<Doctors> doctorsList = getAllDoctors();
		for (Doctors doctors : doctorsList) {
			System.out.print("\n{" + doctors.getFullNameString() + ", ");
			System.out.print(doctors.getQualificationString() + ", ");
			System.out.print(doctors.getSpecializationString() + ", ");
			System.out.print(doctors.getEmailString() + ", ");
			System.out.print(doctors.getMobileNumberString() + "}");
		}
	}

	public static int getDoctorsCount() {
		int doctorsCount = 0;
		Connection connection = null;
		PreparedStatement pStatement = null;

		try {
			connection = DBUtil.getConnection();
			String query = "SELECT COUNT(*) AS total FROM doctor";
			pStatement = connection.prepareStatement(query);

			ResultSet resultSet = pStatement.executeQuery();
			if (resultSet.next()) {
				doctorsCount = resultSet.getInt("total");
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
		return doctorsCount;
	}

	public static Doctors doctorLogin(String emailString, String passwordString) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		Doctors doctor = null;

		try {
			connection = DBUtil.getConnection();
			String query = "select * from doctor where email=? and password=?;";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, emailString);
			pstmt.setString(2, passwordString);

			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()) {
				doctor = new Doctors();
				doctor.setId(resultSet.getInt("doctor_id"));
				doctor.setFullNameString(resultSet.getString("full_name"));
				doctor.setQualificationString(resultSet.getString("qualification"));
				doctor.setSpecializationString(resultSet.getString("specialization"));
				doctor.setEmailString(resultSet.getString("email"));
				doctor.setMobileNumberString(resultSet.getString("mobile_number"));
				doctor.setPasswordString(resultSet.getString("password"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.closeResources(connection, pstmt);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return doctor;
	}

	public static String getDoctorNameById(int doctorId) {
		Connection connection = null;
		PreparedStatement pStatement = null;
		String doctorNameString = null;

		try {
			connection = DBUtil.getConnection();
			String query = "select * from doctor where doctor_id=?;";
			pStatement = connection.prepareStatement(query);
			pStatement.setInt(1, doctorId);
			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				doctorNameString = resultSet.getString("full_name");
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

		return doctorNameString;
	}

	public static boolean updateDoctorDetails(Doctors doctor) {
		boolean isUpdated = false;
		Connection connection = null;
		PreparedStatement pStatement = null;

		try {
			connection = DBUtil.getConnection();
			String query = "update doctor set full_name=? ,qualification=?,specialization=?,email=?,mobile_number=?,password=? where doctor_id=?;";
			pStatement = connection.prepareStatement(query);
			pStatement.setString(1, doctor.getFullNameString());
			pStatement.setString(2, doctor.getQualificationString());
			pStatement.setString(3, doctor.getSpecializationString());
			pStatement.setString(4, doctor.getEmailString());
			pStatement.setString(5, doctor.getMobileNumberString());
			pStatement.setString(6, doctor.getPasswordString());
			pStatement.setInt(7, doctor.getId());

			int rowsAffected = pStatement.executeUpdate();
			if (rowsAffected == 1) {
				isUpdated = true;
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
		return isUpdated;
	}

	public static boolean deleteDoctorById(int doctorId) {
		boolean isDeleted = false;
		Connection connection = null;
		PreparedStatement pStatement = null;

		try {
			connection = DBUtil.getConnection();
			String query = "delete from doctor where doctor_id=?;";
			pStatement = connection.prepareStatement(query);
			pStatement.setInt(1, doctorId);

			int rowsAffected = pStatement.executeUpdate();
			if (rowsAffected == 1) {
				isDeleted = true;
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
		return isDeleted;
	}

	public static boolean isOldPasswordCorrect(String oldPasswordString, int doctorId) {
		boolean isOldPasswordCorrect = false;
		Connection connection = null;
		PreparedStatement pStatement = null;

		try {
			connection = DBUtil.getConnection();
			String query = "select password from doctor where doctor_id=?;";
			pStatement = connection.prepareStatement(query);
			pStatement.setInt(1, doctorId);

			ResultSet resultSet = pStatement.executeQuery();
			if (resultSet.next()) {
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

	public static boolean isNewPasswordUpdated(String newPassworString, int doctorId) {
		boolean isNewPasswordUpdated = false;
		Connection connection = null;
		PreparedStatement pStatement = null;

		try {
			connection = DBUtil.getConnection();
			String query = "update doctor set password=? where doctor_id=?;";
			pStatement = connection.prepareStatement(query);
			pStatement.setString(1, newPassworString);
			pStatement.setInt(2, doctorId);

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

}//Class Ends

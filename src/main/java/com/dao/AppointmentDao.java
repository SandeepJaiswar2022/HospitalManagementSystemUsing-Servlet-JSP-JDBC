package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;

import com.db.DBUtil;
import com.entity.Appointments;

public class AppointmentDao {

	public AppointmentDao() {
		// TODO Auto-generated constructor stub
	}

	public static boolean saveAppointmentInDatabase(Appointments appointment) {
		boolean savedOrNot = false;
		Connection connection = null;
		PreparedStatement pStatement = null;

		try {
			connection = DBUtil.getConnection();
			String query = "insert into appointment(user_id, full_name, gender, age, appointment_date, email, phone_number, disease, doctor_id, full_address, status) values(?,?,?,?,?,?,?,?,?,?,?);";
			pStatement = connection.prepareStatement(query);
			pStatement.setInt(1, appointment.getUserId());
			pStatement.setString(2, appointment.getFullNameString());
			pStatement.setString(3, appointment.getGenderString());
			pStatement.setString(4, appointment.getAgeString());
			pStatement.setString(5, appointment.getAppointmentDateString());
			pStatement.setString(6, appointment.getEmailString());
			pStatement.setString(7, appointment.getPhoneNumberString());
			pStatement.setString(8, appointment.getDeseaseString());
			pStatement.setInt(9, appointment.getDoctorId());
			pStatement.setString(10, appointment.getFullAddressString());
			pStatement.setString(11, appointment.getStatuString());

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

	public static List<Appointments> getAllAppointmentsByDoctorId(int doctorId) {
		Connection connection = null;
		PreparedStatement pStatement = null;
		Appointments appointment = null;
		List<Appointments> appointmentsList = new ArrayList<Appointments>();

		try {
			connection = DBUtil.getConnection();
			String query = "select * from appointment where doctor_id=?;";
			pStatement = connection.prepareStatement(query);
			pStatement.setInt(1, doctorId);

			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				appointment = new Appointments();
				appointment.setAppointmentId(resultSet.getInt("appointment_id"));
				appointment.setUserId(resultSet.getInt("user_id"));
				appointment.setFullNameString(resultSet.getString("full_name"));
				appointment.setAgeString(resultSet.getString("age"));
				appointment.setGenderString(resultSet.getString("gender"));
				appointment.setAppointmentDateString(resultSet.getString("appointment_date"));
				appointment.setEmailString(resultSet.getString("email"));
				appointment.setPhoneNumberString(resultSet.getString("phone_number"));
				appointment.setDeseaseString(resultSet.getString("disease"));
				appointment.setDoctorId(resultSet.getInt("doctor_id"));
				appointment.setFullAddressString(resultSet.getString("full_address"));
				appointment.setStatuString(resultSet.getString("status"));
				appointmentsList.add(appointment);
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

		return appointmentsList;
	}

	public static List<Appointments> getAllAppointmentsOfUserById(int userId) {
		Connection connection = null;
		PreparedStatement pStatement = null;
		Appointments appointment = null;
		List<Appointments> appointmentsList = new ArrayList<Appointments>();

		try {
			connection = DBUtil.getConnection();
			String query = "select * from appointment where user_id=?;";
			pStatement = connection.prepareStatement(query);
			pStatement.setInt(1, userId);

			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				appointment = new Appointments();
				appointment.setAppointmentId(resultSet.getInt("appointment_id"));
				appointment.setUserId(resultSet.getInt("user_id"));
				appointment.setFullNameString(resultSet.getString("full_name"));
				appointment.setAgeString(resultSet.getString("age"));
				appointment.setGenderString(resultSet.getString("gender"));
				appointment.setAppointmentDateString(resultSet.getString("appointment_date"));
				appointment.setEmailString(resultSet.getString("email"));
				appointment.setPhoneNumberString(resultSet.getString("phone_number"));
				appointment.setDeseaseString(resultSet.getString("disease"));
				appointment.setDoctorId(resultSet.getInt("doctor_id"));
				appointment.setFullAddressString(resultSet.getString("full_address"));
				appointment.setStatuString(resultSet.getString("status"));
				appointmentsList.add(appointment);
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

		return appointmentsList;
	}

	public static List<Appointments> getAllAppointments() {
		Connection connection = null;
		PreparedStatement pStatement = null;
		Appointments appointment = null;
		List<Appointments> appointmentsList = new ArrayList<Appointments>();

		try {
			connection = DBUtil.getConnection();
			String query = "select * from appointment;";
			pStatement = connection.prepareStatement(query);

			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				appointment = new Appointments();
				appointment.setAppointmentId(resultSet.getInt("appointment_id"));
				appointment.setUserId(resultSet.getInt("user_id"));
				appointment.setFullNameString(resultSet.getString("full_name"));
				appointment.setAgeString(resultSet.getString("age"));
				appointment.setGenderString(resultSet.getString("gender"));
				appointment.setAppointmentDateString(resultSet.getString("appointment_date"));
				appointment.setEmailString(resultSet.getString("email"));
				appointment.setPhoneNumberString(resultSet.getString("phone_number"));
				appointment.setDeseaseString(resultSet.getString("disease"));
				appointment.setDoctorId(resultSet.getInt("doctor_id"));
				appointment.setFullAddressString(resultSet.getString("full_address"));
				appointment.setStatuString(resultSet.getString("status"));
				appointmentsList.add(appointment);
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

		return appointmentsList;
	}

	public static int getAppointmentsCount() {
		int appointmentsCount = 0;
		Connection connection = null;
		PreparedStatement pStatement = null;

		try {
			connection = DBUtil.getConnection();
			String query = "SELECT COUNT(*) AS total FROM appointment";
			pStatement = connection.prepareStatement(query);

			ResultSet resultSet = pStatement.executeQuery();
			if (resultSet.next()) {
				appointmentsCount = resultSet.getInt("total");
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
		return appointmentsCount;
	}

	public static void printOnCosole() {
		List<Appointments> appointmentList = getAllAppointmentsByDoctorId(5);
		for (Appointments a : appointmentList) {
			System.out.println("Hello From Console..........");
			System.out.println("status = " + a.getFullNameString());
			System.out.println("age = " + a.getAgeString());
			System.out.println("Date = " + a.getAppointmentDateString());
			System.out.println("app id = " + a.getAppointmentId());
			System.out.println("disease = " + a.getDeseaseString());
			System.out.println("doc id = " + a.getDoctorId());
			System.out.println("email = " + a.getEmailString());
			System.out.println("phone = " + a.getPhoneNumberString());
			System.out.println("address = " + a.getFullAddressString());
			System.out.println("status = " + a.getStatuString());
			System.out.println("user id = " + a.getUserId());
			System.out.println("gender = " + a.getGenderString());
		}
	}

	public static Appointments getAppointmentByAppmntId(int appmntId) {
		Connection connection = null;
		PreparedStatement pStatement = null;
		Appointments appointment = null;

		try {
			connection = DBUtil.getConnection();
			String query = "select * from appointment where appointment_id=?;";
			pStatement = connection.prepareStatement(query);
			pStatement.setInt(1, appmntId);

			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				appointment = new Appointments();
				appointment.setAppointmentId(resultSet.getInt("appointment_id"));
				appointment.setUserId(resultSet.getInt("user_id"));
				appointment.setFullNameString(resultSet.getString("full_name"));
				appointment.setAgeString(resultSet.getString("age"));
				appointment.setGenderString(resultSet.getString("gender"));
				appointment.setAppointmentDateString(resultSet.getString("appointment_date"));
				appointment.setEmailString(resultSet.getString("email"));
				appointment.setPhoneNumberString(resultSet.getString("phone_number"));
				appointment.setDeseaseString(resultSet.getString("disease"));
				appointment.setDoctorId(resultSet.getInt("doctor_id"));
				appointment.setFullAddressString(resultSet.getString("full_address"));
				appointment.setStatuString(resultSet.getString("status"));
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

		return appointment;
	}

	public static boolean updateStatusInAppointment(int appmntId, int doctorId, String commentString) {
		boolean isStatusUpdated = false;
		Connection connection = null;
		PreparedStatement pstmt = null;

		try {
			connection = DBUtil.getConnection();
			String query = "update appointment set status=? where appointment_id=? and doctor_id=?;";
			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, commentString);
			pstmt.setInt(2, appmntId);
			pstmt.setInt(3, doctorId);

			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected == 1) {
				isStatusUpdated = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isStatusUpdated;
	}

}

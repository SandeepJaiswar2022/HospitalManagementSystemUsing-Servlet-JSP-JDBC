package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.entity.Appointments;

public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userID"));
		String fullNameString = request.getParameter("fullName");
	    String genderString = request.getParameter("gender");
	    String ageString = request.getParameter("age");
	    String appointmentDateString = request.getParameter("appointmentDate");
	    String emailString = request.getParameter("email");
	    String phoneNumberString = request.getParameter("phoneNumber");
	    String deseaseString = request.getParameter("disease");
	    int doctorId = Integer.parseInt(request.getParameter("doctorId"));
	    String fullAddressString = request.getParameter("fullAddress");
	    String statuString = "pending";
	    
	    Appointments appointment = new Appointments(userId, fullNameString, genderString, ageString, appointmentDateString, emailString, phoneNumberString, deseaseString, doctorId, fullAddressString, statuString);
	    
	    boolean addedOrNot = AppointmentDao.saveAppointmentInDatabase(appointment);
	    HttpSession session = request.getSession();
	    
	    if(addedOrNot)
	    {
	    	session.setAttribute("messageFromServer","Appointment Booked Successfully");
	    	response.sendRedirect("userAfterLogin/userIndex.jsp");
	    }
	    else {
	    	session.setAttribute("messageFromServer","Unable to add problem in server");
	    	response.sendRedirect("userAfterLogin/userIndex.jsp");
		}
	}

}

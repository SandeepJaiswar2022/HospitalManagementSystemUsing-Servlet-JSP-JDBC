package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.entity.Doctors;

public class EditDoctorDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullNameString = request.getParameter("fullName");
		String qualificationString = request.getParameter("qualification");
		String specializationString = request.getParameter("specialization");
		String emialString = request.getParameter("email");
		String passwordString = request.getParameter("password");
		String mobileNumberString = request.getParameter("mobileNumber");
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		
		Doctors d = new Doctors(doctorId,fullNameString, qualificationString, specializationString, emialString, mobileNumberString, passwordString);
		boolean isUpdated = DoctorDao.updateDoctorDetails(d);
		
		HttpSession session = request.getSession(false);
	    
		if(isUpdated)
		{
			session.setAttribute("messageFromServer", "Details Updated Successfully");
			response.sendRedirect("adminAfterLogin/doctor.jsp");
		}
		else {
			session.setAttribute("messageFromServer", "Unabe to update problem in server");
			response.sendRedirect("adminAfterLogin/doctor.jsp");
		}
		
	}

}

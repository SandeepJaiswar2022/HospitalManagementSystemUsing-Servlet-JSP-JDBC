package com.doctor.serlvet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.entity.Doctors;

public class DoctorLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailString = request.getParameter("doctorEmail");
		String passwordString = request.getParameter("doctorPassword");
		
		Doctors doctor = DoctorDao.doctorLogin(emailString, passwordString);
		HttpSession session = request.getSession(false);
		
		if(doctor!=null)
		{
			session.setAttribute("doctorObject", doctor);
			response.sendRedirect("doctorAfterLogin/doctorIndex.jsp");
		}
		else {
			session.setAttribute("messageFromServer", "Invalid Email or Password");
			response.sendRedirect("doctorLogin.jsp");
		}
	}

}

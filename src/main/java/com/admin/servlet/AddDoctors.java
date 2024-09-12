package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.entity.Doctors;;

@WebServlet("/addDoctorServlet")
public class AddDoctors extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullNameString = request.getParameter("fullName");
		String qualificationString = request.getParameter("qualification");
		String specializationString = request.getParameter("specialization");
		String emailString = request.getParameter("email");
		String mobileNumberString = request.getParameter("mobileNumber");
		String passwordString = request.getParameter("password");
		
		Doctors doctor = new Doctors(fullNameString, qualificationString, specializationString, emailString, mobileNumberString, passwordString);   
		boolean savedOrNot = DoctorDao.saveDoctorInDatabase(doctor);
		
		HttpSession session = request.getSession();
		
		if(savedOrNot)
		{
			session.setAttribute("messageFromServer", "Doctor Added Successfully");
			response.sendRedirect("adminAfterLogin/adminIndex.jsp");
		}
		else {
			session.setAttribute("messageFromServer", "Unable to add doctor problem in server");
			response.sendRedirect("adminAfterLogin/adminIndex.jsp");
		}
	}

}

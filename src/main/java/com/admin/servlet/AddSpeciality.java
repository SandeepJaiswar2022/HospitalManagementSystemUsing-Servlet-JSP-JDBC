package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.entity.Specialities;

@WebServlet("/addSpeciality")
public class AddSpeciality extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String specialityString = request.getParameter("speciality");
		
		Specialities sepeciality = new Specialities(specialityString);
		
		boolean savedOrnot = SpecialistDao.saveSpecialistInDatabase(sepeciality);
		HttpSession session = request.getSession();
		
		if(savedOrnot)
		{
			session.setAttribute("messageFromServer", "Specialization Added Successfully");
			response.sendRedirect("adminAfterLogin/adminIndex.jsp");
		}
		else {
			session.setAttribute("messageFromServer", "Unable to add Specialization problem in Server");
			response.sendRedirect("adminAfterLogin/adminIndex.jsp");
		}
	}

}

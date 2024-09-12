package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;

public class DeletDoctorServet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));

		boolean isDeleted = DoctorDao.deleteDoctorById(doctorId);

		HttpSession session = request.getSession(false);

		if (isDeleted) {
			session.setAttribute("messageFromServer", "Doctor Deleted Successfully");
			response.sendRedirect("adminAfterLogin/doctor.jsp");
		} else {
			session.setAttribute("messageFromServer", "Unabe to delete problem in server");
			response.sendRedirect("adminAfterLogin/doctor.jsp");
		}
	}

}

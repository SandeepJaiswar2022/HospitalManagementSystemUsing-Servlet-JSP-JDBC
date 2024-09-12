package com.doctor.serlvet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dao.UserDao;

public class DoctorChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String oldPasswordString = request.getParameter("oldPassword");
		String newPasswordString = request.getParameter("newPassword");
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));

		boolean isOldPasswordCorrect = DoctorDao.isOldPasswordCorrect(oldPasswordString, doctorId);

		HttpSession session = request.getSession(false);

		if (isOldPasswordCorrect) {
			boolean isNewPasswordUpdated = DoctorDao.isNewPasswordUpdated(newPasswordString, doctorId);
			if (isNewPasswordUpdated) {
				session.setAttribute("messageFromServer", "Password Updated Successfully");
				response.sendRedirect("doctorAfterLogin/doctorIndex.jsp");
			} else {
				session.setAttribute("messageFromServer", "Unable to updated problem in server");
				response.sendRedirect("doctorAfterLogin/doctorIndex.jsp");
			}
		} else {
			session.setAttribute("messageFromServer", "Invalid Old Password");
			response.sendRedirect("doctorAfterLogin/doctorIndex.jsp");
		}
	}

}

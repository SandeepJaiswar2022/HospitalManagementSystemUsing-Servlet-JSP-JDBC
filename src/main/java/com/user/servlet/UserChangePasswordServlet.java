package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;

public class UserChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldPasswordString = request.getParameter("oldPassword");
		String newPasswordString = request.getParameter("newPassword");
		int userId = Integer.parseInt(request.getParameter("userID"));
		
		boolean isOldPasswordCorrect = UserDao.isOldPasswordCorrect(oldPasswordString, userId);
		
		HttpSession session = request.getSession(false);
		
		if(isOldPasswordCorrect)
		{
			boolean isNewPasswordUpdated = UserDao.isNewPasswordUpdated(newPasswordString, userId);
			if(isNewPasswordUpdated)
			{
				session.setAttribute("messageFromServer", "Password Updated Successfully");
			    response.sendRedirect("userAfterLogin/userIndex.jsp");
			}
			else {
				session.setAttribute("messageFromServer", "Unable to updated problem in server");
			    response.sendRedirect("userAfterLogin/userIndex.jsp");
			}
		}
		else {
			session.setAttribute("messageFromServer", "Invalid Old Password");
		    response.sendRedirect("userAfterLogin/userIndex.jsp");
		}
	}

}

package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entity.Users;
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailString = request.getParameter("email");
		String passwordString = request.getParameter("password");
		
		Users user = UserDao.doesExists(emailString, passwordString);
		HttpSession session = request.getSession(false);
		
		if(user!=null)
		{
			session.setAttribute("userObject", user);
			response.sendRedirect("userAfterLogin/userIndex.jsp");
		}
		else {
			session.setAttribute("messageFromServer", "Invalid Email or password for user");
			response.sendRedirect("userLogin.jsp");
		}
	}

}

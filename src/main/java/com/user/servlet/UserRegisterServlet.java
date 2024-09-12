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

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String usernameString = request.getParameter("username");
		String emailString = request.getParameter("email");
		String passwordString = request.getParameter("password");

		Users user = new Users(usernameString, passwordString, emailString);

		boolean savedOrnot = UserDao.saveUserInDatabase(user);
		HttpSession session = request.getSession();

//		PrintWriter outPrintWriter = response.getWriter();
		if (savedOrnot) {
			session.setAttribute("messageFromServer", "Registered Successfully please login to Continue");
			response.sendRedirect("userLogin.jsp");
			//System.out.println("Register Successfully");
		} else {
			session.setAttribute("messageFromServer", "Unable to register");
			response.sendRedirect("userRegister.jsp");
			//System.out.println("Unable to register");
		}
	}
}

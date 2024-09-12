package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Users;

public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String adminEmailString = request.getParameter("adminEmail");
		String adminPasswordString = request.getParameter("adminPassword");

		HttpSession session = request.getSession();
		try {
			if ("a".equals(adminEmailString) && "a".equals(adminPasswordString)) {
				session.setAttribute("adminObject", new Users());
				response.sendRedirect("adminAfterLogin/adminIndex.jsp");
			}
			else {
				session.setAttribute("messageFromServer", "Invalid username or password for admin");
				response.sendRedirect("adminLogin.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

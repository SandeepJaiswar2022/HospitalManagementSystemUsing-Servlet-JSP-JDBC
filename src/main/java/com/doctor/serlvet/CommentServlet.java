package com.doctor.serlvet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;

/**
 * Servlet implementation class CommentServlet
 */
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int appmntId = Integer.parseInt(request.getParameter("appmntId"));
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		String commentString = request.getParameter("drComment");
		
		boolean isStatusUpdated = AppointmentDao.updateStatusInAppointment(appmntId,doctorId,commentString);
		
		HttpSession session = request.getSession(false);
		
		if(isStatusUpdated)
		{
			session.setAttribute("messageFromServer", "Commented Successfully");
			response.sendRedirect("doctorAfterLogin/patients.jsp");
		}
		else {
			session.setAttribute("messageFromServer", "Unable to comment proble on server");
			response.sendRedirect("doctorAfterLogin/patients.jsp");
		}
	}

}

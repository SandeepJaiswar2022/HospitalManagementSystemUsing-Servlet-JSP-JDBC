<%@page import="com.dao.UserDao"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/44e8cd70ef.js"
	crossorigin="anonymous"></script>
<!-- Bootstrap Icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="../component/styles.css">
<title>DoctorWelcomePage</title>
<style>
.container-fluid {
	width: 100%;
	padding-left: 0;
	padding-right: 0;
}

.anchor:hover {
	color: rgb(2, 17, 227) !important;
}
</style>
</head>
<body>

	<!-- navbar Starts -->
	<%@include file="doctorNavbar.jsp"%>
	<!-- navbar Ends -->
	<!-- Clearing Cache Starts -->

	<!-- Message Component Starts -->
	<%@include file="../component/message.jsp"%>
	<!-- Message Component End -->
	
	<%
	response.setHeader("Cache-Control", "no-cache");

	//Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control", "no-store");

	//Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0);

	//Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma", "no-cache");
	//HTTP 1.0 backward enter code here
	%>
	<!-- Clearing Cache Ends -->
	<%
	if (session.getAttribute("doctorObject") == null) {
		session.invalidate();
		response.sendRedirect("../doctorLogin.jsp");
	}
	%>


	<!-- Cards View patient Starts-->
	<div class="container text-center">
		<div class="row my-3">
			<div class="col-12 col-lg-12">
				<div class="card text-center shadow-lg mb-5 bg-body rounded">
					<div class="card-header bg-info text-white fs-5">View Your
						Patients/Appointments</div>
					<div class="card-body">
						<p class="text-center">ipsum dolor sit amet consectetur
							adipisicing elit. Beatae enim aliquam tenetur odio inventore
							velit, sequi quis eius vel voluptas quae expedita quaerat
							cupiditate blanditiis eserunt voluptates? Inventore ducimus
							officiis tempora numquam consequatur velit. vel voluptas quae
							expedita enim aliquam adipisicing elit. Eserunt voluptates?
							Inventore Beatae enim aliquam tenetur odio inventore velit, sequi
							voluptas quae expedita quaerat cupiditate blanditiis .</p>
						<a class="btn btn-primary" href="patients.jsp">View</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Cards View patient Ends-->
	<!-- Cards and Image for doctor index page Starts-->
	<div class="container text-center">
		<div class="row">
			<div
				class="col-12 col-lg-6 p-3 d-flex flex-column justify-content-around">
				<div class="card cursor-pointer bg-secondary text-center">
					<div class="card-body text-white">
						<i class="fa-solid fa-calendar-check fa-2x"></i>
						<p class="card-text h5">Total Appointments</p>
						<h5 class="card-title"><%=AppointmentDao.getAppointmentsCount()%></h5>
					</div>
				</div>
			</div>
			<div
				class="col-12 col-lg-6 p-3 d-flex flex-column justify-content-around">
				<div class="card cursor-pointer bg-secondary text-center">
					<div class="card-body text-white">
						<i class="fa-solid fa-calendar-check fa-2x"></i>
						<p class="card-text h5">Total Users</p>
						<h5 class="card-title"><%=UserDao.getUsersCount()%></h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Cards and Image for doctor index page Ends-->

	<!-- Footer Starts  -->
	<%@include file="../component/footer.jsp"%>
	<!-- Footer Ends  -->

	<!-- JavaScripts Starts  -->
	<%@include file="../component/JsScripts.jsp"%>
	<!-- JavaScripts Ends  -->
</body>
</html>
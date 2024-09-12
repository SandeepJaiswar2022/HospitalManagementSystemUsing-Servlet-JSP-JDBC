<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Appointments"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctors"%>
<%@page import="java.util.List"%>
<%@ page import="com.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<script src="https://cdn.tailwindcss.com"></script>
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
<title>UserAppointment</title>
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

	<!-- Message Component Starts -->
	<%@include file="../component/message.jsp"%>
	<!-- Message Component End -->

	<!-- Clearing Cache Starts -->
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

	<div class="text-center m-3">
		<a href="patients.jsp"><button
				class="btn btn-primary rounded-pill">Go Back</button></a> <a
			href="doctorIndex.jsp"><button
				class="btn btn-primary rounded-pill">Go To Home</button></a>
	</div>

	<!-- Clearing Cache Ends -->
	<!-- Doctor page Content Starts -->

	<%
	int appmntId = Integer.parseInt(request.getParameter("appointment_id"));
	Appointments appmnt = AppointmentDao.getAppointmentByAppmntId(appmntId);
	%>

	<div class="container rounded w-50 border border-2 my-4 py-3 shadow-lg">
		<div class="text-center">
			<p class="fs-3 text-info">Patient Comment</p>
		</div>
		<form action="../CommentServlet" method="post">
			<input type="hidden" name="appmntId"
				value="<%=appmnt.getAppointmentId()%>"> <input type="hidden"
				name="doctorId" value="<%=appmnt.getDoctorId()%>">
			<div class="container">
				<div class="row">
					<div class="col-12 col-lg-6">
						<div class="mb-3">
							<label for="" class="form-label">Full Name</label> <input
								type="text" value="<%=appmnt.getFullNameString()%>"
								name="fullName" required class="form-control">
						</div>
					</div>
					<div class="col-12 col-lg-6">
						<div class="mb-3">
							<label for="" class="form-label">Age</label> <input type="text"
								name="age" value="<%=appmnt.getAgeString()%>" required
								class="form-control">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-lg-6">
						<div class="mb-3">
							<label for="" class="form-label">Contact</label> <input
								type="text" value="<%=appmnt.getPhoneNumberString()%>"
								name="contact" required class="form-control">
						</div>
					</div>
					<div class="col-12 col-lg-6">
						<div class="mb-3">
							<label for="" class="form-label">Disease</label> <input
								type="text" value="<%=appmnt.getDeseaseString()%>"
								name="disease" required class="form-control">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="mb-3">
							<label for="ContactMessage" class="form-label">Comment</label>
							<textarea class="form-control" name="drComment" id="fullAddress"
								rows="4" placeholder=""></textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="mb-3">
							<button type="submit" data-bs-toggle="modal"
								class="btn w-100 btn-primary btn-lg btn-block close">SUBMIT
							</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- Doctor page Content Ends -->


	<!-- Footer Starts  -->
	<%@include file="../component/footer.jsp"%>
	<!-- Footer Ends  -->

	<!-- JavaScripts Starts  -->
	<%@include file="../component/JsScripts.jsp"%>
	<!-- JavaScripts Ends  -->
</body>

</html>
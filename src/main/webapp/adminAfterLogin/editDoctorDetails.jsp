<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctors"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.entity.Specialities"%>
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
<link rel="stylesheet" href="component/styles.css">
<title>EditDoctorDetailsPage</title>
<style>
.container-fluid {
	width: 100%;
	padding-left: 0;
	padding-right: 0;
}

.anchor:hover {
	color: rgb(209, 210, 223) !important;
}
</style>
</head>
<body class="d-flex flex-column min-vh-100">

	<!-- navbar Starts -->
	<%@include file="adminNavbar.jsp"%>
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
	if (session.getAttribute("adminObject") == null) {
		response.sendRedirect("../adminLogin.jsp");
		session.invalidate();
	}
	%>
	<!-- Clearing Cache Ends -->


	<div class="text-center m-3">
		<a href="adminIndex.jsp"><button
				class="btn btn-primary rounded-pill">Go To Home</button></a>
	</div>


    <%
    int doctorId = Integer.parseInt(request.getParameter("doctorId"));
    Doctors d = DoctorDao.getDoctorById(doctorId);
    %>
	<!-- Doctor page Content Starts -->
	<div class="container rounded w-50 border border-2 my-4 py-3 shadow-lg">
		<div class="text-center">
			<p class="fs-3 text-info">Update Details</p>
		</div>
		<form action="../EditDoctorDetailsServlet" method="post">
			<div class="mb-3">
				<label for="" class="form-label">Full Name</label> <input
					type="text" name="fullName" required value="<%=d.getFullNameString()%>" class="form-control">
			</div>
			<div class="mb-3">
				<label for="" class="form-label">Qualification</label> <input
					type="text" name="qualification" value="<%=d.getQualificationString()%>" required class="form-control">
			</div>
			<div class="mb-3">
				<label for="" class="form-label">Specialization</label> <select
					name="specialization" required class="form-control" id="">
					<option><%=d.getSpecializationString()%></option>
					<%
					List<Specialities> specialitiesList = SpecialistDao.GetAllSpecialization();
					for (Specialities s : specialitiesList) {
					%>
					<option><%=s.getSpecialityString()%></option>
					<%
					}
					%>
				</select>
			</div>
			<div class="mb-3">
				<label for="" class="form-label">Email</label> <input type="email"
					name="email" required class="form-control" value="<%=d.getEmailString()%>">
			</div>
			<div class="mb-3">
				<label for="" class="form-label">Mobile Number</label> <input
					type="tel" name="mobileNumber" value="<%=d.getMobileNumberString()%>" required class="form-control">
			</div>
			<div class="mb-4">
				<label for="" class="form-label">Password</label> <input
					type="text" name="password" value="<%=d.getPasswordString()%>" required class="form-control">
			</div>
			<input type="hidden" name="doctorId" value="<%=d.getId()%>">
			<div class="mb-2 text-center">
				<button type="submit" class="btn btn-primary w-100">Update</button>
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
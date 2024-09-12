<%@page import="com.dao.UserDao"%>
<%@page import="com.dao.AppointmentDao"%>
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
<title>AdminPage</title>
<style>
.container-fluid {
	width: 100%;
	padding-left: 0;
	padding-right: 0;
}

.divBgColor {
	background-color: rgb(109, 132, 208);
}

.anchor:hover {
	color: rgb(209, 210, 223) !important;
}
</style>
</head>
<body>
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

	<div class="text-center my-5">
		<button class="btn btn-primary btn-lg rounded mx-5"
			data-bs-toggle="modal" data-bs-target="#AddDoctorModal">ADD
			DOCTOR</button>
		<button class="btn btn-primary btn-lg rounded" data-bs-toggle="modal"
			data-bs-target="#specialityModal">ADD SPECIALIZATION</button>
	</div>
	<!-- Clearing Cache Ends -->

	<!-- Cards and Image for admin index page Starts-->
	<div class="container text-center p-5">
		<div class="row">
			<div class="col-12 col-lg-6">
				<img src="../images/admin2.jpg" class="rounded img-fluid h-100"
					style="object: fit-cover;" alt="admin picture">
			</div>
			<div class="col-12 col-lg-6 ">
				<div class="card cursor-pointer text-center">
					<div class="card-body divBgColor text-white">
						<i class="fa-solid fa-calendar-check fa-2x"></i>
						<p class="card-text h5">Total Appointments</p>
						<h5 class="card-title"><%=AppointmentDao.getAppointmentsCount()%></h5>
					</div>
				</div>
				<div class="card cursor-pointer text-center">
					<div class="card-body divBgColor text-white">
						<i class="fa-solid fa-user-doctor fa-2x"></i>
						<p class="card-text h5">Doctors</p>
						<h5 class="card-title"><%=DoctorDao.getDoctorsCount()%></h5>
					</div>
				</div>

				<div class="card cursor-pointer text-center">
					<div class="card-body divBgColor text-white">
						<i class="fa-solid fa-circle-user fa-2x"></i>
						<p class="card-text h5">Users</p>
						<h5 class="card-title"><%=UserDao.getUsersCount()%></h5>
					</div>
				</div>
				<div class="card cursor-pointer text-center button">
					<div class="card-body divBgColor text-white">
						<i class="fa-solid fa-user-nurse fa-2x"></i>
						<p class="card-text h5">Specializations</p>
						<h5 class="card-title"><%=SpecialistDao.getSpecializationCount()%></h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Cards and Image for admin index page Ends-->

	<!--Specialization Modal Starts-->
	<div class="modal fade" id="specialityModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title text-primary" id="exampleModalLongTitle">ADD
						SPECIALIZATION</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addSpeciality" method="post">
						<div class="form-floating mb-2">
							<input type="text" required class="form-control" id="fname"
								placeholder="Username" name="speciality"> <label
								for="fname">Enter Speciality</label>
						</div>
						<div class="text-center">
							<button type="submit"
								class="btn btn-primary btn-lg btn-block close">ADD</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--Specialization Modal Ends-->

	<!--Doctors Modal Starts-->
	<div class="modal fade" id="AddDoctorModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title text-primary" id="exampleModalLongTitle">ADD
						DOCTOR</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addDoctorServlet" method="post">
						<div class="mb-3">
							<label for="" class="form-label">Full Name</label> <input
								type="text" name="fullName" required class="form-control">
						</div>
						<div class="mb-3">
							<label for="" class="form-label">Qualification</label> <input
								type="text" name="qualification" required class="form-control">
						</div>
						<div class="mb-3">
							<label for="" class="form-label">Specialization</label> <select
								name="specialization" required class="form-control" id="">
								<option>--select--</option>
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
							<label for="" class="form-label">Email</label> <input
								type="email" name="email" required class="form-control">
						</div>
						<div class="mb-3">
							<label for="" class="form-label">Mobile Number</label> <input
								type="tel" name="mobileNumber" required class="form-control">
						</div>
						<div class="mb-4">
							<label for="" class="form-label">Password</label> <input
								type="password" name="password" required class="form-control">
						</div>
						<div class="mb-2 text-center">
							<button type="submit" class="btn btn-primary w-100">ADD</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--Doctors Modal Ends-->

	<!-- Footer Starts  -->
	<%@include file="../component/footer.jsp"%>
	<!-- Footer Ends  -->

	<!-- JavaScripts Starts  -->
	<%@include file="../component/JsScripts.jsp"%>
	<!-- JavaScripts Ends  -->
</body>
</html>
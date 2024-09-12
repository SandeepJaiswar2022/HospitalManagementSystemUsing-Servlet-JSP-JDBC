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
	<%@include file="userNavbar.jsp"%>
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
	if (user == null) {
		response.sendRedirect("../userLogin.jsp");
		session.invalidate();
	}
	%>
	<!-- Clearing Cache Ends -->

	<!-- Book Appointment Starts -->
	<div class="container text-center">
		<div class="row my-3 mb-5">
			<div class="col-12 col-lg-12">
				<div class="card text-center shadow-lg mb-5 bg-body rounded">
					<div class="card-header bg-info text-white fs-5">BOOK AN
						APPOINMENT</div>
					<div class="card-body">
						<h5 class="card-title">Book Your Private Consultant</h5>
						<p class="text-center">ipsum dolor sit amet consectetur
							adipisicing elit. Beatae enim aliquam tenetur odio inventore
							velit, sequi quis eius vel voluptas quae expedita quaerat
							cupiditate blanditiis eserunt voluptates? Inventore ducimus
							officiis tempora numquam consequatur velit. vel voluptas quae
							expedita enim aliquam adipisicing elit. Eserunt voluptates?
							Inventore Beatae enim aliquam tenetur odio inventore velit, sequi
							voluptas quae expedita quaerat cupiditate blanditiis .</p>
						<a href="#" class="btn btn-primary" data-bs-toggle="modal"
							data-bs-target="#appointmentModal">BOOK NOW</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row my-3 mb-5">
			<div class="col-12 col-lg-12">
				<div class="card text-center shadow-lg mb-5 bg-body rounded">
					<div class="card-header bg-warning text-white fs-5">MY
						APPOINTMENTS</div>
					<div class="card-body text-center">
						<h5 class="card-title">Your Feedback Matters To Us</h5>
						<p class="text-center">ipsum dolor sit amet consectetur
							adipisicing elit. Beatae enim aliquam tenetur odio inventore
							velit, sequi quis eius vel voluptas quae expedita quaerat
							cupiditate blanditiis eserunt voluptates? Inventore ducimus
							officiis tempora numquam consequatur velit. vel voluptas quae
							expedita enim aliquam adipisicing elit. Eserunt voluptates?
							Inventore Beatae enim aliquam tenetur odio inventore velit, sequi
							voluptas quae expedita quaerat cupiditate blanditiis .</p>
						<a href="myAppointment.jsp" class="btn btn-primary px-4">VIEW</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--Book Appointment Modal Starts-->
	<div class="modal fade" id="appointmentModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title text-primary" id="exampleModalLongTitle">Book
						Appointment</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../AppointmentServlet" method="post">
						<%
						if (user != null) {
						%>
						<input type="hidden" name="userID"
							value="<%=user.getIdInteger()%>">
						<%
						}
						%>
						<div class="container">
							<div class="row">
								<div class="col-12 col-lg-6">
									<div class="mb-3">
										<label for="" class="form-label">Full Name</label> <input
											type="text" name="fullName" required class="form-control">
									</div>
								</div>
								<div class="col-12 col-lg-6">
									<div class="mb-3">
										<label for="" class="form-label">Gender</label> <input
											type="text" name="gender" required class="form-control">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-lg-6">
									<div class="mb-3">
										<label for="" class="form-label">Age</label> <input
											type="text" name="age" required class="form-control">
									</div>
								</div>
								<div class="col-12 col-lg-6">
									<div class="mb-3">
										<label for="" class="form-label">Appointment Date</label> <input
											type="date" name="appointmentDate" required
											class="form-control">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-lg-6">
									<div class="mb-3">
										<label for="" class="form-label">Email</label> <input
											type="email" name="email" required class="form-control">
									</div>
								</div>
								<div class="col-12 col-lg-6">
									<div class="mb-3">
										<label for="" class="form-label">Phone no</label> <input
											type="tel" name="phoneNumber" required class="form-control">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-lg-6">
									<div class="mb-3">
										<label for="" class="form-label">Disease</label> <input
											type="tel" name="disease" required class="form-control">
									</div>
								</div>
								<div class="col-12 col-lg-6">
									<div class="mb-3">
										<label for="" class="form-label">Doctors</label> <select
											name="doctorId" required class="form-control" id="">
											<option>--select--</option>
											<%
											List<Doctors> doctorsList = DoctorDao.getAllDoctors();
											for (Doctors d : doctorsList) {
											%>
											<option value="<%=d.getId()%>"><%=d.getFullNameString()%>(<%=d.getSpecializationString()%>)
											</option>
											<%
											}
											%>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<div class="mb-3">
										<label for="ContactMessage" class="form-label">Full
											Address</label>
										<textarea class="form-control" name="fullAddress"
											id="fullAddress" rows="4" placeholder=""></textarea>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<div class="mb-3">
										<button type="submit" data-bs-toggle="modal"
											class="btn w-100 btn-primary btn-lg btn-block close">BOOK
										</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--Book Appointment Modal Ends-->

	<!-- About Section Starts -->
	<div class="container" style="margin-bottom: 3rem;" id="aboutUs">
		<p class="text-center fs-2 mb-5 text-info h1">About us</p>
		<!-- row-1 -->
		<div class="row">
			<div class="col-12 col-lg-6">
				<div class="container">
					<div class="row">
						<div class="col text-center">
							<img src="../images/midical.jpg" alt="" class="img-fluid">
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-lg-6">
				<div class="container">
					<div class="row">
						<div class="col">
							<h5 class="card-title text-center h3 text-success">About
								Healthii</h5>
						</div>
					</div>
					<div class="row">
						<div class="col text-center">
							<p class="card-text text-secondary" style="text-align: justify;">
								Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae
								enim aliquam tenetur odio inventore velit, sequi quis eius vel
								voluptas quae expedita quaerat cupiditate blanditiis ducimus
								soluta itaque aspernatur, illum consequuntur rem deserunt
								voluptates? Inventore ducimus officiis tempora numquam
								consequatur velit ad assumenda molestias veniam. <br> <br>
								Lorem ipsum dolor sit Lorem ipsum dolor sit amet consectetur,
								adipisicing elit. Necessitatibus, omnis Lorem ipsum dolor sit
								amet consectetur adipisicing elit. Ullam, aliquid. consectetur
								adipisicing elit. Officiis suscipit quisquam quidem odio fuga
								possimus quis, praesentium dolores. Lorem ipsum dolor sit amet
								consectetur.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- row-2 -->
		<div class="row mt-5">
			<div class="col-12 col-lg-6">
				<div class="container">
					<div class="row">
						<div class="col text-center">
							<img src="../images/bed.jpg" alt="" class="img-fluid mt-1">
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-lg-6">
				<div class="container">
					<div class="row">
						<div class="col-12 col-lg-6">
							<div class="card shadow border-0">
								<div class="card-body">
									<div class="container">
										<div class="row">
											<div class="col text-center">
												<img src="images/first-aid-kit.png" alt="" height="35px">
											</div>
										</div>
										<div class="row">
											<div class="col">
												<h6 class="card-title text-center text-success">PRIMARY
													CARE</h6>
											</div>
										</div>
									</div>
									<p class="card-text text-secondary"
										style="text-align: justify;">Lorem ipsum dolor sit amet
										consectetur adipisicing elit. Beatae Lorem, ipsum dolor.</p>
								</div>
							</div>
						</div>
						<div class="col-12 col-lg-6">

							<div class="card shadow border-0">
								<div class="card-body">
									<div class="container">
										<div class="row">
											<div class="col text-center">
												<img src="images/lab.png" alt="" height="35px">
											</div>
										</div>
										<div class="row">
											<div class="col">
												<h6 class="card-title text-center text-success">LAB
													TEST</h6>
											</div>
										</div>
									</div>
									<p class="card-text text-secondary"
										style="text-align: justify;">Lorem ipsum dolor sit amet
										consectetur adipisicing elit. Beatae Lorem, ipsum dolor.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-1">
						<div class="col-12 col-lg-6">

							<div class="card shadow border-0">
								<div class="card-body">
									<div class="container">
										<div class="row">
											<div class="col text-center">
												<img src="images/medical-checkup.png" alt="" height="35px">
											</div>
										</div>
										<div class="row">
											<div class="col">
												<h6 class="card-title text-center text-success">SYMPTOM
													CHECK</h6>
											</div>
										</div>
									</div>
									<p class="card-text text-secondary"
										style="text-align: justify;">Lorem ipsum dolor sit amet
										consectetur adipisicing elit. Beatae Lorem, ipsum dolor.</p>
								</div>
							</div>
						</div>
						<div class="col-12 col-lg-6">
							<div class="card shadow border-0">
								<div class="card-body">
									<div class="container">
										<div class="row">
											<div class="col text-center">
												<img src="images/heart-rate.png" alt="" height="35px">
											</div>
										</div>
										<div class="row">
											<div class="col">
												<h6 class="card-title text-center text-success">HEART
													RATE</h6>
											</div>
										</div>
									</div>
									<p class="card-text text-secondary"
										style="text-align: justify;">Lorem ipsum dolor sit amet
										consectetur adipisicing elit. Beatae Lorem, ipsum dolor.</p>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- About Section Ends -->

	<!--Change Password Modal Starts-->
	<div class="modal fade" id="changePasswordModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title text-primary" id="exampleModalLongTitle">UPDATE PASSWORD</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../UserChangePasswordServlet" method="post">
						<div class="form-floating mb-2">
							<input type="text" name="oldPassword" required class="form-control" id="fname"
								placeholder="Username" name="speciality"> <label
								for="fname">OLD PASSWORD</label>
						</div>
						<div class="form-floating mb-2">
							<input type="text" name="newPassword" required class="form-control" id="fname"
								placeholder="Username" name="speciality"> <label
								for="fname">NEW PASSWORD</label>
						</div>
						<%if(user != null) 
						{
						%>
						<input type="hidden" name="userID" value="<%=user.getIdInteger()%>">
						<%
						}
						%>
						<div class="text-center">
							<button type="submit"
								class="btn btn-primary btn-lg btn-block close">UPDATE</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--Change Password Modal Ends-->


	<!-- Footer Starts  -->
	<%@include file="../component/footer.jsp"%>
	<!-- Footer Ends  -->

	<!-- JavaScripts Starts  -->
	<%@include file="../component/JsScripts.jsp"%>
	<!-- JavaScripts Ends  -->
</body>

</html>
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
<link rel="stylesheet" href="component/styles.css">
<title>WelcomePageHealthii</title>
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
	<%@include file="component/navbar.jsp"%>
	<!-- navbar Ends -->
	
	<!-- Message Component Starts -->
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
	
	<!-- Sliding images Starts -->
	<div class="container-fluid mb-5">
		<div id="carouselExampleIndicators"
			class="carousel slide carousel-fade" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item">
					<img src="images/doc2.jpg" class="d-block w-100 img-fluid"
						alt="..." height="530px">
				</div>
				<div class="carousel-item active">
					<img src="images/doc3.jpg" class="d-block w-100 img-fluid"
						alt="..." height="530px">
				</div>
				<div class="carousel-item">
					<img src="images/doctor1.jpg" class="d-block w-100 img-fluid"
						alt="..." height="530px">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<!-- Sliding images End -->

	<!-- key features using grid box Starts -->
	<div class="container mb-5 " id="keyFeatures">
		<p class="text-center fs-2 mb-5 text-info h1">Taking care of your
			health</p>
		<div class="row">
			<div class="col-sm-4">
				<div class="card shadow-lg border-0">
					<div class="card-body">
						<div class="container">
							<div class="row">
								<div class="col text-center">
									<img src="images/doctor.png" alt="" height="60px">
								</div>
							</div>
							<div class="row">
								<div class="col">
									<h5 class="card-title text-center text-success">Qualified
										Doctors</h5>
								</div>
							</div>
						</div>
						<p class="card-text text-secondary" style="text-align: justify;">Lorem
							ipsum dolor sit amet consectetur adipisicing elit. Beatae enim
							aliquam tenetur odio inventore velit, sequi quis eius vel
							voluptas quae expedita quaerat cupiditate blanditiis ducimus
							soluta itaque aspernatur, illum consequuntur rem deserunt
							voluptates? Inventore ducimus officiis tempora numquam
							consequatur velit ad assumenda molestias veniam.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card shadow-lg border-0">
					<div class="card-body">
						<div class="container">
							<div class="row">
								<div class="col text-center">
									<img src="images/24-7.png" alt="" height=" 60px">
								</div>
							</div>
							<div class="row">
								<div class="col">
									<h5 class="card-title text-center text-success">24/7
										Service Availabe</h5>
								</div>
							</div>
						</div>
						<p class="card-text text-secondary" style="text-align: justify;">Lorem
							ipsum dolor sit amet consectetur adipisicing elit. Beatae enim
							aliquam tenetur odio inventore velit, sequi quis eius vel
							voluptas quae expedita quaerat cupiditate blanditiis ducimus
							soluta itaque aspernatur, illum consequuntur rem deserunt
							voluptates? Inventore ducimus officiis tempora numquam
							consequatur velit ad assumenda molestias Lorem, ipsum dolor.
							Lorem ipsum dolor sit.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card shadow-lg border-0">
					<div class="card-body">
						<div class="container">
							<div class="row">
								<div class="col text-center">
									<img src="images/emergency-services.png" alt="" height="60px">
								</div>
							</div>
							<div class="row">
								<div class="col">
									<h5 class="card-title text-center text-success">Emergency
										Care</h5>
								</div>
							</div>
						</div>
						<p class="card-text text-secondary" style="text-align: justify;">Lorem
							ipsum dolor sit amet consectetur adipisicing elit. Beatae enim
							aliquam tenetur odio inventore velit, sequi quis eius vel
							voluptas quae expedita quaerat cupiditate blanditiis ducimus
							soluta itaque aspernatur, illum consequuntur rem deserunt
							voluptates? Inventore ducimus officiis tempora numquam
							consequatur velit ad assumenda molestias sum dolor sit amet
							consectetur.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- key features using grid box Ends -->


	<!-- About Section Starts -->
	<div class="container" style="margin-bottom: 3rem;" id="aboutUs">
		<p class="text-center fs-2 mb-5 text-info h1">About us</p>
		<!-- row-1 -->
		<div class="row">
			<div class="col-12 col-lg-6">
				<div class="container">
					<div class="row">
						<div class="col text-center">
							<img src="images/midical.jpg" alt="" class="img-fluid">
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
							<img src="images/bed.jpg" alt="" class="img-fluid mt-1">
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


	<!-- ContactUs Starts -->
	<div class="container mb-5" id="contactUs">
		<p class="text-center fs-2 mb-5 text-info h1">Contact us</p>
		<div class="row">
			<div class="col-md-7">
				<h4 class="text-success">Get in touch</h4>
				<div class="mb-3">
					<label for="ContactName" class="form-label">Name</label> <input
						type="text" class="form-control" name="" id="ContactName"
						placeholder="Enter your name">
				</div>
				<div class="mb-3">
					<label for="ContactEmail" class="form-label">Email</label> <input
						type="email" class="form-control" name="" id="ContactEmail"
						placeholder="Enter your email">
				</div>
				<div class="mb-3">
					<label for="ContactNumber" class="form-label">Contact
						Number</label> <input type="tel" class="form-control" name=""
						id="ContactNumber" placeholder="contact number">
				</div>
				<div class="mb-3">
					<label for="ContactMessage" class="form-label">Message</label>
					<textarea class="form-control" name="" id="ContactMessage" rows="4"
						placeholder="Message"></textarea>
				</div>
				<div class="mb-3">
					<button type="submit" data-bs-toggle="modal"
						class="btn w-100 btn-primary btn-lg btn-block close">SEND
						US</button>
				</div>
			</div>
			<div class="col-md-5">
				<h4 class="text-success">Contact Details</h4>
				<div class="mt-5 ">
					<div class="d-flex gap-2 mt-4">
						<i class="h6 bi bi-geo-alt-fill"></i>
						<p class="h6 text-secondary">Address : 198 west 21th street,
							opposite to k-mart, Raipur</p>
					</div>
					<div class="d-flex gap-2 mt-4">
						<i class="h6 bi bi-telephone-fill"></i>
						<p class="h6 text-secondary">Contact : 8745678934</p>
					</div>
					<div class="d-flex gap-2 mt-4">
						<i class="h6 bi bi-envelope-fill"></i>
						<p class="h6 text-secondary">Email : testing@gamil.com</p>
					</div>
					<div class="d-flex gap-2 mt-4">
						<i class="h6 bi bi-browser-chrome"></i>
						<p class="h6 text-secondary">Website : www.testing.com</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ContactUs Ends -->


	<!--User Register Modal Starts-->
	<div class="modal fade" id="register" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title text-primary" id="exampleModalLongTitle">Register</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="UserRegister" method="post">
						<div class="form-floating mb-2">
							<input type="text" required class="form-control" id="fname"
								placeholder="Username" name="username"> <label
								for="fname">Username</label>
						</div>
						<div class="form-floating mb-2">
							<input type="email" required class="form-control" id="femail"
								placeholder="Email" name="email"> <label for="femail">Email</label>
						</div>
						<div class="form-floating mb-2">
							<input type="password" required class="form-control" id="fpass"
								placeholder="Password" name="password"> <label
								for="fpass">Password</label>
						</div>
						<button type="submit"
							class="btn w-100 btn-primary btn-lg btn-block">Register</button>
					</form>
				</div>
				<div class="text-center mb-4 hover-overlay">
					<button type="button" data-bs-toggle="modal"
						data-bs-target="#login" class="close border-0 bg-white anchor"
						data-bs-dismiss="modal" aria-label="Close">I already have
						an account</button>
				</div>
			</div>
		</div>
	</div>
	<!--User Register Modal Ends-->


	<!--User Login Modal Starts-->
	<div class="modal fade" id="login" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title text-primary" id="exampleModalLongTitle">Login</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="">
						<div class="form-floating mb-2">
							<input type="email" required class="form-control" id="femail"
								placeholder="Email"> <label for="femail">Email</label>
						</div>
						<div class="form-floating mb-2">
							<input type="password" required class="form-control" id="fpass"
								placeholder="Password"> <label for="fpass">Password</label>
						</div>
						<button type="submit"
							class="btn w-100 btn-primary btn-lg btn-block">Login</button>
					</form>
				</div>
				<div class="text-center mb-4 hover-overlay">
					<button type="button" data-bs-toggle="modal"
						data-bs-target="#register" class="close border-0 bg-white anchor"
						data-bs-dismiss="modal" aria-label="Close">Don't have an
						account</button>
				</div>
			</div>
		</div>
	</div>
	<!--User Login Modal Ends-->


	<!--Admin Login Modal Starts-->
	<div class="modal fade" id="adminLoginModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title text-primary" id="exampleModalLongTitle">Admin
						Login</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="AdminLogin" method="post">
						<div class="form-floating mb-2">
							<input type="email" required class="form-control" id="femail"
								placeholder="Email" name="adminEmail"> <label
								for="femail">Email</label>
						</div>
						<div class="form-floating mb-2">
							<input type="password" required class="form-control" id="fpass"
								placeholder="Password" name="adminPassword"> <label
								for="fpass">Password</label>
						</div>
						<button type="submit" data-bs-toggle="modal"
							class="btn w-100 btn-primary btn-lg btn-block close">Login</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--Admin Login Modal Ends-->

	<!-- Footer Starts  -->
	<%@include file="component/IndexPageFooter.jsp"%>
	<!-- Footer Ends  -->

	<!-- JavaScripts Starts  -->
	<%@include file="component/JsScripts.jsp"%>
	<!-- JavaScripts Ends  -->
</body>

</html>
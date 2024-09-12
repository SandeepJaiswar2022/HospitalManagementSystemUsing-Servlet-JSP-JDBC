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
<title>UserLogin</title>
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
	<%@include file="component/message.jsp"%>
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

	<div class="container text-center">
		<div class="row">
			<div
				class="col-12 col-lg-6 p-3 border bg-dark d-flex align-items-center">
				<div class="modal-body bg-white">
					<form action="UserLoginServlet" method="post">
						<div class="card-body text-dark">
							<i class="fa-solid fa-user fa-3x"></i>
							<p class="card-text h3 text-info">USER LOGIN</p>
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
							class="btn w-100 btn-primary btn-lg btn-block">LOGIN</button>
					</form>
					<div class="text-center my-3 hover-overlay">
						<a class="text-secondary anchor" href="userRegister.jsp">I
							don't have account</a>
					</div>
				</div>
			</div>
			<div class="col-12 col-lg-6">
				<img src="images/userlogin.jpg" class="rounded img-fluid h-100"
					style="object: fit-cover;" alt="admin picture">
			</div>
		</div>
	</div>

	<!-- Footer Starts  -->
	<%@include file="component/footer.jsp"%>
	<!-- Footer Ends  -->

	<!-- JavaScripts Starts  -->
	<%@include file="component/JsScripts.jsp"%>
	<!-- JavaScripts Ends  -->


</body>
</html>
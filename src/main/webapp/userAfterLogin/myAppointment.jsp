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

	<!-- Clearing Cache Ends -->
	<div class="text-center m-3">
		<a href="userIndex.jsp"><button
				class="btn btn-primary rounded-pill">Go To Home</button></a>
	</div>

	<!-- Clearing Cache Ends -->
	<!-- Doctor page Content Starts -->
	<section class=" p-3 sm:p-5 h-screen">
		<div
			class="bg-gray-800 relative shadow-md sm:rounded-lg overflow-hidden">
			<div
				class="relative overflow-hidden  shadow-md bg-gray-800 sm:rounded-lg">
				<div class="overflow-x-auto">
					<table class="w-full text-sm text-left table table-striped ">
						<!-- w-full text-sm text-left text-gray-500 dark:text-gray-400 -->
						<thead
							class="text-base uppercase text-white dark:border-gray-700 dark:text-gray-400">
							<tr>
								<th scope="col" class="px-4 py-3">FullName</th>
								<th scope="col" class="px-4 py-3">Gender</th>
								<th scope="col" class="px-4 py-3">Age</th>
								<th scope="col" class="px-4 py-3">Appointment Date</th>
								<th scope="col" class="px-4 py-3">Disease</th>
								<th scope="col" class="px-4 py-3">Doctor Name</th>
								<th scope="col" class="px-4 py-3">Status</th>
							</tr>
						</thead>

						<tbody>
							<%
							if (user != null) {
								int userId = user.getIdInteger();
								List<Appointments> appointmentList = AppointmentDao.getAllAppointmentsOfUserById(userId);
								for (Appointments a : appointmentList) {
							%>
							<tr class="border-b bg-gray-50 dark:border-gray-40">
								<th scope="row"
									class="px-4 py-3 font-medium whitespace-nowrap dark:text-white">
									<%=a.getFullNameString()%></th>
								<td class="px-4 font-semibold py-3"><%=a.getGenderString()%></td>
								<td class="px-4 font-semibold py-3"><%=a.getAgeString()%></td>
								<td class="px-4 font-semibold py-3"><%=a.getAppointmentDateString()%></td>
								<td class="px-4 font-semibold py-3"><%=a.getDeseaseString()%></td>
								<td class="px-4 font-semibold py-3"><%=DoctorDao.getDoctorNameById(a.getDoctorId())%></td>
								<td class="px-4 font-semibold py-3">
									<%
									if ("pending".equals(a.getStatuString())) {
									%> <a href="#" class="btn btn-warning"><i
										class="fa-regular fa-clock mx-1"></i>Pending</a> <%
 } else {
 %> <%=a.getStatuString()%> <%
 }
 %>
								</td>
							</tr>
							<%
							}
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!-- Doctor page Content Ends -->


	<!--Change Password Modal Starts-->
	<div class="modal fade" id="changePasswordModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title text-primary" id="exampleModalLongTitle">UPDATE
						PASSWORD</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../UserChangePasswordServlet" method="post">
						<div class="form-floating mb-2">
							<input type="text" name="oldPassword" required
								class="form-control" id="fname" placeholder="Username"
								name="speciality"> <label for="fname">OLD
								PASSWORD</label>
						</div>
						<div class="form-floating mb-2">
							<input type="text" name="newPassword" required
								class="form-control" id="fname" placeholder="Username"
								name="speciality"> <label for="fname">NEW
								PASSWORD</label>
						</div>
						<%
						if (user != null) {
						%>
						<input type="hidden" name="userID"
							value="<%=user.getIdInteger()%>">
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
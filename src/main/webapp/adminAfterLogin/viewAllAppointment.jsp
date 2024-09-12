<%@page import="com.entity.Appointments"%>
<%@page import="com.dao.AppointmentDao"%>
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
								<th scope="col" class="px-4 py-3">FULLNAME</th>
								<th scope="col" class="px-4 py-3">GENDER</th>
								<th scope="col" class="px-4 py-3">AGE</th>
								<th scope="col" class="px-4 py-3">APPOINTMENT DATE</th>
								<th scope="col" class="px-4 py-3">DISEASE</th>
								<th scope="col" class="px-4 py-3">DOCTOR NAME</th>
								<th scope="col" class="px-4 py-3">EMAIL</th>
								<th scope="col" class="px-4 py-3">CONTACT</th>
								<th scope="col" class="px-4 py-3">STATUS</th>
							</tr>
						</thead>

						<tbody>
							<%
							List<Appointments> appointmentList = AppointmentDao.getAllAppointments();
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
								<td class="px-4 font-semibold py-3"><%=a.getEmailString()%></td>
								<td class="px-4 font-semibold py-3"><%=a.getPhoneNumberString()%></td>
								<td class="px-4 font-semibold py-3"><%=a.getStatuString()%></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!-- Doctor page Content Ends -->


	<!-- Footer Starts  -->
	<%@include file="../component/footer.jsp"%>
	<!-- Footer Ends  -->

	<!-- JavaScripts Starts  -->
	<%@include file="../component/JsScripts.jsp"%>
	<!-- JavaScripts Ends  -->
</body>
</html>
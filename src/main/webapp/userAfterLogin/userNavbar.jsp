<%@page import="com.entity.Users"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
	<div class="container-fluid">
		<a class="navbar-brand fs-3" href="../index.jsp"> <i
			class="fa-regular fa-hospital"></i> HEALTHII
		</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavAltMarkup"
			aria-controls="navbarNavAltMarkup" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<%
		Users user = (Users) session.getAttribute("userObject");
		if (user != null) {
			String userName = user.getUsernameString();
		%>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav ms-auto px-5">
				<a class="nav-link mx-3" aria-current="page" href="#"
					data-bs-toggle="modal" data-bs-target="#appointmentModal">BOOK
					APPOINTMENT</a> <a class="nav-link mx-3" href="myAppointment.jsp">VIEW APPOINTMENT</a>
				<a class="nav-link mx-3" href="#aboutUs">ABOUT US</a>
			</div>
		</div>
		<div class="dropdown mx-5">
			<a class="btn btn-dark text-capitalize dropdown-toggle" href="#"
				role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
				aria-expanded="false"><%=userName%></a> <a
				class="btn btn-dark text-white" href="#" role="button"
				id="dropdownMenuLink" data-bs-toggle="dropdown"
				aria-expanded="false"> <i class="fa-solid fa-circle-user fa-2x"></i>
			</a>


			<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				<li><a class="dropdown-item" href="" data-bs-toggle="modal"
			data-bs-target="#changePasswordModal">Change Password</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="../UserLogoutServlet">Logout</a></li>
			</ul>
		</div>
		<%
		}
		else if(user==null)
		{
		%>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav ms-auto px-5">
				<a class="nav-link" aria-current="page" href="index.jsp">HOME</a> <a
					class="nav-link" href="../adminLogin.jsp">ADMIN</a> <a
					class="nav-link" href="../doctorLogin.jsp">DOCTOR</a> <a
					class="nav-link" href="../userIndex.jsp">BOOK APPOINTMENT</a><a
					class="nav-link" href="../userLogin.jsp">USER</a>
			</div>
		</div>
		<%
		}
		%>
	</div>
</nav>
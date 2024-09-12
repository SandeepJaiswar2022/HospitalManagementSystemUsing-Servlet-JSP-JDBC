<%@page import="com.entity.Doctors"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
	<div class="container-fluid">
		<a class="navbar-brand fs-3" href="../index.jsp"> <i
			class="fa-regular fa-hospital"></i> HEALTHIFY
		</a>

		<%
		Doctors d = (Doctors) session.getAttribute("doctorObject");
		String doctorName;
		if (d != null) {
			doctorName = d.getFullNameString();
		%>
		
		<div class="dropdown mx-5">
			<a class="btn btn-dark text-capitalize dropdown-toggle" href="#"
				role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
				aria-expanded="false">Dr. <%=doctorName%></a> 

			<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				<li><a class="dropdown-item" href="editDoctorByDoctor.jsp">Edit Profile</a></li>
				<li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#changePasswordModal">Change Password</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="../DoctorLogoutServlet">Logout</a></li>
			</ul>
		</div>
		<%
		}
		%>
	</div>
</nav>


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
					<form action="../DoctorChangePasswordServlet" method="post">
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
						<%if(d != null) 
						{
						%>
						<input type="hidden" name="doctorId" value="<%=d.getId()%>">
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
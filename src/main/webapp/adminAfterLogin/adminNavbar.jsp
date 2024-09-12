<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
	<div class="container-fluid">
		<a class="navbar-brand fs-3" href="../index.jsp"> <i
			class="fa-regular fa-hospital"></i> HEALTHIFY
		</a>
		<div class="container">
			<a class="text-white  m-4 anchor" href="adminIndex.jsp"> HOME</a> <a
				class="text-white m-4 anchor" href="doctor.jsp"> VIEW DOCTORS</a> <a
				type="button" class="text-white m-4 anchor"
				href="viewAllAppointment.jsp"> VIEW PATIENTS</a>
		</div>
		<div class="dropdown mx-5 ">
			<a class="btn btn-dark text-capitalize dropdown-toggle" href="#"
				role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
				aria-expanded="false"> ADMIN <i
				class="fa-solid fa-user-tie mx-1"></i>
			</a>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">

				<li><a class="dropdown-item" href="../adminLogoutServlet">Logout</a></li>
			</ul>
		</div>
	</div>
</nav>

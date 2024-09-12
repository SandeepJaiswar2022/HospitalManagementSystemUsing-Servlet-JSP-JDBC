<%@page import="com.entity.Users"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
	<div class="container-fluid">
		<a class="navbar-brand fs-3" href="index.jsp"> <i
			class="fa-regular fa-hospital"></i> HEALTHIFY
		</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavAltMarkup"
			aria-controls="navbarNavAltMarkup" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav ms-auto px-5">
				<a class="nav-link" aria-current="page" href="index.jsp">HOME</a> <a
					class="nav-link" href="adminLogin.jsp">ADMIN</a> <a
					class="nav-link" href="doctorLogin.jsp">DOCTOR</a> <a
					class="nav-link" href="userAfterLogin/userIndex.jsp">BOOK APPOINTMENT</a><a
					class="nav-link" href="userLogin.jsp">USER</a>
			</div>
		</div>
	</div>
</nav>
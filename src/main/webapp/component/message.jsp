
<%
String messageString = (String) session.getAttribute("messageFromServer");
if (messageString != null) {
%>
<div class="alert alert-warning alert-dismissible fade show mb-0 text-center"
	role="alert">
	<strong><%=messageString%></strong>
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
session.removeAttribute("messageFromServer");
}
%>

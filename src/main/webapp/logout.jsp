<%
	session.removeAttribute("user_id");
	session.invalidate();
%>
<script type="text/javascript">
	alert("You are logged out successfully.");
	location.href = "index.jsp";
</script>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link href="responsive_style.css" type="text/css" rel="stylesheet"/>
<title>Enter Roll:</title>
</head>
<body class="body_mid">
<%  String uid = (String)session.getAttribute("user");
				if (uid == null)
				{
					out.println("<h4 color:red >Please Login First:(</h4>");%>
			 <jsp:include page="register.html"/>
			<%
				}
else{				
					
					
					%>
<div class="form_div" >
<span align="center">
<p class="form_label">Enter Roll No to Generate GradeCard:</p>
<form method="post" action="Grade.jsp" >
<p><input type="text" placeholder="Enter RollNo:" name="roll"></p>
<p><input type="submit" value="Submit"></p>
</form></span>
</div>
<div class="form_div">
<form method="post" action="logout.jsp">
<p> <input type="submit" value="LogOut??!"></p>
</form>
</div>
<%
}
%>
</body>
</html>

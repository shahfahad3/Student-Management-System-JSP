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
<div class="form_div" >
<span align="center">
<p class="form_label">Enter your registered Email:</p>
<form method="post" action="sendmail.jsp" >
<p><input type="text" placeholder="Email:" name="email"></p>
<p><input type="submit" value="Submit"></p>
</form></span>
</div>
</body>
</html>

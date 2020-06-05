<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password1");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","xxxx");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from student where email='"+email+"' and pass='"+password+"'");
try{
rs.next();
if(rs.getString("pass").equals(password)&&rs.getString("email").equals(email))
{
out.println("Welcome ");
session.setAttribute("user", email);
out.println(session.getAttribute("user"));

%>
 <jsp:include page="roll.jsp"/>
 <%

}
else{
out.println("<h4 color:red padding:2px>Invalid password or username.</h4>");
%>
<%@include file="register.html"%>
<%
}
}
catch (Exception e) {
e.printStackTrace();
}
%>
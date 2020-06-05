<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String uname=request.getParameter("uname");
String name=request.getParameter("name");
String email=request.getParameter("email");
String mob=request.getParameter("mob");
String password=request.getParameter("password1");
try
{
Class.forName("com.mysql.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "xxxx");
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery("select email from student where email='"+email+"'");
if(rs.next()==true)
{
out.println("<h2 color=green padding=3px>Already REGISTERED-</h2><p class color:blue>Please Log In:");
%>
<%@include file="register.html"%>
<%
}

int i=st.executeUpdate("insert into student(uname,name,email,pass,mob)values('"+uname+"','"+name+"','"+email+"','"+password+"','"+mob+"')");
out.println("Thank you for register ! Please Login to continue.<br>");
%>
<br>
<br>
<%@include file="register.html"%>
<%
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
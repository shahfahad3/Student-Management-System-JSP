<html>
<%@page import="java.sql.*,java.util.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "xxxx");
Statement st=conn.createStatement();

String roll=request.getParameter("roll");

 %>

       <%
          ResultSet resultset = st.executeQuery("select * from grade where roll='"+roll+"'") ;
		  try{
			  
		  
		  if(resultset.next()==false)
		  { out.println("<h3 color:'red' >No RECORD FOUND:<br>Please enter right Rollno:</h3>");  
      
			 
			  %>
			  <jsp:include page="roll.jsp"/>
			  <%
		  }
		  else{
			  %>
			  <head>
			 
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

       <TITLE>Student RECORD </TITLE>
	   <style>
	   
	   
h1{
  font-size: 30px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 300;
  text-align: center;
  margin-bottom: 15px;
}
table{
  width:100%;
  table-layout: fixed;
}
.tbl-header{
  background-color: rgba(255,255,255,0.3);
 }
.tbl-content{
  height:300px;
  overflow-x:auto;
  margin-top: 0px;
  border: 1px solid rgba(255,255,255,0.3);
}
th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 12px;
  color: #fff;
  text-transform: uppercase;
}
td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 12px;
  color: #fff;
  border-bottom: solid 1px rgba(255,255,255,0.1);
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}
section{
  margin: 50px;
}


/* follow me template */
.made-with-love {
  margin-top: 40px;
  padding: 10px;
  clear: left;
  text-align: center;
  font-size: 10px;
  font-family: arial;
  color: #fff;
}
.made-with-love i {
  font-style: normal;
  color: #F50057;
  font-size: 14px;
  position: relative;
  top: 2px;
}
.made-with-love a {
  color: #fff;
  text-decoration: none;
}
.made-with-love a:hover {
  text-decoration: underline;
}


/* for custom scrollbar for webkit browser*/

::-webkit-scrollbar {
    width: 6px;
} 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
} 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
}
	   </style>
       </HEAD>
	   
       <BODY >
	   <section>
  <!--for demo wrap-->
  <h1>Student Marksheet</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>Attributes</th>
          <th>Values</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <tr>
          <td>Name</td>
          <td><%out.print(resultset.getString("name"));%> </td>
          
        </tr>
       <tr>
          <td>Email</td>
          <td><%out.print(resultset.getString("email"));%> </td>
          
        </tr><tr>
          <td>Course</td>
          <td><%out.print(resultset.getString("course"));%> </td>
          
        </tr><tr>
          <td>Year</td>
          <td><%out.print(resultset.getString("year"));%> </td>
          
        </tr><tr>
          <td>RollNo</td>
          <td><%out.print(resultset.getString("roll"));%> </td>
          
        </tr><tr>
          <td>CGPA</td>
          <td><%out.print(resultset.getString("cgpa"));%> </td>
          
        </tr><tr>
          <td>Result</td>
          <td><%out.print(resultset.getString("result"));%> </td>
          
        </tr>
      </tbody>
    </table>
  </div>
</section>


	 </BODY>
	 
			  <jsp:include page="roll.jsp"/>
			  <%
	 
	 
	 }
		  }
		  catch (Exception e) {
e.printStackTrace();
}
		  
		 %>
</HTML>
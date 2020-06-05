<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "xxxx");
Statement st=conn.createStatement();

String email=request.getParameter("email");



 %>
 
  <%
          ResultSet resultset = st.executeQuery("select * from student where email='"+email+"'") ;
		  try{
			  
		  
		  if(resultset.next()==false)
		  { out.println("<h3 color:'red' >Your email isn't registered:<br>Please enter correct mail:</h3>");  
      
			 
			  %>
			   <jsp:include page="forget.jsp"/>
			  <%
		  }
		  else{
			  
			  String pass1=resultset.getString("pass");
			  //out.println(pass1);
			 
      //Creating a result for getting status that messsage is delivered or not!

    String result;

    // Get recipient's email-ID, message & subject-line from index.html page

    final String to = request.getParameter("email");
	//out.println(to);

    String subject = request.getParameter("FORGET?");

    String messg ="Hello! Your password for Student LogIn is:"+pass1;

 //out.print(messg+"AFTER");

    // Sender's email ID and password needs to be mentioned

    final String from = "shahfahadkhan4@gmail.com";

    final String pass = "fahad khan";

 

    // Defining the gmail host

    String host = "smtp.gmail.com";

 

    // Creating Properties object

    Properties props = new Properties();

 

    // Defining properties

    props.put("mail.smtp.host", host);

    props.put("mail.transport.protocol", "smtp");

    props.put("mail.smtp.auth", "true");

    props.put("mail.smtp.starttls.enable", "true");

    props.put("mail.user", from);

    props.put("mail.password", pass);

    props.put("mail.port", "465");

 
    // Authorized the Session object.

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, pass);

        }

    });

 

    try {
		
		//out.print(pass1);

        // Create a default MimeMessage object.

        MimeMessage message = new MimeMessage(mailSession);

        // Set From: header field of the header.
		

		//out.print(pass1);
        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.

		//out.print(pass1);
		
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
		
		
		//out.print(pass1);
		
		
        // Set Subject: header field

        message.setSubject(subject);

        // Now set the actual message

       // message.setText(messg);

        // Send message
		
		  message.setContent(messg, "text/plain");
		
		
		//out.print(messg+"jghh");
		
        Transport.send(message);
		
		//out.print(pass1);
        result = "Your mail sent successfully....";
		

    } catch (MessagingException mex) {

        mex.printStackTrace();

        result = "Error: unable to send mail....";

    }
		  

%>

<title>Sending Mail:)</title>

<h1><center><font color="blue">Sending Mail...</font></h1>

<b><center><font color="red"><% out.println(result);%></b>

<h2>Please LOGIN!</h2>
<jsp:include page="register.html" />


<%
		  }
		  }
		  		  catch (Exception e) {
e.printStackTrace();
}
		  %>
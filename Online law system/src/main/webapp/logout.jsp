

<%


HttpSession session1 = request.getSession(false); // Get the session, but don't create a new one if it doesn't exist
if (session != null) {
    session.invalidate(); 
}
response.sendRedirect("/Online_law_system/loginpage.jsp"); // Redirect back to the login page after logging out


%>
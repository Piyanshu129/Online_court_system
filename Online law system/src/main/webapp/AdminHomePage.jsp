<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="adminnavbar.jsp" %>

<html>
<head>
    <title>All Users</title>
    <!-- Add your CSS styles if needed -->
</head>
<body>
    <center>
        <h2>ALL USERS</h2>
    </center>

    <%
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            String url = "jdbc:mysql://localhost:3306/law";
            String username = "root";
            String password = "saini_dev79";
            Connection connection = DriverManager.getConnection(url, username, password);

            // Create a statement
            Statement statement = connection.createStatement();

            // Execute the query
            ResultSet resultSet = statement.executeQuery("SELECT * FROM userregister");

            if (resultSet.next()) {
                do {
                    // Retrieve user information from the result set
                    String userId = resultSet.getString("USERID");
                    String userName = resultSet.getString("UNAM");
                    String userEmail = resultSet.getString("UEID");
                    String userMobile = resultSet.getString("UMOB");
                    String userState = resultSet.getString("USTATE");
                    String userGender = resultSet.getString("GENDER");
                    String userDistrict = resultSet.getString("UDISTRICT");
                    String userType = resultSet.getString("UTYPE");
    %>

    <div style="margin: 20px;">
        <strong>ID:</strong> <%= userId %><br>
        <strong>Name:</strong> <%= userName %><br>
        <strong>Email:</strong> <%= userEmail %><br>
        <strong>Mobile:</strong> <%= userMobile %><br>
        <strong>State:</strong> <%= userState %><br>
        <strong>Gender:</strong> <%= userGender %><br>
        <strong>District:</strong> <%= userDistrict %><br>
        <strong>Type:</strong> <%= userType %><br>
    </div>

    <%
                } while (resultSet.next());
            } else {
    %>

    <div style="margin: 20px;">
        <p>No users found in the database.</p>
    </div>

    <%
            }

            // Close resources
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <!-- Add your HTML structure or additional content as needed -->

</body>
</html>

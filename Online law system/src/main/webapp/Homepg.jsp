<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>
<html>
<head>
   <center> <title>Show IPC Data</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>IPC Table</h2>

    <form action="" method="get">
        <label for="searchType">Search by Type:</label>
        <input type="text" id="searchType" name="searchType">
        <input type="submit" value="Search">
    </form>

    <table>
        <tr>
            <th>Section Number</th>
            <th>Description</th>
            <th>Type</th>
        </tr>

        <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/law", "root", "saini_dev79");

                String searchType = request.getParameter("searchType");
                String sqlQuery = "SELECT * FROM ipc";
                
                if (searchType != null && !searchType.isEmpty()) {
                    // If searchType is provided, modify the query to filter by type
                    sqlQuery += " WHERE type LIKE '%" + searchType + "%'";
                }

                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sqlQuery);

                while (rs.next()) {
                    int secno = rs.getInt("secno");
                    String descp = rs.getString("descp");
                    String type = rs.getString("type");

        %>
                    <tr>
                        <td><%= secno %></td>
                        <td><%= descp %></td>
                        <td><%= type %></td>
                    </tr>
        <%
                }
                
                rs.close();
                stmt.close();
                con.close();

            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        %>
    </table>
    </center>
</body>
</html>

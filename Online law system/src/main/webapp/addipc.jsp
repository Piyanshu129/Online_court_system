<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="adminnavbar.jsp" %>
<html>
<head>
    <title>Insert IPC Data</title>
</head>
<body>
    <h2>Insert Data into IPC Table</h2>

    <form action="insertIPC" method="post">
        <label for="secno">Section Number:</label>
        <input type="text" name="secno" required><br>

        <label for="descp">Description:</label>
        <input type="text" name="descp" required><br>

        <label for="type">Type:</label>
        <input type="text" name="type" required><br>

        <input type="submit" value="Insert">
    </form>
</body>
</html>

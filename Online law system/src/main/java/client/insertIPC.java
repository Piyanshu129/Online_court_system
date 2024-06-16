package client;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/insertIPC")
public class insertIPC extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/law", "root", "saini_dev79");

            int secno = Integer.parseInt(request.getParameter("secno"));
            String descp = request.getParameter("descp");
            String type = request.getParameter("type");

            PreparedStatement stmt = con.prepareStatement("insert into ipc values (?, ?, ?)");
            stmt.setInt(1, secno);
            stmt.setString(2, descp);
            stmt.setString(3, type);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("/Online_law_system/AdminHomePage.jsp");
            } else {
                response.sendRedirect("/Online_law_system/addipc.jsp");
            }

            stmt.close();
            con.close();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("/Online_law_system/error.jsp");
        }
    }
}

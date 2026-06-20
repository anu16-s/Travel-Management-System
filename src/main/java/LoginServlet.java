/*
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter();
        
        String username = request.getParameter("t"); // Matches your HTML input name
        String password = request.getParameter("pass"); // Fixed 'pass' to 'password'
        HttpSession session = request.getSession();
		session.setAttribute("username", username);
		
        try {
            // Database Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "Admin1", "@anu");

            System.out.println("Database Connected Successfully!"); // Debugging step

            // Check if username and password exist
            String query = "SELECT * FROM register WHERE name = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            
            
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	int userid = rs.getInt("uid");
            	session.setAttribute("userid", userid);
            	//response.sendRedirect("welcome.html");
                //System.out.println("Login Successful for: " + username); // Debugging step
            	System.out.println("Session Username: " + session.getAttribute("userid"));
                out.print("success"); // Ensure exactly "success" is returned
            } else {
                System.out.println("Invalid login attempt for: " + username); // Debugging step
                out.print("Invalid Username or Password"); // Ensure this message is consistent
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print errors for debugging
            out.print("Database Connection Error: " + e.getMessage()); 
        }
        out.flush();
    }
}
*/

/*import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter();
        
        String username = request.getParameter("t"); // Input name in HTML
        String password = request.getParameter("pass"); // Corrected 'pass' parameter
        HttpSession session = request.getSession();
        session.setAttribute("username", username);

        try {
            // Admin Login Check
            if ("Admin1".equals(username) && "@anu".equals(password)) {
                session.setAttribute("role", "admin");
                out.print("admin"); // Response to frontend
                return;
            }

            // Database Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "Admin1", "@anu");

            // Check if username and password exist
            String query = "SELECT * FROM register WHERE name = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int userid = rs.getInt("uid");
                session.setAttribute("userid", userid);
                out.print("success"); // Ensure exactly "success" is returned
            } else {
                out.print("Invalid Username or Password"); // Ensure this message is consistent
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print errors for debugging
            out.print("Database Connection Error: " + e.getMessage()); 
        }
        out.flush();
    }
}

*/
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter();
        
        String username = request.getParameter("t"); // Input name in HTML
        String password = request.getParameter("pass"); // Corrected 'pass' parameter
        HttpSession session = request.getSession();
        session.setAttribute("username", username);

        try {
            // Database Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "Admin1", "@anu");

            // **Check Admin Login First**
            String adminQuery = "SELECT * FROM admin WHERE aname = ? AND apass = ?";
            PreparedStatement adminPs = con.prepareStatement(adminQuery);
            adminPs.setString(1, username);
            adminPs.setString(2, password);
            ResultSet adminRs = adminPs.executeQuery();

            if (adminRs.next()) {
                int adminId = adminRs.getInt("admin_id"); // Assuming 'admin_id' is the primary key in admin table
                session.setAttribute("admin_id", adminId);
                session.setAttribute("role", "admin");
                out.print("admin"); // Response for frontend
                return;
            }

            // **Check Normal User Login**
            String userQuery = "SELECT * FROM register WHERE name = ? AND password = ?";
            PreparedStatement userPs = con.prepareStatement(userQuery);
            userPs.setString(1, username);
            userPs.setString(2, password);
            ResultSet userRs = userPs.executeQuery();

            if (userRs.next()) {
                int userId = userRs.getInt("uid");
                System.out.println("uid session="+userId);
                session.setAttribute("userid", userId);
                session.setAttribute("role", "user"); // Store user role
                out.print("success"); // Response for frontend
            } else {
                out.print("Invalid Username or Password"); // Ensure this message is consistent
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace(); // Print errors for debugging
            out.print("Database Connection Error: " + e.getMessage()); 
        }
        out.flush();
    }
}

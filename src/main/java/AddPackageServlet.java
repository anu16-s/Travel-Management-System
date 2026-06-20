/*import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/AddPackageServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddPackageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Database Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "Admin1", "@anu");

            // Retrieve Package Details
            String packName = request.getParameter("pack_name");
            String descrip = request.getParameter("descrip");
            String cost = request.getParameter("cost");
            String tour_id=request.getParameter("tid");
            Part packageImagePart = request.getPart("images");
            String left=request.getParameter("no_left");

            // Retrieve Guide Details
            String guideName = request.getParameter("guide_name");
            String guideContact = request.getParameter("guide_contact");
            String guideEmail = request.getParameter("guide_email");
            String guideDesc = request.getParameter("guide_desc");

            // Retrieve Destination Details
            String dname = request.getParameter("dname");
            String highlight = request.getParameter("highlight");
            String days = request.getParameter("days");
            String dayPlan = request.getParameter("day_plan");
            Part destinationImagePart = request.getPart("destination_image");
            String costDistribution = request.getParameter("cost_distribution");
            String hotel = request.getParameter("hotel");

            // Save Images to Server
            String packageImagePath = saveFile(packageImagePart, "images");
           // String destinationImagePath = saveFile(destinationImagePart, "destination_images");

            // Insert Package into Database
            String packageQuery = "INSERT INTO package (pack_name, images, cost, descrip,tid,no_left, guide_name, guide_contact, guide_email, guide_desc) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?,?)";
            PreparedStatement ps = con.prepareStatement(packageQuery, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, packName);
            ps.setString(2, packageImagePath);
            ps.setDouble(3, Double.parseDouble(cost));
            ps.setString(4, descrip);
            ps.setInt(5, Integer.parseInt(tour_id));
            ps.setInt(6, Integer.parseInt(left));
            ps.setString(7, guideName);
            ps.setString(8, guideContact);
            ps.setString(9, guideEmail);
            ps.setString(10, guideDesc);
            ps.executeUpdate();

            // Get Generated Package ID
            int packageId = 0;
            java.sql.ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                packageId = rs.getInt(1);
            }
            String q="select pid from package where pid=LAST_INSERT_ID()";
            // Insert Destination into Database
            PreparedStatement ps3 = con.prepareStatement(q);
            ResultSet rs1=ps3.executeQuery();
            while(rs1.next()) {
            	int a=rs1.getInt("pid");
            	System.out.println("pid="+a);
            }
            String destinationQuery = "INSERT INTO destination (dname, highlight, days, day_plan, path, pid, description, cost_distribution, hotel) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps2 = con.prepareStatement(destinationQuery);
            ps2.setString(1, dname);
            ps2.setString(2, highlight);
            ps2.setString(3, days);
            ps2.setString(4, dayPlan);
          //  ps2.setString(5, destinationImagePath);
            ps2.setInt(5, packageId);
            ps2.setString(6, descrip);
            ps2.setString(7, costDistribution);
            ps2.setString(8, hotel);
            ps2.executeUpdate();

            out.println("<h3 class='text-success'>Package and Destination Added Successfully!</h3>");
            con.close();
        } catch (Exception e) {
            out.println("<h3 class='text-danger'>Error: " + e.getMessage() + "</h3>");
        }
    }

    private String saveFile(Part filePart, String folderName) throws IOException {
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }
        String uploadPath = "C:\\server_uploads\\" + folderName; // Change this path as needed
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);
        return fileName;
    }
}*/
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/AddPackageServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddPackageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private Part filePart;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Database Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "Admin1", "@anu");

            // Retrieve Package Details
            String packName = request.getParameter("pack_name");
            Part filePart = request.getPart("images");
            String cost = request.getParameter("cost");
            String descrip = request.getParameter("descrip");
        
            String tour_id = request.getParameter("tid");
         
            String left = request.getParameter("no_left");
            String guideName = request.getParameter("guide_name");
            String guideContact = request.getParameter("guide_contact");
            String guideEmail = request.getParameter("guide_email");
            String guideDesc = request.getParameter("guide_desc");
            String duration=request.getParameter("duration"); 
            String limit = request.getParameter("book_limit");

            
            
            String fileName=Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String imagePath="gallery/"+fileName;
            String savePath=getServletContext().getRealPath("/")+imagePath;
            filePart.write(savePath);
            // Save Package Image to Server
          //  String packageImagePath = saveFile(packageImagePart, "images");

            // Insert Package into Database
            String packageQuery = "INSERT INTO package (pack_name, images, cost, descrip, tid, no_left, guide_name, guide_contact, guide_email, guide_desc,duration,book_limit) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
            PreparedStatement ps = con.prepareStatement(packageQuery, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, packName);
            ps.setString(2, imagePath);
            ps.setDouble(3, Double.parseDouble(cost));
            ps.setString(4, descrip);
            ps.setInt(5, Integer.parseInt(tour_id));
            ps.setInt(6, Integer.parseInt(left));
            ps.setString(7, guideName);
            ps.setString(8, guideContact);
            ps.setString(9, guideEmail);
            ps.setString(10, guideDesc);
            ps.setInt(11, Integer.parseInt(duration));
            ps.setInt(12, Integer.parseInt(limit));
            ps.executeUpdate();
           
           
            // Get Generated Package ID
            int packageId = 0;
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                packageId = rs.getInt(1);
            }

            // Close connection
            con.close();

            // Redirect to AddDestinationServlet with the generated package ID
            response.sendRedirect("addDestination.jsp?pid=" + packageId);

        } catch (Exception e) {
            out.println("<h3 class='text-danger'>Error: " + e.getMessage() + "</h3>");
        }
    }
}

    /*private String saveFile(Part filePart, String folderName) throws IOException {
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }
        String uploadPath = "C:\\server_uploads\\" + folderName;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);
        return fileName;
    }
}
*/
    
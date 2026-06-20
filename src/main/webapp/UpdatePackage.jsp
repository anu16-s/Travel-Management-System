<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    String packageId = request.getParameter("package_id");
    String packageName = request.getParameter("pack_name");
    String cost = request.getParameter("cost");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "Admin1", "@anu");
    PreparedStatement ps = con.prepareStatement("SELECT cost_distribution FROM destination WHERE pid=?");
    PreparedStatement ps1=con.prepareStatement("select book_limit,no_left from package where pid=?");
    ps.setInt(1, Integer.parseInt(packageId));
    ps1.setInt(1, Integer.parseInt(packageId));
    ResultSet rs = ps.executeQuery();
    ResultSet rs1 = ps1.executeQuery();
    String costDistribution = "";
    int book=0;
    int left=0;
    if (rs.next()) {
        costDistribution = rs.getString("cost_distribution");
       
    }
    if (rs1.next()) {
        book=rs1.getInt("book_limit");
        left=rs1.getInt("no_left");
    }

    con.close();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Package</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h2>Update Package Details</h2>
    <form action="UpdatePackageServlet" method="post">
        <input type="hidden" name="package_id" value="<%= packageId %>">
        <div class="form-group">
            <label>Package Name:</label>
            <input type="text" class="form-control" value="<%= packageName %>" readonly>
        </div>
        <div class="form-group">
            <label>Cost:</label>
            <input type="number" name="cost" class="form-control" value="<%= cost %>" required>
        </div>
        <div class="form-group">
            <label>Cost Distribution:</label>
            <textarea name="cost_distribution" class="form-control" required><%= costDistribution %></textarea>
        </div>
        <div class="form-group">
            <label>Number Left:</label>
            <textarea name="left" class="form-control" required><%= left %></textarea>
        </div>
         <div class="form-group">
            <label>Book Limit:</label>
            <textarea name="book" class="form-control" required><%= book %></textarea>
        </div>
        
        
        <button type="submit" class="btn btn-success">Update Package</button>
    </form>
</body>
</html>

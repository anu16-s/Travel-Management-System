<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>

<%
int uid = 0;
Connection con = null;
Statement st = null;
ResultSet rs = null;
PreparedStatement ps;
try {
    Object temp = session.getAttribute("userid");
    if (temp != null) {
        uid = Integer.parseInt(temp.toString());
    }

    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "Admin1", "@anu");

    String query = "SELECT * FROM package WHERE pid IN (SELECT pid FROM booking WHERE uid=? AND status='paid')";
    ps = con.prepareStatement(query);
    ps.setInt(1, uid);
    rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booked Packages | Journey Genie</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        
        /* Navbar */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }
        .navbar-brand {
            display: flex;
            align-items: center;
            font-size: 28px;
            font-weight: bold;
            color: white;
        }
        .navbar-brand img {
            height: 50px;
            width: 50px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 10px;
        }

        /* Content */
        .content {
            margin-top: 120px;
            text-align: center;
        }

        h2 {
            color: #333;
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .container {
            max-width: 90%;
            margin: auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        /* Card Style */
        .card {
            background: #fff;
            width: 320px;
            height: auto;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card h3 {
            margin-bottom: 10px;
            color: #007bff;
            font-size: 20px;
        }
        .card p {
            color: #555;
            font-size: 15px;
        }
        .cost {
            font-size: 18px;
            font-weight: bold;
            color: #28a745;
        }

        /* Refund Policy */
        .refund-policy {
            background: #fff;
            padding: 20px;
            margin: 40px auto;
            width: 80%;
            border-radius: 12px;
            box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.1);
            text-align: left;
        }
        .refund-policy h3 {
            color: #dc3545;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .refund-policy ul {
            list-style-type: disc;
            padding-left: 20px;
        }
        .refund-policy li {
            color: #333;
            font-size: 16px;
            margin-bottom: 5px;
        }
        .refund-policy p {
            font-size: 14px;
            font-weight: bold;
            color: #555;
        }

        /* Footer */
        .footer {
            background: #222;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: auto;
            width:100%;
        }

        /* Social Icons */
        .social-icons a {
            color: white;
            font-size: 20px;
            margin: 0 10px;
            transition: transform 0.3s ease-in-out;
        }

        .social-icons a:hover {
            transform: scale(1.2);
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="gallery/logo.png" alt="Logo">
            Journey Genie
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item mx-2"><a class="nav-link" href="front.html">Home</a></li>
                <li class="nav-item mx-2"><a class="nav-link" href="Package.jsp">Packages</a></li>
                <li class="nav-item mx-2"><a class="nav-link" href="About_us.html">About Us</a></li>
                <li class="nav-item mx-2"><a class="nav-link" href="#contact">Contact Us</a></li>
                <li class="nav-item mx-2"><a class="nav-link" href="review.jsp">Reviews</a></li>
            </ul>
            <a href="user_pack.jsp" class="mx-3">
                <i class="fa-solid fa-circle-user fa-2x text-light"></i>
            </a>
            <a href="LogoutServlet" class="btn btn-danger ms-3">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="content">
    <h2>Booked Packages</h2>
</div>

<div class="container">
    <%
        while (rs.next()) {
    %>
    <div class="card">
        <h3><%= rs.getString("pack_name") %></h3>
        <p class="cost">Cost: ₹<%= rs.getDouble("cost") %></p>
        <p><%= rs.getString("descrip") %></p>
    </div>
    <%
        }
    %>
</div>

<!-- Refund Policy Section -->
<div class="refund-policy">
    <h3>Refund Policy</h3>
    <ul>
        <li>Refunds will be available only in the following cases:</li>
        <li>Flight delays of more than 6 hours</li>
        <li>Medical emergencies (valid proof required)</li>
        <li>Natural disasters affecting travel</li>
        <li>Government-imposed travel restrictions</li>
        <li>Double booking due to system error</li>
        <li>Cancellation by the tour operator</li>
    </ul>
    <p>All refund requests must be submitted within 48 hours of the issue occurrence.</p>
</div>

 <!-- Footer -->
    <footer id="contact" class="footer">
        <p>&copy; 2025 JourneyGenie | All rights reserved</p>
        <p><b>Phone:</b> 7385226044 | 9867896430</p>
        <p><b>Email:</b> snehajadhav10573@gmail.com | anushkashinde1661@gmail.com</p>
        <div class="social-icons">
            <a href="https://www.facebook.com/"><i class="fab fa-facebook"></i></a>
            <a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a>
            <a href="https://x.com/"><i class="fab fa-twitter"></i></a>
        </div>
    </footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>

</body>
</html>

<%
} catch (Exception e) {}
%>

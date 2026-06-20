<%--   <%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>--%>
<!--  <!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UPI Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        background-color: rgba(185, 196, 185, 0.726);
        max-width: 460px;
        height: auto;
        width: 100%;
        padding: 35px;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        text-align: center;
    }

    h1 {
        margin: 0 0 20px 0;
    }

    input[type="radio"], input[type="text"], input[type="button"] {
        margin: 10px 0;
    }

    .hidden {
        display: none;
    }
</style>
</head>
<body>
<form method="get" action="upiServlet">
    <div class="container">
        <h1>Select an UPI App:</h1>
       
        <div id="upiSelection">
            <input type="radio" name="app" value="GPay"> GPay<br><br>
            <input type="radio" name="app" value="Paytm"> Paytm<br><br>
            <input type="radio" name="app" value="PhonePe"> PhonePe<br><br>
            <input type="button" value="Next" onclick="showPaymentForm()">
        </div>

     
        <div id="paymentForm" class="hidden">
            <h2>Enter Payment Details:</h2>
            <input type="text" name="upi_mob" id="paymentDetails" placeholder="Enter UPI ID or Mobile Number"><br><br>
            <input type="submit" value="Proceed Payment: <%=session.getAttribute("cost")%>" onclick="processPayment()">
            <input type="button" value="Back" onclick="goBack()">
        </div>
    </div>

   <script>
        function showPaymentForm() {
            let paymentOptions = document.getElementsByName("app");
            let selectedValue = "";

            for (let i = 0; i < paymentOptions.length; i++) {
                if (paymentOptions[i].checked) {
                    selectedValue = paymentOptions[i].value;
                    break;
                }
            }

            if (selectedValue) {
                document.getElementById("upiSelection").classList.add("hidden");
                document.getElementById("paymentForm").classList.remove("hidden");
            } else {
                alert("Please select a UPI app before proceeding.");
            }
        }

        function processPayment() {
            let details = document.getElementById("paymentDetails").value;
            if (details.trim() === "") {
                alert("Please enter your UPI ID or Mobile Number.");
            } else {
          //  	window.location.href="upiServlet";
                //alert("Payment processed successfully!");
                // Add payment logic or redirection here if needed
            }
        }

        function goBack() {
            document.getElementById("upiSelection").classList.remove("hidden");
            document.getElementById("paymentForm").classList.add("hidden");
        }
    </script>
    </form>
</body>
</html>
-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UPI Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: white;
            font-family: 'Poppins', sans-serif;
            padding: 20px;
        }
.navbar {
            background: rgba(31, 45, 36, 0.9);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            height: 80px;
            padding: 5px 20px;
        }

        .navbar-brand {
            font-size: 24px;
            display: flex;
            align-items: center;
        }

        .navbar-brand img {
            height: 60px; /* Adjust size as needed */
            width: 60px;
            border-radius: 50%; /* Makes the logo circular */
            object-fit: cover;
            margin-right: 10px;
        }
        .navbar-nav .nav-link {
            font-size: 14px;
            padding: 5px 10px;
        }

        .container {
            background: white;
            max-width: 420px;
            width: 100%;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            text-align: center;
            border: 2px solid #dc3545;
        }

        h1 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
            color: black;
        }

        .payment-option {
            display: flex;
            align-items: center;
            padding: 12px;
            border-radius: 8px;
            background-color: #f8d7da;
            margin: 10px 0;
            cursor: pointer;
            transition: background 0.3s ease;
            font-size: 16px;
            border: 1px solid #dc3545;
            color: black;
        }

        .payment-option:hover {
            background-color: #f5c6cb;
        }

        .payment-option i {
            margin-right: 10px;
            font-size: 20px;
        }

        .btn-next {
            margin-top: 20px;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 6px;
            background-color: #dc3545;
            color: white;
            cursor: pointer;
            transition: background 0.3s;
            width: 100%;
        }

        .btn-next:hover {
            background-color: #bb2d3b;
        }

        @media (max-width: 480px) {
            .container {
                padding: 30px;
                max-width: 90%;
            }
            h1 {
                font-size: 20px;
            }
            .payment-option {
                font-size: 14px;
                padding: 10px;
            }
            .btn-next {
                font-size: 14px;
                padding: 10px;
            }
        }

        .hidden {
            display: none;
        }
    </style>
    <script>
        function showPaymentForm() {
            let paymentOptions = document.getElementsByName("app");
            let selectedValue = "";

            for (let i = 0; i < paymentOptions.length; i++) {
                if (paymentOptions[i].checked) {
                    selectedValue = paymentOptions[i].value;
                    break;
                }
            }

            if (selectedValue) {
                document.getElementById("upiSelection").classList.add("hidden");
                document.getElementById("paymentForm").classList.remove("hidden");
            } else {
                alert("Please select a UPI app before proceeding.");
            }
        }

        function goBack() {
            document.getElementById("upiSelection").classList.remove("hidden");
            document.getElementById("paymentForm").classList.add("hidden");
        }
    </script>
</head>
<body>
<!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="gallery/logo.png" alt="Logo">
                <span><i style="color:#4d739d;">J</i>ourney<i style="color:#4d739d;">G</i>enie</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="http://localhost:8080/Storedb/front.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="http://localhost:8080/Storedb/Package.html">Packages</a></li>
                     <li class="nav-item"><a class="nav-link" href="http://localhost:8080/Storedb/About_us.html">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contactus">Contact Us</a></li>
                   <li class="nav-item"><a class="nav-link" href="http://localhost:8080/Storedb/review.jsp">Review</a></li>
                </ul>
                <a style="padding-left:20px; padding-top:10px; height:50px; width:100px;" href="user_pack.jsp">
                    <i class="fa-solid fa-circle-user fa-2x" style="color:white; filter:opacity(0.7);"></i>
                   </a>
                <a href="LogoutServlet" class="btn btn-danger ms-3 btn-sm">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>
    </nav>
<form method="get" action="upiServlet">
    <div class="container">
        <h1>Select an UPI App:</h1>
        
        <div id="upiSelection">
            <label class="payment-option">
                <input type="radio" name="app" value="GPay"> <i class="fa-brands fa-google-pay"></i> GPay
            </label>
            <label class="payment-option">
                <input type="radio" name="app" value="Paytm"> <i class="fa-brands fa-paypal"></i> Paytm
            </label>
            <label class="payment-option">
                <input type="radio" name="app" value="PhonePe"> <i class="fa-solid fa-mobile-alt"></i> PhonePe
            </label>
            <button type="button" class="btn-next" onclick="showPaymentForm()">Next</button>
        </div>

        <div id="paymentForm" class="hidden">
            <h2>Enter Payment Details:</h2>
            <input type="text" name="upi_mob" id="paymentDetails" class="form-control" placeholder="Enter UPI ID or Mobile Number"><br>
            <input type="submit" class="btn-next" value="Proceed Payment: <%=session.getAttribute("cost")%>">
            <button type="button" class="btn-next" onclick="goBack()">Back</button>
        </div>
    </div>
</form>
</body>
</html>

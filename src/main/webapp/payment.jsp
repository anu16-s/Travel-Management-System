<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Selection</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full height of the viewport */
            margin: 0; /* Remove default margin */
            /* Light background for contrast */
        }

        .container {
            background-color: rgba(185, 196, 185, 0.726);
            max-width: 460px;
            height: 450px;
            width: 100%; /* Ensure it uses full width */
            padding: 35px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center; /* Center text */
        }

        h1 {
            margin: 0 0 20px 0; /* Add margin below the heading */
        }

        input[type="radio"] {
            margin: 10px 0; /* Add margin for radio buttons */
        }
    </style>
    <script>
        function redirectToPage() {
            // Get all radio buttons
            let paymentOptions = document.getElementsByName("pay");
            let selectedValue = "";
            
            // Loop through radio buttons to find the selected one
            for (let i = 0; i < paymentOptions.length; i++) {
                if (paymentOptions[i].checked) {
                    selectedValue = paymentOptions[i].value;
                    break;
                }
            }

            // Redirect based on selected value
            if (selectedValue === "1") {
                window.location.href = "debit.jsp";
            } else if (selectedValue === "2") {
                window.location.href = "credit.jsp";
            } else if (selectedValue === "3") {
                window.location.href = "upi.jsp";
            } else {
                alert("Please select a payment mode before proceeding.");
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Select the Payment Mode:</h1>
        <input type="radio" name="pay" value="1"> Debit Card<br><br>
        <input type="radio" name="pay" value="2"> Credit Card<br><br>
        <input type="radio" name="pay" value="3"> Other UPI apps<br><br>
        <input type="button" value="Next" onclick="redirectToPage()">       
    </div>
</body>
</html>
-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Selection</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
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
            flex-direction: column;
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
            margin-top: 70px;
        }

        .payment-option {
            display: flex;
            align-items: center;
            justify-content: flex-start;
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

        .payment-option input {
            margin-right: 10px;
        }

        .payment-option i {
            margin-right: 10px;
            font-size: 18px;
            color: #dc3545;
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
    <script>
        function redirectToPage() {
            let paymentOptions = document.getElementsByName("pay");
            let selectedValue = "";
            
            for (let i = 0; i < paymentOptions.length; i++) {
                if (paymentOptions[i].checked) {
                    selectedValue = paymentOptions[i].value;
                    break;
                }
            }

            if (selectedValue === "1") {
                window.location.href = "debit.jsp";
            } else if (selectedValue === "2") {
                window.location.href = "credit.jsp";
            } else if (selectedValue === "3") {
                window.location.href = "upi.jsp";
            } else {
                alert("Please select a payment mode before proceeding.");
            }
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
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact Us</a></li>
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
    <br>
    <br>
    <br>
    <br>
    <div class="container">
        <h1>Select Payment Mode</h1>
        <label class="payment-option">
            <input type="radio" name="pay" value="1"> <i class="fas fa-credit-card"></i> Debit Card
        </label>
        <label class="payment-option">
            <input type="radio" name="pay" value="2"> <i class="fas fa-credit-card"></i> Credit Card
        </label>
        <label class="payment-option">
            <input type="radio" name="pay" value="3"> <i class="fas fa-mobile-alt"></i> Other UPI Apps
        </label>
        <button class="btn-next" onclick="redirectToPage()">Next</button>
    </div>
    <br>
    <br>
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
       <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
   
</body>
</html>
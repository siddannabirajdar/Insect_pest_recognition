<?php
  session_start();
  error_reporting(0);
  include('dbconnection.php');

  if(isset($_POST['register'])){
    $yourname=$_POST['yourname'];
    $mob=$_POST['mob'];
    $emailid=$_POST['emailid'];
    $address=$_POST['address'];
    $uname=$_POST['uname'];
    $pass=$_POST['pass'];
    $query=mysqli_query($con,"insert into tbl_register (yourname,mob,emailid,address,uname,pass) value ('$yourname','$mob','$emailid','$address','$uname','$pass')");
    
    header('location:index.php');
  }
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Insect Detection</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/farm.jpg" rel="icon">
  <link href="assets/img/farm.jpg" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <style>
    body {
      background-image: url('assets/img/farm.jpg');
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: 100% 100%;
    }
  </style>

</head>

<body>

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="card mb-3">

                <div class="card-header">
                  <div class="pt-3">
                    <h5 class="card-title text-center">Registration</h5>
                  </div>
                </div>

                <div class="card-body mt-3">

                  <form class="row g-3 needs-validation" method="POST" novalidate>

                    <div class="col-12">
                      <div class="input-group has-validation">
                        <input type="text" name="yourname" class="form-control" id="yourname" placeholder="Name" required>
                        <div class="invalid-feedback">Please Enter Your Name.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <div class="input-group has-validation">
                        <span class="input-group-text" id="inputGroupPrepend">+91</span>
                        <input type="tel" name="mob" class="form-control" id="mob" placeholder="Contact Number" required>
                        <div class="invalid-feedback">Please Enter Your Contact Number.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <div class="input-group has-validation">
                        <input type="email" name="emailid" class="form-control" id="emailid" placeholder="Email-ID" required>
                        <div class="invalid-feedback">Please Enter Your Email-ID.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <div class="input-group has-validation">
                        <textarea type="text" name="address" rows="2" cols="50" class="form-control" id="address" placeholder="Address" required></textarea>
                        <div class="invalid-feedback">Please Enter Your Address.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <div class="input-group has-validation">
                        <input type="text" name="uname" class="form-control" id="uname" placeholder="Username" required>
                        <div class="invalid-feedback">Please Enter Your Username.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <input type="password" name="pass" class="form-control" id="pass" placeholder="Password" required>
                      <div class="invalid-feedback">Please Enter Your Password!</div>
                    </div>

                    <div class="col-12 d-flex justify-content-center mt-4">
                      <input type="submit" class="btn btn-primary w-50 mt-4" name="register" value="Register">
                    </div>
                    <div class="col-12">
                      <p class="small mb-0" style="text-align: center;">Already have an account? <a href="index.php">Login</a></p>
                    </div>
                  </form>

                </div>
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>
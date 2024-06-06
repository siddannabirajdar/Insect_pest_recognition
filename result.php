<?php
session_start();
error_reporting(0);
include('dbconnection.php');

$id = $_SESSION['login_id'];
  if (strlen($_SESSION['login_id']==0)) {
  header('location:logout.php');
  }else {
  
    
   $command = escapeshellcmd('python testing(new).py');
  $output = shell_exec($command);
  echo $output;
      
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


</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="uploadimg.php" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">Detect-pest</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>

    </div><!-- End Logo -->

    <div class="w-100 d-flex justify-content-end pe-5">
      <a class="dropdown-item d-flex align-items-center justify-content-end" href="logout.php">
        <i class="bi bi-box-arrow-right"></i>
        <span>Sign Out</span>
      </a>
    </div><!-- Signout -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed" href="uploadimg.php">
          <i class="bi bi-cloud-upload"></i><span>Upload</span><i></i>
        </a>
      </li><!-- End upload Nav -->

      <li class="nav-item">
        <a class="nav-link active" href="result.php">
          <i class="bi bi-cloud-download"></i><span>Result</span><i></i>
        </a>
      </li><!-- End result Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="details.php">
          <i class="bi bi-award"></i><span>About Us</span><i></i>
        </a>
      </li><!-- End details Nav -->

    </ul>
  </aside><!-- End Sidebar-->

  <main>
    <div class="container">

      <section class="section py-4">
        <div class="container">
          <div class="row">
            <div class="col-lg-10" style="margin-left: 230px;">

              <div class="card mb-3" style="margin: 50px 0 0 0;">


                <div class="card-body mt-3" style="padding: 10px 0 50px 0">
                  <?php
                  $query = mysqli_query($con, "select * from tbl_uploadimg order by id DESC limit 1");
                  while ($row1 = mysqli_fetch_array($query)) {
                  ?>
                    <form class="row d-flex justify-content-center" method="POST" enctype="multipart/form-data">

                      <div class="col-6">
                        <img src="images/<?php echo $row1['uploadimg']; ?>" alt="Image" width="60%" height="95%">
                       
                      </div>


                      <!--<div class="col-12 d-flex justify-content-center mt-4">
                      <input type="submit" class="btn btn-primary w-25 mt-4" name="submit" value="Submit">
                    </div>-->
                    </form>
                  <?php } ?>
                </div>
              </div>

            </div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-10" style="margin-left: 230px;">
            <div class="card-header">
                  <div class="pt-3">
                    <h5 class="card-title text-center">Result</h5>
                  </div>
                </div>
              <div class="card mb-3">


                <div class="card-body mt-3" style="padding: 10px 0 50px 0">
                <?php 
                $query = mysqli_query($con,"select * from tblresult order by id DESC limit 1");
                while ($row1=mysqli_fetch_array($query)) {
                ?>
                  

                    <div class="col-12">
                        <?php $mystring = $row1['outputresult']; 
                        if($mystring=='Invalid Input')
                          echo 'This is not an Insect-Pest image!!';
                        else{
                          $strnewclass = substr($mystring, 0, strpos($mystring, '_'));?>
                          <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Predicted Result is : <?php  echo $strnewclass ?></h5>
                       <?php }}?>
                    </div>
                    <?php 
                    $strnew = substr($mystring, -2, strpos($mystring, '_'));
                    if($strnew[0]=='_')
                      $strnew=$strnew[1];
                    //echo $strnew;

                    ?>
                     <?php 
                $query1 = mysqli_query($con,"select * from tbl_pesticide where cls_no='$strnew'");
                while ($row11=mysqli_fetch_array($query1)) {
                  if($mystring!='Invalid Input'){
                    ?>
                    <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pesticide : <?php  echo $row11['pst_name'];?></h5>
                     <?php }}?>
                     <?php 
                $query11 = mysqli_query($con,"select * from tbl_pestnames where class_no='$strnew'");
                while ($row111=mysqli_fetch_array($query11)) {
                  if($mystring!='Invalid Input'){
                ?>
                     <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pestname  : <?php  echo $row111['pestName'];?></h5>

                    <!--<div class="col-12 d-flex justify-content-center mt-4">
                      <input type="submit" class="btn btn-primary w-25 mt-4" name="submit" value="Submit">
                    </div>-->
                
                <?php }} ?>
                </div>
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->

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
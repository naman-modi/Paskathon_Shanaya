<?php
    require_once "../db.php";
    session_destroy();
    if(isset($_POST["submit"])) {
        if($_POST["category"] == "0") {
            $db   = new DB();
            $query = "SELECT * FROM investigator";
            $result = $db->run_query($query);
            while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                if($row["username"] == $_POST["username"] && $row["password"] == $_POST["password"]) {
                    session_start();
                    $_SESSION["username"] = $_POST["username"];
                    header("Location: ./statistics.php");
                }
            }
        }
        else if($_POST["category"] == "1") {
            $db   = new DB();
            $query = "SELECT * FROM admin";
            $result = $db->run_query($query);
            while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                if($row["username"] == $_POST["username"] && $row["password"] == $_POST["password"]) {
                    session_start();
                    $_SESSION["username"] = $_POST["username"];
                    header("Location: ../../index.php");
                }
            }
        }
    }
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Sign In</title>
    <!-- Favicon-->
    <link rel="icon" href="../../favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="../../plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
   <style>
       
    .profile-img-card {
        width: 120px;
        height: 120px;
        margin: 0 auto 10px;
        display: block;
        /*-moz-border-radius: 50%; --> 
        -webkit-border-radius: 50%; 
        border-radius: 50%; */
    }
   </style> 
   
    <!-- Waves Effect Css -->
    <link href="../../plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="../../plugins/animate-css/animate.css" rel="stylesheet" />
    <link href="options.css" rel="stylesheet" />
    <!-- Custom Css -->
    <link href="../../css/style.css" rel="stylesheet">
</head>

<body class="login-page">
    <div class="login-box">
        <div class="logo">
            <img id="profile-img" class="profile-img-card" src="https://www.noticebard.com/wp-content/uploads/2018/04/Capture-38.png" />
            <!-- <a href="javascript:void(0);">Ministry of Women and</a>
            <a href="javascript:void(0);">Child Development</a>
            <small>Admin BootStrap Based - Material Design</small> -->
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_in" method="POST">
                    <div class="msg">Sign in to start your session</div>
                    
<!-- Example split danger button 
<div class="btn-group">
    <button type="button" class="btn btn-primary">Action</button>
    <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <span class="sr-only">Toggle Dropdown</span>
    </button>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">Action</a>
      <a class="dropdown-item" href="#">Another action</a>
      <a class="dropdown-item" href="#">Something else here</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">Separated link</a>
    </div>
  </div>-->
                    <div class="form-group">
                        <select class="form-control" name="category" id="category">
                        <option value="0">Investigator</option>
                        <option value="1">Administrator</option>
                        </select>
                    </div>                    

                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" name="username" placeholder="Username" required autofocus>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-8 p-t-5">
                            <input type="checkbox" name="rememberme" id="rememberme" class="filled-in chk-col-pink">
                            <label for="rememberme">Remember Me</label>
                        </div>
                        <div class="col-xs-4">
                            <button class="btn btn-block bg-pink waves-effect" type="submit" name="submit">SIGN IN</button>
                        </div>
                    </div>
                    <div class="row m-t-15 m-b--20">
                        <div class="col-xs-6">
                            
                        </div>
                        <div class="col-xs-6 align-right">
                            <a href="forgot-password.html">Forgot Password?</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Jquery Core Js -->
    <script src="../../plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="../../plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="../../plugins/node-waves/waves.js"></script>

    <!-- Validation Plugin Js -->
    <script src="../../plugins/jquery-validation/jquery.validate.js"></script>

    <!-- Custom Js -->
    <script src="../../js/admin.js"></script>
    <script src="../../js/pages/examples/sign-in.js"></script>
</body>

</html>
<?php
 //echo md5('judiciary');
require_once('db_config.php');
if($user->is_loggedin()!="")
{
	 $user_id = $_SESSION['user_session'];
    $stmt=$DB_con->prepare("SELECT * FROM logins WHERE login_user_name =:ema");
    $stmt->bindParam(":ema",$user_id);
    $stmt->execute();
    $results=$stmt->fetch(PDO::FETCH_ASSOC);
    if($results['login_rank'] =="admin")
    {
        $user->redirect('dashboards/index.php');
    }
    
    
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>JUDICIARY | MANAGEMENT</title>
 <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta-Tags -->
	
	<!-- css files -->
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
	<link href="css/style-login.css" rel="stylesheet" type="text/css" media="all"/>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="all" />
	<link rel="stylesheet" href="css/buttons.css">
    <link rel="stylesheet" href="css/sweetalert.css">
	<!-- //css files -->
	
	<!-- google fonts -->
	<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<!-- //google fonts -->
	
	
</head>
<body>

<div class="signupform">
	<div class="container">
		<!-- main content -->
		<div class="agile_info">
			<div class="w3l_form">
				<div class="left_grid_info">
					<h1>JUDICIARY MANAGEMENT SYSTEM</h1>
					
					<img src="images/gavel-2492011_1920(1).jpg" alt="" />
				</div>
			</div>
			<div class="w3_info">
				<h2>Login to your Account</h2>
				<p>Enter your details to login.</p>
				<div id="error"></div>
				<form id="loginForm"  method="post">
				<div style="padding:5%;" id="error"></div>

					<label>Username</label>
					<div class="form-group">
						<span class="fa fa-envelope" aria-hidden="true"></span>
						<input type="text" name="user" placeholder="Enter Username" required=""> 
					</div>
					<label>Password</label>
					<div class="form-group">
						<span class="fa fa-lock" aria-hidden="true"></span>
						<input type="Password" name="password" placeholder="Enter Password" required="">
					</div> 
					<div class="login-check">
						 <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i> Remember me</label>
					</div>						
						<button class="btn btn-primary btn-block" type="submit">Login</button >                
				</form>
			
			</div>
		</div>
		<!-- //main content -->
	</div>
	<!-- footer -->
	<div class="footer">
		<p>&copy; <?php echo date('Y');?> JUDICIARY MANAGEMENT SYSTEM. All Rights Reserved | Design and Developed by <a href="#">Dennis</a></p>
	</div>
	<!-- footer -->
</div>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
			<script type="text/javascript">
				$(document).ready(function(){
					//alert("YOU ARE GOOD TO GO");
					                $("#loginForm").on('submit',(function(e)
																{
																	e.preventDefault();
																	$.ajax({
																		url:"logged.php",
																		type:"POST",
																		data:new FormData(this),
																		contentType:false,
																		cache:false,
																		processData:false,
																		beforeSend: function(){	
				$("#error").fadeOut();
				$("#login_button").html('<span class="glyphicon glyphicon-transfer"></span> &nbsp; sending ...');
			},
																		success:function(data)
																		{
																			//$("#return-data").html(data);
																			if (data=="OK") {
                                                                                //code
																				 $("#login_button").html('<img src="img/ajax-loader.gif" /> &nbsp; Signing In ...');
					setTimeout(' window.location.href = "choose_dashboard.php"; ',3000);
                                                }
																		else {									
					$("#error").fadeIn(1000, function(){						
						$("#error").html('<div class="alert alert-danger alert-dismissable"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <span class="glyphicon glyphicon-info-sign"></span> &nbsp; '+data+' !</div>');
						$("#login_button").html('<span class="glyphicon glyphicon-log-in"></span> &nbsp; Sign In');
					});
				}
																		}
																		
																	
																	});
				}));
				});
			</script>
</body>
</html>
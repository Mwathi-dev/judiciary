<?php
require_once('db_config.php');
if(!$user->is_loggedin())
{
	$user->redirect('index.php');
}
else
{
    $user_id = $_SESSION['user_session'];
    $stmt=$DB_con->prepare("SELECT * FROM logins WHERE login_user_name =:ema");
    $stmt->bindParam(":ema",$user_id);
    $stmt->execute();
    $results=$stmt->fetch(PDO::FETCH_ASSOC);
   
        $user->redirect('dashboards/index.php');
    
 
    
   
}
?>
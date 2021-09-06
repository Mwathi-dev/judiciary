<?php
class USER
{
	private $db;

	function __construct($DB_con)
	{
		$this->db = $DB_con;
	}
		public function testinput($data)
	{
		$data = htmlspecialchars($data);
		$data=stripslashes($data);
		$data=trim($data);
		return $data;

	}
	    /**
     * Insert data into the database
     * @param string name of the table
     * @param array the data for inserting into the table
     */
    public function insert($table,$data)
    {
        if(!empty($data) && is_array($data))
        {
            $columns = '';
            $values = '';
            $i = 0;
            $columnString = implode(',',array_keys($data));
            $valueString = ":" .implode(',:',array_keys($data));
            $sql = "INSERT INTO ".$table." (".$columnString.") VALUES
            (".$valueString.")";
            $query = $this->db->prepare($sql);
            foreach($data as $key=>$val)
            {
                $query->bindValue(':'.$key,$val);
            }
            $insert = $query->execute();
            return $insert?$this->db->lastInsertId():false;
        }
        else
        {
            return false;
        }
    }
    public function checkRow($table,$conditions = array())
    {
        $sql = ' SELECT * FROM ' . $table;
        if(!empty($conditions) && is_array($conditions))
        {
            $columns = '';
            $values = '';
            $sql .= ' WHERE ';
            $keys = array_keys($conditions);
            for($i=0;$i<count($keys);$i++)
            {
                $pre = ($i > 0)?' OR ':'';
                $sql .= $pre . $keys[$i] .'=:' . $keys[$i];
          
            }
            $query = $this->db->prepare($sql);
            foreach($conditions as $key=>$val)
            {
                $query->bindValue(':'.$key,$val);
            }
            $query->execute();
            
            return $query->rowCount();
        }
    }
/**
 * Update data into the database
 * @param string name of the table
 * @param array the data for updating into the table
 * @param array where condition on updating data
 */
    public function update($table,$data,$conditions)
    {
        if(!empty($data) && is_array($data))
        {
            $colvalset= '';
            $whereSql= '';
            $i = 0;
            
            foreach($data as $key=>$val)
            {
                $pre = ($i > 0)?', ':'';
                $colvalset .=$pre.$key."='".$val."'";
                $i++;
            }
            if(!empty($conditions) && is_array($conditions))
            {
                $whereSql .=' WHERE ';
                $i = 0;
                foreach($conditions as $key => $value)
                {
                    $pre = ($i > 0)?' AND ':'';
                    $whereSql .=$pre.$key."='".$value."'";
                    $i++;
                }
            }
            $sql = "UPDATE ".$table." SET ".$colvalset.$whereSql;
            $query = $this->db->prepare($sql);
            $update = $query->execute();
            return $update?true:false;
        }
        else
        {
            return false;
        }

    }
	

	public function login($umail,$upass)
	{
		try
		{
            $pass=  MD5($upass);
            
			$stmt = $this->db->prepare("SELECT * FROM logins WHERE login_user_name=:ema AND login_password=:pass LIMIT 1");
            $stmt->bindParam(":ema",$umail);
            $stmt->bindParam(":pass",$pass);
			$stmt->execute();
            $userRow=$stmt->fetch(PDO::FETCH_ASSOC);
            
			if($stmt->rowCount() > 0)
			{
                
					$_SESSION['user_session'] = $userRow['login_user_name'];
					return true;
				
				
            }
            else
				{
					return false;
				}
		}
		catch(PDOException $e)
		{
			echo $e->getMessage();
		}
	}

	public function is_loggedin()
	{
		if(isset($_SESSION['user_session']))
		{
			return true;
		}
	}

	public function redirect($url)
	{
		header("Location: $url");
	}

	public function logout()
	{
		session_destroy();
		unset($_SESSION['user_session']);
		return true;
	}
}
?>

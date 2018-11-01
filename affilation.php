


<?php

$db = mysqli_connect('localhost', 'root', '', 'cs306_project_s3');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

$id = (string)$_POST['affilation'];


if($id == ""){
	echo "No ID sent<br>";
}
else if(is_string($id)) {
	
	$sql = "SELECT C.affilation,COUNT(*) AS affilationcount FROM Characters C GROUP BY C.affilation HAVING C.affilation='$id' ";
	$sql2 = "SELECT C.name FROM Characters C WHERE C.affilation='$id' ";
	$result = $db->query($sql);
	$result2 = $db->query($sql2);
	
	$count = $result->num_rows;
	$count2 = $result->num_rows;
	if($count==0) {
		echo "There is no such affilation: $id";
	}
	else if($count2 == 0)
	{
		echo "This affilation: $id has no member";
	}
	else {
		 while($row = $result->fetch_assoc())
		{echo "$id afilation has ".$row['affilationcount']." members <br>";}
	echo "Members:<br>";
		 while($row = $result2->fetch_assoc())
		{echo  $row['name']."<br>";}
	}
}
else {
	echo "ID is not valid<br>";
}

?>

</br>
<a href="index.html">Back to the Search Page</a>

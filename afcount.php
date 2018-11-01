


<?php

$db = mysqli_connect('localhost', 'root', '', 'cs306_project_s3');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

$id = (int)$_POST['affilation'];


if($id == ""){
	echo "No ID sent<br>";
}
else if(is_int($id)) {
	
	$sql = "SELECT C.affilation,COUNT(*) AS affilationcount FROM Characters C GROUP BY C.affilation HAVING COUNT(*)>=$id ";
	$result = $db->query($sql);
	
	$count = $result->num_rows;
	if($count==0) {
		echo "There is no such affilation having number of members greater than: $id";
	}
	else {
		 while($row = $result->fetch_assoc())
		{echo $row['affilation']." : ".$row['affilationcount']." <br>";}
	}
}
else {
	echo "ID is not valid<br>";
}

?>

</br>
<a href="index.html">Back to the Search Page</a>

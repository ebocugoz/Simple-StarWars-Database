


<?php

$db = mysqli_connect('localhost', 'root', '', 'cs306_project_s3');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

$id = (string)$_POST['character'];


if($id == ""){
	echo "No ID sent<br>";
}
else if(is_string($id)) {
	
	$sql = "SELECT * FROM characters  WHERE name='$id' ";
	$result = $db->query($sql);
	
	$count = $result->num_rows;
	if($count==0) {
		echo "There is no such character: $id";
	}
	else {
		 $row = $result->fetch_assoc();
		echo $row['name']." <br>
		------------------- <br>
		 birthyear: ".$row['birthyear']."<br>
		 deathyear: ".$row['deathyear']."<br>
		 affilation: ".$row['affilation']."<br>
		 gender: ".$row['gender']."<br> ";
	}
}
else {
	echo "ID is not valid<br>";
}

?>

</br>
<a href="index.html">Back to the Search Page</a>

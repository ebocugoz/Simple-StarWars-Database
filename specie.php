


<?php

$db = mysqli_connect('localhost', 'root', '', 'cs306_project_s3');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

$id = (string)$_POST['specie'];


if($id == ""){
	echo "No ID sent<br>";
}
else if(is_string($id)) {
	
	$sql = "SELECT C.name FROM characters C WHERE C.name IN (SELECT K.name FROM kind_of K WHERE K.speciename = '$id')";
	$result = $db->query($sql);
	
	$count = $result->num_rows;
	if($count==0) {
		echo "There is no such specie: $id";
	}
	else {
		 while($row = $result->fetch_assoc())
		{echo $row['name']." specie is $id <br>";}
	}
}
else {
	echo "ID is not valid<br>";
}

?>

</br>
<a href="index.html">Back to the Search Page</a>


<?php

$db = mysqli_connect('localhost', 'root', '', 'cs306_project_s3');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

$id = (string)$_POST['ss'];


if($id == ""){
	echo "No ID sent<br>";
}
else if(is_string($id)) {
	
	$sql = "SELECT S.speciename, COUNT(*) AS speciecount FROM Species S, Kind_of K WHERE S.speciename=K.speciename GROUP BY S.speciename HAVING S.speciename='$id'";
	$result = $db->query($sql);
	
	$count = $result->num_rows;
	if($count==0) {
		echo "There is no such specie: $id";
	}
	else {
		$row = $result->fetch_assoc();
		echo $row['speciecount']." character is $id <br>";
	}
}
else {
	echo "ID is not valid<br>";
}

?>

</br>
<a href="index.html">Back to the Search Page</a>

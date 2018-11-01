




<?php

$db = mysqli_connect('localhost', 'root', '', 'cs306_project_s3');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

	
	$sql = "SELECT P.planetname, P.moon_number FROM Planets P WHERE (SELECT MAX(P2.moon_number) FROM Planets P2)=P.moon_number ";
	$result = $db->query($sql);
	
	$count = $result->num_rows;
	if($count==0) {
		echo "There is no planet with moons";
	}
	else {
		 while($row = $result->fetch_assoc())
		{echo "Planet: ".$row['planetname']." |Moon Number : ".$row['moon_number']." <br>";}
	}


?>

</br>
<a href="index.html">Back to the Search Page</a>

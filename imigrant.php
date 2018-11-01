


<?php

$db = mysqli_connect('localhost', 'root', '', 'cs306_project_s3');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

	$sql = "SELECT S.speciename,P.planetname FROM Species S, Planets P, Lives L WHERE L.status='Immigrant' AND L.speciename=S.speciename AND P.planetname=L.planetname";
	$result = $db->query($sql);
	
	$count = $result->num_rows;
	if($count==0) {
		echo "There is no imigrant specie";
	}
	else {
		 while($row = $result->fetch_assoc())
		{echo "Specie: ".$row['speciename']." |Planet: ".$row['planetname']." <br>";}
	}


?>

</br>
<a href="index.html">Back to the Search Page</a>

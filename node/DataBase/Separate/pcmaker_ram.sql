#
# SQL Export
# Created by Querious (303012)
# Created: December 5, 2022 at 15:27:45 GMT+3:30
# Encoding: Unicode (UTF-8)
#


SET @ORIG_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;

SET @ORIG_UNIQUE_CHECKS = @@UNIQUE_CHECKS;
SET UNIQUE_CHECKS = 0;

SET @ORIG_TIME_ZONE = @@TIME_ZONE;
SET TIME_ZONE = '+00:00';

SET @ORIG_SQL_MODE = @@SQL_MODE;
SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';



CREATE TABLE `pcram` (
  `id` int NOT NULL AUTO_INCREMENT,
  `en_name` varchar(45) NOT NULL,
  `fa_name` varchar(45) NOT NULL,
  `company` varchar(45) NOT NULL,
  `ramFrequency` int NOT NULL,
  `ramType` int NOT NULL,
  `ramAllStorage` int NOT NULL,
  `ramSluts` int NOT NULL,
  `showIMG` varchar(45) NOT NULL,
  `smallIMG` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




LOCK TABLES `pcram` WRITE;
INSERT INTO `pcram` (`id`, `en_name`, `fa_name`, `company`, `ramFrequency`, `ramType`, `ramAllStorage`, `ramSluts`, `showIMG`, `smallIMG`, `price`) VALUES 
	(1,'Crucial Ram','رم کروشیال DDR4 16GB','Crucial',2400,4,16,2,'ram/crucial-show.png','ram/crucial-small.png','2,170,000');
UNLOCK TABLES;






SET FOREIGN_KEY_CHECKS = @ORIG_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS = @ORIG_UNIQUE_CHECKS;

SET @ORIG_TIME_ZONE = @@TIME_ZONE;
SET TIME_ZONE = @ORIG_TIME_ZONE;

SET SQL_MODE = @ORIG_SQL_MODE;



# Export Finished: December 5, 2022 at 15:27:45 GMT+3:30


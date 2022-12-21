#
# SQL Export
# Created by Querious (303012)
# Created: December 5, 2022 at 15:24:22 GMT+3:30
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



CREATE TABLE `pchdd` (
  `id` int NOT NULL AUTO_INCREMENT,
  `en_name` varchar(45) NOT NULL,
  `fa_name` varchar(45) NOT NULL,
  `company` varchar(45) NOT NULL,
  `HDDstorage` int NOT NULL,
  `hddType` varchar(45) NOT NULL,
  `hddForm` int NOT NULL,
  `smallIMG` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




LOCK TABLES `pchdd` WRITE;
INSERT INTO `pchdd` (`id`, `en_name`, `fa_name`, `company`, `HDDstorage`, `hddType`, `hddForm`, `smallIMG`, `price`) VALUES 
	(1,'wd 1TB hard drive','هارد اینترال وسترن دیجیتال 1 ترابایت','WD',1000,'blue',4,'hdd/wd-1tb-small.png','1,260,000');
UNLOCK TABLES;






SET FOREIGN_KEY_CHECKS = @ORIG_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS = @ORIG_UNIQUE_CHECKS;

SET @ORIG_TIME_ZONE = @@TIME_ZONE;
SET TIME_ZONE = @ORIG_TIME_ZONE;

SET SQL_MODE = @ORIG_SQL_MODE;



# Export Finished: December 5, 2022 at 15:24:22 GMT+3:30


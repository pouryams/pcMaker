#
# SQL Export
# Created by Querious (303012)
# Created: December 5, 2022 at 15:22:29 GMT+3:30
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



CREATE TABLE `pccase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `en_name` varchar(45) NOT NULL,
  `fa_name` varchar(45) NOT NULL,
  `company` varchar(45) NOT NULL,
  `caseForm` varchar(45) NOT NULL,
  `caseBiggerFormFactorSupport` varchar(45) NOT NULL,
  `fansNum` int NOT NULL,
  `intelTAC` tinyint NOT NULL,
  `showIMG` varchar(45) NOT NULL,
  `smallIMG` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




LOCK TABLES `pccase` WRITE;
INSERT INTO `pccase` (`id`, `en_name`, `fa_name`, `company`, `caseForm`, `caseBiggerFormFactorSupport`, `fansNum`, `intelTAC`, `showIMG`, `smallIMG`, `price`) VALUES 
	(1,'Cooler Master MASTERBOX Q500L','کیس کامپیوتر کولر مستر مدل MASTERBOX Q500L','CoolerMaster','M','ATX',0,0,'case/CoolerMaster-show.png','case/CoolerMaster-small.png','2,240,000'),
	(3,'Lian Li O11 Dynamic EVO W','کیس لیان لی مدل O11 Dynamic EVO','LianLi','H','ATX',4,1,'case/LianLi-show.png','case/LianLi-small.png','6,570,000'),
	(4,'Green Griffin G6','کیس گرین مدل G6','green','M','ATX',3,1,'case/Green-G6-show.png','case/Green-G6-small.png','2,840,000');
UNLOCK TABLES;






SET FOREIGN_KEY_CHECKS = @ORIG_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS = @ORIG_UNIQUE_CHECKS;

SET @ORIG_TIME_ZONE = @@TIME_ZONE;
SET TIME_ZONE = @ORIG_TIME_ZONE;

SET SQL_MODE = @ORIG_SQL_MODE;



# Export Finished: December 5, 2022 at 15:22:29 GMT+3:30


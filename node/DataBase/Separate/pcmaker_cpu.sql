#
# SQL Export
# Created by Querious (303012)
# Created: December 5, 2022 at 15:23:34 GMT+3:30
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



CREATE TABLE `pccpu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `en_name` varchar(45) NOT NULL,
  `fa_name` varchar(45) NOT NULL,
  `company` varchar(45) NOT NULL,
  `cpu_socket` varchar(45) NOT NULL,
  `haveGPU` tinyint NOT NULL,
  `benchmark` int NOT NULL,
  `showIMG` varchar(45) NOT NULL,
  `smallIMG` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




LOCK TABLES `pccpu` WRITE;
INSERT INTO `pccpu` (`id`, `en_name`, `fa_name`, `company`, `cpu_socket`, `haveGPU`, `benchmark`, `showIMG`, `smallIMG`, `price`) VALUES 
	(1,'AMD Ryzen7 Pro 5750G','پردازنده ی ای ام دی مدل Ryzen7 5750G','AMD','AM4',1,24637,'CPU/Ryzen7-Pro5750G-Show.png','CPU/Ryzen7-Pro5750G-Show.png','7,780,000'),
	(2,'AMD Ryzen5 5600X','پردازنده ی ای ام دی مدل Ryzen5 5600X','AMD','AM4',1,21950,'CPU/Ryzen5-5600X-Show.png','CPU/Ryzen5-5600X-Small.png','7,690,000'),
	(3,'Intel Core i5 9400f','پردازنده ی اینتل مدل core i5 9400f','Intel','LGA-1151',0,9540,'CPU/i5-9400f-Show.png','CPU/i5-9400f-Small.png','4,597,000'),
	(4,'Intel Core i3 9100','پردازنده ی اینتل مدل core i3 9100','Intel','LGA-1151',1,6663,'CPU/i3-9100-Show.png','CPU/i5-9100-Small.png','4,478,000'),
	(5,'Intel Core i5 10400f','پردازنده ی اینتل مدل core i5 10400f','Intel','LGA-1200',1,12369,'CPU/i5-10400f-Show.png','CPU/i5-10400f-Small.png','3,778,000');
UNLOCK TABLES;






SET FOREIGN_KEY_CHECKS = @ORIG_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS = @ORIG_UNIQUE_CHECKS;

SET @ORIG_TIME_ZONE = @@TIME_ZONE;
SET TIME_ZONE = @ORIG_TIME_ZONE;

SET SQL_MODE = @ORIG_SQL_MODE;



# Export Finished: December 5, 2022 at 15:23:34 GMT+3:30


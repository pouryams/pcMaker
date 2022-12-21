#
# SQL Export
# Created by Querious (303012)
# Created: December 5, 2022 at 15:24:43 GMT+3:30
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



CREATE TABLE `pcmotherboard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `en_name` varchar(45) NOT NULL,
  `fa_name` varchar(45) NOT NULL,
  `company` varchar(45) NOT NULL,
  `ramSupportCount` int NOT NULL,
  `ramTypes` int NOT NULL,
  `ramFrequency` int NOT NULL,
  `cpuSocket` varchar(45) NOT NULL,
  `chipset` varchar(45) NOT NULL,
  `formFactor` varchar(45) NOT NULL,
  `ramSluts` int NOT NULL,
  `m2Sluts` int NOT NULL,
  `MBsataNum` int NOT NULL,
  `showIMG` varchar(45) NOT NULL,
  `smallIMG` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




LOCK TABLES `pcmotherboard` WRITE;
INSERT INTO `pcmotherboard` (`id`, `en_name`, `fa_name`, `company`, `ramSupportCount`, `ramTypes`, `ramFrequency`, `cpuSocket`, `chipset`, `formFactor`, `ramSluts`, `m2Sluts`, `MBsataNum`, `showIMG`, `smallIMG`, `price`) VALUES 
	(1,'Asus Motherboard PRIME B550M-A','مادربرد ایسوس مدل PRIME B550M-A','Asus',128,4,4600,'AM4','B550','microATX',4,2,4,'motherboard/Asus-B550-Show.png','motherboard/Asus-B550-Small.png','3,440,000'),
	(2,'Biostar Motherboard B550T-SILVER','مادربرد بایوستار مدل B550T-SILVER','Biostar',32,4,2900,'AM4','B550','microATX',2,1,4,'motherboard/Biostasr-B550-Show.png','motherboard/Biostasr-B550-Small.png','3,380,000'),
	(3,'Biostar Motherboard B250MHC','مادربرد بایوستار مدل B250MHC','Biostar',32,4,2133,'LGA-1151','B250','microATX',2,0,4,'motherboard/Biostasr-B250-Show.png','motherboard/Biostasr-B250-Small.png','2,197,000'),
	(4,'MSI MotherBoard H510 Pro-E','مادربرد ام اس آی مدل H510M PRO-E','MSI',64,4,2133,'LGA-1200','H510','microATX',2,0,4,'motherboard/Msi-H510-Show.png','motherboard/Msi-H510-Small.png','2,170,000'),
	(5,'Asus MotherBoard PRIME H310M-K','مادربرد ایسوس مدل PRIME H310M-K','Asus',32,4,2133,'LGA-1151','H310','microATX',2,0,3,'motherboard/Asus-H310-Show.png','motherboard/Asus-H310-Small.png','1,628,000');
UNLOCK TABLES;






SET FOREIGN_KEY_CHECKS = @ORIG_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS = @ORIG_UNIQUE_CHECKS;

SET @ORIG_TIME_ZONE = @@TIME_ZONE;
SET TIME_ZONE = @ORIG_TIME_ZONE;

SET SQL_MODE = @ORIG_SQL_MODE;



# Export Finished: December 5, 2022 at 15:24:43 GMT+3:30


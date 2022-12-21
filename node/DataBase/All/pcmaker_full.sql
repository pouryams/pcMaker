#
# SQL Export
# Created by Querious (303012)
# Created: December 5, 2022 at 15:08:38 GMT+3:30
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



DROP DATABASE IF EXISTS `PCmaker`;
CREATE DATABASE `PCmaker` DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_0900_ai_ci;
USE `PCmaker`;




DROP TABLE IF EXISTS `pcssd`;
DROP TABLE IF EXISTS `pcram`;
DROP TABLE IF EXISTS `pcpower`;
DROP TABLE IF EXISTS `pcmotherboard`;
DROP TABLE IF EXISTS `pchdd`;
DROP TABLE IF EXISTS `pcgpu`;
DROP TABLE IF EXISTS `pccpu`;
DROP TABLE IF EXISTS `pccase`;


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


CREATE TABLE `pcgpu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `en_name` varchar(45) NOT NULL,
  `fa_name` varchar(45) NOT NULL,
  `company` varchar(45) NOT NULL,
  `chipsetCompany` varchar(45) NOT NULL,
  `chipset` varchar(45) NOT NULL,
  `benchmark` int NOT NULL,
  `HDMIport` int NOT NULL,
  `DPport` int NOT NULL,
  `VGAport` int NOT NULL,
  `DGport` int NOT NULL,
  `showIMG` varchar(45) NOT NULL,
  `smallIMG` varchar(45) NOT NULL,
  `gpuStorage` int NOT NULL,
  `price` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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


CREATE TABLE `pcpower` (
  `id` int NOT NULL AUTO_INCREMENT,
  `en_name` varchar(45) NOT NULL,
  `fa_name` varchar(45) NOT NULL,
  `company` varchar(45) NOT NULL,
  `watt` int NOT NULL,
  `module` varchar(45) NOT NULL,
  `form` varchar(45) NOT NULL,
  `powerSataConnectorNum` int NOT NULL,
  `smallIMG` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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


CREATE TABLE `pcssd` (
  `id` int NOT NULL AUTO_INCREMENT,
  `en_name` varchar(45) NOT NULL,
  `fa_name` varchar(45) NOT NULL,
  `company` varchar(45) NOT NULL,
  `SSDstorage` int NOT NULL,
  `ssdType` varchar(45) NOT NULL,
  `smallIMG` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




LOCK TABLES `pccase` WRITE;
INSERT INTO `pccase` (`id`, `en_name`, `fa_name`, `company`, `caseForm`, `caseBiggerFormFactorSupport`, `fansNum`, `intelTAC`, `showIMG`, `smallIMG`, `price`) VALUES 
	(1,'Cooler Master MASTERBOX Q500L','کیس کامپیوتر کولر مستر مدل MASTERBOX Q500L','CoolerMaster','M','ATX',0,0,'case/CoolerMaster-show.png','case/CoolerMaster-small.png','2,240,000'),
	(3,'Lian Li O11 Dynamic EVO W','کیس لیان لی مدل O11 Dynamic EVO','LianLi','H','ATX',4,1,'case/LianLi-show.png','case/LianLi-small.png','6,570,000'),
	(4,'Green Griffin G6','کیس گرین مدل G6','green','M','ATX',3,1,'case/Green-G6-show.png','case/Green-G6-small.png','2,840,000');
UNLOCK TABLES;


LOCK TABLES `pccpu` WRITE;
INSERT INTO `pccpu` (`id`, `en_name`, `fa_name`, `company`, `cpu_socket`, `haveGPU`, `benchmark`, `showIMG`, `smallIMG`, `price`) VALUES 
	(1,'AMD Ryzen7 Pro 5750G','پردازنده ی ای ام دی مدل Ryzen7 5750G','AMD','AM4',1,24637,'CPU/Ryzen7-Pro5750G-Show.png','CPU/Ryzen7-Pro5750G-Show.png','7,780,000'),
	(2,'AMD Ryzen5 5600X','پردازنده ی ای ام دی مدل Ryzen5 5600X','AMD','AM4',1,21950,'CPU/Ryzen5-5600X-Show.png','CPU/Ryzen5-5600X-Small.png','7,690,000'),
	(3,'Intel Core i5 9400f','پردازنده ی اینتل مدل core i5 9400f','Intel','LGA-1151',0,9540,'CPU/i5-9400f-Show.png','CPU/i5-9400f-Small.png','4,597,000'),
	(4,'Intel Core i3 9100','پردازنده ی اینتل مدل core i3 9100','Intel','LGA-1151',1,6663,'CPU/i3-9100-Show.png','CPU/i5-9100-Small.png','4,478,000'),
	(5,'Intel Core i5 10400f','پردازنده ی اینتل مدل core i5 10400f','Intel','LGA-1200',1,12369,'CPU/i5-10400f-Show.png','CPU/i5-10400f-Small.png','3,778,000');
UNLOCK TABLES;


LOCK TABLES `pcgpu` WRITE;
INSERT INTO `pcgpu` (`id`, `en_name`, `fa_name`, `company`, `chipsetCompany`, `chipset`, `benchmark`, `HDMIport`, `DPport`, `VGAport`, `DGport`, `showIMG`, `smallIMG`, `gpuStorage`, `price`) VALUES 
	(1,'GigaByte GeForce RTX 2060','کارت گرافیک گیگابایت GeForce RTX2060','gigabyte','nvidia','RTX2060',14006,2,2,0,0,'gpu/Gigabyte-RTX2060-show.png','gpu/Gigabyte-RTX2060-small.png',6,'11,200,000'),
	(2,'Asus TUF-GTX1650','کارت گرافیک ایسوس TUF GeForce GTX1650','Asus','nvidia','GTX1650',7828,1,1,0,1,'gpu/Asus-GTX1650-show.png','gpu/Asus-GTX1650-small.png',4,'7,100,000'),
	(3,'Asus TUF-GTX1660Ti','کارت گرافیک ایسوس TUF GeForce GTX1660Ti','Asus','nvidia','GTX1660Ti',11886,2,1,0,1,'gpu/Asus-GTX1660Ti-show.png','gpu/Asus-GTX1660Ti-small.png',6,'8,500,000');
UNLOCK TABLES;


LOCK TABLES `pchdd` WRITE;
INSERT INTO `pchdd` (`id`, `en_name`, `fa_name`, `company`, `HDDstorage`, `hddType`, `hddForm`, `smallIMG`, `price`) VALUES 
	(1,'wd 1TB hard drive','هارد اینترال وسترن دیجیتال 1 ترابایت','WD',1000,'blue',4,'hdd/wd-1tb-small.png','1,260,000');
UNLOCK TABLES;


LOCK TABLES `pcmotherboard` WRITE;
INSERT INTO `pcmotherboard` (`id`, `en_name`, `fa_name`, `company`, `ramSupportCount`, `ramTypes`, `ramFrequency`, `cpuSocket`, `chipset`, `formFactor`, `ramSluts`, `m2Sluts`, `MBsataNum`, `showIMG`, `smallIMG`, `price`) VALUES 
	(1,'Asus Motherboard PRIME B550M-A','مادربرد ایسوس مدل PRIME B550M-A','Asus',128,4,4600,'AM4','B550','microATX',4,2,4,'motherboard/Asus-B550-Show.png','motherboard/Asus-B550-Small.png','3,440,000'),
	(2,'Biostar Motherboard B550T-SILVER','مادربرد بایوستار مدل B550T-SILVER','Biostar',32,4,2900,'AM4','B550','microATX',2,1,4,'motherboard/Biostasr-B550-Show.png','motherboard/Biostasr-B550-Small.png','3,380,000'),
	(3,'Biostar Motherboard B250MHC','مادربرد بایوستار مدل B250MHC','Biostar',32,4,2133,'LGA-1151','B250','microATX',2,0,4,'motherboard/Biostasr-B250-Show.png','motherboard/Biostasr-B250-Small.png','2,197,000'),
	(4,'MSI MotherBoard H510 Pro-E','مادربرد ام اس آی مدل H510M PRO-E','MSI',64,4,2133,'LGA-1200','H510','microATX',2,0,4,'motherboard/Msi-H510-Show.png','motherboard/Msi-H510-Small.png','2,170,000'),
	(5,'Asus MotherBoard PRIME H310M-K','مادربرد ایسوس مدل PRIME H310M-K','Asus',32,4,2133,'LGA-1151','H310','microATX',2,0,3,'motherboard/Asus-H310-Show.png','motherboard/Asus-H310-Small.png','1,628,000');
UNLOCK TABLES;


LOCK TABLES `pcpower` WRITE;
INSERT INTO `pcpower` (`id`, `en_name`, `fa_name`, `company`, `watt`, `module`, `form`, `powerSataConnectorNum`, `smallIMG`, `price`) VALUES 
	(1,'Green power 580W','پاور گرین 580 وات','GREEN',580,'N','normal',4,'power/green-580-small.png','3,400,000');
UNLOCK TABLES;


LOCK TABLES `pcram` WRITE;
INSERT INTO `pcram` (`id`, `en_name`, `fa_name`, `company`, `ramFrequency`, `ramType`, `ramAllStorage`, `ramSluts`, `showIMG`, `smallIMG`, `price`) VALUES 
	(1,'Crucial Ram','رم کروشیال DDR4 16GB','Crucial',2400,4,16,2,'ram/crucial-show.png','ram/crucial-small.png','2,170,000');
UNLOCK TABLES;


LOCK TABLES `pcssd` WRITE;
INSERT INTO `pcssd` (`id`, `en_name`, `fa_name`, `company`, `SSDstorage`, `ssdType`, `smallIMG`, `price`) VALUES 
	(2,'samsung 870 1TB','اس اس دی ایننترنال سامسونگ مدل 870 1TB','samsun',1000,'sata','ssd/samsung-870-small.png','3,640,000');
UNLOCK TABLES;






SET FOREIGN_KEY_CHECKS = @ORIG_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS = @ORIG_UNIQUE_CHECKS;

SET @ORIG_TIME_ZONE = @@TIME_ZONE;
SET TIME_ZONE = @ORIG_TIME_ZONE;

SET SQL_MODE = @ORIG_SQL_MODE;



# Export Finished: December 5, 2022 at 15:08:38 GMT+3:30


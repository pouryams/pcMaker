#
# SQL Export
# Created by Querious (303012)
# Created: December 5, 2022 at 15:24:07 GMT+3:30
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




LOCK TABLES `pcgpu` WRITE;
INSERT INTO `pcgpu` (`id`, `en_name`, `fa_name`, `company`, `chipsetCompany`, `chipset`, `benchmark`, `HDMIport`, `DPport`, `VGAport`, `DGport`, `showIMG`, `smallIMG`, `gpuStorage`, `price`) VALUES 
	(1,'GigaByte GeForce RTX 2060','کارت گرافیک گیگابایت GeForce RTX2060','gigabyte','nvidia','RTX2060',14006,2,2,0,0,'gpu/Gigabyte-RTX2060-show.png','gpu/Gigabyte-RTX2060-small.png',6,'11,200,000'),
	(2,'Asus TUF-GTX1650','کارت گرافیک ایسوس TUF GeForce GTX1650','Asus','nvidia','GTX1650',7828,1,1,0,1,'gpu/Asus-GTX1650-show.png','gpu/Asus-GTX1650-small.png',4,'7,100,000'),
	(3,'Asus TUF-GTX1660Ti','کارت گرافیک ایسوس TUF GeForce GTX1660Ti','Asus','nvidia','GTX1660Ti',11886,2,1,0,1,'gpu/Asus-GTX1660Ti-show.png','gpu/Asus-GTX1660Ti-small.png',6,'8,500,000');
UNLOCK TABLES;






SET FOREIGN_KEY_CHECKS = @ORIG_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS = @ORIG_UNIQUE_CHECKS;

SET @ORIG_TIME_ZONE = @@TIME_ZONE;
SET TIME_ZONE = @ORIG_TIME_ZONE;

SET SQL_MODE = @ORIG_SQL_MODE;



# Export Finished: December 5, 2022 at 15:24:07 GMT+3:30


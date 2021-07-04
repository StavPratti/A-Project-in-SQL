set define off;

INSERT INTO groupAge VALUES(1);
INSERT INTO groupAge VALUES(2);
INSERT INTO groupAge VALUES(3);
INSERT INTO groupAge VALUES(4);
INSERT INTO groupAge VALUES(5);
INSERT INTO groupAge VALUES(6);
INSERT INTO groupAge VALUES(7);
INSERT INTO groupAge VALUES(8);
INSERT INTO groupAge VALUES(9);
INSERT INTO groupAge VALUES(10);
SELECT * FROM groupAge;

INSERT INTO country VALUES(64,'Gambia');
INSERT INTO country VALUES(144,'Romania');
INSERT INTO country VALUES(181,'Turkey');
INSERT INTO country VALUES(189,'United States of America');
INSERT INTO country VALUES(167,'State of Palestine');
SELECT * FROM country;

--the countries that the citizens come from are already in the base because we put the values in the array 'country' above this comment
INSERT INTO citizen VALUES('00dfe662-5e91-5144-92f3-5ac880967a2d','GI 60211','Gregory','Morales','1/1/1965','(584) 758-1681','Ujjes Heights 331',93744,'Tutveswuk','WA',181);
INSERT INTO citizen VALUES('00e102e6-40d8-53d6-b67b-eddae2414718','JJ 29391','Carlos','Hines','5/5/1999','(206) 754-6512','Avaguh Pike 319',41550,'Julustok','DE',144);
INSERT INTO citizen VALUES('00f50093-fbbb-5507-ac2d-f786d0152fac','KH 32010','Caroline','Webster','12/5/1976','(785) 353-2883','Pugdi Park 504',17116,'Ozapeda','WI',144);
INSERT INTO citizen VALUES('0104061b-0a86-54f2-a1f2-60752731ab89','BU 76733','Jorge','Lambert','26/7/1968','(312) 612-2758','Feuw Turnpike 78',55634,'Tokapuz','CT',181);
INSERT INTO citizen VALUES('0115736c-89cd-5a9a-9c04-90d8abc7d111','BW 96688','Alexander','Howell','16/11/1999','(700) 853-6442','Tatge Key 156',65621,'Debkuwasa','ID',189);
INSERT INTO citizen VALUES('01229457-4a31-5d4d-b1fa-53d8b47579b2','PW 58503','Delia','Hill','16/7/1992','(377) 468-5760','Joha Square 240',77425,'Wejnali','NM',189);
INSERT INTO citizen VALUES('013c7155-54ae-5f3d-870e-bbd9ac4c6225','FZ 80830','Mattie','Jacobs','1/2/1983','(386) 621-2058','Wulod Center 39',19996,'Sommetce','MT',167);
INSERT INTO citizen VALUES('015afd58-1406-5715-aec6-2d9b22a5463a','DN 94933','Pauline','Gregory','11/2/1983','(471) 446-7009','Cede River 167',47925,'Jalelri','WY',167);
INSERT INTO citizen VALUES('01ace0e9-758f-5bc1-ac96-8330a81618d0','JC 47306','Lou','Flowers','28/7/1995','(902) 805-9998','Ohegeg Heights 227',99968,'Nenajav','MT',64);
INSERT INTO citizen VALUES('02680760-f38d-5e5d-8d8e-118691dea1ee','OW 84589','Leon','Dunn','31/7/1956','(676) 404-3728','Mabu Avenue 361',35614,'Efiurioga','MS',64);
--INSERT INTO citizen VALUES('0029ddf0-3fbe-5188-abad-5f584b1693f0','YM 27439','Lester','Walker','27/3/1984','818-725-3262','Olovok Drive 501',38194,'Wofabbo','NE',169); FOREIGN KEY DOES NOT EXIST
SELECT * FROM citizen;


--the vaccinationCenters are in the countries that have been already inserted in the base
INSERT INTO vaccinationCenter VALUES(4281657,'VAIL VALLEY MEDICAL CENTER','181 W MEADOW DRIVE','VAIL','CO',81657,'(970) 476-2451',/*'EAGLE',*/167,39.64337027,-106.3819852,'http://www.vvmc.com','Y');
INSERT INTO vaccinationCenter VALUES(2380810,'KEEFE MEMORIAL HOSPITAL','602 N 6TH W ST','CHEYENNE WELLS','CO',80810,'(719) 767-5661',/*'CHEYENNE',*/144,38.82572778,-102.3550113,'http://www.keefememorialhospital.org','Y');
INSERT INTO vaccinationCenter VALUES(9045238,'MERCY HOSPITAL WEST','3131 QUEEN CITY AVENUE','CINCINNATI','OH',45238,'(513) 389-5915',/*'HAMILTON',*/181,39.13495616,-84.60736474,'http://www.e-mercy.com','Y');
INSERT INTO vaccinationCenter VALUES(3806067,'SGT JOHN L LEVITOW VETERAN S HEALTH CENTER','287 WEST ST','ROCKY HILL','CT',6067,'(860) 616-3600',/*'HARTFORD,*/189,41.65674059,-72.65651214,'http://www.ct.gov/ctva/cwp/view.asp?a=2005&q=482380','N'); --theres a bug please press enter or anything else
INSERT INTO vaccinationCenter VALUES(7530152,'DEVEREUX TREATMENT NETWORK','1291 STANLEY ROAD NW','KENNESAW','GA',30152,'(770) 427-0147',/*'COBB',*/64,33.98622371,-84.60617122,'http://www.devereuxga.org','N');
--INSERT INTO vaccinationCenter VALUES(8153210,'ASCENSION SE WISCONSIN HOSPITAL ST JOSEPH','5000 W CHAMBERS ST','MILWAUKEE','WI',53210,414-447-2000,/*MILWAUKEE,*/73,43.07412025,-87.9760734,'http://www.mywheaton.org/stjoseph','N'); FOREIGN KEY DOES NOT EXIST
SELECT * FROM vaccinationCenter;

INSERT INTO company VALUES(1,'Pfizer Inc. and BioNTech','Pfizer-BioNTech','BNT162b2');
INSERT INTO company VALUES(2,'ModernaTX Inc.','Moderna','mRNA-1273');
INSERT INTO company VALUES(3,'Oxford/AstraZeneca','AstraZeneca','AZD1222'); 
INSERT INTO company VALUES(4,'Johnson & Johnson','Johnson & Johnson COVID-19','-');
INSERT INTO company VALUES(5,'Gamaleya National Centre of Epidemiology and Microbiology','Sputnik V','Gam-COVID-Vac');
SELECT * FROM company;

--the vaccines are in the vaccination centers of the base above
INSERT INTO vaccine VALUES('00099cd6-bc40-5837-bc32-560e0df28b5d',4,'TRUE','8/2/2021','TRUE','15/3/2021',4281657);
INSERT INTO vaccine VALUES('000a3aa0-620c-5faf-955e-7116ce9f29aa',2,'TRUE','25/2/2021','TRUE','5/3/2021',2380810);
INSERT INTO vaccine VALUES('000a4feb-2623-572d-8751-cf88507ee611',1,'TRUE','22/2/2021','TRUE','9/3/2021',9045238);
INSERT INTO vaccine VALUES('00086691-3089-5aeb-89fc-98369efdc609',3,'TRUE','3/2/2021','FALSE','',3806067);
INSERT INTO vaccine VALUES('0008b651-9312-572e-b7a7-35f335a69ed2',5,'TRUE','7/1/2021','TRUE','9/3/2021',7530152);
--INSERT INTO vaccine VALUES('0072f1db-924e-58a9-92fc-79eae7642836',1,'TRUE','14/2/2021','TRUE','1/3/2021',154580138); THE FOREIGN KEY DOES NOT EXIST
SELECT * FROM vaccine;
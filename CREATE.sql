ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';

set define off;

--we decided to create the tables according to the form of the project and not ours, because the information from the excel must be compatible to the tables

--some attributes of the tables are in comments because we consider them important to exist but in the excel file there arent

CREATE TABLE groupAge(
 groupAgeID NUMBER(2) PRIMARY KEY , 
 CONSTRAINT groupAge_chk_groupAgeID CHECK (groupAgeID > 0 AND groupAgeID < 11) /* the size of the field is 1 because the groups ages are from 1-10 */
);

CREATE TABLE country(
 countryCode NUMBER(3) PRIMARY KEY,
 countryName VARCHAR(45) UNIQUE NOT NULL
 --totalPopulationMillion NUMBER(10,4) NOT NULL, /* million because the presicion is too limited for a realistic number*/
 --groupAge NUMBER(1) NOT NULL,
 --vaccinationCentersID NUMBER(5) NOT NULL ,
 --CONSTRAINT country_vaccinationCenter_fk FOREIGN KEY(vaccinationCentersID) REFERENCES vaccinationCenter(vaccinationCenterID),
 --CONSTRAINT country_groupAge_fk FOREIGN KEY(groupAge) REFERENCES groupAge(groupAgeID)
);

CREATE TABLE vaccinationCenter (
 vaccinationCenterID NUMBER(10) PRIMARY KEY,
 nameCenter VARCHAR(60) NOT NULL ,
 address VARCHAR(45) NOT NULL,
 city VARCHAR(25) NOT NULL,
 state VARCHAR(3) NOT NULL,
 zipCode NUMBER(7) NOT NULL,
 phoneNumber VARCHAR(30) NOT NULL,
 countryName NUMBER(3) NOT NULL,
 geodesticLan NUMBER(10,4) NOT NULL,
 geodesticLot NUMBER(10,4) NOT NULL,
 website VARCHAR(65) NULL,
 helipad VARCHAR(1) NOT NULL CHECK (helipad IN ('N','Y')),
 CONSTRAINT vaccinationCenter_country_fk FOREIGN KEY(countryName) REFERENCES country(countryCode)
);

CREATE TABLE citizen(
 amka VARCHAR(45) PRIMARY KEY,
 citizenID VARCHAR(45) UNIQUE NOT NULL ,
 firstName VARCHAR(45) NOT NULL ,
 lastName VARCHAR(45) NOT NULL ,
 birthdate DATE NOT NULL ,
 phone VARCHAR(45) NOT NULL ,
 address VARCHAR(45) NOT NULL ,
 zipCode NUMBER(7) NOT NULL ,
 city VARCHAR(25) NOT NULL ,
 state VARCHAR(3) NOT NULL ,
 country NUMBER(3) NOT NULL ,
 --age NUMBER(3) NOT NULL CHECK (age > 0 AND age < 110),
 --vaccineSelection VARCHAR(15) NOT NULL ,
 --number?f?nstallments NUMBER(1) CHECK (number?f?nstallments IN(1,2)),
 --vaccinated VARCHAR(3) NOT NULL CHECK (vaccinated IN ('Yes','No')),
 --vaccineID VARCHAR(10),
 --vaccinationCenterID NUMBER(5) NOT NULL ,
 --CONSTRAINT citizen_vaccinationCenter_fk FOREIGN KEY(vaccinationCenterID) REFERENCES vaccinationCenter(vaccinationCenterID),
 CONSTRAINT citizen_country_fk FOREIGN KEY(country) REFERENCES country(countryCode)
);

CREATE TABLE company(
 companyID NUMBER(2) UNIQUE NOT NULL,
 nameCompany VARCHAR(60) PRIMARY KEY,
 vaccineName VARCHAR(45) NOT NULL,
 vaccineID VARCHAR(45) NOT NULL
 --CONSTRAINT company_vaccine_fk FOREIGN KEY(vaccineID) REFERENCES vaccine(vaccineID)
 --CONSTRAINT company_vaccine_fk FOREIGN KEY(vaccineName) REFERENCES vaccine(vaccineName)
);

CREATE TABLE vaccine(
 vaccineID VARCHAR(45) PRIMARY KEY,
 vaccineType NUMBER(2) NOT NULL,
 firstDose VARCHAR(5) NOT NULL,
 firstDoseDate DATE NULL,
 secondDose VARCHAR(10) NOT NULL,
 secondDoseDate DATE NULL,
 vaccinationCenterID NUMBER(10) NOT NULL,
 --vaccineName VARCHAR(10) NOT NULL,
 --numberVaccine NUMBER(6) NOT NULL,
 --countryProduction NUMBER(3) NOT NULL,
 --nameCompany VARCHAR(20) NOT NULL,
 --singleDose NUMBER(1) NOT NULL CHECK (singleDose IN (0,1)) ,
 --CONSTRAINT vaccine_country_fk FOREIGN KEY(countryProduction) REFERENCES country(countryCode),
 --CONSTRAINT vaccine_company_fk FOREIGN KEY(nameCompany) REFERENCES company(nameCompany)
 CONSTRAINT vaccine_vaccinationCenter_fk FOREIGN KEY (vaccinationCenterID) REFERENCES vaccinationCenter(vaccinationCenterID),
 CONSTRAINT vaccine_company_fk FOREIGN KEY (vaccineType) REFERENCES company(companyID)
);

SELECT table_name FROM user_tables;
--Πόσα εμβολιαστικά κέντρα έχει κάθε χώρα (Ερώτημα ΙI)
SELECT count(Country) as has_centers,vac.country --gia na emfanisw kai tin xwra
FROM Vaccination_Centers Vac
GROUP BY Country;


--Πόσοι πολίτες έχουν ολοκληρώσει και τις δύο δόσεις του εμβολίου (Ερώτημα VΙ)
SELECT count(Uids_Population) 
FROM Vaccinations Vac
WHERE (First_Dose like '%TRUE%')and(Second_Dose like '%TRUE%');

--Πόσοι εμβολιασμοί έχουν γίνει σε κάθε τύπο εμβολίου (Ερώτημα VI)
SELECT count(Vaccination_Id) as Vaccined,Vaccine_Type
FROM Vaccinations
GROUP BY Vaccine_Type;

--Εφόσον κάθε δόση θεωρείται εμβολιασμός (Ερώτημα Ι)
/*Βήμα 1 : Φτιάξαμε μια όψη η οποία κάνει μια ένωση των αποτελεσματων που μας
δίνουν 2 ερωτηματα. Τα ερωτήματα κάνουν join τους πίνακες Vaccination_Centers,Countries και Vaccinations και φέρνουν πίσω 
 το αθροισμα των εμβολιασμών της πρώτης δόσεις και της δεύτερης δόσης αντίστοιχα σε έναν πίνακα*/
CREATE VIEW total_vaccinations AS 
(SELECT count(First_Dose) total_vaccinations,Country,Country_Name 
FROM Vaccinations embo 
    JOIN Vaccination_Centers kentr
     on embo.Vaccination_Center=kentr.Facility_ID 
     JOIN Countries cnt
     on cnt.Country_Code=kentr.Country
WHERE First_Dose like '%TRUE%'  --Φιλτράρουμε τους εμβολιασμούς που έχουν γίνει από την 1η δόση
GROUP BY Country,Country_Name) --ωστε α κρατήσω στην όψη και το νούμερο χώρας και το όνομα
    UNION --ενωση
    (SELECT count(Second_Dose),Country,Country_Name
      FROM Vaccinations embo 
            JOIN Vaccination_Centers kentr
             on embo.Vaccination_Center=kentr.Facility_ID 
             JOIN Countries cnt 
             on cnt.Country_Code=kentr.Country
     WHERE Second_Dose like '%TRUE%'   --Φιλτράρουμε τους εμβολιασμούς που έχουν γίνει από την 2η δόση
GROUP BY Country,Country_Name); --ωστε α κρατήσω στην όψη και το νούμερο χώρας και το όνομα

/*Βήμα 2: Φτιάχνουμε μια νέα όψη που αθροίζει τους εμβολιασμούς από την πρώτη δόση με τους εμβολιασμούς 
από την δεύτερη δόση με κρητήριο κσθε χώρα να εμφανιστεί μια φορά στον πινακα*/
CREATE VIEW Vaccinations_of_Country AS
SELECT sum(total_vaccinations) Vaccinations_of_Country,Country,Country_Name --οι 3 στήλες που θα εχει η όψη
FROM total_vaccinations --φιλτραρουμε
GROUP BY Country,Country_Name; --για να εχω και τις δυο στήλες

/*Βήμα 3: Το τελικο ερώτημα που μας δίνει την Χώρα ή τις χώρες με τους max εμβολιασμούς */
SELECT Country_Name  --για να εμφανίσω το όνομα της χώρας
FROM Vaccinations_of_Country
WHERE Vaccinations_of_Country=(SELECT max(Vaccinations_of_Country) FROM Vaccinations_of_Country); --εμφολευμενο ερώτημα για να βρώ το μαξ

--Πόσοι εμβολιασμοί έχουν γίνει στην Ελλάδα (Ερώτημα ΙΙΙ)
SELECT vac.Vaccinations_of_Country --τυπώνουμε μονο το νουμερο των εμβολιασμών της συγκεκριμένης χώρας
FROM Vaccinations_of_Country vac --Επιλέγουμε τον πίνακα που φτιάξαμε παραπάνω με τους εμβολιασμούς κάθε χώρας
WHERE vac.Country_Name like '%Greece%' ; --παίρνουμε μονο το αποτέλεσμα της ελλάδας (στον κώδικα μας που δεν προσθέσαμε όλες τις χώρες βαλαμε Angola αντι για Greece)

--Ποσοι έχουν κάνει εστω μια δόση του εμβολίου παγκοσμίος (VII)
SELECT count(*)
FROM Vaccinations
WHERE (first_dose like '%TRUE%') OR (second_dose like  '%TRUE%');

DROP TABLE Effectuer;
DROP TABLE EffectuerQualification;
DROP TABLE Course;
DROP TABLE Circuit;
DROP TABLE Appartenir;
DROP TABLE Ecurie;
DROP TABLE Pilote;


-- script de creation des tables de la base F1
CREATE TABLE Pilote(
nuPilote number(5) constraint pk_pilote Primary key, 
nomPilote varchar2(20), 
prenomPilote varchar2(20),
nationalite varchar2(20)
);

create table Ecurie(
nuEcurie number(5) constraint pk_ecurie Primary key,
nomEcurie varchar2(20)
);

create table Appartenir(
nuPilote number(5) constraint fk_pilote_appartenir references Pilote(nuPilote),
nuEcurie number(5) constraint fk_ecurie references Ecurie(nuEcurie),
annee number(4),
constraint pk_appartenir primary key (nuPilote, nuEcurie, annee)
);


CREATE TABLE Circuit(
nuCi number(5) constraint pk_circuit primary key,
nomCi varchar2(20),
paysCi varchar2(20),
longueurCi number(5),
nbTours number(3)
);

create table Course(
nuCo number(5) constraint pk_course primary key,
anneeCo number(4),
meteo varchar2(5) constraint ck_meteo check (meteo in ('sec','pluie','mix')),
nuCi number(5) constraint fk_co_ci references Circuit(nuCi)
);

create table EffectuerQualification(
nuCo number(5) constraint fk_co_effectuerQualif references Course(nuCo),
nuPilote number(5) constraint fk_pilote_effectuerQualif references Pilote(nuPilote),
classement number(2),
tempsTour number(6),
constraint pk_effectuerQualification primary key (nuCO, nuPilote)
);


create table Effectuer(
nuCo number(5) constraint fk_co_effectuer references Course(nuCo),
nuPilote number(5) constraint fk_pilote_effectuer references Pilote(nuPilote),
classement number(2),
temps number(6),
tempsTour number(6),
constraint pk_effectuer primary key (nuCO, nuPilote)
);




INSERT INTO PILOTE VALUES (1, 'HAMILTON','Lewis', 'Royaume-Uni');    
INSERT INTO PILOTE VALUES (2, 'MASSA', 'Felipe', 'Bresil');
INSERT INTO PILOTE VALUES (3, 'RAIKKONEN','Kimi', 'Finlande');
INSERT INTO PILOTE VALUES (4, 'KUBICA', 'Robert', 'Pologne');
INSERT INTO PILOTE VALUES (5, 'SCHUMACHER', 'Mickael', 'Allemagne');
INSERT INTO PILOTE VALUES (6, 'ALONSO','Fernando', 'Espagne'); 
INSERT INTO PILOTE VALUES (7, 'FISICHELLA', 'Giancarlo','Italie');



INSERT INTO ECURIE values (1, 'Ferrari');
INSERT INTO ECURIE values (2, 'McLarenMercedes');
INSERT INTO ECURIE values (3, 'Renault');
INSERT INTO ECURIE values (4, 'WilliamsBMW');
INSERT INTO ECURIE values (5, 'Force India');



INSERT INTO APPARTENIR values (1,2,2009);
INSERT INTO APPARTENIR values (1,2,2008);
INSERT INTO APPARTENIR values (1,2,2007);    
INSERT INTO APPARTENIR values (2,1,2009);
INSERT INTO APPARTENIR values (2,1,2008);
INSERT INTO APPARTENIR values (2,1,2007);
INSERT INTO APPARTENIR values (2,1,2006);
INSERT INTO APPARTENIR values (3,1,2009);
INSERT INTO APPARTENIR values (3,1,2008);
INSERT INTO APPARTENIR values (3,1,2007);
INSERT INTO APPARTENIR values (3,2,2006);
INSERT INTO APPARTENIR values (4,4,2009);
INSERT INTO APPARTENIR values (4,4,2008);
INSERT INTO APPARTENIR values (4,4,2007);
INSERT INTO APPARTENIR values (4,4,2006);
INSERT INTO APPARTENIR values (5,1,2006);
INSERT INTO APPARTENIR values (6,3,2009);
INSERT INTO APPARTENIR values (6,3,2008);
INSERT INTO APPARTENIR values (6,2,2007);
INSERT INTO APPARTENIR values (6,3,2006);
INSERT INTO APPARTENIR values (7,5,2009);
INSERT INTO APPARTENIR values (7,5,2008);
INSERT INTO APPARTENIR values (7,3,2007);
INSERT INTO APPARTENIR values (7,3,2006);

INSERT INTO CIRCUIT values (1, 'Silverstone','Grande-Bretagne',5141, 60);
INSERT INTO CIRCUIT values (2, 'Gilles-Villeneuve','Canada',4361, 70);
INSERT INTO CIRCUIT values (3, 'Shangai','Chine', 5451, 56);
INSERT INTO CIRCUIT values (4, 'Albert Park','Australie', 5303, 58);
INSERT INTO CIRCUIT values (5, 'Magny-Cours','France', 4411, 68);
INSERT INTO CIRCUIT values (6, 'Yas Marina Circuit','Emirats Arabes Unis', 5505, 55);



INSERT INTO COURSE values (1, 2006, 'pluie',1);
INSERT INTO COURSE values (2, 2006, 'sec',2);
INSERT INTO COURSE values (3, 2006, 'pluie',3);
INSERT INTO COURSE values (4, 2006, 'pluie',5);
INSERT INTO COURSE values (5, 2007, 'sec',1);
INSERT INTO COURSE values (6, 2007, 'sec',2);
INSERT INTO COURSE values (7, 2007, 'pluie',3);
INSERT INTO COURSE values (8, 2008, 'mix',1);
INSERT INTO COURSE values (9, 2008, 'sec',2);
INSERT INTO COURSE values (10, 2008, 'pluie',3);
INSERT INTO COURSE values (11, 2009, 'pluie',1);
INSERT INTO COURSE values (12, 2009, 'pluie',2);
INSERT INTO COURSE values (13, 2009, 'mix',3);
INSERT INTO COURSE values (14, 2009, 'sec',6);



INSERT INTO EFFECTUERQUALIFICATION values (1,6,1, 80);
INSERT INTO EFFECTUERQUALIFICATION values (1,5,2, 81);
INSERT INTO EFFECTUERQUALIFICATION values (1,3,6, 82);
INSERT INTO EFFECTUERQUALIFICATION values (1,2,3, 81);
INSERT INTO EFFECTUERQUALIFICATION values (1,7,4, 82);


INSERT INTO EFFECTUER values (1,6,1, 4980, 81);
INSERT INTO EFFECTUER values (1,5,2, 4996, 81);
INSERT INTO EFFECTUER values (1,3,3 , 5010, 82);
INSERT INTO EFFECTUER values (1,2,5,5016, 82);
INSERT INTO EFFECTUER values (1,7,4,5012, 82);

INSERT INTO EFFECTUERQUALIFICATION values (2,6,1, 75);
INSERT INTO EFFECTUERQUALIFICATION values (2,5,2, 75);
INSERT INTO EFFECTUERQUALIFICATION values (2,7,6, 76);
INSERT INTO EFFECTUERQUALIFICATION values (2,2,7, 77);

INSERT INTO EFFECTUER values (2,6,1,5390, 75);
INSERT INTO EFFECTUER values (2,5,2,5395, 75);
INSERT INTO EFFECTUER values (2,7,3,5410, 75);
INSERT INTO EFFECTUER values (2,2,4,5416, 76);

INSERT INTO EFFECTUERQUALIFICATION values (3,5,1, 77);
INSERT INTO EFFECTUERQUALIFICATION values (3,6,6, 79);
INSERT INTO EFFECTUERQUALIFICATION values (3,7,2, 77);
INSERT INTO EFFECTUERQUALIFICATION values (3,4,9, 80);

INSERT INTO EFFECTUER values (3,5,1, 4559, 78);
INSERT INTO EFFECTUER values (3,6,2, 4580, 79);
INSERT INTO EFFECTUER values (3,7,3, 5601, 79);
INSERT INTO EFFECTUER values (3,4,13,4630, 82);



INSERT INTO EFFECTUERQUALIFICATION values (5,3,3, 80);
INSERT INTO EFFECTUERQUALIFICATION values (5,6,1, 79);
INSERT INTO EFFECTUERQUALIFICATION values (5,1,2, 79);
INSERT INTO EFFECTUERQUALIFICATION values (5,4,8, 81);
INSERT INTO EFFECTUERQUALIFICATION values (5,2,7, 81);


INSERT INTO EFFECTUER values (5,3,1, 5000, 80);
INSERT INTO EFFECTUER values (5,6,2, 5010, 79);
INSERT INTO EFFECTUER values (5,1,3, 5060, 80);
INSERT INTO EFFECTUER values (5,4,4, 5070, 81);
INSERT INTO EFFECTUER values (5,2,5, 5075, 80);

INSERT INTO EFFECTUERQUALIFICATION values (6,1,3,76);
INSERT INTO EFFECTUERQUALIFICATION values (6,3,4,78);
INSERT INTO EFFECTUERQUALIFICATION values (6,6,6,79);
INSERT INTO EFFECTUERQUALIFICATION values (6,5,7,79);


INSERT INTO EFFECTUER values (6,1,1,5450, 77);
INSERT INTO EFFECTUER values (6,3,5,5502, 82);
INSERT INTO EFFECTUER values (6,6,7,5523, 83);
INSERT INTO EFFECTUER values (6,5,8,5524, 84);

INSERT INTO EFFECTUERQUALIFICATION values (7,3,1, 76);
INSERT INTO EFFECTUERQUALIFICATION values (7,6,2, 77);
INSERT INTO EFFECTUERQUALIFICATION values (7,2,3, 78);
INSERT INTO EFFECTUERQUALIFICATION values (7,7,11, 82);

INSERT INTO EFFECTUER values (7,3,1, 4570, 75);
INSERT INTO EFFECTUER values (7,6,2, 4600, 76);
INSERT INTO EFFECTUER values (7,2,3, 4610, 78);
INSERT INTO EFFECTUER values (7,7,11, 4650, 79);

INSERT INTO EFFECTUERQUALIFICATION values (8,1,1, 79);
INSERT INTO EFFECTUERQUALIFICATION values (8,3,4, 81);
INSERT INTO EFFECTUERQUALIFICATION values (8,6,6, 82);
INSERT INTO EFFECTUERQUALIFICATION values (8,2,13, 84);

INSERT INTO EFFECTUER values (8,1,1, 4990, 79);
INSERT INTO EFFECTUER values (8,3,4, 4999, 78);
INSERT INTO EFFECTUER values (8,6,6, 5050, 80);



INSERT INTO EFFECTUER values (9,1,1, 5400, 75);
INSERT INTO EFFECTUER values (9,2,2, 5403, 75);
INSERT INTO EFFECTUER values (9,3,3, 5410, 76);
INSERT INTO EFFECTUER values (9,6,4, 5490, 76);
INSERT INTO EFFECTUER values (9,4,6, 5500, 77);
INSERT INTO EFFECTUER values (9,7,17, 5530, 76);

commit;
Select nuPilote, nomPilote FROM Pilote;
Select nuCi FROM Course;
Select DISTINCT nuCi FROM Course;

Select anneeCo, meteo FROM COURSE where nuCi = 2;
Select nuPilote, classement FROM Effectuer where nuCo = 3;
Select nuCo, anneeCo, meteo FROM Course where nuCi = 2 
ORDER BY anneeCo;
SELECT nuCi, nomCi, paysCi, longueurCi FROM Circuit 
ORDER BY paysCi DESC;
SELECT * FROM Pilote where nomPilote like 'F%';
SELECT nuPilote FROM Appartenir where (nuEcurie = 1 or nuEcurie = 2) and annee = 2009;
SELECT nuPilote FROM Effectuer where classement <= 3 and nuCo = 9; 
SELECT nuCi, nomCi,  (longueurCi * nbTours) / 1000 AS DistanceTotale FROM Circuit; 
SELECT Count(*) from Circuit;
SELECT AVG(Temps) from Effectuer where nuCo = 1;
SELECT AVG(Temps), nuCo FROM effectuer group by nuCo order by AVG(temps);
SELECT nuCo , AVG(Temps) FROM Effectuer GROUP BY nuCo Having AVG(Temps) < 5500;
SELECT nuPilote, COUNT (DISTINCT nuEcurie) FROM Appartenir GROUP BY nuPilote HAVING COUNT(DISTINCT nuEcurie) >1;
select nuCo, anneeCo, nomCi, paysCi from Course, Circuit;
select nuCo, anneeCo, nomCi, paysCi from Course, Circuit where Course.nuCi = Circuit.nuCi;
SELECT DISTINCT nomCi, paysCi from Course Co, Circuit Ci where Co.nuCi = Ci.nuCi and UPPER(Co.meteo) = 'PLUIE';
SELECT DISTINCT nomPilote, prenomPilote, nationalite  from Pilote P , Appartenir A, Ecurie E  where P.nuPilote = A.nuPilote and A.nuEcurie = E.nuEcurie 
and nomEcurie = 'Ferrari';

//Q15
//Avec des registres Imbriqués 
SELECT nomPilote, prenomPilote, nationalite 
FROM Pilote 
where nuPilote in (SELECT nuPilote FROM Appartenir WHERE nuEcurie IN (SELECT nuEcurie FROM Ecurie Where nomEcurie = 'Ferrari') and annee = 2006);
//Sans Registre Imbriqués 
SELECT nomPilote, prenomPilote, nationalite FROM Pilote P, Appartenir A, Ecurie E where P.nuPilote = A.nuPilote 
and A.nuEcurie = E.nuEcurie
and nomEcurie = 'Ferrari'
and annee = 2006; 
SELECT DISTINCT nomPilote, prenomPilote, nationalite FROM Pilote P, Effectuer E , Course Co, Circuit Ci where P.nuPilote = E.nuPilote  and 
E.nuCo = Co.nuCo and Co.nuCi = Ci.nuCi and UPPER(nomCi) = 'SILVERSTONE' and classement = 1;
SELECT DISTINCT nomPilote, prenomPilote, nationalite, tempsTour FROM Pilote P, Effectuer E , Course Co, Circuit Ci where P.nuPilote = E.nuPilote  and 
E.nuCo = Co.nuCo and Co.nuCi = Ci.nuCi and UPPER(nomCi) = 'SILVERSTONE' and classement = 1;
//Imbriqué (Non car il doit faire la jointure avant)
SELECT DISTINCT nomPilote, prenomPilote, nationalite, tempsTour FROM Pilote, Effectuer where nuPilote in 
(SELECT nuPilote From Effectuer where nuCo in 
(SELECT nuCo From Course WHERE nuCi in 
(SELECT nuCi From Circuit where UPPER(nomCi) = 'SILVERSTONE' and classement = 1 )));



SELECT nuCi From Circuit Ci UNION SELECT nuCi From Course MINUS SELECT nuCi From Course; 
SELECT DISTINCT nomPilote, prenomPilote FROM Pilote P, Effectuer E , Course Co, Circuit Ci where P.nuPilote = E.nuPilote  and 
E.nuCo = Co.nuCo and Co.nuCi = Ci.nuCi and UPPER(nomCi) = 'SILVERSTONE' and classement = 1 
INTERSECT 
SELECT DISTINCT nomPilote, prenomPilote FROM Pilote P, Effectuer E , Course Co, Circuit Ci where P.nuPilote = E.nuPilote  and 
E.nuCo = Co.nuCo and Co.nuCi = Ci.nuCi and UPPER(nomCi) = 'GILLES-VILLENEUVE' and classement = 1 ;  


SELECT DISTINCT nomPilote, prenomPilote FROM Pilote where nuPilote in 
(SELECT nuPilote From Effectuer where nuCo in 
(SELECT nuCo From Course WHERE nuCi in 
(SELECT nuCi From Circuit where UPPER(nomCi) = 'SILVERSTONE')) and classement = 1 )
and nuPilote in 
(SELECT nuPilote From Effectuer where nuCo in 
(SELECT nuCo From Course WHERE nuCi in 
(SELECT nuCi From Circuit where UPPER(nomCi) = 'GILLES-VILLENEUVE')) and classement = 1 );

SELECT DISTINCT nomCi FROM Circuit Ci, Course Co where Ci.nuCi = Co.nuCi
MINUS 
SELECT DISTINCT nomCi FROM Circuit Ci, Course Co where Ci.nuCi = Co.nuCi and anneeCo = 2009;

SELECT DISTINCT nomCi FROM Circuit Ci, Course Co where Ci.nuCi = Co.nuCi and anneeCo <= 2009
MINUS
SELECT DISTINCT nomCi FROM Circuit Ci, Course Co where Ci.nuCi = Co.nuCi and anneeCo = 2009;

SELECT DISTINCT nomCi FROM Circuit Ci, Course Co where Ci.nuCi = Co.nuCi and anneeCo >= 2009
MINUS 
SELECT DISTINCT nomCi FROM Circuit Ci, Course Co where Ci.nuCi = Co.nuCi and anneeCo < 2009; 

//Question 25
SELECT nomPilote, nuCo
FROM Effectuer e, Pilote p
where e.nuPilote = p.nuPilote 
INTERSECT
SELECT nomPilote, nuCo 
FROM effectuerqualification eq, Pilote p
where eq.nuPilote = p.nuPilote;

SELECT nomEcurie, annee , Count(nuPilote)
FROM Appartenir, Ecurie
Group By nomEcurie, annee;

SELECT nomPilote, prenomPilote 
FROM Effectuer e, Pilote p
where e.nuPilote = p.nuPilote
Group by nomPilote, prenomPilote  
Having nuCo = 5 and temps = MAX(temps);

SELECT nuCi, Count(noCo), Max(Count (noCo))
FROM Circuit ci, Course co 
where Co.nuCi = Ci.nuCi 
Group by nuCi, Count(noCo),Max(Count (noCo)) Having Count(noCo) = Max(Count (noCo));

SELECT nomPilote , AVG(tempsTour), MAX(tempsTour) 
FROM Effectuer e, Pilote p
where e.nuPilote = p.nuPilote 
Group by nomPilote Having AVG(tempsTour) <= 1.05 * Max(tempsTour);

SELECT nomPilote, nuCo, MAX(TempsTour) 
FROM Effectuer e, Pilote p
where e.nuPilote = p.nuPilote 
Group by nomPilote, nuCo,MAX(TempsTour) having classement <> 1 and tempsTour = MAX(tempsTour);

SELECT nuCo, MAX(e.tempsTour), MAX(eq.tempsTour)
FROM Effectuer e , EffectuerQualification eq
Group by nuCo where MAX(e.tempsTour) > MAX(eq.tempsTour);

Alter Table Pilote 
Add nbVictoires NUMBER;

Update Pilote Set nbVictoires = (Select COUNT(nuPilote) 
FROM Effectuer
where classement = 1
and Pilote.nuPilote = Effectuer.nuPilote) ;

SELECT * FROM Pilote;

SELECT * FROM Pilote 
where ROWNUM < = 3;

SELECT * FROM (Select p.nuPilote, nbVictoires, classement, temps, tempsTour from Pilote p, Effectuer ef where p.nuPilote = ef.nuPilote and nuCo = 1 ORDER BY classement) where ROWNUM <= 3;

SELECT * FROM (Select p.nuPilote, nbVictoires, classement, temps, tempsTour from Pilote p, Effectuer ef where p.nuPilote = ef.nuPilote and nuCo = 1 ORDER BY classement) where ROWNUM <= 3
MINUS 
SELECT * FROM (Select p.nuPilote, nbVictoires, classement, temps, tempsTour from Pilote p, Effectuer ef where p.nuPilote = ef.nuPilote and nuCo = 1 ORDER BY classement) where ROWNUM < 3;

 commit;
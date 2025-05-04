Create Table EffectuerQualification (nuCo NUMBER, nuPilote NUMBER, classement VARCHAR2(20), tempsTour NUMBER
, Constraint pk_nuCo_nuPilote2 PRIMARY KEY (nuCo, nuPilote)
, Constraint fk_nuCo FOREIGN KEY(nuCo) REFERENCES COURSE 
, Constraint fk_nuPilote FOREIGN KEY(nuPilote) REFERENCES PILOTE
);
Alter Table EffectuerQualification MODIFY (tempsTour FLOAT );
Alter Table Circuit Add (longueurCi NUMBER, nbTours NUMBER);
Alter Table Effectuer Add (temps FLOAT, tempsTour FLOAT); 



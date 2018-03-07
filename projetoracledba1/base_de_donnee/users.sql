-- URL            : miageprojet2.unice.fr
-- Project        : Gestion d'un cabinet médical
-- Author         : Marouane
-- Date           : 13/04/2017
-- Purpose        : Les utilisateurs

-- Se connecter entant que administrateur de la base de donnees
CONNECT / AS SYSDBA

-- Creer la view des informations autorisées par les medecins
CREATE VIEW "med_patient_view" AS SELECT "idPatient","nomPatient","prenomPatient","agePatient","genrePatient","statutFamilialePatient","groupeSanguinPatient","professionPatient" FROM "Patient";

-- Creer le role pour les medecins
create role MEDECIN_RL 
	IDENTIFIED BY rolemedpass;
GRANT CREATE SESSION TO MEDECIN_RL;
GRANT SELECT ON "RendezVous" TO MEDECIN_RL ;
GRANT SELECT ON "med_patient_view" TO MEDECIN_RL ;
GRANT UPDATE ON "RendezVous" TO MEDECIN_RL ;
GRANT UPDATE ON "Prescription" TO MEDECIN_RL ;
GRANT INSERT ON "Ordonnance" TO MEDECIN_RL ;
GRANT INSERT ON "Facture" TO MEDECIN_RL ;
GRANT INSERT ON "ExamenClinique" TO MEDECIN_RL ;
	
-- Creer le propriétaire de l'application (ADMIN)
CREATE USER ADMIN 
	IDENTIFIED BY @dm!n$2017
	DEFAULT tablespace users
	TEMPORARY tablespace ts_tmp_cabinet_medi;
	QUOTA 10m ON users;
GRANT ALL PRIVILEGES TO ADMIN;

-- Creer l'utilisateur ASSISTANTE_1
CREATE VIEW "assist_patient_view" AS SELECT "idPatient", "nomPatient", "prenomPatient", "dateNaissancePatient" FROM "Patient";
CREATE USER ASSISTANTE_1 
	IDENTIFIED BY @s:sm[an[e$2017
	DEFAULT TABLESPACE users
	TEMPORARY TABLESPACE ts_tmp_cabinet_medi;
	QUOTA 10M ON users;
GRANT SELECT ON "Ordonnance" TO ASSISTANTE_1;
GRANT SELECT ON "ExamenClinique" TO ASSISTANTE_1;
GRANT SELECT ON "Facture" TO ASSISTANTE_1;
GRANT SELECT ON "ASSIST_PATIENT_VIEW" TO ASSISTANTE_1;

-- Creer l'utilisateur MEDECIN_1
CREATE USER MEDECIN_1 
	IDENTIFIED BY medpass
	DEFAULt TABLESPACE users
	TEMPORARY TABLESPACE ts_tmp_cabinet_medi;
	QUOTA 50M ON users;
GRANT MEDECIN_RL TO MEDECIN_1;




-- URL            : miageprojet2.unice.fr
-- Project        : Gestion d'un cabinet médical
-- Author         : Mamadou
-- Date           : 01/05/2017
-- Purpose        : Script pour le calcul du volume des indexes

-- Index sur la table RendezVous
SET SERVEROUTPUT ON
DECLARE
ub NUMBER;
ab NUMBER;
BEGIN
	dbms_space.create_index_cost('CREATE INDEX idx_rendezvous ON
	"RendezVous"("idRendezVous","idMedecin","idPatient", "idVisite")', ub, ab);
	dbms_output.put_line('Used Bytes: ' || TO_CHAR(ub));
	dbms_output.put_line('Alloc Bytes: ' || TO_CHAR(ab));
END;
/
-- Indexe sur la table Patient
DECLARE
ub NUMBER;
ab NUMBER;
BEGIN
dbms_space.create_index_cost('CREATE INDEX idx_patient ON
"Patient"("nomPatient","prenomPatient")', ub, ab);
dbms_output.put_line('Used Bytes: ' || TO_CHAR(ub));
dbms_output.put_line('Alloc Bytes: ' || TO_CHAR(ab));
END;
/

-- Indexe sur la table Visite
DECLARE
ub NUMBER;
ab NUMBER;
BEGIN
dbms_space.create_index_cost('CREATE INDEX idx_visite ON
"Visite"("idVisite","idRendezVous","idFacture", "idOrdonnance")', ub, ab);
dbms_output.put_line('Used Bytes: ' || TO_CHAR(ub));
dbms_output.put_line('Alloc Bytes: ' || TO_CHAR(ab));
END;
/

-- Indexe sur la table ExamenClinique
DECLARE
ub NUMBER;
ab NUMBER;
BEGIN
dbms_space.create_index_cost('CREATE INDEX idx_examenclinique ON
"ExamenClinique"("idExamenClinique","idVisite")', ub, ab);
dbms_output.put_line('Used Bytes: ' || TO_CHAR(ub));
dbms_output.put_line('Alloc Bytes: ' || TO_CHAR(ab));
END;
/


-- Creation des indexes
DROP INDEX idx_rendezvous;
DROP INDEX idx_visite;
DROP INDEX IDX_PATIENT;
DROP INDEX idx_examenclinique;

CREATE UNIQUE INDEX idx_rendezvous
	ON "RendezVous" ('idRendezVous', 'idMedecin', 'idPatient', 'idVisite')
	TABLESPACE ts_ind_cabinet_medi_auto;

CREATE UNIQUE INDEX idx_visite
	ON "Visite"("idVisite", "idRendezVous", "idFacture","idOrdonnance")
	TABLESPACE ts_ind_cabinet_medi_auto;

CREATE UNIQUE INDEX idx_patient
	ON "Patient"("nomPatient", "prenomPatient")
	TABLESPACE ts_ind_cabinet_medi_auto;

CREATE UNIQUE INDEX idx_examenclinique
	ON "ExamenClinique"("idExamenClinique", "idVisite")
	TABLESPACE ts_ind_cabinet_medi_auto;



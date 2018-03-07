-- URL            : miageprojet2.unice.fr
-- Project        : Gestion d'un cabinet médical
-- Author         : Marouane
-- Date           : 13/04/2017
-- Purpose        : Les tables de la base de donneés

/*==============================================================*/
/* Table : "Affectation"                                        */
/*==============================================================*/
CREATE TABLE "Affectation" 
   (
      "idMedecin"          INTEGER,
      "idClinique"         INTEGER,
      "Contrat_AFFECTATION" VARCHAR2(30)
   )
   TABLESPACE ts_tab_cabinet_medi_auto;

/*==============================================================*/
/* Table : "Clinique"                                           */
/*==============================================================*/
CREATE TABLE "Clinique" 
   (
      "idClinique"         INTEGER              NOT NULL,
      "nomClinique"        VARCHAR2(50),
      "adresseClinique"    VARCHAR2(254),
      "telephone1Clinique" NUMBER,
      "telephone2Clinique" NUMBER,
      "faxClinique"        NUMBER,
      "emailClinique"      VARCHAR2(100),
      CONSTRAINT PK_CLINIQUE PRIMARY KEY ("idClinique")
   )
   TABLESPACE ts_tab_cabinet_medi_auto;

/*==============================================================*/
/* Table : "ExamenClinique"                                     */
/*==============================================================*/
CREATE TABLE "ExamenClinique" 
   (
      "IDEXAMENCLINIQUE"   INTEGER              NOT NULL,
      "idVisite"           INTEGER,
      "commentaireExamenClinique" VARCHAR2(254),
      "diagnostiqueExamenClinique" VARCHAR2(254),
      CONSTRAINT PK_EXAMENCLINIQUE PRIMARY KEY ("idExamenClinique")
   )
   TABLESPACE ts_tab_visites_auto;

/*==============================================================*/
/* Table : "Facture"                                            */
/*==============================================================*/
CREATE TABLE "Facture" 
   (
      "idFacture"          INTEGER              NOT NULL,
      "idVisite"           INTEGER,
      "dateFacture"        DATE,
      "fraisFacture"       FLOAT,
      "reductionFacture"   FLOAT,
      CONSTRAINT PK_FACTURE PRIMARY KEY ("idFacture")
   )
   TABLESPACE ts_tab_visites_auto;

/*==============================================================*/
/* Table : "Medecin"                                            */
/*==============================================================*/
CREATE TABLE "Medecin" 
   (
      "idMedecin"          INTEGER              NOT NULL,
      "nomMedecin"         VARCHAR2(30),
      "prenomMedecin"         VARCHAR2(30),
      "specialisationMedecin" VARCHAR2(100),
      "telephoneMedecin"   NUMBER,
      "nrLicence"          VARCHAR2(20),
      CONSTRAINT PK_MEDECIN PRIMARY KEY ("idMedecin")
   )
   TABLESPACE ts_tab_cabinet_medi_auto;

/*==============================================================*/
/* Table : "Medicament"                                         */
/*==============================================================*/
CREATE TABLE "Medicament" 
   (
      "idMedicament"       INTEGER              NOT NULL,
      "libelleMedicament"  VARCHAR2(100),
      "familleMedicament"  VARCHAR2(50),
      CONSTRAINT PK_MEDICAMENT PRIMARY KEY ("idMedicament")
   )
   TABLESPACE ts_tab_medicament_uniform;

/*==============================================================*/
/* Table : "Ordonnance"                                         */
/*==============================================================*/
CREATE TABLE "Ordonnance" 
   (
      "idVisite"           INTEGER,
      "idOrdonnance"       INTEGER              NOT NULL,
      "dateOrdonnance"     DATE,
      "dureeTraitementOrdonnance" DATE,
      "commentaireOrdonnance" VARCHAR2(254),
      CONSTRAINT PK_ORDONNANCE PRIMARY KEY ("idOrdonnance")
   )
   TABLESPACE ts_tab_visites_auto;

/*==============================================================*/
/* Table : "Patient"                                            */
/*==============================================================*/
CREATE TABLE "Patient" 
   (
      "idPatient"          INTEGER              NOT NULL,
      "nomPatient"         VARCHAR2(30),
      "prenomPatient"         VARCHAR2(30),
      "dateNaissancePatient" DATE,
      "agePatient"         INTEGER,
      "genrePatient"       SMALLINT,
      "statutFamilialePatient" INTEGER,
      "groupeSanguinPatient" INTEGER,
      "adresseDomicilePatient" VARCHAR2(254),
      "adresseTravailPatient" VARCHAR2(254),
      "telephoneFixPatient" VARCHAR2(30),
      "telephonePortablePatient" VARCHAR2(30),
      "telephoneTravailPatient" VARCHAR2(30),
      "professionPatient"  INTEGER,
      "adresseElectroniquePatient" VARCHAR2(100),
      CONSTRAINT PK_PATIENT PRIMARY KEY ("idPatient")
   )
   TABLESPACE ts_tab_patients_uniform;

/*==============================================================*/
/* Table : "Prescription"                                       */
/*==============================================================*/
CREATE TABLE "Prescription" 
   (
      ID_PRESCRIPTION      INTEGER              NOT NULL,
      "idMedicament"       INTEGER,
      "idOrdonnance"       INTEGER,
      RYTHME_PRESCRIPTION  NUMBER,
      QUANTITE_PRESCRIPTION NUMBER,
      CONSTRAINT PK_PRESCRIPTION PRIMARY KEY (ID_PRESCRIPTION)
   )
   TABLESPACE ts_tab_visites_auto;

/*==============================================================*/
/* Table : "RendezVous"                                         */
/*==============================================================*/
CREATE TABLE "RendezVous" 
   (
      "idMedecin"          INTEGER,
      "idRendezVous"       INTEGER              NOT NULL,
      "idPatient"          INTEGER,
      "idVisite"           INTEGER,
      "dateRendezVous"     DATE,
      "heureRendezVous"    DATE,
      CONSTRAINT PK_RENDEZVOUS PRIMARY KEY ("idRendezVous")
   )
   TABLESPACE ts_tab_patients_uniform;

/*==============================================================*/
/* Table : "Visite"                                             */
/*==============================================================*/
CREATE TABLE "Visite" 
   (
      "idVisite"           INTEGER              NOT NULL,
      "idRendezVous"       INTEGER,
      "idFacture"          INTEGER,
      "idOrdonnance"       INTEGER,
      "dateVisite"         DATE,
      "problemeVisite"     VARCHAR2(254),
      CONSTRAINT PK_VISITE PRIMARY KEY ("idVisite")
   )
   TABLESPACE ts_tab_visites_auto;

/*==============================================================*/
/* Table : "Statistique"                                             */
/*==============================================================*/
CREATE TABLE "Statistique"
   (
      "idStatistique"      INTEGER     NOT NULL,
      "datemaj"   TIMESTAMP,
      "CA"     FLOAT,
      "NbVisite"  INTEGER,
      CONSTRAINT PK_STATISTIQUE PRIMARY KEY ("idStatistique")
   )
   TABLESPACE ts_tab_visites_auto;


ALTER TABLE "Affectation"
   ADD CONSTRAINT FK_AFFECTAT_ASSOCIATI_CLINIQUE FOREIGN KEY ("idClinique")
      REFERENCES "Clinique" ("idClinique");

ALTER TABLE "Affectation"
   ADD CONSTRAINT FK_AFFECTAT_ASSOCIATI_MEDECIN FOREIGN KEY ("idMedecin")
      REFERENCES "Medecin" ("idMedecin");

ALTER TABLE "ExamenClinique"
   ADD CONSTRAINT FK_EXAMENCL_ASSOCIATI_VISITE FOREIGN KEY ("idVisite")
      REFERENCES "Visite" ("idVisite");

ALTER TABLE "Facture"
   ADD CONSTRAINT FK_FACTURE_ASSOCIATI_VISITE FOREIGN KEY ("idVisite")
      REFERENCES "Visite" ("idVisite");

ALTER TABLE "Ordonnance"
   ADD CONSTRAINT FK_ORDONNAN_ASSOCIATI_VISITE FOREIGN KEY ("idVisite")
      REFERENCES "Visite" ("idVisite");

ALTER TABLE "Prescription"
   ADD CONSTRAINT FK_PRESCRIP_ASSOCIATI_MEDICAME FOREIGN KEY ("idMedicament")
      REFERENCES "Medicament" ("idMedicament");

ALTER TABLE "Prescription"
   ADD CONSTRAINT FK_PRESCRIP_ASSOCIATI_ORDONNAN FOREIGN KEY ("idOrdonnance")
      REFERENCES "Ordonnance" ("idOrdonnance");

ALTER TABLE "RendezVous"
   ADD CONSTRAINT FK_RENDEZVO_ASSOCIATI_MEDECIN FOREIGN KEY ("idMedecin")
      REFERENCES "Medecin" ("idMedecin");

ALTER TABLE "RendezVous"
   ADD CONSTRAINT FK_RENDEZVO_ASSOCIATI_PATIENT FOREIGN KEY ("idPatient")
      REFERENCES "Patient" ("idPatient");

ALTER TABLE "RendezVous"
   ADD CONSTRAINT FK_RENDEZVO_ASSOCIATI_VISITE FOREIGN KEY ("idVisite")
      REFERENCES "Visite" ("idVisite");

ALTER TABLE "Visite"
   ADD CONSTRAINT FK_VISITE_ASSOCIATI_RENDEZVO FOREIGN KEY ("idRendezVous")
      REFERENCES "RendezVous" ("idRendezVous");

ALTER TABLE "Visite"
   ADD CONSTRAINT FK_VISITE_ASSOCIATI_ORDONNAN FOREIGN KEY ("idOrdonnance")
      REFERENCES "Ordonnance" ("idOrdonnance");

ALTER TABLE "Visite"
   ADD CONSTRAINT FK_VISITE_ASSOCIATI_FACTURE FOREIGN KEY ("idFacture")
      REFERENCES "Facture" ("idFacture");

-- URL            : miageprojet2.unice.fr
-- Project        : Gestion d'un cabinet médical
-- Author         : Marouane
-- Date           : 20/04/2017
-- Purpose        : Les tablespaces



-- ts_tab_patients_uniform doit contenir le segment 
-- PATIENT

CREATE TABLESPACE ts_tab_patients_uniform
	DATAFILE '%ORACLE_BASE%\oradata\%oracle_sid%\tstab\ts_tab_patients_uniform_1.dbf'
	SIZE 10M
	EXTENT MANAGEMENT LOCAL UNIFORM SIZE 5M
	SEGMENT SPACE MANAGEMENT AUTO;

-- ts_tab_visites_auto doit contenir les segments 
-- VISITE, RENDEZ_VOUS, FACTURE, EXAMEN_CLINIQUE, ORDONNANCE et PRESCRIPTION

CREATE TABLESPACE ts_tab_visites_auto
	DATAFILE '%ORACLE_BASE%\oradata\%oracle_sid%\tstab\ts_tab_visites_auto_1.dbf'
	SIZE 50M
	EXTENT MANAGEMENT LOCAL AUTOALLOCATE
	SEGMENT SPACE MANAGEMENT AUTO;

-- ts_tab_cabinet_medi_auto doit contenir les segments
-- AFFECTATION, MEDECIN et CLINIQUE

CREATE TABLESPACE ts_tab_cabinet_medi_auto
	DATAFILE '%ORACLE_BASE%\oradata\%oracle_sid%\tstab\ts_tab_cabinet_medi_auto_1.dbf'
	SIZE 10M
	EXTENT MANAGEMENT LOCAL AUTOALLOCATE
	SEGMENT SPACE MANAGEMENT AUTO;

-- ts_tab_medicament_uniform doit contenir le segment
-- MEDICAMENT

CREATE TABLESPACE ts_tab_medicament_uniform
	DATAFILE '%ORACLE_BASE%\oradata\%oracle_sid%\tstab\ts_tab_medicament_uniform_1.dbf'
	SIZE 5M
	EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1M
	SEGMENT SPACE MANAGEMENT AUTO;

-- ts_ind_cabinet_medi_auto doit contenir le segment d’indexes

CREATE TABLESPACE ts_ind_cabinet_medi_auto
	DATAFILE '%ORACLE_BASE%\oradata\%oracle_sid%\tstab\ts_ind_cabinet_medi_auto_1.dbf'
	SIZE 5M
	EXTENT MANAGEMENT LOCAL AUTOALLOCATE
	SEGMENT SPACE MANAGEMENT AUTO;

-- ts_tmp_cabinet_medi_auto doit contenir les segments temporaires

CREATE TEMPORARY tablespace ts_tmp_cabinet_medi
	DATAFILE '%ORACLE_BASE%\oradata\%oracle_sid%\tstab\ts_tmp_cabinet_medi_auto_1.dbf'
	SIZE 20M
	AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED;

-- definir comme tablespace tomporaire de la base de donnees
ALTER DATABASE DEFAULT TEMPORARY TABLESPACE ts_tmp_cabinet_medi;

/*=========================================================================================*/
/* Notre base de données est fin prête à recevoir les données du fichier Data Pump (.dmp). */
/* Il suffit pour cela exécuter un ensemble de commandes tels que                          */
/*=========================================================================================*/

/*==============================================================*/
/* Connectez vous depuis l’invite de commande Windows à la      */
/* console SQLPlus                                              */
/*==============================================================*/
sqlplus /as sysdba

/* ---> Resultat
ConnectÚ.
*/


/*==============================================================*/
/*  Monter la base                                              */
/*==============================================================*/
startup

/* ---> Resultat
ORA-01081: impossible de lancer ORACLE dÚjÓ en cours - fermer d'abord le thread
*/

/*==============================================================*/
/* Arrêter la base de données                                   */
/*==============================================================*/
disc dba_directories

/* ---> Resultat

/*==============================================================*/
/* sortir de sql                                                */
/*==============================================================*/
ho

/* ---> Resultat
Microsoft Windows [version 10.0.14393]
(c) 2016 Microsoft Corporation. Tous droits réservés.

C:\Users\Nordine Bouchti>
*/

/*==============================================================*/
/* creer le repertoire data_pump                                   */
/*==============================================================*/
mkdir F:\oracle\oradata\orcl\data_pump

/* ---> Resultat
RÚpertoire crÚÚ.
*/

/*==============================================================*/
/* Exit                                                         */
/*==============================================================*/
exit

/* ---> Resultat
SQL>*/

/*==============================================================*/
/* creer le diroctory dpdire                                 */
/*==============================================================*/
create diroctory dpdire as 'F:\oracle\oradata\orcl\data_pump';

/* ---> Resultat
RÚpertoire crÚÚ.
*/

/*==============================================================*/
/* Donner des droits                                               */
/*==============================================================*/
grant read, write on directory dbdire to scott, system;

/* ---> Resultat
Autorisation de privilÞges (GRANT) acceptÚe.
*/

/*==============================================================*/
/* Donner des droits                                               */
/*==============================================================*/
grant exp_full_database, imp_full_database to scott, system;

/* ---> Resultat
Autorisation de privilÞges (GRANT) acceptÚe.
*/


/*==============================================================*/
/* sortie de sql                                                */
/*==============================================================*/
ho

/* ---> Resultat
Microsoft Windows [version 10.0.14393]
(c) 2016 Microsoft Corporation. Tous droits réservés.

C:\Users\Nordine Bouchti>
*/

/*==============================================================*/
/* La commande de l’export Data Pump des tables                 */
/*==============================================================*/
expdp scott/tiger tables=emp, dept directory=dpdire dumpfile=emp_dept.emp filelog=emp_dept.log

/* ---> Resultat
ConnectÚ Ó : Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options
DÚmarrage de "SCOTT"."SYS_EXPORT_TABLE_01" : scott/******** tables=emp, dept directory=dpdire dumpfile=emp_dept.emp logfile=emp_dept.log
Estimation en cours Ó l'aide de la mÚthode BLOCKS ...
Traitement du type d'objet TABLE_EXPORT/TABLE/TABLE_DATA
Estimation totale Ó l'aide le la mÚthode BLOCKS : 64 KB
Traitement du type d'objet TABLE_EXPORT/TABLE/TABLE
Traitement du type d'objet TABLE_EXPORT/TABLE/INDEX/INDEX
Traitement du type d'objet TABLE_EXPORT/TABLE/CONSTRAINT/CONSTRAINT
Traitement du type d'objet TABLE_EXPORT/TABLE/INDEX/STATISTICS/INDEX_STATISTICS
Traitement du type d'objet TABLE_EXPORT/TABLE/STATISTICS/TABLE_STATISTICS
. . export : "SCOTT"."DEPT"                              5.937 KB       4 lignes
ORA-39166: L'objet SCOTT.EMP est introuvable.
Table ma¯tre "SCOTT"."SYS_EXPORT_TABLE_01" chargÚe/dÚchargÚe avec succÞs
******************************************************************************
L'ensemble de fichiers de vidage de SCOTT.SYS_EXPORT_TABLE_01 est :
  F:\ORACLE\ORADATA\ORCL\EMP_DEPT.EMP
Travail "SCOTT"."SYS_EXPORT_TABLE_01" terminÚ avec 1 erreur(s) Ó 21:41:47
*/

/*==============================================================*/
/* Exit                                                         */
/*==============================================================*/
exit

/* ---> Resultat

/*==============================================================*/
/* supprimer les tables                                         */
/*==============================================================*/
drop table scott.dept purge;
drop table scott.emp purge;

/* ---> Resultat
Table supprimÚe.
Table supprimÚe.
*/

select * from scott.emp;

/* ---> Resultat
select * from scott.emp
                 *
ERREUR Ó la ligne 1 :
ORA-00942: Table ou vue inexistante
*/

/*==============================================================*/
/* sortie de sql                                                */
/*==============================================================*/
ho 

/* ---> Resultat

/*==============================================================*/
/* La commande de l’import Data Pump des tables                 */
/*==============================================================*/
impdp tables=dept, emp directory=dpdire dumpfile=emp_dept.emp logfile=emp_dept.log

/* ---> Resultat
Import: Release 11.2.0.1.0 - Production on Jeu. Mai 4 21:52:11 2017

Copyright (c) 1982, 2009, Oracle and/or its affiliates.  All rights reserved.

Nom utilisateur : scott
Mot de passe :

ConnectÚ Ó : Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options
Table ma¯tre "SCOTT"."SYS_IMPORT_TABLE_01" chargÚe/dÚchargÚe avec succÞs
DÚmarrage de "SCOTT"."SYS_IMPORT_TABLE_01" : scott/******** tables=dept directory=dpdire dumpfile=emp_dept.emp logfile=emp_dept.log
Traitement du type d'objet TABLE_EXPORT/TABLE/TABLE
Traitement du type d'objet TABLE_EXPORT/TABLE/TABLE_DATA
. . import : "SCOTT"."DEPT"                              5.937 KB       4 lignes
Traitement du type d'objet TABLE_EXPORT/TABLE/INDEX/INDEX
Traitement du type d'objet TABLE_EXPORT/TABLE/CONSTRAINT/CONSTRAINT
Traitement du type d'objet TABLE_EXPORT/TABLE/INDEX/STATISTICS/INDEX_STATISTICS
Traitement du type d'objet TABLE_EXPORT/TABLE/STATISTICS/TABLE_STATISTICS
L'exÚcution du travail "SCOTT"."SYS_IMPORT_TABLE_01" a abouti Ó 21:52:21
*/

/*==============================================================*/
/* Exit                                                         */
/*==============================================================*/
exit

/* ---> Resultat

/*==============================================================*/
/* selectionner pour la vérification                                */
/*==============================================================*/
select * from scott.emp;

/* ---> Resultat
   DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON
*/

/*==============================================================*/
/* sortir de sql                                                */
/*==============================================================*/
ho

/* ---> Resultat

/*==============================================================*/
/* La commande de l’export Data Pump de shemas                  */
/*==============================================================*/
expdp schemas=scott.hr directory=dpdire dumpfile=scott_hr.dmp logfile=scott_hr.log

/* ---> Resultat
Export: Release 11.2.0.1.0 - Production on Jeu. Mai 4 21:55:18 2017

Copyright (c) 1982, 2009, Oracle and/or its affiliates.  All rights reserved.

Nom utilisateur : scott
Mot de passe :

ConnectÚ Ó : Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options
DÚmarrage de "SCOTT"."SYS_EXPORT_SCHEMA_01" : scott/******** schemas=scott.hr directory=dpdire dumpfile=scott_hr.dmp logfile=scott_hr.log
Estimation en cours Ó l'aide de la mÚthode BLOCKS ...
Traitement du type d'objet SCHEMA_EXPORT/TABLE/TABLE_DATA
Estimation totale Ó l'aide le la mÚthode BLOCKS : 128 KB
Traitement du type d'objet SCHEMA_EXPORT/USER
Traitement du type d'objet SCHEMA_EXPORT/SYSTEM_GRANT
Traitement du type d'objet SCHEMA_EXPORT/ROLE_GRANT
Traitement du type d'objet SCHEMA_EXPORT/DEFAULT_ROLE
Traitement du type d'objet SCHEMA_EXPORT/PRE_SCHEMA/PROCACT_SCHEMA
Traitement du type d'objet SCHEMA_EXPORT/TABLE/TABLE
Traitement du type d'objet SCHEMA_EXPORT/TABLE/INDEX/INDEX
Traitement du type d'objet SCHEMA_EXPORT/TABLE/CONSTRAINT/CONSTRAINT
Traitement du type d'objet SCHEMA_EXPORT/TABLE/INDEX/STATISTICS/INDEX_STATISTICS
Traitement du type d'objet SCHEMA_EXPORT/TABLE/COMMENT
Traitement du type d'objet SCHEMA_EXPORT/TABLE/STATISTICS/TABLE_STATISTICS
. . export : "SCOTT"."DEPT"                              5.937 KB       4 lignes
. . export : "SCOTT"."SALGRADE"                          5.867 KB       5 lignes
. . export : "SCOTT"."BONUS"                                 0 KB       0 lignes
Table ma¯tre "SCOTT"."SYS_EXPORT_SCHEMA_01" chargÚe/dÚchargÚe avec succÞs
******************************************************************************
L'ensemble de fichiers de vidage de SCOTT.SYS_EXPORT_SCHEMA_01 est :
  F:\ORACLE\ORADATA\ORCL\SCOTT_HR.DMP
L'exÚcution du travail "SCOTT"."SYS_EXPORT_SCHEMA_01" a abouti Ó 21:56:47
*/


/*==============================================================*/
/* La commande de l’export Data Pump de toute la base avec         */
/* l’argument FULL=Y                                            */
/*==============================================================*/
expdp full=y directory=dpdire dumpfile=full_db.dmp logfile=dumpfile_db.log

/* ---> Resultat
Export: Release 11.2.0.1.0 - Production on Jeu. Mai 4 21:58:38 2017

Copyright (c) 1982, 2009, Oracle and/or its affiliates.  All rights reserved.

Nom utilisateur : scott
Mot de passe :

ConnectÚ Ó : Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options
DÚmarrage de "SCOTT"."SYS_EXPORT_FULL_01" : scott/******** full=y directory=dpdire dumpfile=full_db.dmp logfile=dumpfile_db.log
Estimation en cours Ó l'aide de la mÚthode BLOCKS ...
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/TABLE_DATA
Estimation totale Ó l'aide le la mÚthode BLOCKS : 125.0 MB
Traitement du type d'objet DATABASE_EXPORT/TABLESPACE
Traitement du type d'objet DATABASE_EXPORT/PROFILE
Traitement du type d'objet DATABASE_EXPORT/SYS_USER/USER
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/USER
Traitement du type d'objet DATABASE_EXPORT/ROLE
Traitement du type d'objet DATABASE_EXPORT/GRANT/SYSTEM_GRANT/PROC_SYSTEM_GRANT
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/GRANT/SYSTEM_GRANT
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/ROLE_GRANT
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/DEFAULT_ROLE
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLESPACE_QUOTA
Traitement du type d'objet DATABASE_EXPORT/RESOURCE_COST
Traitement du type d'objet DATABASE_EXPORT/TRUSTED_DB_LINK
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/SEQUENCE/SEQUENCE
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/SEQUENCE/GRANT/OWNER_GRANT/OBJECT_GRANT
Traitement du type d'objet DATABASE_EXPORT/DIRECTORY/DIRECTORY
Traitement du type d'objet DATABASE_EXPORT/DIRECTORY/GRANT/OWNER_GRANT/OBJECT_GRANT
Traitement du type d'objet DATABASE_EXPORT/CONTEXT
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/PUBLIC_SYNONYM/SYNONYM
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/SYNONYM
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TYPE/INC_TYPE
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TYPE/TYPE_SPEC
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TYPE/GRANT/OWNER_GRANT/OBJECT_GRANT
Traitement du type d'objet DATABASE_EXPORT/SYSTEM_PROCOBJACT/PRE_SYSTEM_ACTIONS/PROCACT_SYSTEM
Traitement du type d'objet DATABASE_EXPORT/SYSTEM_PROCOBJACT/PROCOBJ
Traitement du type d'objet DATABASE_EXPORT/SYSTEM_PROCOBJACT/POST_SYSTEM_ACTIONS/PROCACT_SYSTEM
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/PROCACT_SCHEMA
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/XMLSCHEMA/XMLSCHEMA
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/TABLE
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/PRE_TABLE_ACTION
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/GRANT/OWNER_GRANT/OBJECT_GRANT
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/INDEX/INDEX
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/CONSTRAINT/CONSTRAINT
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/INDEX/STATISTICS/INDEX_STATISTICS
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/COMMENT
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/PACKAGE/PACKAGE_SPEC
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/PACKAGE/GRANT/OWNER_GRANT/OBJECT_GRANT
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/FUNCTION/FUNCTION
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/FUNCTION/GRANT/OWNER_GRANT/OBJECT_GRANT
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/PROCEDURE/PROCEDURE
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/PROCEDURE/GRANT/OWNER_GRANT/OBJECT_GRANT
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/FUNCTION/ALTER_FUNCTION
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/PROCEDURE/ALTER_PROCEDURE
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/VIEW/VIEW
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/VIEW/GRANT/OWNER_GRANT/OBJECT_GRANT
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/VIEW/COMMENT
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/CONSTRAINT/REF_CONSTRAINT
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/PACKAGE_BODIES/PACKAGE/PACKAGE_BODY
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TYPE/TYPE_BODY
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/INDEX/FUNCTIONAL_AND_BITMAP/INDEX
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/INDEX/STATISTICS/FUNCTIONAL_AND_BITMAP/INDEX_STATISTICS
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/STATISTICS/TABLE_STATISTICS
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/INDEX/DOMAIN_INDEX/INDEX
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/POST_TABLE_ACTION
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/TRIGGER
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/VIEW/TRIGGER
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/EVENT/TRIGGER
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/MATERIALIZED_VIEW
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/JOB
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/DIMENSION
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/POST_INSTANCE/PROCACT_INSTANCE
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/TABLE/POST_INSTANCE/PROCDEPOBJ
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/POST_SCHEMA/PROCOBJ
Traitement du type d'objet DATABASE_EXPORT/SCHEMA/POST_SCHEMA/PROCACT_SCHEMA
Traitement du type d'objet DATABASE_EXPORT/AUDIT
. . export : "SH"."CUSTOMERS"                            9.853 MB   55500 lignes
. . export : "PM"."ONLINE_MEDIA"                         7.752 MB       9 lignes
. . export : "APEX_030200"."WWV_FLOW_PAGE_PLUGS"         3.835 MB    7417 lignes
. . export : "APEX_030200"."WWV_FLOW_STEP_ITEMS"         3.505 MB    9673 lignes
. . export : "SYSMAN"."MGMT_MESSAGES"                    4.154 MB   23311 lignes
. . export : "APEX_030200"."WWV_FLOW_DICTIONARY$"        2.909 MB   70601 lignes
. . export : "SH"."SUPPLEMENTARY_DEMOGRAPHICS"           697.3 KB    4500 lignes
. . export : "OE"."PRODUCT_DESCRIPTIONS"                 2.379 MB    8640 lignes
. . export : "APEX_030200"."WWV_FLOW_STEP_PROCESSING"    1.248 MB    2239 lignes
. . export : "APEX_030200"."WWV_FLOW_REGION_REPORT_COLUMN"  1.148 MB    7918 lignes
. . export : "APEX_030200"."WWV_FLOW_STEP_ITEM_HELP"     1003. KB    6335 lignes
. . export : "SH"."SALES":"SALES_Q4_2001"                2.257 MB   69749 lignes
. . export : "SYSMAN"."MGMT_METRICS"                     3.235 MB   12796 lignes
. . export : "SYSMAN"."MGMT_METRICS_RAW"                 935.0 KB   12937 lignes
. . export : "SYSMAN"."MGMT_SWLIB_ENTITY_DOCUMENTS"      680.5 KB     364 lignes
. . export : "APEX_030200"."WWV_FLOW_STEPS"              571.0 KB    1755 lignes
. . export : "SH"."SALES":"SALES_Q1_1999"                2.071 MB   64186 lignes
. . export : "SH"."SALES":"SALES_Q3_2001"                2.130 MB   65769 lignes
. . export : "SH"."SALES":"SALES_Q1_2000"                2.012 MB   62197 lignes
. . export : "SH"."SALES":"SALES_Q1_2001"                1.965 MB   60608 lignes
. . export : "SH"."SALES":"SALES_Q2_2001"                2.051 MB   63292 lignes
. . export : "SH"."SALES":"SALES_Q3_1999"                2.166 MB   67138 lignes
. . export : "SH"."SALES":"SALES_Q4_1999"                2.014 MB   62388 lignes
. . export : "SH"."SALES":"SALES_Q2_2000"                1.802 MB   55515 lignes
. . export : "SH"."SALES":"SALES_Q3_2000"                1.909 MB   58950 lignes
. . export : "SH"."SALES":"SALES_Q4_1998"                1.581 MB   48874 lignes
. . export : "SH"."SALES":"SALES_Q4_2000"                1.814 MB   55984 lignes
. . export : "SYSMAN"."MGMT_IP_REPORT_ELEM_PARAMS"       513.5 KB    2167 lignes
. . export : "SH"."SALES":"SALES_Q2_1999"                1.754 MB   54233 lignes
. . export : "APEX_030200"."WWV_FLOW_LIST_ITEMS"         590.3 KB    3048 lignes
. . export : "APEX_030200"."WWV_FLOW_STEP_VALIDATIONS"   611.4 KB    1990 lignes
. . export : "SH"."SALES":"SALES_Q1_1998"                1.412 MB   43687 lignes
. . export : "SH"."SALES":"SALES_Q3_1998"                1.633 MB   50515 lignes
. . export : "SYSMAN"."MGMT_JOB_STEP_PARAMS"             490.3 KB    5277 lignes
. . export : "APEX_030200"."WWV_FLOW_LIST_TEMPLATES"     73.32 KB     105 lignes
. . export : "APEX_030200"."WWV_FLOW_STEP_BRANCHES"      508.6 KB    3255 lignes
. . export : "APEX_030200"."WWV_FLOW_STEP_BUTTONS"       472.4 KB    3513 lignes
. . export : "ORDDATA"."ORDDCM_DOCS"                     445.5 KB       9 lignes
. . export : "PM"."PRINT_MEDIA"                          187.8 KB       4 lignes
. . export : "SH"."SALES":"SALES_Q2_1998"                1.160 MB   35758 lignes
. . export : "SH"."FWEEK_PSCAT_SALES_MV"                 419.8 KB   11266 lignes
. . export : "SYSMAN"."MGMT_ESA_REPORT"                  447.3 KB    6128 lignes
. . export : "SYSMAN"."MGMT_POLICIES"                    720.3 KB    3302 lignes
. . export : "APEX_030200"."WWV_FLOW_LIST_OF_VALUES_DATA"  392.1 KB    4184 lignes
. . export : "SH"."PROMOTIONS"                           58.89 KB     503 lignes
. . export : "SH"."TIMES"                                380.8 KB    1826 lignes
. . export : "SYSMAN"."MGMT_METRICS_1HOUR"               486.6 KB    5803 lignes
. . export : "APEX_030200"."WWV_FLOW_MESSAGES$"          348.4 KB    3706 lignes
. . export : "APEX_030200"."WWV_FLOW_TEMPLATES"          180.6 KB      64 lignes
. . export : "APEX_030200"."WWV_FLOW_CUSTOM_AUTH_SETUPS"  20.92 KB      11 lignes
. . export : "APEX_030200"."WWV_FLOW_PAGE_PLUG_TEMPLATES"  98.99 KB     166 lignes
. . export : "APEX_030200"."WWV_FLOW_ROW_TEMPLATES"      73.27 KB      54 lignes
. . export : "APEX_030200"."WWV_FLOW_STEP_COMPUTATIONS"  258.3 KB     984 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEETS"         141.6 KB      30 lignes
. . export : "SYSMAN"."MGMT_JOB_CRED_PARAMS"             33.72 KB     101 lignes
. . export : "APEX_030200"."WWV_FLOW_LISTS_OF_VALUES$"   207.8 KB     959 lignes
. . export : "SYSMAN"."MGMT_JOB_EXECPLAN"                251.8 KB    1849 lignes
. . export : "SYSMAN"."MGMT_SEC_INFO"                    8.304 KB       1 lignes
. . export : "SYSMAN"."MGMT_VIOLATIONS"                  248.0 KB     903 lignes
. . export : "APEX_030200"."WWV_FLOW_MENU_OPTIONS"       170.1 KB    1452 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_COLUMNS"  185.7 KB     721 lignes
. . export : "OE"."CUSTOMERS"                            77.98 KB     319 lignes
. . export : "OE"."WAREHOUSES"                           12.46 KB       9 lignes
. . export : "ORDDATA"."ORDDCM_STD_ATTRS"                188.8 KB    2415 lignes
. . export : "SH"."COSTS":"COSTS_Q4_2001"                278.4 KB    9011 lignes
. . export : "SYSMAN"."MGMT_CURRENT_METRICS"             29.53 KB     320 lignes
. . export : "SYSMAN"."MGMT_DB_INIT_PARAMS_ECM"          99.50 KB    1709 lignes
. . export : "SYSMAN"."MGMT_JOB_PARAM_SOURCE"            96.19 KB     652 lignes
. . export : "SYSMAN"."MGMT_JOB_PROP_PARAMS"             10.85 KB      25 lignes
. . export : "SYSMAN"."MGMT_POLICY_ASSOC"                91.35 KB    1118 lignes
. . export : "SYSMAN"."MGMT_POLICY_ASSOC_CFG"            156.4 KB    1170 lignes
. . export : "APEX_030200"."WWV_FLOW_RANDOM_IMAGES"      50.38 KB      42 lignes
. . export : "PM"."TEXTDOCS_NESTEDTAB"                   87.73 KB      12 lignes
. . export : "SH"."COSTS":"COSTS_Q1_1999"                183.5 KB    5884 lignes
. . export : "SH"."COSTS":"COSTS_Q1_2001"                227.8 KB    7328 lignes
. . export : "SH"."COSTS":"COSTS_Q2_2001"                184.5 KB    5882 lignes
. . export : "SH"."COSTS":"COSTS_Q3_2001"                234.4 KB    7545 lignes
. . export : "SYSMAN"."MGMT_COLLECTIONS"                 32.67 KB     202 lignes
. . export : "SYSMAN"."MGMT_COLLECTION_TASKS"            20.51 KB      28 lignes
. . export : "SYSMAN"."MGMT_ECM_MD_ALL_TBL_COLUMNS"      109.9 KB     702 lignes
. . export : "SYSMAN"."MGMT_INV_COMPONENT"               108.7 KB     576 lignes
. . export : "SYSMAN"."MGMT_IP_SQL_STATEMENTS"           64.57 KB      31 lignes
. . export : "SYSMAN"."MGMT_JOB_SCHEDULE"                11.18 KB       3 lignes
. . export : "SYSMAN"."MGMT_JOB_SEC_INFO"                9.484 KB      12 lignes
. . export : "SYSMAN"."MGMT_JOB_USER_PARAMS"             7.515 KB      15 lignes
. . export : "SYSMAN"."MGMT_SYSTEM_PERFORMANCE_LOG"      62.08 KB     778 lignes
. . export : "APEX_030200"."WWV_FLOW_BANNER"             9.320 KB      10 lignes
. . export : "APEX_030200"."WWV_FLOW_BUTTON_TEMPLATES"   15.21 KB      12 lignes
. . export : "APEX_030200"."WWV_FLOW_FLASH_CHARTS"       30.06 KB       5 lignes
. . export : "APEX_030200"."WWV_FLOW_FLASH_CHART_SERIES"  13.79 KB       5 lignes
. . export : "APEX_030200"."WWV_FLOW_INSTALL"            36.28 KB       2 lignes
. . export : "APEX_030200"."WWV_FLOW_LISTS"              51.75 KB     601 lignes
. . export : "APEX_030200"."WWV_FLOW_PAGE_GENERIC_ATTR"  8.382 KB      44 lignes
. . export : "APEX_030200"."WWV_FLOW_PROCESSING"         45.50 KB      45 lignes
. . export : "APEX_030200"."WWV_FLOW_SHORTCUTS"          26.61 KB      39 lignes
. . export : "APEX_030200"."WWV_FLOW_THEMES"             20.89 KB      10 lignes
. . export : "OE"."PRODUCT_INFORMATION"                  72.77 KB     288 lignes
. . export : "ORDDATA"."ORDDCM_CT_PRED_OPRD"             13.16 KB      51 lignes
. . export : "ORDDATA"."ORDDCM_MAPPING_DOCS"             9.484 KB       1 lignes
. . export : "SH"."COSTS":"COSTS_Q1_1998"                139.5 KB    4411 lignes
. . export : "SH"."COSTS":"COSTS_Q1_2000"                120.6 KB    3772 lignes
. . export : "SH"."COSTS":"COSTS_Q2_1998"                79.53 KB    2397 lignes
. . export : "SH"."COSTS":"COSTS_Q2_1999"                132.6 KB    4179 lignes
. . export : "SH"."COSTS":"COSTS_Q2_2000"                119.0 KB    3715 lignes
. . export : "SH"."COSTS":"COSTS_Q3_1998"                131.1 KB    4129 lignes
. . export : "SH"."COSTS":"COSTS_Q3_1999"                137.3 KB    4336 lignes
. . export : "SH"."COSTS":"COSTS_Q3_2000"                151.4 KB    4798 lignes
. . export : "SH"."COSTS":"COSTS_Q4_1998"                144.7 KB    4577 lignes
. . export : "SH"."COSTS":"COSTS_Q4_1999"                159.0 KB    5060 lignes
. . export : "SH"."COSTS":"COSTS_Q4_2000"                160.2 KB    5088 lignes
. . export : "SYSMAN"."ESM_COLLECTION"                   51.92 KB     616 lignes
. . export : "SYSMAN"."MGMT_AGENT_SEC_INFO"              7.968 KB       1 lignes
. . export : "SYSMAN"."MGMT_ARU_PRODUCT_RELEASE_MAP"     84.80 KB    5956 lignes
. . export : "SYSMAN"."MGMT_CATEGORY_MAP"                46.47 KB     637 lignes
. . export : "SYSMAN"."MGMT_COLL_ITEMS"                  24.57 KB     254 lignes
. . export : "SYSMAN"."MGMT_CURRENT_VIOLATION"           98.70 KB     174 lignes
. . export : "SYSMAN"."MGMT_ECM_SNAPSHOT_MD_COLUMNS"     87.02 KB     837 lignes
. . export : "SYSMAN"."MGMT_INV_DEPENDENCY_RULE"         43.25 KB    1008 lignes
. . export : "SYSMAN"."MGMT_IP_ELEM_DEFAULT_PARAMS"      31.75 KB     130 lignes
. . export : "SYSMAN"."MGMT_IP_REPORT_DEF_ELEMENTS"      44.35 KB     349 lignes
. . export : "SYSMAN"."MGMT_JOB_COMMAND_BLOCK_PROCS"     5.921 KB       3 lignes
. . export : "SYSMAN"."MGMT_JOB_LARGE_PARAMS"            5.937 KB       2 lignes
. . export : "SYSMAN"."MGMT_JOB_OUTPUT"                  8.929 KB       8 lignes
. . export : "SYSMAN"."MGMT_JOB_PARAMETER"               9.304 KB       8 lignes
. . export : "SYSMAN"."MGMT_JOB_SQL_PARAMS"              6.937 KB      10 lignes
. . export : "SYSMAN"."MGMT_JOB_SUBST_PARAMS"            7.125 KB      24 lignes
. . export : "SYSMAN"."PARAM_VALUES_TAB"                 25.12 KB     308 lignes
. . export : "SYSMAN"."MGMT_LAST_VIOLATION"              55.70 KB     750 lignes
. . export : "SYSMAN"."MGMT_LICENSE_DEFINITIONS"         54.66 KB      59 lignes
. . export : "SYSMAN"."MGMT_METRICS_1DAY"                62.46 KB     621 lignes
. . export : "SYSMAN"."MGMT_PAF_TEXTUAL_DATA"            42.50 KB       7 lignes
. . export : "SYSMAN"."MGMT_POLICY_ASSOC_CFG_PARAMS"     61.64 KB     713 lignes
. . export : "SYSMAN"."MGMT_POLICY_ASSOC_EVAL_DETAILS"   52.63 KB     476 lignes
. . export : "SYSMAN"."MGMT_POLICY_VIOL_CTXT_DEF"        68.09 KB     642 lignes
. . export : "SYSMAN"."MGMT_STRING_METRIC_HISTORY"       69.99 KB     427 lignes
. . export : "SYSMAN"."MGMT_SWLIB_ENTITIES"              46.03 KB     180 lignes
. . export : "SYSMAN"."MGMT_SWLIB_ENTITY_DATA"           32.77 KB     150 lignes
. . export : "SYSMAN"."MGMT_SWLIB_REVISION_PARAMETERS"   54.92 KB     728 lignes
. . export : "SYSMAN"."MGMT_TASK_QTABLE"                 21.73 KB      28 lignes
. . export : "APEX_030200"."WWV_COLUMN_EXCEPTIONS"       5.976 KB       3 lignes
. . export : "APEX_030200"."WWV_FLOW_ACTIVITY_LOG_NUMBER$"  5.476 KB       1 lignes
. . export : "APEX_030200"."WWV_FLOW_ALT_CONFIG_PICK"    8.210 KB      37 lignes
. . export : "APEX_030200"."WWV_FLOW_APPLICATION_GROUPS"  7.968 KB       1 lignes
. . export : "APEX_030200"."WWV_FLOW_CALS"               18.86 KB      11 lignes
. . export : "APEX_030200"."WWV_FLOW_CAL_TEMPLATES"      38.88 KB       9 lignes
. . export : "APEX_030200"."WWV_FLOW_CHARSETS"           7.789 KB      32 lignes
. . export : "APEX_030200"."WWV_FLOW_CLICKTHRU_LOG_NUMBER$"  5.890 KB       1 lignes
. . export : "APEX_030200"."WWV_FLOW_COMPANIES"          8.843 KB       3 lignes
. . export : "APEX_030200"."WWV_FLOW_COMPANY_SCHEMAS"    6.281 KB       1 lignes
. . export : "APEX_030200"."WWV_FLOW_COMPANY_TYPES"      6.593 KB      32 lignes
. . export : "APEX_030200"."WWV_FLOW_COMPUTATIONS"       14.92 KB      14 lignes
. . export : "APEX_030200"."WWV_FLOW_COUNTRIES"          9.828 KB     240 lignes
. . export : "APEX_030200"."WWV_FLOW_DB_AUTH"            5.460 KB       1 lignes
. . export : "APEX_030200"."WWV_FLOW_DEVELOPER_ROLES"    5.921 KB       9 lignes
. . export : "APEX_030200"."WWV_FLOW_DUAL100"            5.703 KB     100 lignes
. . export : "APEX_030200"."WWV_FLOW_FIELD_TEMPLATES"    19.31 KB      36 lignes
. . export : "APEX_030200"."WWV_FLOW_FND_USER"           23.81 KB       1 lignes
. . export : "APEX_030200"."WWV_FLOW_HNT_COLUMN_INFO"    23.55 KB      58 lignes
. . export : "APEX_030200"."WWV_FLOW_HNT_TABLE_INFO"     9.382 KB       8 lignes
. . export : "APEX_030200"."WWV_FLOW_ICON_BAR"           19.25 KB      12 lignes
. . export : "APEX_030200"."WWV_FLOW_ITEMS"              15.34 KB      89 lignes
. . export : "APEX_030200"."WWV_FLOW_LANGUAGE_MAP"       15.28 KB      90 lignes
. . export : "APEX_030200"."WWV_FLOW_LANGUAGES"          16.15 KB     132 lignes
. . export : "APEX_030200"."WWV_FLOW_LOV_VALUES"         8.867 KB       6 lignes
. . export : "APEX_030200"."WWV_FLOW_MENUS"              7.718 KB       7 lignes
. . export : "APEX_030200"."WWV_FLOW_MENU_TEMPLATES"     14.14 KB       8 lignes
. . export : "APEX_030200"."WWV_FLOW_PAGE_GROUPS"        14.28 KB     105 lignes
. . export : "APEX_030200"."WWV_FLOW_PASSWORD_HISTORY"   6.679 KB       1 lignes
. . export : "APEX_030200"."WWV_FLOW_PATCHES"            10.69 KB       9 lignes
. . export : "APEX_030200"."WWV_FLOW_PICK_END_USERS"     6.023 KB       4 lignes
. . export : "APEX_030200"."WWV_FLOW_PICK_PAGE_VIEWS"    6.093 KB       5 lignes
. . export : "APEX_030200"."WWV_FLOW_PLATFORM_PREFS"     9.015 KB      21 lignes
. . export : "APEX_030200"."WWV_FLOW_POPUP_LOV_TEMPLATE"  32.23 KB      10 lignes
. . export : "APEX_030200"."WWV_FLOW_QUERY_COLUMN"       9.929 KB      18 lignes
. . export : "APEX_030200"."WWV_FLOW_QUERY_CONDITION"    9.609 KB       6 lignes
. . export : "APEX_030200"."WWV_FLOW_QUERY_DEFINITION"   7.648 KB       6 lignes
. . export : "APEX_030200"."WWV_FLOW_QUERY_OBJECT"       8.304 KB       6 lignes
. . export : "APEX_030200"."WWV_FLOW_REGION_UPD_RPT_COLS"  36.80 KB     439 lignes
. . export : "APEX_030200"."WWV_FLOW_RESTRICTED_SCHEMAS"  8.242 KB      46 lignes
. . export : "APEX_030200"."WWV_FLOWS"                   59.71 KB      10 lignes
. . export : "APEX_030200"."WWV_FLOW_SECURITY_SCHEMES"   15.28 KB      19 lignes
. . export : "APEX_030200"."WWV_FLOW_STANDARD_CSS"       9.742 KB      27 lignes
. . export : "APEX_030200"."WWV_FLOW_STANDARD_ICONS"     16.91 KB     319 lignes
. . export : "APEX_030200"."WWV_FLOW_STANDARD_JS"        7.203 KB       2 lignes
. . export : "APEX_030200"."WWV_FLOW_SW_CREATE_KEYWORDS"  6.875 KB      10 lignes
. . export : "APEX_030200"."WWV_FLOW_SW_MAIN_KEYWORDS"   10.85 KB     199 lignes
. . export : "APEX_030200"."WWV_FLOW_SW_SET_KEYWORDS"    6.757 KB       4 lignes
. . export : "APEX_030200"."WWV_FLOW_SW_SQLPLUS_CMD"     5.101 KB       8 lignes
. . export : "APEX_030200"."WWV_FLOW_TABS"               13.53 KB       3 lignes
. . export : "APEX_030200"."WWV_FLOW_TOPLEVEL_TABS"      13.18 KB       5 lignes
. . export : "APEX_030200"."WWV_FLOW_TRANSLATABLE_COLS$"  29.55 KB     232 lignes
. . export : "APEX_030200"."WWV_FLOW_TREES"              25.80 KB       3 lignes
. . export : "APEX_030200"."WWV_FLOW_UPGRADE_PROGRESS"   21.89 KB      89 lignes
. . export : "APEX_030200"."WWV_FLOW_UPG_TAB_NAME_CHANGES"  8.781 KB      42 lignes
. . export : "APEX_030200"."WWV_FLOW_UPG_TAB_OBSOLETE"   6.476 KB      17 lignes
. . export : "APEX_030200"."WWV_FLOW_USER_ACCESS_LOG_NUM$"  5.890 KB       1 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_RPTS"     37.01 KB      30 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSPACE_REQ_SIZE"  6.859 KB      14 lignes
. . export : "APEX_030200"."WWV_MIG_EXPORTER"            7.382 KB       5 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_OLB_XMLTAGTABLEMAP"  11.29 KB      45 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_XMLTAGTABLEMAP"  10.55 KB      36 lignes
. . export : "APEX_030200"."WWV_MIG_MENU_XMLTAGTABLEMAP"  8.710 KB       7 lignes
. . export : "APEX_030200"."WWV_MIG_RESERVED_WORDS"      5.898 KB      87 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_XMLTAGTABLEMAP"  9.140 KB      15 lignes
. . export : "HR"."COUNTRIES"                            6.375 KB      25 lignes
. . export : "HR"."DEPARTMENTS"                          7.015 KB      27 lignes
. . export : "HR"."EMPLOYEES"                            16.81 KB     107 lignes
. . export : "HR"."JOB_HISTORY"                          7.054 KB      10 lignes
. . export : "HR"."JOBS"                                 6.992 KB      19 lignes
. . export : "HR"."LOCATIONS"                            8.273 KB      23 lignes
. . export : "HR"."REGIONS"                              5.484 KB       4 lignes
. . export : "IX"."AQ$_ORDERS_QUEUETABLE_S"              10.92 KB       4 lignes
. . export : "IX"."AQ$_STREAMS_QUEUE_TABLE_S"            11.17 KB       1 lignes
. . export : "OE"."PRODUCT_REF_LIST_NESTEDTAB"           12.51 KB     288 lignes
. . export : "OE"."CATEGORIES_TAB"                       14.16 KB      22 lignes
. . export : "OE"."SUBCATEGORY_REF_LIST_NESTEDTAB"       6.593 KB      21 lignes
. . export : "OE"."INVENTORIES"                          21.67 KB    1112 lignes
. . export : "OE"."ORDER_ITEMS"                          20.88 KB     665 lignes
. . export : "OE"."ORDERS"                               12.39 KB     105 lignes
. . export : "OE"."PROMOTIONS"                           5.507 KB       2 lignes
. . export : "OLAPSYS"."CWM$CLASSIFICATION"              14.29 KB      42 lignes
. . export : "OLAPSYS"."CWM$CLASSIFICATIONENTRY"         19.53 KB      66 lignes
. . export : "OLAPSYS"."CWM$CLASSIFICATIONTYPE"          12.55 KB      15 lignes
. . export : "OLAPSYS"."CWM$CUBE"                        14.51 KB       2 lignes
. . export : "OLAPSYS"."CWM$CUBEDIMENSIONUSE"            14.55 KB       9 lignes
. . export : "OLAPSYS"."CWM$DIMENSION"                   15.22 KB       5 lignes
. . export : "OLAPSYS"."CWM$DIMENSIONATTRIBUTE"          19.00 KB      23 lignes
. . export : "OLAPSYS"."CWM$DOMAIN"                      15.39 KB      21 lignes
. . export : "OLAPSYS"."CWM$FACTLEVELGROUP"              8.484 KB       2 lignes
. . export : "OLAPSYS"."CWM$FACTLEVELUSE"                12.54 KB       9 lignes
. . export : "OLAPSYS"."CWM$FACTTABLEMAP"                11.82 KB       2 lignes
. . export : "OLAPSYS"."CWM$FACTUSE"                     20.91 KB       4 lignes
. . export : "OLAPSYS"."CWM$FUNCTION"                    12.96 KB      14 lignes
. . export : "OLAPSYS"."CWM$FUNCTIONUSE"                 19.64 KB       4 lignes
. . export : "OLAPSYS"."CWM$HIERARCHY"                   12.66 KB       7 lignes
. . export : "OLAPSYS"."CWM$ITEMMAP"                     13.91 KB      59 lignes
. . export : "OLAPSYS"."CWM$ITEMUSE"                     24.67 KB     118 lignes
. . export : "OLAPSYS"."CWM$LEVEL"                       16.92 KB      27 lignes
. . export : "OLAPSYS"."CWM$LEVELATTRIBUTE"              23.64 KB      67 lignes
. . export : "OLAPSYS"."CWM$MEASURE"                     17.13 KB       4 lignes
. . export : "OLAPSYS"."CWM$MEASUREDIMENSIONUSE"         9.890 KB       4 lignes
. . export : "OLAPSYS"."CWM$MODEL"                       12.69 KB       3 lignes
. . export : "OLAPSYS"."CWM$OBJECTTYPE"                  12.82 KB      15 lignes
. . export : "OLAPSYS"."CWM$PARAMETER"                   19.35 KB       5 lignes
. . export : "OLAPSYS"."CWM$PROJECT"                     10.90 KB       3 lignes
. . export : "OLAPSYS"."CWM2$AWCUBELOADPARM"              6.25 KB       1 lignes
. . export : "OLAPSYS"."CWM2$AWCUBELOADTYPE"             5.921 KB       2 lignes
. . export : "OLAPSYS"."CWM2$AWDIMLOADPARM"              6.335 KB       4 lignes
. . export : "OLAPSYS"."CWM2$AWDIMLOADTYPE"              5.937 KB       2 lignes
. . export : "OLAPSYS"."CWM2$MRALL_DESCRIPTORS"          7.085 KB      41 lignes
. . export : "ORDDATA"."ORDDCM_ANON_ACTION_TYPES"        5.492 KB       4 lignes
. . export : "ORDDATA"."ORDDCM_ANON_ATTRS"               8.703 KB      37 lignes
. . export : "ORDDATA"."ORDDCM_ANON_RULES"               6.296 KB       3 lignes
. . export : "ORDDATA"."ORDDCM_ANON_RULE_TYPES"          5.546 KB       3 lignes
. . export : "ORDDATA"."ORDDCM_CT_ACTION"                6.664 KB       7 lignes
. . export : "ORDDATA"."ORDDCM_CT_DAREFS"                6.218 KB      74 lignes
. . export : "ORDDATA"."ORDDCM_CT_LOCATORPATHS"          10.07 KB      95 lignes
. . export : "ORDDATA"."ORDDCM_CT_MACRO_DEP"             5.460 KB       1 lignes
. . export : "ORDDATA"."ORDDCM_CT_MACRO_PAR"             5.484 KB       2 lignes
. . export : "ORDDATA"."ORDDCM_CT_PRED"                  8.328 KB      61 lignes
. . export : "ORDDATA"."ORDDCM_CT_PRED_PAR"              5.945 KB       3 lignes
. . export : "ORDDATA"."ORDDCM_CT_PRED_SET"              8.906 KB       9 lignes
. . export : "ORDDATA"."ORDDCM_DATA_MODEL"               5.867 KB       1 lignes
. . export : "ORDDATA"."ORDDCM_DICT_ATTRS"               33.95 KB    2418 lignes
. . export : "ORDDATA"."ORDDCM_DOC_REFS"                 6.507 KB       7 lignes
. . export : "ORDDATA"."ORDDCM_DOC_TYPES"                6.984 KB       8 lignes
. . export : "ORDDATA"."ORDDCM_INSTALL_DOCS"             6.546 KB       9 lignes
. . export : "ORDDATA"."ORDDCM_INTERNAL_TAGS"            6.218 KB      42 lignes
. . export : "ORDDATA"."ORDDCM_PREFS_DEF_VALUES_TAB"     5.687 KB       7 lignes
. . export : "ORDDATA"."ORDDCM_PREFS_VALID_VALUES_TAB"   6.492 KB      33 lignes
. . export : "ORDDATA"."ORDDCM_PREFS_LOOKUP"             9.703 KB      13 lignes
. . export : "ORDDATA"."ORDDCM_PRV_ATTRS"                9.804 KB       3 lignes
. . export : "ORDDATA"."ORDDCM_RT_PREF_PARAMS"           8.617 KB      13 lignes
. . export : "ORDDATA"."ORDDCM_UID_DEFS"                  33.5 KB     245 lignes
. . export : "ORDDATA"."ORDDCM_VR_DT_MAP"                6.515 KB      32 lignes
. . export : "SCOTT"."DEPT"                              5.937 KB       4 lignes
. . export : "SCOTT"."SALGRADE"                          5.867 KB       5 lignes
. . export : "SH"."CAL_MONTH_SALES_MV"                   6.320 KB      48 lignes
. . export : "SH"."CHANNELS"                             7.257 KB       5 lignes
. . export : "SH"."COUNTRIES"                            10.21 KB      23 lignes
. . export : "SH"."PRODUCTS"                             26.18 KB      72 lignes
. . export : "SYSMAN"."AQ$_MGMT_LOADER_QTABLE_S"         10.81 KB       2 lignes
. . export : "SYSMAN"."AQ$_MGMT_NOTIFY_QTABLE_S"         10.81 KB       2 lignes
. . export : "SYSMAN"."EMDW_TRACE_CONFIG"                7.062 KB       9 lignes
. . export : "SYSMAN"."EM_PAGE_CONDITION_METADATA"       5.640 KB       7 lignes
. . export : "SYSMAN"."EM_PAGE_CUST_METADATA"            6.039 KB       4 lignes
. . export : "SYSMAN"."EUME2E_ASSOCS_LOOKUP"             6.601 KB       9 lignes
. . export : "SYSMAN"."MGMT_ADMIN_LICENSES"              5.296 KB      19 lignes
. . export : "SYSMAN"."MGMT_ALL_TARGET_PROPS"            9.773 KB       5 lignes
. . export : "SYSMAN"."MGMT_ARU_FAMILY_PRODUCT_MAP"      25.85 KB    1660 lignes
. . export : "SYSMAN"."MGMT_ARU_LANGUAGES"               6.164 KB      40 lignes
. . export : "SYSMAN"."MGMT_ARU_OUI_COMPONENTS"          21.34 KB     393 lignes
. . export : "SYSMAN"."MGMT_ARU_PLATFORMS"               9.585 KB      76 lignes
. . export : "SYSMAN"."MGMT_ARU_PRODUCTS"                34.72 KB     744 lignes
. . export : "SYSMAN"."MGMT_ARU_RELEASES"                19.90 KB     863 lignes
. . export : "SYSMAN"."MGMT_AUDIT_DESTINATION"           5.492 KB       1 lignes
. . export : "SYSMAN"."MGMT_AUDIT_MASTER"                5.078 KB       1 lignes
. . export : "SYSMAN"."MGMT_AVAILABILITY"                9.156 KB      47 lignes
. . export : "SYSMAN"."MGMT_AVAILABILITY_MARKER"         6.015 KB       5 lignes
. . export : "SYSMAN"."MGMT_AVAILABLE_SEARCHES"          7.031 KB      15 lignes
. . export : "SYSMAN"."MGMT_BLACKOUT_PROXY_TARGETS"      5.140 KB       5 lignes
. . export : "SYSMAN"."MGMT_BLACKOUT_REASON"             9.593 KB      60 lignes
. . export : "SYSMAN"."MGMT_BSLN_METRICS"                7.359 KB       6 lignes
. . export : "SYSMAN"."MGMT_CALLBACKS"                   12.20 KB      87 lignes
. . export : "SYSMAN"."MGMT_CATEGORIES"                  6.234 KB      12 lignes
. . export : "SYSMAN"."MGMT_CATEGORY_CLASSES"            5.468 KB       2 lignes
. . export : "SYSMAN"."MGMT_COLLECTION_METRIC_TASKS"     19.73 KB     196 lignes
. . export : "SYSMAN"."MGMT_COLL_ITEM_METRICS"           18.80 KB     217 lignes
. . export : "SYSMAN"."MGMT_COLL_ITEM_PROPERTIES"        10.67 KB      48 lignes
. . export : "SYSMAN"."MGMT_CORRECTIVE_ACTION"           6.742 KB       2 lignes
. . export : "SYSMAN"."MGMT_CREATED_USERS"               5.984 KB       4 lignes
. . export : "SYSMAN"."MGMT_CREDENTIAL_SET_COLUMNS"      15.09 KB      86 lignes
. . export : "SYSMAN"."MGMT_CREDENTIAL_SET_COL_VALS"     7.945 KB       8 lignes
. . export : "SYSMAN"."MGMT_CREDENTIAL_SETS"             12.00 KB      35 lignes
. . export : "SYSMAN"."MGMT_CREDENTIALS2"                 7.75 KB       3 lignes
. . export : "SYSMAN"."MGMT_CREDENTIAL_TYPE_COLUMNS"     12.21 KB      45 lignes
. . export : "SYSMAN"."MGMT_CREDENTIAL_TYPE_COL_VALS"    7.656 KB       3 lignes
. . export : "SYSMAN"."MGMT_CREDENTIAL_TYPE_REF"         8.468 KB       9 lignes
. . export : "SYSMAN"."MGMT_CREDENTIAL_TYPES"            8.625 KB      19 lignes
. . export : "SYSMAN"."MGMT_CS_CONFIG_STANDARD"          15.93 KB       3 lignes
. . export : "SYSMAN"."MGMT_CS_HIERARCHY"                11.30 KB     117 lignes
. . export : "SYSMAN"."MGMT_CS_KEYWORD"                  5.562 KB       3 lignes
. . export : "SYSMAN"."MGMT_CS_RULE"                     31.97 KB      94 lignes
. . export : "SYSMAN"."MGMT_CS_RULEFOLDER"               9.335 KB      23 lignes
. . export : "SYSMAN"."MGMT_CURRENT_AVAILABILITY"        6.468 KB       5 lignes
. . export : "SYSMAN"."MGMT_CURRENT_METRIC_ERRORS"       8.187 KB       3 lignes
. . export : "SYSMAN"."MGMT_DB_CONTROLFILES_ECM"         8.773 KB      10 lignes
. . export : "SYSMAN"."MGMT_DB_DATAFILES_ECM"            14.97 KB      64 lignes
. . export : "SYSMAN"."MGMT_DB_DBNINSTANCEINFO_ECM"      11.21 KB       5 lignes
. . export : "SYSMAN"."MGMT_DB_FEATUREUSAGE"             32.21 KB     152 lignes
. . export : "SYSMAN"."MGMT_DB_HDM_METRIC_HELPER"        6.695 KB       1 lignes
. . export : "SYSMAN"."MGMT_DB_LICENSE_ECM"              7.210 KB       5 lignes
. . export : "SYSMAN"."MGMT_DB_OPTIONS_ECM"              7.851 KB      55 lignes
. . export : "SYSMAN"."MGMT_DB_RECTSSETTINGS_ECM"        6.914 KB       4 lignes
. . export : "SYSMAN"."MGMT_DB_RECUSERSETTINGS_ECM"      6.437 KB       4 lignes
. . export : "SYSMAN"."MGMT_DB_REDOLOGS_ECM"             10.31 KB      15 lignes
. . export : "SYSMAN"."MGMT_DB_ROLLBACK_SEGS_ECM"        11.87 KB       5 lignes
. . export : "SYSMAN"."MGMT_DB_SGA_ECM"                  7.656 KB      45 lignes
. . export : "SYSMAN"."MGMT_DB_TABLESPACES_ECM"          19.56 KB      64 lignes
. . export : "SYSMAN"."MGMT_DELTA_ENTRY"                 10.71 KB      51 lignes
. . export : "SYSMAN"."MGMT_DELTA_ENTRY_VALUES"          17.32 KB     229 lignes
. . export : "SYSMAN"."MGMT_DELTA_IDS"                   12.46 KB      40 lignes
. . export : "SYSMAN"."MGMT_DELTA_ID_VALUES"             11.35 KB      87 lignes
. . export : "SYSMAN"."MGMT_DELTA_SNAP"                  10.82 KB      10 lignes
. . export : "SYSMAN"."MGMT_DEPLOYMENT_SECTIONS"         5.507 KB       1 lignes
. . export : "SYSMAN"."MGMT_DM_ALITEMS"                  7.054 KB      48 lignes
. . export : "SYSMAN"."MGMT_DM_RULEENTRY"                12.51 KB      45 lignes
. . export : "SYSMAN"."MGMT_DM_RULETEMPLATES"            9.882 KB      19 lignes
. . export : "SYSMAN"."MGMT_ECM_ARU_MAP"                 8.164 KB      29 lignes
. . export : "SYSMAN"."MGMT_ECM_CSA_OUT_OF_BOX"          5.031 KB       1 lignes
. . export : "SYSMAN"."MGMT_ECM_GEN_SNAPSHOT"            14.33 KB      29 lignes
. . export : "SYSMAN"."MGMT_ECM_HOST_CONFIGS_TO_DEL"     5.460 KB       1 lignes
. . export : "SYSMAN"."MGMT_ECM_MD_HIST_TBLS"            19.63 KB      39 lignes
. . export : "SYSMAN"."MGMT_ECM_RESOURCES"               6.812 KB      14 lignes
. . export : "SYSMAN"."MGMT_ECM_SNAP_COMPONENT_INFO"     7.070 KB      16 lignes
. . export : "SYSMAN"."MGMT_ECM_SNAPSHOT"                10.00 KB       5 lignes
. . export : "SYSMAN"."MGMT_ECM_SNAPSHOT_MD_TABLES"      21.81 KB     122 lignes
. . export : "SYSMAN"."MGMT_ECM_SNAPSHOT_METADATA"       17.29 KB      53 lignes
. . export : "SYSMAN"."MGMT_EMD_PING"                    11.42 KB       1 lignes
. . export : "SYSMAN"."MGMT_EMD_PING_CHECK"              5.460 KB       1 lignes
. . export : "SYSMAN"."MGMT_ERROR_MASTER"                6.460 KB      12 lignes
. . export : "SYSMAN"."MGMT_FAILOVER_CALLBACKS"          5.187 KB       4 lignes
. . export : "SYSMAN"."MGMT_FAILOVER_TABLE"              6.773 KB       1 lignes
. . export : "SYSMAN"."MGMT_FBP_PATCHING_GUIDS"          5.617 KB       3 lignes
. . export : "SYSMAN"."MGMT_FLAT_TARGET_ASSOC"           7.835 KB       3 lignes
. . export : "SYSMAN"."MGMT_GROUP_DEFAULT_CHART"         10.26 KB       9 lignes
. . export : "SYSMAN"."MGMT_HA_BACKUP"                   10.89 KB       1 lignes
. . export : "SYSMAN"."MGMT_HA_INFO_ECM"                 7.726 KB       5 lignes
. . export : "SYSMAN"."MGMT_HA_MTTR"                     5.875 KB       1 lignes
. . export : "SYSMAN"."MGMT_HA_RMAN_CONFIG_ECM"          6.460 KB       9 lignes
. . export : "SYSMAN"."MGMT_HC_CPU_DETAILS"              8.765 KB      16 lignes
. . export : "SYSMAN"."MGMT_HC_FS_MOUNT_DETAILS"         7.921 KB       8 lignes
. . export : "SYSMAN"."MGMT_HC_HARDWARE_MASTER"          9.781 KB       4 lignes
. . export : "SYSMAN"."MGMT_HC_IOCARD_DETAILS"           7.210 KB       4 lignes
. . export : "SYSMAN"."MGMT_HC_NIC_DETAILS"              8.726 KB       8 lignes
. . export : "SYSMAN"."MGMT_HC_OS_PROPERTIES"            11.82 KB      68 lignes
. . export : "SYSMAN"."MGMT_HC_OS_SUMMARY"               8.664 KB       4 lignes
. . export : "SYSMAN"."MGMT_HC_SYSTEM_SUMMARY"           7.585 KB       4 lignes
. . export : "SYSMAN"."MGMT_HC_VENDOR_SW_SUMMARY"        17.75 KB      74 lignes
. . export : "SYSMAN"."MGMT_HTTP_SESSION_CALLBACKS"        5.5 KB       1 lignes
. . export : "SYSMAN"."MGMT_INV_CONTAINER"               8.132 KB       8 lignes
. . export : "SYSMAN"."MGMT_INV_CONTAINER_PROPERTY"      6.367 KB      12 lignes
. . export : "SYSMAN"."MGMT_INV_SUMMARY"                 9.226 KB       8 lignes
. . export : "SYSMAN"."MGMT_IP_ELEM_PARAM_CLASSES"       19.91 KB     116 lignes
. . export : "SYSMAN"."MGMT_IP_ELEM_TARGET_TYPES"        9.257 KB      86 lignes
. . export : "SYSMAN"."MGMT_IP_REPORT_DEF"               40.94 KB     124 lignes
. . export : "SYSMAN"."MGMT_IP_REPORT_DEF_JIT_TYPES"     9.656 KB     135 lignes
. . export : "SYSMAN"."MGMT_IP_REPORT_ELEM_DEF"          20.97 KB      77 lignes
. . export : "SYSMAN"."MGMT_JOB"                         14.61 KB       5 lignes
. . export : "SYSMAN"."MGMT_JOB_CALLBACKS"               6.289 KB       6 lignes
. . export : "SYSMAN"."MGMT_JOB_COMMAND"                 18.40 KB     146 lignes
. . export : "SYSMAN"."MGMT_JOB_DISPLAY_ERROR_CODES"     6.773 KB       8 lignes
. . export : "SYSMAN"."MGMT_JOB_EVENT"                   5.484 KB       1 lignes
. . export : "SYSMAN"."MGMT_JOB_EXEC_SUMMARY"             15.5 KB      14 lignes
. . export : "SYSMAN"."MGMT_JOB_EXECUTION"               17.53 KB      12 lignes
. . export : "SYSMAN"."MGMT_JOB_HISTORY"                 20.62 KB      36 lignes
. . export : "SYSMAN"."MGMT_JOB_LOCK_INFO"               8.312 KB       6 lignes
. . export : "SYSMAN"."MGMT_JOB_LOCK_TARGETS"            7.148 KB       6 lignes
. . export : "SYSMAN"."MGMT_JOB_PURGE_CRITERIA"            6.5 KB       3 lignes
. . export : "SYSMAN"."MGMT_JOB_PURGE_POLICIES"          5.562 KB       4 lignes
. . export : "SYSMAN"."MGMT_JOB_PURGE_VALUES"            6.054 KB       3 lignes
. . export : "SYSMAN"."MGMT_JOB_SINGLE_TARGET_TYPES"     9.578 KB     137 lignes
. . export : "SYSMAN"."MGMT_JOB_STATE_CHANGES"           11.82 KB      37 lignes
. . export : "SYSMAN"."MGMT_JOB_TYPE_DISPLAY_INFO"       11.91 KB      87 lignes
. . export : "SYSMAN"."MGMT_JOB_TYPE_INFO"               37.37 KB     187 lignes
. . export : "SYSMAN"."MGMT_JOB_TYPE_MAX_VERSIONS"       14.71 KB     180 lignes
. . export : "SYSMAN"."MGMT_JOB_TYPE_PARAM_DSPLY_INFO"   30.85 KB     300 lignes
. . export : "SYSMAN"."MGMT_JOB_TYPE_PARAM_URI_INFO"     8.148 KB       7 lignes
. . export : "SYSMAN"."MGMT_JOB_TYPE_URI_INFO"           12.04 KB      99 lignes
. . export : "SYSMAN"."MGMT_JOB_VALUE_PARAMS"            13.80 KB     180 lignes
. . export : "SYSMAN"."MGMT_LAST_SYNC_LOAD_DETAILS"      5.890 KB       1 lignes
. . export : "SYSMAN"."MGMT_LICENSABLE_TARGET_TYPES"     7.125 KB      49 lignes
. . export : "SYSMAN"."MGMT_LICENSED_TARGETS"            6.304 KB      10 lignes
. . export : "SYSMAN"."MGMT_LOADER_DESIGNATORS"          5.773 KB      40 lignes
. . export : "SYSMAN"."MGMT_LOGIN_ASSISTANTS"            6.054 KB       2 lignes
. . export : "SYSMAN"."MGMT_MASTER_CHANGED_CALLBACK"     5.906 KB       1 lignes
. . export : "SYSMAN"."MGMT_METADATA_SETS"               9.953 KB      76 lignes
. . export : "SYSMAN"."MGMT_METRIC_DEPENDENCY_DEF"       8.070 KB      16 lignes
. . export : "SYSMAN"."MGMT_METRIC_ERRORS"               41.98 KB     237 lignes
. . export : "SYSMAN"."MGMT_METRICS_COMPOSITE_KEYS"      16.78 KB     115 lignes
. . export : "SYSMAN"."MGMT_METRICS_EXT"                 10.21 KB      20 lignes
. . export : "SYSMAN"."MGMT_METRIC_VERSIONS"             17.10 KB     273 lignes
. . export : "SYSMAN"."MGMT_MP_HOMEPAGE_REPORTS"         7.796 KB      30 lignes
. . export : "SYSMAN"."MGMT_NESTED_JOB_TARGETS"          17.80 KB     126 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_FORMAT_HANDLERS"      5.812 KB       6 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_JOB_RULE_CONFIGS"     10.22 KB       1 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_PROFILES"             6.726 KB       3 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_QUEUES"               6.257 KB      27 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_RULE_CONFIGS"         25.32 KB      41 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_RULES"                8.328 KB       7 lignes
. . export : "SYSMAN"."MGMT_OMS_PARAMETERS"              9.109 KB      39 lignes
. . export : "SYSMAN"."MGMT_OPERATIONS_MASTER"           13.86 KB      25 lignes
. . export : "SYSMAN"."MGMT_OUI_ARU_MAP"                 5.812 KB      27 lignes
. . export : "SYSMAN"."MGMT_PAF_APPLICATIONS"            12.62 KB      13 lignes
. . export : "SYSMAN"."MGMT_PAF_COMP_JOBTYPE_MAPPINGS"   9.695 KB       2 lignes
. . export : "SYSMAN"."MGMT_PAF_JOBTYPE_PARAMS"          15.02 KB      17 lignes
. . export : "SYSMAN"."MGMT_PAF_JOBTYPES"                10.39 KB       4 lignes
. . export : "SYSMAN"."MGMT_PAF_PARAM_GROUPS"            10.79 KB       6 lignes
. . export : "SYSMAN"."MGMT_PAF_PROCEDURES"              14.56 KB       7 lignes
. . export : "SYSMAN"."MGMT_PARAMETERS"                  13.78 KB      84 lignes
. . export : "SYSMAN"."MGMT_PDP_COLUMN_METADATA"         5.976 KB       3 lignes
. . export : "SYSMAN"."MGMT_PDP_METADATA"                5.914 KB       2 lignes
. . export : "SYSMAN"."MGMT_PDP_PARAM_METADATA"          7.015 KB       9 lignes
. . export : "SYSMAN"."MGMT_PDP_SETTING_METADATA"        7.937 KB       3 lignes
. . export : "SYSMAN"."MGMT_PERFORMANCE_NAMES"           11.71 KB     106 lignes
. . export : "SYSMAN"."MGMT_POLICY_ASSOC_EVAL_SUMM"      20.95 KB     167 lignes
. . export : "SYSMAN"."MGMT_POLICY_BIND_VARS"             12.5 KB     169 lignes
. . export : "SYSMAN"."MGMT_POLICY_PARAMETERS"           8.125 KB      27 lignes
. . export : "SYSMAN"."MGMT_POLICY_TYPE_VERSIONS"        19.71 KB     585 lignes
. . export : "SYSMAN"."MGMT_PRIV_GRANTS"                 13.69 KB     133 lignes
. . export : "SYSMAN"."MGMT_PRIV_INCLUDES"               5.820 KB      13 lignes
. . export : "SYSMAN"."MGMT_PRIVS"                       8.273 KB      24 lignes
. . export : "SYSMAN"."MGMT_PURGE_POLICY"                10.57 KB      16 lignes
. . export : "SYSMAN"."MGMT_PURGE_POLICY_GROUP"          6.148 KB       7 lignes
. . export : "SYSMAN"."MGMT_PURGE_POLICY_TARGET_STATE"   10.77 KB      36 lignes
. . export : "SYSMAN"."MGMT_REBUILD_INDEXES"             5.867 KB       1 lignes
. . export : "SYSMAN"."MGMT_ROLE_GRANTS"                 6.343 KB       1 lignes
. . export : "SYSMAN"."MGMT_ROLES"                       5.437 KB       1 lignes
. . export : "SYSMAN"."MGMT_ROWSET_HANDLERS"             7.195 KB      14 lignes
. . export : "SYSMAN"."MGMT_RT_BOOTSTRAP_TIMES"          5.585 KB       5 lignes
. . export : "SYSMAN"."MGMT_SNAPSHOT_METRIC_MAP"         19.13 KB     221 lignes
. . export : "SYSMAN"."MGMT_SPACE_METRICS"               8.414 KB       1 lignes
. . export : "SYSMAN"."MGMT_SWLIB_DATA_DIRECTORIES"        5.5 KB       1 lignes
. . export : "SYSMAN"."MGMT_SWLIB_DIRECTORIES"           15.35 KB      88 lignes
. . export : "SYSMAN"."MGMT_SWLIB_ENTITY_PARAMETERS"     16.22 KB     180 lignes
. . export : "SYSMAN"."MGMT_SWLIB_ENTITY_REFERENCES"     8.242 KB       2 lignes
. . export : "SYSMAN"."MGMT_SWLIB_ENTITY_REVISIONS"      32.46 KB     182 lignes
. . export : "SYSMAN"."MGMT_SWLIB_MATURITY_STATUS"       5.554 KB       3 lignes
. . export : "SYSMAN"."MGMT_TARGET_ADD_CALLBACKS"        5.984 KB      13 lignes
. . export : "SYSMAN"."MGMT_TARGET_ASSOC_DEFS"           11.03 KB      15 lignes
. . export : "SYSMAN"."MGMT_TARGET_ASSOC_ERROR"          6.484 KB       4 lignes
. . export : "SYSMAN"."MGMT_TARGET_ASSOCS"               7.546 KB       6 lignes
. . export : "SYSMAN"."MGMT_TARGET_ASSOC_STATUS"         5.960 KB       4 lignes
. . export : "SYSMAN"."MGMT_TARGET_CREDENTIALS"          6.718 KB       1 lignes
. . export : "SYSMAN"."MGMT_TARGET_DELETE_EXCEPTIONS"    5.953 KB      35 lignes
. . export : "SYSMAN"."MGMT_TARGET_PROP_DEFS"            38.57 KB     288 lignes
. . export : "SYSMAN"."MGMT_TARGET_PROPERTIES"           17.10 KB     203 lignes
. . export : "SYSMAN"."MGMT_TARGET_ROLLUP_TIMES"         12.26 KB     130 lignes
. . export : "SYSMAN"."MGMT_TARGETS"                     16.62 KB       5 lignes
. . export : "SYSMAN"."MGMT_TARGET_TYPE_COMPONENT_MAP"   6.460 KB       5 lignes
. . export : "SYSMAN"."MGMT_TARGET_TYPES"                9.726 KB      28 lignes
. . export : "SYSMAN"."MGMT_TARGET_TYPE_VERSIONS"        11.93 KB      37 lignes
. . export : "SYSMAN"."MGMT_TASK_WORKER_COUNTS"          5.507 KB       2 lignes
. . export : "SYSMAN"."MGMT_TYPE_PROPERTIES"             8.585 KB      75 lignes
. . export : "SYSMAN"."MGMT_USER_CALLBACKS"              6.507 KB      27 lignes
. . export : "SYSMAN"."MGMT_USER_CAS"                    5.468 KB       2 lignes
. . export : "SYSMAN"."MGMT_USER_CONTEXT"                5.906 KB       4 lignes
. . export : "SYSMAN"."MGMT_USER_FOLDERS"                6.843 KB      24 lignes
. . export : "SYSMAN"."MGMT_USER_SUBTAB_COL_PREFS"       8.687 KB      41 lignes
. . export : "SYSMAN"."MGMT_VERSIONS"                    6.843 KB       5 lignes
. . export : "SYSMAN"."MGMT_VIEW_USER_CREDENTIALS"       5.523 KB       1 lignes
. . export : "SYSMAN"."MGMT_VIOLATION_CONTEXT"           22.44 KB     134 lignes
. . export : "SYSTEM"."REPCAT$_AUDIT_ATTRIBUTE"          6.335 KB       2 lignes
. . export : "SYSTEM"."REPCAT$_OBJECT_TYPES"             6.890 KB      28 lignes
. . export : "SYSTEM"."REPCAT$_RESOLUTION_METHOD"        5.843 KB      19 lignes
. . export : "SYSTEM"."REPCAT$_TEMPLATE_STATUS"          5.492 KB       3 lignes
. . export : "SYSTEM"."REPCAT$_TEMPLATE_TYPES"           6.296 KB       2 lignes
. . export : "APEX_030200"."WWV_FLOW_ACTIVITY_LOG1$"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_ACTIVITY_LOG2$"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_ALT_CONFIG_DETAIL"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_ALTERNATE_CONFIG"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_APP_BUILD_PREF"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_APP_COMMENTS"           0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_BUILDER_AUDIT_TRAIL"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_CLICKTHRU_LOG$"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_CLICKTHRU_LOG2$"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_COLLECTION_MEMBERS$"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_COLLECTIONS$"           0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_COMPOUND_CONDITIONS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_CSS_REPOSITORY"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_CUSTOMIZED_TASKS"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_DATA"                   0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_DATA_LOAD_BAD_LOG"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_DATA_LOAD_UNLOAD"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_DEBUG"                  0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_DEVELOPERS"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_DYNAMIC_TRANSLATIONS$"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_EFFECTIVE_USERID_MAP"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_ENTRY_POINT_ARGS"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_ENTRY_POINTS"           0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_FILE_OBJECTS$PART"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_FND_GROUP_USERS"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_FND_USER_GROUPS"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_FOLDERS"                0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_HNT_ARGUMENT_INFO"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_HNT_LOV_DATA"           0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_HNT_PROCEDURE_INFO"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_HTML_REPOSITORY"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_ICON_BAR_ATTRIBUTES"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_IMAGE_REPOSITORY"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_IMPORT_EXPORT"          0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_INSTALL_BUILD_OPT"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_INSTALL_CHECKS"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_INSTALL_SCRIPTS"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_JOB_BIND_VALUES"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_JOBS"                   0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_LOCK_PAGE"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_LOCK_PAGE_LOG"          0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_MAIL_ATTACHMENTS"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_MAIL_LOG"               0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_MAIL_QUEUE"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_MODEL_PAGE_COLS"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_MODEL_PAGE_REGIONS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_MODEL_PAGES"            0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_MODELS"                 0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_ONLINE_HELP"            0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_ONLINE_HELP_JA"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_PAGE_CACHE"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_PAGES_RESERVED"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_PAGE_SUBMISSIONS"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_PICK_DATABASE_SIZE"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_PLATFORM_PREF"          0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_PREFERENCES$"           0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_PROVISION_COMPANY"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_PROVISION_SERICE_MOD"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_PURGED_SESSIONS$"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_QB_SAVED_COND"          0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_QB_SAVED_JOIN"          0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_QB_SAVED_QUERY"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_QB_SAVED_TABS"          0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_REGION_CHART_SER_ATTR"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_REGION_REPORT_FILTER"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_REPORT_LAYOUTS"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_REQUEST_VERIFICATIONS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_REQUIRED_ROLES"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_RSCHEMA_EXCEPTIONS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_SC_TRANS"               0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_SESSIONS$"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_SHARED_QRY_SQL_STMTS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_SHARED_QUERIES"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_SHARED_WEB_SERVICES"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_SHORTCUT_USAGE_MAP"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOWS_RESERVED"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_STEP_BRANCH_ARGS"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_SW_BINDS"               0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_SW_DETAIL_RESULTS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_SW_RESULTS"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_SW_SQL_CMDS"            0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_SW_STMTS"               0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_TEMPLATE_PREFERENCES"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_TEMPLATES$"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_TEMPLATE_THEMES$"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_TRANSLATABLE_TEXT$"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_TREE_STATE"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_UPG_COL_NAME_CHANGES"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_USER_ACCESS_LOG1$"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_USER_ACCESS_LOG2$"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_VERSION$"               0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WEB_PAGES"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WEB_PG_LIST_ENTRIES"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WEB_PG_REGIONS"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_CATEGORIES"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_COL_GROUPS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_COMPUTATION"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_CONDITIONS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_DOCS"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_GEOCACHE"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_HISTORY"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_LINKS"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_LOV_ENTRIES"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_LOVS"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_PRIVS"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_ROWS"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WORKSHEET_STICK"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WS_OPERATIONS"          0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WS_PARAMETERS"          0 KB       0 lignes
. . export : "APEX_030200"."WWV_FLOW_WS_PROCESS_PARMS_MAP"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_COLUMNS"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACCESS"                  0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_FORMS"               0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_FORMS_CONTROLS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_FORMS_MODULES"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_FORMS_PERM"          0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_GROUPS"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_GRPSMEMBERS"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_INDEXES"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_INDEXES_COLS"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_MODULES"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_MODULES_PERM"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_PAGES"               0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_QUERIES"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_RELATION_COLS"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_RELATIONS"           0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_REPORTS"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_RPT_PERMS"           0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_RPTS_CONTROLS"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_RPTS_MODULES"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_TABLES"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_TAB_PERM"            0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_ACC_USERS"               0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FORMS"                   0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_ALERTS"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_ATTACHEDLIBRARY"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_BLK_DSA"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_BLK_DSC"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_BLK_ITEM_LIE"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_BLK_ITEM_RADIO"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_BLK_ITEMS"           0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_BLK_ITEM_TRIGGERS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_BLK_RELATIONS"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_BLK_TRIGGERS"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_BLOCKS"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_CANVAS"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_CNVG_COMPOUNDTEXT"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_CNVS_GRAPHICS"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_CNVS_TABPAGE"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_COORDINATES"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_CPDTXT_TEXTSEGMENT"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_EDITOR"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_FMB_MENU"            0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_FMB_MENUITEM_ROLE"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_FMB_MENU_MENUITEM"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_FORMMODULES"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_LOV"                 0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_LOVCOLUMNMAPPING"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_MENU"                0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_MENUITEM_ROLE"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_MENU_MENUITEM"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_MENUS"               0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_MENUS_MENUMODULES"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_MENUSMODULEROLES"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_MENUS_MODULES"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_MENUS_PROGRAMUNIT"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_MODULEPARAMETER"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_MODULES"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_OBJECTGROUP"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_OBJECTGROUPCHILD"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_PROGRAMUNIT"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_PROPERTYCLASS"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_RECORDGROUPCOLUMN"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_RECORDGROUPS"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_REPORT"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_REV_APEX_APP"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_REV_BLK_ITEMS"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_REV_BLOCKS"          0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_REV_FORMMODULES"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_REV_LOV"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_REV_LOVCOLMAPS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_TRIGGERS"            0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_VISUALATTRIBUTES"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_FRM_WINDOWS"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_GENERATED_APPLICATIONS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB"                     0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_BLK_DATASOURCECOL"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_BLK_ITEM"            0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_BLK_ITEM_LIE"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_BLK_ITEM_TRIGGER"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_BLK_TRIGGER"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_BLOCK"               0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_CANVAS"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_CG_COMPOUNDTEXT"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_CG_CT_TEXTSEGMENT"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_CNVS_GRAPHICS"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_MODULES"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OBJECTLIBRARY"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OBJECTLIBRARYTAB"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_ALERT"           0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_BLK_ITEM"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_BLK_ITEM_TRIGR"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_BLOCK"           0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_CANVAS"          0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_CNVS_GRAPHICS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_GRAPHICS"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_ITEM"            0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_MENU"            0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_MENU_MENUITEM"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_OBJECTGROUP"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_OB_OBJGRPCHILD"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_REPORT"          0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_TABPAGE"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_TABPG_GRAPHICS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_VISUALATTRBUTE"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_OLT_WINDOW"          0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_PROGRAMUNIT"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_PROPERTYCLASS"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_T_TP_GG_CPDTXT"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_T_TP_GG_CT_TXTSGT"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_T_TP_GGG_CPDTXT"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_T_TP_GGG_CT_TXTSGT"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_T_TP_GGGG_CPDTXT"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_T_TP_GGGG_CT_TXSGT"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_T_TP_GGGGG_CPDTXT"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_T_TP_GGGGG_CT_TXST"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_T_TP_GGGG_GRAPHICS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_T_TP_GGG_GRAPHICS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_T_TP_GG_GRAPHICS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_T_TP_G_GRAPHICS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_VISUALATTRIBUTE"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_OLB_WINDOW"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_PLSQL_LIBS"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_PROJECT_COMPONENTS"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_PROJECTS"                0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_PROJECT_TRIGGERS"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_REPORT"                  0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_REV_APEXAPP"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_REV_FORMS"               0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_REV_QUERIES"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_REV_REPORTS"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_REV_TABLES"              0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_DATA"                0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_DATASRC"             0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_DATASRC_GRP"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_DATASRC_SELECT"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_DATA_SUMMARY"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_GRP_DATAITEM"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_GRP_DATAITEM_DESC"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_GRP_DATAITEM_PRIV"      0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_GRP_FIELD"           0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_GRP_FILTER"          0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_GRP_FORMULA"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_GRP_ROWDELIM"        0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_GRP_SUMMARY"         0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPT_REPORTPRIVATE"       0 KB       0 lignes
. . export : "APEX_030200"."WWV_MIG_RPTS"                    0 KB       0 lignes
. . export : "FLOWS_FILES"."WWV_FLOW_FILE_OBJECTS$"          0 KB       0 lignes
. . export : "IX"."AQ$_ORDERS_QUEUETABLE_G"                  0 KB       0 lignes
. . export : "IX"."AQ$_ORDERS_QUEUETABLE_H"                  0 KB       0 lignes
. . export : "IX"."AQ$_ORDERS_QUEUETABLE_I"                  0 KB       0 lignes
. . export : "IX"."AQ$_ORDERS_QUEUETABLE_L"                  0 KB       0 lignes
. . export : "IX"."AQ$_ORDERS_QUEUETABLE_T"                  0 KB       0 lignes
. . export : "IX"."AQ$_STREAMS_QUEUE_TABLE_C"                0 KB       0 lignes
. . export : "IX"."AQ$_STREAMS_QUEUE_TABLE_G"                0 KB       0 lignes
. . export : "IX"."AQ$_STREAMS_QUEUE_TABLE_H"                0 KB       0 lignes
. . export : "IX"."AQ$_STREAMS_QUEUE_TABLE_I"                0 KB       0 lignes
. . export : "IX"."AQ$_STREAMS_QUEUE_TABLE_L"                0 KB       0 lignes
. . export : "IX"."AQ$_STREAMS_QUEUE_TABLE_T"                0 KB       0 lignes
. . export : "IX"."ORDERS_QUEUETABLE"                        0 KB       0 lignes
. . export : "IX"."STREAMS_QUEUE_TABLE"                      0 KB       0 lignes
. . export : "OE"."PURCHASEORDER"                            0 KB       0 lignes
. . export : "OLAPSYS"."CWM$ARGUMENT"                        0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWCOMPOSITESPEC"                0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWCOMPSPECMEMBERSHIP"           0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWCUBEAGG"                      0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWCUBEAGGLEVEL"                 0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWCUBEAGGMEASURE"               0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWCUBECOMPPLAN"                 0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWCUBELOAD"                     0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWCUBELOADAGGPLAN"              0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWCUBELOADFILTER"               0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWCUBELOADMEASURE"              0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWCUBELOADPARMVALUE"            0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AW_DIMENSIONMAP"                0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWDIMLOAD"                      0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWDIMLOADFILTER"                0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWDIMLOADPARMVALUE"             0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AW_MEASUREMAP"                  0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$_AW_NEXT_PERM_CUST_MEAS"        0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$_AW_PERM_CUST_MEAS_MAP"         0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWVIEWCOLS"                     0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$AWVIEWS"                        0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$CLASSIFICATIONVALUEPAIR"        0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$CUBE"                           0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$CUBEDIMENSIONUSE"               0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$DIMENSION"                      0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$DIMENSIONATTRIBUTE"             0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$DIMHIERLVLMAP"                  0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$FACTDIMHIERMAP"                 0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$FACTDIMHIERTPLSDTL"             0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$FACTKEYDIMHIERLVLMAP"           0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$FACTKEYDIMHIERMAP"              0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$HIERARCHY"                      0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$HIERCUSTOMSORT"                 0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$HIERLEVELREL"                   0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$LEVEL"                          0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$LEVELATTRIBUTE"                 0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$LEVELATTRIBUTEMAP"              0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MEASURE"                        0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MEASURETABLEMAP"                0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_AWVIEWCOLS"               0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_AWVIEWS"                  0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_CATALOG_ENTITY_USES"      0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_CATALOGS"                 0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_CUBE_MEASURES"            0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_CWM1_AGGOP"               0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_CWM1_AGGORD"              0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_DIM_ATTRIBUTES"           0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_DIM_HIER_LEVEL_USES"      0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_DIM_HIERS"                0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_DIM_LEVEL_ATTR_MAPS"      0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_ENTITY_DESC_USES"         0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_ENTITY_EXT_PARMS"         0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_ENTITY_PARAMETERS"        0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_FACTTBLFCTMAPS"           0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_FACTTBLKEYMAPS"           0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_HIER_CUSTOM_SORT"         0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_HIERDIM_KEYCOL_MAP"       0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_HIERDIMS"                 0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_JOIN_KEY_COL_USES"        0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_LISTDIMS"                 0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRALL_OLAP2_AGG_USES"           0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRFACTTBLFCTMAPS"               0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$MRFACTTBLKEYMAPS"               0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$STOREDDIMLVLTPLS"               0 KB       0 lignes
. . export : "OLAPSYS"."CWM2$STOREDDIMLVLTPLSDTL"            0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_ATTRIBUTES_T"          0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_CUBE_AGG_LVL_T"        0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_CUBE_AGG_MEAS_T"       0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_CUBE_AGG_OP_T"         0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_CUBE_AGG_SPECS_T"      0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_CUBE_DIM_USES_T"       0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_CUBE_MEASURES_T"       0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_CUBES_T"               0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_DIMENSIONS_T"          0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_DIM_LEVELS_T"          0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_HIER_LVL_ORD_T"        0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_MAP_ATTR_USE_T"        0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_MAP_DIM_USE_T"         0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_MAP_MEAS_USE_T"        0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_PHYS_OBJ_PROP_T"       0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AW_PHYS_OBJ_T"            0 KB       0 lignes
. . export : "OLAPSYS"."MRAC_OLAP2_AWS_T"                    0 KB       0 lignes
. . export : "OLAPSYS"."XML_LOAD_LOG"                        0 KB       0 lignes
. . export : "OLAPSYS"."XML_LOAD_RECORDS"                    0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_ANON_ATTRS_WRK"               0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_ANON_RULES_WRK"               0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_CT_ACTION_WRK"                0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_CT_DAREFS_WRK"                0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_CT_LOCATORPATHS_WRK"          0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_CT_MACRO_DEP_WRK"             0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_CT_MACRO_PAR_WRK"             0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_CT_PRED_OPRD_WRK"             0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_CT_PRED_PAR_WRK"              0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_CT_PRED_SET_WRK"              0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_CT_PRED_WRK"                  0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_CT_VLD_MSG"                   0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_DATA_MODEL_WRK"               0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_DICT_ATTRS_WRK"               0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_DOC_REFS_WRK"                 0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_DOCS_WRK"                     0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_MAPPED_PATHS"                 0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_MAPPED_PATHS_WRK"             0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_MAPPING_DOCS_WRK"             0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_PRV_ATTRS_WRK"                0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_RT_PREF_PARAMS_WRK"           0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_STD_ATTRS_WRK"                0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_STORED_TAGS"                  0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_STORED_TAGS_WRK"              0 KB       0 lignes
. . export : "ORDDATA"."ORDDCM_UID_DEFS_WRK"                 0 KB       0 lignes
. . export : "OUTLN"."OL$"                                   0 KB       0 lignes
. . export : "OUTLN"."OL$HINTS"                              0 KB       0 lignes
. . export : "OUTLN"."OL$NODES"                              0 KB       0 lignes
. . export : "OWBSYS"."OWBRTPS"                              0 KB       0 lignes
. . export : "SCOTT"."BONUS"                                 0 KB       0 lignes
. . export : "SH"."COSTS":"COSTS_H1_1997"                    0 KB       0 lignes
. . export : "SH"."COSTS":"COSTS_H2_1997"                    0 KB       0 lignes
. . export : "SH"."COSTS":"COSTS_Q1_2002"                    0 KB       0 lignes
. . export : "SH"."COSTS":"COSTS_Q1_2003"                    0 KB       0 lignes
. . export : "SH"."COSTS":"COSTS_Q2_2002"                    0 KB       0 lignes
. . export : "SH"."COSTS":"COSTS_Q2_2003"                    0 KB       0 lignes
. . export : "SH"."COSTS":"COSTS_Q3_2002"                    0 KB       0 lignes
. . export : "SH"."COSTS":"COSTS_Q3_2003"                    0 KB       0 lignes
. . export : "SH"."COSTS":"COSTS_Q4_2002"                    0 KB       0 lignes
. . export : "SH"."COSTS":"COSTS_Q4_2003"                    0 KB       0 lignes
. . export : "SH"."COSTS":"COSTS_1995"                       0 KB       0 lignes
. . export : "SH"."COSTS":"COSTS_1996"                       0 KB       0 lignes
. . export : "SH"."DIMENSION_EXCEPTIONS"                     0 KB       0 lignes
. . export : "SH"."SALES":"SALES_H1_1997"                    0 KB       0 lignes
. . export : "SH"."SALES":"SALES_H2_1997"                    0 KB       0 lignes
. . export : "SH"."SALES":"SALES_Q1_2002"                    0 KB       0 lignes
. . export : "SH"."SALES":"SALES_Q1_2003"                    0 KB       0 lignes
. . export : "SH"."SALES":"SALES_Q2_2002"                    0 KB       0 lignes
. . export : "SH"."SALES":"SALES_Q2_2003"                    0 KB       0 lignes
. . export : "SH"."SALES":"SALES_Q3_2002"                    0 KB       0 lignes
. . export : "SH"."SALES":"SALES_Q3_2003"                    0 KB       0 lignes
. . export : "SH"."SALES":"SALES_Q4_2002"                    0 KB       0 lignes
. . export : "SH"."SALES":"SALES_Q4_2003"                    0 KB       0 lignes
. . export : "SH"."SALES":"SALES_1995"                       0 KB       0 lignes
. . export : "SH"."SALES":"SALES_1996"                       0 KB       0 lignes
. . export : "SYSMAN"."AQ$_MGMT_LOADER_QTABLE_G"             0 KB       0 lignes
. . export : "SYSMAN"."AQ$_MGMT_LOADER_QTABLE_H"             0 KB       0 lignes
. . export : "SYSMAN"."AQ$_MGMT_LOADER_QTABLE_I"             0 KB       0 lignes
. . export : "SYSMAN"."AQ$_MGMT_LOADER_QTABLE_L"             0 KB       0 lignes
. . export : "SYSMAN"."AQ$_MGMT_LOADER_QTABLE_T"             0 KB       0 lignes
. . export : "SYSMAN"."AQ$_MGMT_NOTIFY_QTABLE_G"             0 KB       0 lignes
. . export : "SYSMAN"."AQ$_MGMT_NOTIFY_QTABLE_H"             0 KB       0 lignes
. . export : "SYSMAN"."AQ$_MGMT_NOTIFY_QTABLE_I"             0 KB       0 lignes
. . export : "SYSMAN"."AQ$_MGMT_NOTIFY_QTABLE_L"             0 KB       0 lignes
. . export : "SYSMAN"."AQ$_MGMT_NOTIFY_QTABLE_T"             0 KB       0 lignes
. . export : "SYSMAN"."DB_USER_PREFERENCES"                  0 KB       0 lignes
. . export : "SYSMAN"."EM_COMPARISON_SUMMARY"                0 KB       0 lignes
. . export : "SYSMAN"."EMDW_TRACE_DATA"                      0 KB       0 lignes
. . export : "SYSMAN"."EM_IPW_INFO"                          0 KB       0 lignes
. . export : "SYSMAN"."EM_PAGE_CUSTOM_CONDITIONS"            0 KB       0 lignes
. . export : "SYSMAN"."EM_PAGE_CUSTOMIZATIONS"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ADMIN_METRIC_THRESHOLDS"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ANNOTATION"                      0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ARU_CREDENTIALS"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_AUDIT_CUSTOM_ATTRIBS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_AUDIT_LOGS"                      0 KB       0 lignes
. . export : "SYSMAN"."MGMT_AVAILABILITY_RBK"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BACKUP_CONFIGURATION"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BAM_DATA_HUBS"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BAM_DATA_ISESSIONS"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BAM_DATA_OSESSIONS"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BAM_ISESSION_DATASOURCE"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BAM_ISESSION_DIAG"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BAM_ISESSION_KPIS"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BAM_OSESSION_ALERTS"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BAM_OSESSION_DIAG"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BAM_OSESSION_METRICS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BAM_OSESSION_STATUS"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BCN_AVAIL_DEF"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BCN_AVAIL_JOB"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BCN_AVAIL_LOG"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BCN_BCNSTEP_PROPS"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BCN_BCNTXN_PROPS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BCN_STEP_DEFN"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BCN_STEPGROUP_DEFN"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BCN_STEPGROUP_STEPS"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BCN_STEP_PROPS"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BCN_TARGET"                      0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BCN_TXN_AUDIT"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BCN_TXN_DEFN"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BCN_TXN_PROPS"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BLACKOUT_FLAT_TARGETS"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BLACKOUT_HISTORY"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BLACKOUTS"                       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BLACKOUT_SCHEDULE"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BLACKOUT_STATE"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BLACKOUT_TARGET_DETAILS"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BLACKOUT_WINDOWS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BSLN_BASELINES"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BSLN_DATASOURCES"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BSLN_INTERVALS"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BSLN_RAWDATA"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BSLN_STATISTICS"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BSLN_THRESHOLD_PARMS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BUG_ADV_HOME_PATCH"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BUG_ADVISORY"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BUG_ADVISORY_BUG"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BUG_AVAILABLE_PATCH"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BUG_FIX_APPLICABLE_COMP"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BUG_FIX_APPLIC_COMP_LIST"        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BUG_PATCH_CERTIFICATE"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BUG_PATCH_FIXES_BUG"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_BUG_PATCH_PLATFORM"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CHANGE_AGENT_URL"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_BASELINE_CONS_GROUPS"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_BASELINE_DEPENDENCIES"        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_BASELINE_DEPENDENTS"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_BASELINE_INIT_PARAMS"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_BASELINE_OBJECTS"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_BASELINE_OBJGRANTS"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_BASELINE_PROXYGRANTS"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_BASELINE_QUOTAGRANTS"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_BASELINE_ROLEGRANTS"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_BASELINES"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_BASELINE_SYSGRANTS"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_BASELINE_VERSIONS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_COMPARISON_INIT_PRMS"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_COMPARISON_OBJECTS"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_COMPARISONS"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_COMPARISON_VERSIONS"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_SCHEMA_MAPS"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_SCOPESPEC_NAMES"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_SCOPESPECS"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_SYNCH_IMPACT_REPORTS"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_SYNCH_OBJECTS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_SYNCHRONIZATIONS"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_SYNCH_SCRIPTS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CM_SYNCH_VERSIONS"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_COLLECTION_CREDENTIALS"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_COLLECTION_TASK_CONTEXT"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_COLLECTION_TEMPLATE_CREDS"       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_COLLECTION_WORKERS"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_COMP_RESULT_TO_JOB_MAP"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_COMP_SNAPSHOT_TO_STEP_MAP"       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CONFIG_ACTIVITIES"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CONTAINER_CREDENTIALS"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CPF_METRIC_SOURCE"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CREDENTIALS"                     0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CS_EVAL_SUMM_RQS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CS_EVAL_SUMM_RULE"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CS_EVAL_SUMM_RULEFOLDER"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CS_INCLUSION"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CS_INCLUSION_PARAMETER"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CS_PARAMETER"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CS_PARAMETER_CHOICES"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CS_REUSABLE_QUERY"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CS_RQS_HIERARCHY"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CS_RQS_INCLUSION"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CS_RULE_FIX_LINK"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CS_RULE_SIMPLE_TEST"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CS_RULE_VIOL_CTX"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CS_SCHEDULED_EVAL"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CSTMZ_CHARTS"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CSTMZ_CHART_SELTARGETS"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CSTMZ_CUSTOM_COLUMNS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CSTMZ_DEFAULT_CHART"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_CSTMZ_SUMMARY_CHART_DEF"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DB_INVOBJS_ECM"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DB_LATEST_HDM_FINDINGS"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DBNET_TNS_ADMINS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DB_RECSEGMENTSETTINGS_ECM"       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DELTA_COMPARISON_DELTAS"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DELTA_COMP_DELTA_DETAILS"        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DELTA_COMP_KEY_COLS"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DELTA_COMP_PROPERTIES"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DELTA_SUMMARY_ERRORS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DELTA_COMP_SUMMARIES"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DELTA_SAVED_COMPARISON"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DIROBJ_USERS_HOTLIST"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DM_COLUMN_RULES"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DM_INFCONS_COLUMNS"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DM_JOB_EXECUTIONS"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DM_SCOPESPECS"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DM_SS_COLUMNS"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_DUPLICATE_TARGETS"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_CLUSTER_NODE_INFO"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_CSA"                         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_CSA_APPID_TARGET_MAP"        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_CSA_COOKIES"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_CSA_CUSTOM"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_CSA_FAILED"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_CSA_GENERAL_INFO"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_CSA_RULES"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_CSA_SNAPSHOT_INFO"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_HOSTPATCH_COMPL_HIST"        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_HOSTPATCH_GROUP_REPOS"       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_HOSTPATCH_GROUPS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_HOSTPATCH_HOST_COMPL"        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_HOSTPATCH_HOSTS"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_HOSTPATCH_REPOS"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_HOSTPATCH_REPOS_PKGS"        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_HW"                          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_HW_CPU"                      0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_HW_IOCARD"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_HW_NIC"                      0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_LOADED_FILES"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_OS"                          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_OS_COMPONENT"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_OS_FILESYSTEM"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_OS_PROPERTY"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_OS_REGISTERED_SW"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_OS_REGISTERED_SW_COMP"       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_PATCH_CACHE"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_SAVEDHOSTCONFIG"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_ULN_CH_ADV"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_ULN_CHANNEL_PKGS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_ULN_CHANNELS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_ULN_SS_CHANNELS"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ECM_ULN_STAGE_SERVERS"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_EMX_CELL_C_CONFIG"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_EMX_CELL_CD_CONFIG"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_EMX_CELL_GD_CONFIG"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_EMX_CELL_IORM_CONFIG"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_EMX_CELL_L_CONFIG"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_EMX_CELL_PD_CONFIG"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_ENTERPRISE_CREDENTIALS"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_E2E_DETAILS"                     0 KB       0 lignes
. . export : "SYSMAN"."MGMT_E2E_DETAILS_1DAY"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_E2E_DETAILS_1HOUR"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_E2E_JDBC"                        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_E2E_JDBC_1DAY"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_E2E_JDBC_1HOUR"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_E2E_SQL"                         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_E2E_SQL_CONN"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_E2E_SQL_STMT"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_E2E_SQL_1DAY"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_E2E_SQL_1HOUR"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_E2E_SUMMARY"                     0 KB       0 lignes
. . export : "SYSMAN"."MGMT_E2E_SUMMARY_1DAY"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_E2E_SUMMARY_1HOUR"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_FAILED_CONFIG_ACTIVITIES"        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_FEATURE_PATCHES"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_FEATURES_MAPPING"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_FLAT_ROLE_GRANTS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GENSVC_AVAIL_BEACONS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GENSVC_AVAIL_CONFIG"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GENSVC_AVAIL_EVENTS"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GENSVC_AVAIL_JOB"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GENSVC_AVAIL_TESTS"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GENSVC_JOBS_DETAILS"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GENSVC_TEST_AVAIL"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GENSVC_TEST_AVAIL_MARKER"        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GENSVC_TEST_CUR_AVAIL"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GENSVC_TMPL_VARS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GENSVC_UPDBCN_JOB"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GENSVC_UPDBCN_JOB_TESTS"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GROUP_CHART"                     0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GROUP_CHART_SELTARGETS"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GROUP_CUSTOM_COLUMNS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_GROUP_SUMMARY_CHART_DEF"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_HA_CLS_INTR_CONN"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_HA_DG_TARGET_SUMMARY"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_HA_FILES_ECM"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_HA_INIT_PARAMS_ECM"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_HA_RAC_INTR_CONN"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_HC_OS_COMPONENTS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_HC_VENDOR_SW_COMPONENTS"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_HOST_CREDENTIALS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_HTTP_SESSION_OBJECTS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_INDEX_SIZES"                     0 KB       0 lignes
. . export : "SYSMAN"."MGMT_INV_COMPONENT_PATCH"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_INV_FILE"                        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_INV_PATCH"                       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_INV_PATCHED_FILE"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_INV_PATCHED_FILE_COMP"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_INV_PATCH_FIXED_BUG"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_INV_PATCHSET"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_INV_VERSIONED_PATCH"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_IP_EMAIL_REPORT"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_IP_PURGE_POLICY"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_IP_REPORT_ELEM_IMAGE"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_IP_REPORT_ELEM_TARGETS"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_IP_STORED_REPORT"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_ASSOC_PARAMS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_BLACKOUT_ASSOC"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_CREDENTIALS"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_EMD_STATUS_QUEUE"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_EXEC_CRED_INFO"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_EXEC_EVENT_PARAMS"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_EXEC_LOCKS"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_EXT_TARGETS"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_FLAT_TARGETS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_NOTIFY_STATES"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_PURGE_TARGETS"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_QUEUES"                      0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_STEP_COMMAND_LOG"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_STEP_TARGETS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_TARGET"                      0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_TYPE_DISPLAY_PARAM"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_JOB_TYPE_PARAM_DROPDOWNS"        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_LICENSE_CONFIRMATION"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_LICENSES"                        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_LOADER_QTABLE"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_LONG_TEXT"                       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_MANAGEMENT_PLUGINS"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_MASTER_AGENT"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_METRIC_COLLECTIONS_REP"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_METRIC_DEPENDENCY"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_METRIC_DEPENDENCY_DETAILS"       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_MNTR_SET_COPIES"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_MP_CONTRIBUTOR_FILE"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_MP_CONTRIBUTORS"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_MP_DEPLOYMENT_ERRORS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_MP_DEPLOYMENTS"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_MP_FILE_PROPS"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_MP_FILES"                        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_MP_GROUP_MEMBERS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_MP_GROUPS"                       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_MP_MECHANISMS"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_MP_NLS_SUBSTITUTIONS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_MP_PROPS"                        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_NESTED_JOB_CRED_INFO"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_NET_EVENTS"                      0 KB       0 lignes
. . export : "SYSMAN"."MGMT_NOTIFICATION_LOG"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_DEVICE_PARAMS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_DEVICES"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_DEV_SCHEDULES"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_EMAIL_GATEWAY"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_INPUT_QTABLE"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_NOTIFYEES"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_QTABLE"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_REQUEUE"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_NOTIFY_SCHEDULES"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_OB_ADMIN_CLIENT_DB"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_OSM_DISK_GROUP_ECM"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PAF_ENCRYPTED_STRINGS"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PAF_INSTANCES"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PAF_MSG_QTABLE_1"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PAF_MSG_QTABLE_2"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PAF_NOTIFICATION_LOG"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PAF_OMS_STATUS"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PAF_PAR_FILES"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PAF_STATES"                      0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PDP_HOST_SETTING"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PDP_SETTINGS"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PDP_SETTING_VALUES"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PLANPROBLEM_FACTORS"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_ASN_DEPENDENCIES"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_ASN_TARGETS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_ASSIGNMENT"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_BOOTSERVER"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_CLUSTER"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_CLUSTER_NODES"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_COLLECTION"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_DEFAULT_IMAGE"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_HARDWARE"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_HISTORY"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_IP_RANGE"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_IP_RESERVED"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_NET_CONFIG"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_OPERATION"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_RPM_REP"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_STAGED_COMPS"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_STAGING_DIRS"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_SUITE_INSTANCE"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_SUITE_INST_MEMBERS"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_PROV_TGT_STATUS"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RAC_SERVICES"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RCA_EVENT"                       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RCA_EVENT_ASSOC"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RCA_METRIC_PROPS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RCA_METRIC_TEST"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RCA_RECOVERY"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RCA_RUN"                         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RCA_SUMMARY"                     0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RCA_TARGET_PROPS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RCA_TEST_RESULT"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RCA_TRACE"                       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RCVCAT_CONFIG"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RCVCAT_REPOS"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_REPOS_TIME_COEFFICIENT"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_COOKIE_DATA"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_DOMAIN_BOOTSTRAP"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_DOMAIN_DIST_BOOTSTRAP"        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_DOMAIN_DIST_1DAY"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_DOMAIN_DIST_1HOUR"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_DOMAIN_1DAY"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_DOMAIN_1HOUR"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_INCOMPLETE_LOADS"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_INCOMPLETE_LOADS_1DAY"        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_INCOMPLETE_LOADS_1HOUR"       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_IP_BOOTSTRAP"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_IP_DIST_BOOTSTRAP"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_IP_DIST_1DAY"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_IP_DIST_1HOUR"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_IP_1DAY"                      0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_IP_1HOUR"                     0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_METRICS_RAW"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_PR_MAPPING"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_PR_MAPPING_1DAY"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_PR_MAPPING_1HOUR"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_REGION_ENTRIES"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_REGION_MAPPING"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_REGIONS"                      0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_TARGET_PROPERTIES"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_URL_BOOTSTRAP"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_URL_DIST_BOOTSTRAP"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_URL_DIST_1DAY"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_URL_DIST_1HOUR"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_URLS"                         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_URL_1DAY"                     0 KB       0 lignes
. . export : "SYSMAN"."MGMT_RT_URL_1HOUR"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SEVERITY_RBK"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SL_METRICS"                      0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SL_METRICS_HISTORY"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SL_RULES"                        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SL_RULES_HISTORY"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SQL_BIND_VARS"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SQL_EVALUATION"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SQL_METRIC_HELPER"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SQL_PLAN"                        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SQLPROBLEM_FACTORS"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SQL_REUSE"                       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SQL_SUMMARY"                     0 KB       0 lignes
. . export : "SYSMAN"."MGMT_STORAGE_REPORT_ALIAS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_STORAGE_REPORT_DATA"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_STORAGE_REPORT_ISSUES"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_STORAGE_REPORT_KEYS"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SWLIB_ENTITY_PLATFORMS"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SYSTEM_CHANGES"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_SYSTEM_ERROR_LOG"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TABLE_SIZES"                     0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TARGET_AGENT_ASSOC"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TARGET_ASSOC"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TARGET_ASSOC_INSTANCE"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TARGET_ASSOC_PROP"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TARGET_ASSOC_PROP_DEFS"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TARGET_BASELINES"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TARGET_BASELINES_DATA"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TARGET_DELETE_CALLBACKS"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TARGET_PENDING_ASSOCS"           0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TARGETS_DELETE"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEMPLATE_COPIES"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEMPLATES"                       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEST"                            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEST_DEFAULT_PROMOTION"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEST_DEFAULT_THRESHOLDS"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEST_MCOLUMNS"                   0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEST_METRIC_PROPS"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEST_METRICS"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEST_PROP"                       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEST_PROP_CHOICES"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEST_PROP_LEVEL"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEST_PROP_QUALIFIERS"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEST_PROP_UIGROUP"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEST_QUALIFIERS"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEST_TARGET_MAP"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEXTINDEX"                       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEXTINDEX_LOGS_INFO"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TEXT_INDEX_STATS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TOPO_PAGE_BG_IMAGE"              0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TOPO_PAGE_OBJ_POS"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_TOPO_PAGE_PREF"                  0 KB       0 lignes
. . export : "SYSMAN"."MGMT_UPDATE_COLL_CREDS_DATA"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_UPDATE_CREDENTIALS_DATA"         0 KB       0 lignes
. . export : "SYSMAN"."MGMT_UPDATE_OPERATIONS"               0 KB       0 lignes
. . export : "SYSMAN"."MGMT_UPDATE_OPERATIONS_DATA"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_UPDATE_OPERATIONS_DETAILS"       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_UPDATE_PDP_DATA"                 0 KB       0 lignes
. . export : "SYSMAN"."MGMT_UPDATE_PDP_DATA_COPY"            0 KB       0 lignes
. . export : "SYSMAN"."MGMT_UPDATE_PDP_DATA_MAP"             0 KB       0 lignes
. . export : "SYSMAN"."MGMT_UPDATE_PROPERTIES_DATA"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_UPDATE_TEMPLATE_DATA_MAP"        0 KB       0 lignes
. . export : "SYSMAN"."MGMT_UPDATE_THRESHOLDS_DATA"          0 KB       0 lignes
. . export : "SYSMAN"."MGMT_URL_CACHE"                       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_URL_PROXY"                       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_USER_JOBS"                       0 KB       0 lignes
. . export : "SYSMAN"."MGMT_USER_PREFERENCES"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_USER_REPORT_DEFS"                0 KB       0 lignes
. . export : "SYSMAN"."MGMT_USER_SESSION"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_USER_TARGETS"                    0 KB       0 lignes
. . export : "SYSMAN"."MGMT_USER_TEMPLATES"                  0 KB       0 lignes
. . export : "SYSTEM"."DEF$_AQCALL"                          0 KB       0 lignes
. . export : "SYSTEM"."DEF$_AQERROR"                         0 KB       0 lignes
. . export : "SYSTEM"."DEF$_CALLDEST"                        0 KB       0 lignes
. . export : "SYSTEM"."DEF$_DEFAULTDEST"                     0 KB       0 lignes
. . export : "SYSTEM"."DEF$_DESTINATION"                     0 KB       0 lignes
. . export : "SYSTEM"."DEF$_ERROR"                           0 KB       0 lignes
. . export : "SYSTEM"."DEF$_LOB"                             0 KB       0 lignes
. . export : "SYSTEM"."DEF$_ORIGIN"                          0 KB       0 lignes
. . export : "SYSTEM"."DEF$_PROPAGATOR"                      0 KB       0 lignes
. . export : "SYSTEM"."DEF$_PUSHED_TRANSACTIONS"             0 KB       0 lignes
. . export : "SYSTEM"."MVIEW$_ADV_INDEX"                     0 KB       0 lignes
. . export : "SYSTEM"."MVIEW$_ADV_PARTITION"                 0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_AUDIT_COLUMN"                 0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_COLUMN_GROUP"                 0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_CONFLICT"                     0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_DDL"                          0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_EXCEPTIONS"                   0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_EXTENSION"                    0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_FLAVOR_OBJECTS"               0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_FLAVORS"                      0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_GENERATED"                    0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_GROUPED_COLUMN"               0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_INSTANTIATION_DDL"            0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_KEY_COLUMNS"                  0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_OBJECT_PARMS"                 0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_PARAMETER_COLUMN"             0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_PRIORITY"                     0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_PRIORITY_GROUP"               0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"            0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_REPCAT"                       0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_REPCATLOG"                    0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_REPCOLUMN"                    0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_REPGROUP_PRIVS"               0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_REPOBJECT"                    0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_REPPROP"                      0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_REPSCHEMA"                    0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL"          0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_RESOLUTION"                   0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS"        0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_RUNTIME_PARMS"                0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_SITE_OBJECTS"                 0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_SITES_NEW"                    0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_SNAPGROUP"                    0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"             0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_TEMPLATE_PARMS"               0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS"           0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_TEMPLATE_SITES"               0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_TEMPLATE_TARGETS"             0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS"          0 KB       0 lignes
. . export : "SYSTEM"."REPCAT$_USER_PARM_VALUES"             0 KB       0 lignes
. . export : "SYSTEM"."SQLPLUS_PRODUCT_PROFILE"              0 KB       0 lignes
Table ma¯tre "SCOTT"."SYS_EXPORT_FULL_01" chargÚe/dÚchargÚe avec succÞs
******************************************************************************
L'ensemble de fichiers de vidage de SCOTT.SYS_EXPORT_FULL_01 est :
  F:\ORACLE\ORADATA\ORCL\FULL_DB.DMP
L'exÚcution du travail "SCOTT"."SYS_EXPORT_FULL_01" a abouti Ó 22:08:05
*/
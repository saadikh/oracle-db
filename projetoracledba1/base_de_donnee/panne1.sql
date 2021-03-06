/*==============================================================*/
/* Arrêter la base de données                                   */
/*==============================================================*/
shutdown immediate;

/*===============================================================*/
/* faire perdre des fichiers de ce tablespace, crieer un dossier */ 
/* tstestrman, déplacer le fichier dans le fichier crieer        */
/*===============================================================*/

cd %oracle_base%\oradata\%oracle_sid%
mkdir tstestrman
ren ts_testrman_1.dbf tstestrman/ts_testrman_1.dbf


/*==============================================================*/
/* Arrêter la base de données une autre fois                    */
/*==============================================================*/
shutdown immediate;


/*==============================================================*/
/* Lancer l'istance d'oracle                                    */
/*==============================================================*/
startup


/*==============================================================*/
/* modifier l'instance d'oracle                                 */
/*==============================================================*/
set ORACLE_SID=ORCL

/*==============================================================*/
/* RMAN                                                         */
/*==============================================================*/
rman


/*==============================================================*/
/* se connecter                                                 */
/*==============================================================*/
connect target sys/dbamanager@ORCL
connect target


/*==============================================================*/
/* Restaurer les fichiers de ce tablespace                      */
/*==============================================================*/
restore tablespace ts_testrman;


/*==============================================================*/
/*  Ouvrir la base, vous auri un ereure de type "le fichier     */
/*  necessite une recuperation apres defaillance materielle     */
/*==============================================================*/
alter database open;


/*==============================================================*/
/* Recouvrez la base                                            */
/*==============================================================*/
recover tablespace ts_testrman;


/*==============================================================*/
/*  Ouvrir la base                                              */
/*==============================================================*/
alter database open;

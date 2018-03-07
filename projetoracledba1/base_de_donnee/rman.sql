
/*==============================================================*/
/* créer le catalogue                                           */
/*==============================================================*/ 
connect target sys@ORCL/dbamanager

/*==============================================================*/
/* configurer certains paramètres RMAN                         */
/*==============================================================*/
show all;
CONFIGURE RETENTION POLICY TO REDUNDANCY 3;
CONFIGURE BACKUP OPTIMIZATION ON; # default
CONFIGURE DEFAULT DEVICE TYPE TO DISK; # default
CONFIGURE RETENTION POLICY 
    TO RECOVERY WINDOW OF 7 DAYS;


/*==============================================================*/
/* Backup de la base de données                                 */
/*==============================================================*/
connect system
alter system set db_recovery_file_dest_size=20G;
connect target sys@ORCL
BACKUP DATABASE INCLUDE CURRENT CONTROLFILE ;
BACKUP ARCHIVELOG ALL ; ##NOT BACKED UP SINCE TIME 'SYSDATE-1';
CROSSCHECK ARCHIVELOG ALL;
backup database;
BACKUP ARCHIVELOG ALL;

/*==============================================================*/
/* Sauvegarde du fichier de contrôle                           */
/*==============================================================*/
configure controlfile autobackup on ;
configure controlfile autobackup format for device type disk to 'F:\oracle\save\rman\cf%F' ;
configure device type disk backup type to compressed backupset ;

/*==============================================================*/
/* Ajouter un tablespace à la base et effectuer les sauvegardes */ 
/* appropriés y compris  le fichier de contrôle                 */
/*==============================================================*/
create tablespace ts_testrman
datafile 'F:\oracle\oradata\orcl\tstab\ts_testrman_1.dbf' size 5M;
backup tablespace ts_testrman;

/*==============================================================*/
/* afficher la liste des copies de sauvegarde                   */
/*==============================================================*/
list backup;

/*==============================================================*/
/* Validation de la base entière et les fichier redo archivés   */
/*==============================================================*/
backup validate database archivelog all ;

/*==============================================================*/
/*Vérifier qu’une restauration sera fait sans problèmes         */
/*==============================================================*/
restore validate database ;
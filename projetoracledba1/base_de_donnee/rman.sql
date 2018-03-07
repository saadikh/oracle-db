
/*==============================================================*/
/* cr�er le catalogue                                           */
/*==============================================================*/ 
connect target sys@ORCL/dbamanager

/*==============================================================*/
/* configurer certains param�tres RMAN                         */
/*==============================================================*/
show all;
CONFIGURE RETENTION POLICY TO REDUNDANCY 3;
CONFIGURE BACKUP OPTIMIZATION ON; # default
CONFIGURE DEFAULT DEVICE TYPE TO DISK; # default
CONFIGURE RETENTION POLICY 
    TO RECOVERY WINDOW OF 7 DAYS;


/*==============================================================*/
/* Backup de la base de donn�es                                 */
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
/* Sauvegarde du fichier de contr�le                           */
/*==============================================================*/
configure controlfile autobackup on ;
configure controlfile autobackup format for device type disk to 'F:\oracle\save\rman\cf%F' ;
configure device type disk backup type to compressed backupset ;

/*==============================================================*/
/* Ajouter un tablespace � la base et effectuer les sauvegardes */ 
/* appropri�s y compris  le fichier de contr�le                 */
/*==============================================================*/
create tablespace ts_testrman
datafile 'F:\oracle\oradata\orcl\tstab\ts_testrman_1.dbf' size 5M;
backup tablespace ts_testrman;

/*==============================================================*/
/* afficher la liste des copies de sauvegarde                   */
/*==============================================================*/
list backup;

/*==============================================================*/
/* Validation de la base enti�re et les fichier redo archiv�s   */
/*==============================================================*/
backup validate database archivelog all ;

/*==============================================================*/
/*V�rifier qu�une restauration sera fait sans probl�mes         */
/*==============================================================*/
restore validate database ;
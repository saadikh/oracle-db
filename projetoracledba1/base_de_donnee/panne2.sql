/*==============================================================*/
/* Arrêter la base de données                                   */
/*==============================================================*/
shutdown immediate;
/* ---> Resultat
Base de donnÚes fermÚe.
Base de donnÚes dÚmontÚe.
Instance ORACLE arrÛtÚe.
*/

/*===============================================================*/
/* faire perdre des fichiers de ce tablespace, crieer un dossier */ 
/* tstestrman, déplacer le fichier dans le fichier crieer        */
/*===============================================================*/

mv F:\oracle\oradata\orcl\orclcontrol01.ctl   F:\oracle\oradata\orcl\ctr\ctrcontrol01.ctl
/* ---> Resultat



/*==============================================================*/
/* Lancer l'istance d'oracle                                    */
/*==============================================================*/
startup
/* ---> Resultat
Instance ORACLE lancÚe.

Total System Global Area 1670221824 bytes
Fixed Size                  2176328 bytes
Variable Size            1140853432 bytes
Database Buffers          520093696 bytes
Redo Buffers                7098368 bytes
Base de donnÚes montÚe.
Base de donnÚes ouverte.
*/


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
/* ---> Resultat
connectÚ Ó la base de donnÚes cible : ORCL (DBID=1470643473)
*/


/*==============================================================*/
/* Restaurer les fichiers de ce tablespace                      */
/*==============================================================*/
restore controlfile to 'F:\oracle\oradata\orcl\ctr\CONTROL01.CTL';
/* ---> Resultat
DÚmarrage de restore dans 05/05/17
utilisation du canal ORA_DISK_1

canal ORA_DISK_1 : dÚmarrage de la restauration de l'ensemble de sauvegarde des fichiers de donnÚes
canal ORA_DISK_1 : restauration de fichier de contr¶le
nom de fichier de sortie=F:\ORACLE\ORADATA\ORCL\CTR\CONTROL01.CTL
canal ORA_DISK_1 : lecture de l'ÚlÚment de sauvegarde F:\ORACLE\SAVE\RMAN\CFC-1470643473-20170505-04
canal ORA_DISK_1 : descripteur d'ÚlÚment=F:\ORACLE\SAVE\RMAN\CFC-1470643473-20170505-04 balise=TAG20170505T120128
canal ORA_DISK_1 : restauration de l'ÚlÚment de sauvegarde 1
canal ORA_DISK_1 : restauration terminÚe, temps ÚcoulÚ : 00:00:01
Fin de restore dans 05/05/17
*/


/*==============================================================*/
/*  Ouvrir la base, vous auri un ereure de type "le fichier     */
/*  necessite une recuperation apres defaillance materielle     */
/*==============================================================*/
alter database open;
/* ---> Resultat
RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-03002: Úchec de la commande alter db Ó 05/05/2017 12:38:24
ORA-01531: une base de donnÚes est dÚjÓ ouverte dans cette instance
*/


/*==============================================================*/
/* Recouvrez la base                                            */
/*==============================================================*/
recover controlfile to 'F:\oracle\oradata\orcl\CONTROL01.CTL';
/* ---> Resultat

/*==============================================================*/
/*  Ouvrir la base                                              */
/*==============================================================*/
alter database open;
/* ---> Resultat

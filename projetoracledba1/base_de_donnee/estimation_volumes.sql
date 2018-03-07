-- URL            : miageprojet2.unice.fr
-- Project        : Gestion d'un cabinet médical
-- Author         : Mamadou
-- Date           : 01/05/2017
-- Purpose        : estimer le volume qui va etre occuper par les tables

SET SERVEROUTPUT ON

-- Table Clinique
DECLARE
	v_used_bytes NUMBER(10);
	v_Allocated_Bytes NUMBER(10);
	v_type sys.create_table_cost_columns;
BEGIN
	v_Type := sys.create_table_cost_columns(
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('VARCHAR2',50),
	sys.create_table_cost_colinfo('VARCHAR2',254),
	sys.create_table_cost_colinfo('VARCHAR2',30),
	sys.create_table_cost_colinfo('VARCHAR2',30),
	sys.create_table_cost_colinfo('VARCHAR2',30),
	sys.create_table_cost_colinfo('VARCHAR2',100));
	DBMS_SPACE.CREATE_TABLE_COST('USERS',v_Type,10, 10,v_used_Bytes,v_Allocated_Bytes);
	DBMS_OUTPUT.PUT_LINE('Table Clinique ==> Used Bytes: ' || TO_CHAR(v_used_Bytes) || ' ,
	Allocated Bytes: ' || TO_CHAR(v_Allocated_Bytes));
END;
/

-- Table ExamenClinique
DECLARE
v_used_bytes NUMBER(10);
v_Allocated_Bytes NUMBER(10);
v_type sys.create_table_cost_columns;
BEGIN
	v_Type := sys.create_table_cost_columns(
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('VARCHAR2',254),
	sys.create_table_cost_colinfo('VARCHAR2',254));
	DBMS_SPACE.CREATE_TABLE_COST('USERS',v_Type,10, 10,v_used_Bytes,v_Allocated_Bytes);
	DBMS_OUTPUT.PUT_LINE('Table ExamenClinique ==> Used Bytes: ' || TO_CHAR(v_used_Bytes) || '
	, Allocated Bytes: ' || TO_CHAR(v_Allocated_Bytes));
END;
/

-- Table Médecin
DECLARE
v_used_bytes NUMBER(10);
v_Allocated_Bytes NUMBER(10);
v_type sys.create_table_cost_columns;
BEGIN
	v_Type := sys.create_table_cost_columns(
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('VARCHAR2',30),
	sys.create_table_cost_colinfo('VARCHAR2',30),
	sys.create_table_cost_colinfo('VARCHAR2',100),
	sys.create_table_cost_colinfo('NUMBER',10),
	sys.create_table_cost_colinfo('VARCHAR2',20));
	DBMS_SPACE.CREATE_TABLE_COST('USERS',v_Type,10, 10,v_used_Bytes,v_Allocated_Bytes);
	DBMS_OUTPUT.PUT_LINE('Used Bytes: ' || TO_CHAR(v_used_Bytes) || ' Allocated Bytes: ' ||
	TO_CHAR(v_Allocated_Bytes));
END;
/

-- Table Patient
DECLARE
v_used_bytes NUMBER(10);
v_Allocated_Bytes NUMBER(10);
v_type sys.create_table_cost_columns;
BEGIN
	v_Type := sys.create_table_cost_columns(
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('VARCHAR2',30),
	sys.create_table_cost_colinfo('VARCHAR2',30),
	sys.create_table_cost_colinfo('DATE',NULL),
	sys.create_table_cost_colinfo('INTEGER',3),
	sys.create_table_cost_colinfo('SMALLINT',1),
	sys.create_table_cost_colinfo('INTEGER',2),
	sys.create_table_cost_colinfo('INTEGER',2),
	sys.create_table_cost_colinfo('VARCHAR2',254),
	sys.create_table_cost_colinfo('VARCHAR2',254),
	sys.create_table_cost_colinfo('VARCHAR2',30),
	sys.create_table_cost_colinfo('VARCHAR2',30),
	sys.create_table_cost_colinfo('VARCHAR2',30),
	sys.create_table_cost_colinfo('INTEGER',2),
	sys.create_table_cost_colinfo('VARCHAR2',100));
	DBMS_SPACE.CREATE_TABLE_COST('USERS',v_Type,
	10, 10,v_used_Bytes,v_Allocated_Bytes);
	DBMS_OUTPUT.PUT_LINE('Used Bytes: ' || TO_CHAR(v_used_Bytes) || ' Allocated Bytes: ' ||
	TO_CHAR(v_Allocated_Bytes));
END;
/

-- Table Affectation
DECLARE
v_used_bytes NUMBER(10);
v_Allocated_Bytes NUMBER(10);
v_type sys.create_table_cost_columns;
BEGIN
	v_Type := sys.create_table_cost_columns(
	sys.create_table_cost_colinfo('NUMBER',10),
	sys.create_table_cost_colinfo('NUMBER',10),
	sys.create_table_cost_colinfo('VARCHAR2',30));
	DBMS_SPACE.CREATE_TABLE_COST('USERS',v_Type,
	10, 10,v_used_Bytes,v_Allocated_Bytes);
	DBMS_OUTPUT.PUT_LINE('Used Bytes: ' || TO_CHAR(v_used_Bytes) || ' Allocated Bytes: ' ||
	TO_CHAR(v_Allocated_Bytes));
END;
/

-- Table Prinscription
DECLARE
v_used_bytes NUMBER(10);
v_Allocated_Bytes NUMBER(10);
v_type sys.create_table_cost_columns;
BEGIN
	v_Type := sys.create_table_cost_columns(
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('NUMBER',10),
	sys.create_table_cost_colinfo('NUMBER',10));
	DBMS_SPACE.CREATE_TABLE_COST('USERS',v_Type,
	10, 10,v_used_Bytes,v_Allocated_Bytes);
	DBMS_OUTPUT.PUT_LINE('Used Bytes: ' || TO_CHAR(v_used_Bytes) || ' Allocated Bytes: ' ||
	TO_CHAR(v_Allocated_Bytes));
END;
/

-- Table RendezVous
DECLARE
v_used_bytes NUMBER(10);
v_Allocated_Bytes NUMBER(10);
v_type sys.create_table_cost_columns;
BEGIN
	v_Type := sys.create_table_cost_columns(
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('DATE',NULL),
	sys.create_table_cost_colinfo('DATE', NULL));
	DBMS_SPACE.CREATE_TABLE_COST('USERS',v_Type,
	10, 10,v_used_Bytes,v_Allocated_Bytes);
	DBMS_OUTPUT.PUT_LINE('Used Bytes: ' || TO_CHAR(v_used_Bytes) || ' Allocated Bytes: ' ||
	TO_CHAR(v_Allocated_Bytes));
END;
/

-- Table Visite
DECLARE
v_used_bytes NUMBER(10);
v_Allocated_Bytes NUMBER(10);
v_type sys.create_table_cost_columns;
BEGIN
	v_Type := sys.create_table_cost_columns(
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('DATE',NULL),
	sys.create_table_cost_colinfo('VARCHAR2', 254));
	DBMS_SPACE.CREATE_TABLE_COST('USERS',v_Type,
	10, 10,v_used_Bytes,v_Allocated_Bytes);
	DBMS_OUTPUT.PUT_LINE('Used Bytes: ' || TO_CHAR(v_used_Bytes) || ' Allocated Bytes: ' ||
	TO_CHAR(v_Allocated_Bytes));
END;
/

-- Table Ordonnance
DECLARE
v_used_bytes NUMBER(10);
v_Allocated_Bytes NUMBER(10);
v_type sys.create_table_cost_columns;
BEGIN
	v_Type := sys.create_table_cost_columns(
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('DATE',NULL),
	sys.create_table_cost_colinfo('DATE',NULL),
	sys.create_table_cost_colinfo('VARCHAR2', 254));
	DBMS_SPACE.CREATE_TABLE_COST('USERS',v_Type,
	10, 10,v_used_Bytes,v_Allocated_Bytes);
	DBMS_OUTPUT.PUT_LINE('Used Bytes: ' || TO_CHAR(v_used_Bytes) || ' Allocated Bytes: ' ||
	TO_CHAR(v_Allocated_Bytes));
END;
/

-- Table Médicament
DECLARE
v_used_bytes NUMBER(10);
v_Allocated_Bytes NUMBER(10);
v_type sys.create_table_cost_columns;
BEGIN
	v_Type := sys.create_table_cost_columns(
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('VARCHAR2',100),
	sys.create_table_cost_colinfo('VARCHAR2', 50));
	DBMS_SPACE.CREATE_TABLE_COST('USERS',v_Type,
	10, 10,v_used_Bytes,v_Allocated_Bytes);
	DBMS_OUTPUT.PUT_LINE('Used Bytes: ' || TO_CHAR(v_used_Bytes) || ' Allocated Bytes: ' ||
	TO_CHAR(v_Allocated_Bytes));
END;
/

-- Table Facture
DECLARE
v_used_bytes NUMBER(10);
v_Allocated_Bytes NUMBER(10);
v_type sys.create_table_cost_columns;
BEGIN
	v_Type := sys.create_table_cost_columns(
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('INTEGER',10),
	sys.create_table_cost_colinfo('DATE',NULL),
	sys.create_table_cost_colinfo('FLOAT',10),
	sys.create_table_cost_colinfo('FLOAT', 10));
	DBMS_SPACE.CREATE_TABLE_COST('USERS',v_Type,
	10, 10,v_used_Bytes,v_Allocated_Bytes);
	DBMS_OUTPUT.PUT_LINE('Used Bytes: ' || TO_CHAR(v_used_Bytes) || ' Allocated Bytes: ' ||
	TO_CHAR(v_Allocated_Bytes));
END;
/

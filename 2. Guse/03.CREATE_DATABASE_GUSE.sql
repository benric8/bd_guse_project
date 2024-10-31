/***********************************************************************************************   
AUTOR		:	rbendezuv
PROPOSITO	:	Creación de la base de datos Servicios Externos
CREADO 		:	15/06/2024
ALCANCE		:	Proyecto Gestion de usuarios
   
************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    rbendezuv          15/06/2024      Creación de base de datos
************************************************************************************************/ 

/* Script para creación de nueva BD */

CREATE DATABASE "SERVICIOS_EXTERNOS"
    WITH 
    OWNER = "usrServiciosExternos"
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = "TBS_SERVICIOS_EXTERNOS"
    CONNECTION LIMIT = -1;
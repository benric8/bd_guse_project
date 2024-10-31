/***********************************************************************************************   
AUTOR		:	rbendezuv
PROPOSITO	:	Creación de TABLESPACE donde se alamcenaran los objetos del proyecto Gestion de usuarios Externos
CREADO 		:	15/06/2024
ALCANCE		:	Proyecto botón de pánico
   
************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    rbendezuv          15/06/2024      Creación de objetos base
************************************************************************************************/ 
/* En LOCATION de tablespace colocar la ruta donde se almacenara el tablespace tbs_botonpanico */
  
/* Script para crear tablespace */

CREATE TABLESPACE "TBS_SERVICIOS_EXTERNOS" OWNER "usrServiciosExternos" LOCATION '/voldata/dbdata/pgsql/serviciosexternos'
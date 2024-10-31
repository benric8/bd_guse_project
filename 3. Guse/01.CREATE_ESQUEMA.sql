/***********************************************************************************************   
AUTOR		:	rbendezuv
PROPOSITO	:	Creación de esquema de serviciosexternos
CREADO 		:	15/06/2024
ALCANCE		:	Proyecto botón de pánico

************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    rbendezuv          15/06/2024      Creación de esquema de serviciosexternos en la base de datos SERVICIOS_EXTERNOS
************************************************************************************************/ 
/* Script para crear un esquema en nueva BD */

CREATE SCHEMA IF NOT EXISTS serviciosexternos AUTHORIZATION "usrServiciosExternos";
COMMENT ON SCHEMA serviciosexternos IS 'Esquema para  proyecto serviciosexternos';
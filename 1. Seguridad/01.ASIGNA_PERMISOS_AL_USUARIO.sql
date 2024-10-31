/***********************************************************************************************   
AUTOR			:	RBENDEZUV
PROPOSITO		:	Asigna permisos al usuario de conexión de BD Seguridad
CREADO 			:	30/11/2023 12:00
VERSION     	: 	1.0
BASE DE DATOS	:	Seguridad
   
************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    RBENDEZUV         30/11/2023 12:00      Asigna permisos al usuario de conexión  a seguridad de conculta-siga-ws
************************************************************************************************/ 
GRANT ALL ON SCHEMA seguridad TO uc_guseapi_seguridad;
GRANT SELECT ON ALL TABLES IN SCHEMA seguridad TO uc_guseapi_seguridad;
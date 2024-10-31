/***********************************************************************************************   
AUTOR		:	rbendezuv
PROPOSITO	:	Asignar permisos a usuario de conexión con BD SERVICIOS_EXTERNOS esquema serviciosexternos
CREADO 		:	31/05/2024
ALCANCE		:	servicio web rest gestion de usuarios externos
   
************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    rbendezuv           31/05/2024     Asignar permisos a usuario de conexión con BD SERVICIOS EXTERNOS
************************************************************************************************/ 
/* */
GRANT ALL ON SCHEMA serviciosexternos TO uc_guseapi_serviciosexternos;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA serviciosexternos TO uc_guseapi_serviciosexternos;
GRANT USAGE,SELECT ON ALL SEQUENCES IN SCHEMA serviciosexternos TO uc_guseapi_serviciosexternos;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA serviciosexternos TO uc_guseapi_serviciosexternos;
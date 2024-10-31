/***********************************************************************************************   
AUTOR		:	rbendezuv
PROPOSITO	:	Creción de usuario de conexión con BD SERVICIOS_EXTERNOS
CREADO 		:	31/05/2024
ALCANCE		:	Servicio web rest gestion de usuarios externos
OBSERVACIONES:  Ejecutar el siguiente script con un usuario que tenga permisos de creacion de usuarios en el esquema serviciosexternos
   				Reemplazar 123456 por una contraseña personalizada
************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    rbendezuv          31/05/2024     Creción de usuario de conexión con BD SERVICIOS_EXTERNOS
************************************************************************************************/ 
CREATE USER "uc_guseapi_serviciosexternos" WITH PASSWORD '123456';
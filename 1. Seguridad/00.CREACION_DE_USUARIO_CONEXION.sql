/***********************************************************************************************   
AUTOR			:	RBENDEZUV
PROPOSITO		:	Creción de usuario uc_consiga_seguridad
CREADO 			:	10/05/2024 12:00
VERSION     	: 	1.0
BASE DE DATOS	:	Seguridad
OBSERVACIONES	:  	1. Ejecutar el siguiente script con un usuario que tenga permisos de creacion de usuarios en la base de datos Seguridad
					2. El responsable de la base de datos del ambiente en la que se ejecuta el script debe determinar la clave 
					3. La clave debe ser reemplazado en el texto "123456"
************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    RBENDEZUV         10/05/2024 12:00      Creción de USUARIO de conexión a BD Seguridad
************************************************************************************************/ 
CREATE USER uc_guseapi_seguridad WITH PASSWORD '123456';


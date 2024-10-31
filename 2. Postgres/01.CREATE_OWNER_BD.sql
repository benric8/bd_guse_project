/***********************************************************************************************   
AUTOR		:	rbendezuv
PROPOSITO	:	Creación de usuario propietario de los objetos del proyecto Gestion de usuarios externos
CREADO 		:	15/06/2024
ALCANCE		:	Proyecto Gestion de usuarios externos
   
************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    rbendezuv          15/06/2024      Creación de objetos base
************************************************************************************************/ 
/* Script para creación de rol/usuario propietarío de la DB, reemplazar "123456" por su clave personalizada */

CREATE ROLE "usrServiciosExternos" WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  PASSWORD '123456';
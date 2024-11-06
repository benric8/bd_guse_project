/***********************************************************************************************   
AUTOR			:	RBENDEZUV	
PROPOSITO		:	Asignar roles a los usuarios que consumiran el api
CREADO 			:	03/06/2024 12:00
VERSION     	: 	1.0
BASE DE DATOS	:	Seguridad
OBSERVACION		:	El DBA debe asignar el valor correspondiente a las variables 
					(var_c_aud_uidred, var_c_aud_pc, var_c_aud_mcaddr) debido a que 
					esos datos no se pueden obtener del motor de base de datos.
************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    RBENDEZUV        03/06/2024 12:00      Asignar roles a los usuarios
************************************************************************************************/
DO $$
	DECLARE var_f_aud timestamp := localtimestamp;
	DECLARE var_b_aud CHARACTER varying(1) := 'I';
	DECLARE var_c_aud_uid CHARACTER varying(30) := CURRENT_USER;
	DECLARE var_c_aud_uidred CHARACTER varying(30) := 'PC-DESARROLLO';
	DECLARE var_c_aud_pc CHARACTER varying(30) := 'PC-DESARROLLO';
	DECLARE var_c_aud_ip CHARACTER varying(15) := cast(host(inet_client_addr()) as varchar(15));
	DECLARE var_c_aud_mcaddr CHARACTER varying(17) := '00-09-00-00-00-00';
BEGIN
	/*Registrar Roles de usuario USR_00003*/
	IF NOT EXISTS(SELECT 1 FROM seguridad.mae_rol_usuario WHERE n_rol=(select n_rol from seguridad.mae_rol where c_rol = 'AGUSE01')
							AND n_usuario=(select n_usuario from seguridad.mae_usuario where c_usuario = 'USR_00003'))
	THEN 

		INSERT INTO seguridad.mae_rol_usuario
		( n_rol_usuario, n_rol, n_usuario, l_activo,f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr) 
		VALUES (nextval('seguridad.mae_rol_usuario_seq'), 
		(select n_rol from seguridad.mae_rol where c_rol = 'AGUSE01'),
		(select n_usuario from seguridad.mae_usuario where c_usuario = 'USR_00003'),
		'1', 
		 var_f_aud,
		 var_b_aud, 
		 var_c_aud_uid,
		 var_c_aud_uidred, 
		 var_c_aud_pc,
		 var_c_aud_ip,
		 var_c_aud_mcaddr);
		 
		RAISE NOTICE 'Se asigno el rol AGUSE01 al usuario USR_00003';
	ELSE
		RAISE NOTICE 'Ya estaba asignado el rol AGUSE01 al usuario USR_00003';
	END IF;

	/*Registrar Roles de usuario USR_00004*/
	IF NOT EXISTS(SELECT 1 FROM seguridad.mae_rol_usuario WHERE n_rol=(select n_rol from seguridad.mae_rol where c_rol = 'GUSEWS01')
							AND n_usuario=(select n_usuario from seguridad.mae_usuario where c_usuario = 'USR_00004'))
	THEN 

		INSERT INTO seguridad.mae_rol_usuario
		( n_rol_usuario, n_rol, n_usuario, l_activo,f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr) 
		VALUES (nextval('seguridad.mae_rol_usuario_seq'), 
		(select n_rol from seguridad.mae_rol where c_rol = 'GUSEWS01'),
		(select n_usuario from seguridad.mae_usuario where c_usuario = 'USR_00004'),
		'1', 
		 var_f_aud,
		 var_b_aud, 
		 var_c_aud_uid,
		 var_c_aud_uidred, 
		 var_c_aud_pc,
		 var_c_aud_ip,
		 var_c_aud_mcaddr);
		 
		RAISE NOTICE 'Se asigno el rol GUSEWS01 al usuario USR_00004';
	ELSE
		RAISE NOTICE 'Ya estaba asignado el rol GUSEWS01 al usuario USR_00004';
	END IF;
END $$;
	
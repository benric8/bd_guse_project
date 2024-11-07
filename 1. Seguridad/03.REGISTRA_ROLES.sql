/***********************************************************************************************
AUTOR			:	RBENDEZUV
PROPOSITO		:	Registrar los roles de ws usuarios-servicios-externos-api-rest
CREADO 			:	03/06/2024 12:00
VERSION     	: 	1.0
BASE DE DATOS	:	Seguridad
OBSERVACION		:	El DBA debe asignar el valor correspondiente a las variables
					(var_c_aud_uidred, var_c_aud_pc, var_c_aud_mcaddr) debido a que
					esos datos no se pueden obtener del motor de base de datos.
************************************************************************************************
ID	  AUTOR	            FECHA	     		PROPOSITO
--    --------------	------------		------------------------------------------------------------
@1    RBENDEZUV         03/06/2024 12:00      Registrar accesos para conumo de ws de usuarios-servicios-externos-api-rest
************************************************************************************************/

/* REGISTRA ROLES DE ACCESOS A MÉTODOS */
DO $$
	DECLARE var_f_aud timestamp := localtimestamp;
	DECLARE var_b_aud CHARACTER varying(1) := 'I';
	DECLARE var_c_aud_uid CHARACTER varying(30) := CURRENT_USER;
	DECLARE var_c_aud_uidred CHARACTER varying(30) := 'PC-DESARROLLO';
	DECLARE var_c_aud_pc CHARACTER varying(30) := 'PC-DESARROLLO';
	DECLARE var_c_aud_ip CHARACTER varying(15) := cast(host(inet_client_addr()) as varchar(15));
	DECLARE var_c_aud_mcaddr CHARACTER varying(17) := '00-09-00-00-00-00';
BEGIN
IF NOT EXISTS(SELECT 1 FROM seguridad.mae_rol WHERE c_rol='AGUSE01')
	THEN
		INSERT INTO seguridad.mae_rol(
			n_rol,c_rol,x_rol,x_descripcion,l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES(
			nextval('seguridad.mae_rol_seq'),'AGUSE01','Administrador usuarios-servicios-externos-api-rest',
			'Rol que se otorga al usuario administrador que consumira el api', '1',
			var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
 		 RAISE NOTICE 'Se creo el rol AGUSE01';
	ELSE
		RAISE NOTICE 'Ya estaba registrado el rol AGUSE01';
	END IF;
IF NOT EXISTS(SELECT 1 FROM seguridad.mae_rol WHERE c_rol='AGUSE02')
	THEN
		INSERT INTO seguridad.mae_rol(
			n_rol,c_rol,x_rol,x_descripcion,l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES(
			nextval('seguridad.mae_rol_seq'),'AGUSE02','Administrador de clientes GUSE',
			'Rol que permite gestionar los metodos de gestion de clientes', '1',
			var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
 		 RAISE NOTICE 'Se creo el rol AGUSE02';
	ELSE
		RAISE NOTICE 'Ya estaba registrado el rol AGUSE02';
	END IF;
IF NOT EXISTS(SELECT 1 FROM seguridad.mae_rol WHERE c_rol='GUSEWS01')
	THEN
		INSERT INTO seguridad.mae_rol(
			n_rol,c_rol,x_rol,x_descripcion,l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES(
			nextval('seguridad.mae_rol_seq'),'GUSEWS01','Rol para el servicio RENIEC',
			'Rol para obtener la lista de clientes con cuota en Reniec', '1',
			var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
 		 RAISE NOTICE 'Se creo el rol GUSEWS01';
	ELSE
		RAISE NOTICE 'Ya estaba registrado el rol GUSEWS01';
	END IF;
COMMIT;
END $$;
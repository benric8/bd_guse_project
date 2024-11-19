/**************************************************************************************************************************
 Objeto          : "serviciosexternos".mae_perfil, "serviciosexternos".mae_opcion, "serviciosexternos".mae_opcion_perfil, "serviciosexternos".mae_usuario
 Tipo de Objeto  : TABLE
 Proposito       : Agregar configuración para opciones administrativas de Usuarios Servicios Externos
 Autor           : Richard Bendezu Villena
 Creado el       : 15/07/2024
 Version         : 1.0
 Bitacora        :   
 Id	 Responsable-- Fecha ---- Hora- 	Version	--------Modificacion ----------------------------------------
 === ============= ========== ===== =======	============================================================
 1	 ATAVARAC	  15/07/2024	 11:00	1.0		Agregar configuración para opciones administrativas
**************************************************************************************************************************/
DO $$
	DECLARE var_f_aud timestamp := localtimestamp;
	DECLARE var_b_aud CHARACTER varying(1) := 'I';
	DECLARE var_c_aud_uid CHARACTER varying(30) := CURRENT_USER;
	DECLARE var_c_aud_uidred CHARACTER varying(30) := 'PC-DESARROLLO';
	DECLARE var_c_aud_pc CHARACTER varying(30) := 'PC-DESARROLLO';
	DECLARE var_c_aud_ip CHARACTER varying(15) := cast(host(inet_client_addr()) as varchar(15));
	DECLARE var_c_aud_mcaddr CHARACTER varying(17) := '00-09-00-00-00-00';
BEGIN

-- INSERTAR ENTIDAD RENIEC
	IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_entidad
               WHERE x_entidad='RENIEC'
               AND x_documento = '20295613620') THEN
	    INSERT INTO serviciosexternos.mae_entidad
	    (n_entidad, x_entidad, x_documento, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
	    VALUES(nextval('serviciosexternos.useq_mae_entidad'), 'RENIEC', '20295613620', '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
        RAISE NOTICE 'Se registro la entidad RENIEC';
    ELSE
        RAISE NOTICE 'Ya estaba registrado la entidad RENIEC';
	END IF;

-- INSERTAR SERVICIO
	IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio
               WHERE x_url='https://ws2.pide.gob.pe/Rest/RENIEC') THEN
	    INSERT INTO serviciosexternos.mae_servicio
	    (n_servicio, n_entidad, x_nombre_servicio, x_descripcion, x_url, l_actualizar_credencial, n_dias_actualizar_credencial, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
	    VALUES(nextval('serviciosexternos.useq_mae_servicio'), (SELECT n_entidad FROM serviciosexternos.mae_entidad  WHERE x_entidad='RENIEC' AND x_documento = '20295613620'), 
	    'PIDE RENIEC REST', 'Servicio de Reniec para consultar datos de reniec por la pide', 'https://ws2.pide.gob.pe/Rest/RENIEC', '1', 30, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
        RAISE NOTICE 'Se registro el servicio de la entidad RENIEC';
    ELSE
        RAISE NOTICE 'Ya estaba registrado el servicio de la entidad RENIEC';
    END IF;
END$$;
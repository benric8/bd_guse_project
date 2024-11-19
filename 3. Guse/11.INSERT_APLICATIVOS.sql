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

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL028') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'MÓDULO DE TALLER', 'Módulo de taller', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL028');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL028';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL028';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL005') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'WEB SGD', 'Cliente de SGD para consulta RENIEC', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL005');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL005';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL005';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL020') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'SISTEM INTEGRADO DE GESTIÓN ADMINISTRATIVA', 'Cliente de aplicativo SIGA', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL020');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL020';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL020';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL021') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'WEB PROCESO DE SELECCION Y EVALUACION DE PERSONAL', 'Cliente de aplicativo PSEP', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL021');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL021';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL021';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL022') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'WEB BUZÓN VIRTUAL DE SUGERENCIAS', 'Cliente de aplicativo buzón virtual de sugerencias', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL022');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL022';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL022';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL025') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'WEB MESA PARTES ELECTRÓNICA ADMINISTRATIVA', 'Cliente de aplicativo mesa partes electrónica administrativa', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL025');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL025';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL025';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL026') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'API PORTAL DE ABASTECIMIENTO', 'Cliente de aplicativo portal de abastecimiento', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL026');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL026';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL026';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CLCRS') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'CONSULTA HISTORIAL JUDICIAL', 'Aplicativo de consulta historial judicial', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CLCRS');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CLCRS';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CLCRS';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL029') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'MÓDULO DE VISITA', 'Módulo de visitas', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL029');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL029';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL029';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL030') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'MÓDULO DE QUEJAS VERBALES', 'Módulo de quejas verbales', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL030');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL030';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL030';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL031') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'MÓDULO DE TURNOS', 'Módulo de turnos', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL031');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL031';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL031';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL032') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'MÓDULO DE TRÁMITE DOCUMENTARIO', 'Módulo de trámite documentario', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL032');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL032';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL032';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL033') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'MÓDULO DE SOCIEDAD CIVIL', 'Módulo de sociedad civil', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL033');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL033';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL033';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL034') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'PÁGINA WEB QUEJAS WEB', 'Página web quejas web', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL034');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL034';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL034';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL035') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'MESA DE PARTES ELECTRÓNICA ANC', 'Mesa de partes electrónica ANC', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL035');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL035';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL035';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_aplicativo
               WHERE c_aplicativo = 'USR_CL036') THEN
    INSERT INTO serviciosexternos.mae_aplicativo
    (n_aplicativo, x_aplicativo, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr, c_aplicativo)
    VALUES(Nextval('serviciosexternos.useq_mae_aplicativo'), 'APP SERVICIOS ANC', 'App servicios ANC', '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr, 'USR_CL036');
    RAISE NOTICE 'Se insertó el aplicativo con código USR_CL036';
ELSE
    RAISE NOTICE 'Ya estaba registrado el aplicativo con código USR_CL036';
END IF;


COMMIT;
END $$;
/**************************************************************************************************************************
 Objeto          : "serviciosexternos".mae_perfil, "serviciosexternos".mae_opcion, "serviciosexternos".mae_opcion_perfil, "serviciosexternos".mae_usuario
 Tipo de Objeto  : TABLE
 Proposito       : Agregar configuración para opciones administrativas de Usuarios Servicios Externos
 Autor           : Richard Bendezu Villena
 Creado el       : 15/07/2024
 Version         : 1.0
 Bitacora        :   
 Observacion     : Reemplazar USUARIO y PASSWORD con los datos correspondientes para cada codigo de aplicativo , estos datos se encuentra en archivo properties del servicio ws servicios
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
    DECLARE var_n_consumo_cuota integer;
BEGIN

-- Script para USR_CL022
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL022')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL022'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL022';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL022';
END IF;

-- Script para USR_CL026
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL026')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL026'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL026';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL026';
END IF;

-- Script para USR_CL020
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL020')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL020'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL020';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL020';
END IF;

-- Script para USR_CLCRS
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CLCRS')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CLCRS'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CLCRS';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CLCRS';
END IF;

-- Script para USR_CL028
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL028')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL028'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL028';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL028';
END IF;

-- Script para USR_CL029
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL029')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL029'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL029';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL029';
END IF;

-- Script para USR_CL030
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL030')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL030'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL030';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL030';
END IF;

-- Script para USR_CL031
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL031')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL031'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL031';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL031';
END IF;

-- Script para USR_CL032
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL032')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL032'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL032';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL032';
END IF;

-- Script para USR_CL033
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL033')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL033'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL033';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL033';
END IF;

-- Script para USR_CL034
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL034')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL034'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL034';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL034';
END IF;

-- Script para USR_CL035
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL035')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL035'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL035';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL035';
END IF;

-- Script para USR_CL036
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL036')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL036'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL036';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL036';
END IF;

-- Script para USR_CL005
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL005')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL005'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL005';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL005';
END IF;

-- Script para USR_CL021
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL021')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL021'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL021';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL021';
END IF;

-- Script para USR_CL025
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_cliente
               WHERE n_aplicativo = (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL025')
               AND x_usuario = 'USUARIO') THEN
    var_n_consumo_cuota := nextval('serviciosexternos.useq_mov_consumo_cuota');
    INSERT INTO serviciosexternos.mov_consumo_cuota
    (n_consumo_cuota, f_consumo_cuota, n_cuota_consumida, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (var_n_consumo_cuota, NULL, 0, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);

    INSERT INTO serviciosexternos.mae_cliente
    (n_cliente, n_persona, n_aplicativo, n_consumo_cuota, x_usuario, x_clave, n_cuota, x_usuario_registra, x_usuario_actualiza, f_actualizacion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
    VALUES (nextval('serviciosexternos.useq_mae_cliente'), 1, (SELECT n_aplicativo FROM serviciosexternos.mae_aplicativo WHERE c_aplicativo = 'USR_CL025'), var_n_consumo_cuota, 'USUARIO', 'PASSWORD', 1500, 'ADMIN', NULL, NULL, '1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el cliente USUARIO para el aplicativo con código USR_CL025';
ELSE
    RAISE NOTICE 'Ya estaba registrado el cliente USUARIO para el aplicativo con código USR_CL025';
END IF;


END$$;


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
    DECLARE var_n_servicio INTEGER;
BEGIN

var_n_servicio := (SELECT n_servicio FROM serviciosexternos.mae_servicio WHERE x_url='https://ws2.pide.gob.pe/Rest/RENIEC');

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL005' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL005') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL005 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL005 con el servicio  PIDE RENIEC REST';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL020' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL020') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL020 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL020 con el servicio  PIDE RENIEC REST';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL021' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL021') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL021 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL021 con el servicio  PIDE RENIEC REST';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL022' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL022') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL022 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL022 con el servicio  PIDE RENIEC REST';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL025' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL025') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL025 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL025 con el servicio  PIDE RENIEC REST';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL026' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL026') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL026 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL026 con el servicio  PIDE RENIEC REST';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL028' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL028') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL028 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL028 con el servicio  PIDE RENIEC REST';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL029' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL029') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL029 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL029 con el servicio  PIDE RENIEC REST';
END IF;
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL030' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL030') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL030 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL030 con el servicio  PIDE RENIEC REST';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL031' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL031') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL031 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL031 con el servicio  PIDE RENIEC REST';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL032' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL032') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL032 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL032 con el servicio  PIDE RENIEC REST';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL033' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL033') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL033 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL033 con el servicio  PIDE RENIEC REST';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL034' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL034') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL034 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL034 con el servicio  PIDE RENIEC REST';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL035' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL035') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL035 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL035 con el servicio  PIDE RENIEC REST';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL036' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CL036') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CL036 con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CL036 con el servicio  PIDE RENIEC REST';
END IF;

IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_servicio_aplicativo
               WHERE n_aplicativo=(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CLCRS' ) 
               AND n_servicio = var_n_servicio) THEN
   INSERT INTO serviciosexternos.mae_servicio_aplicativo
(n_servicio_aplicativo, n_servicio, n_aplicativo, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_servicio_aplicativo'), var_n_servicio,(select n_aplicativo from serviciosexternos.mae_aplicativo where c_aplicativo = 'USR_CLCRS') , '1',var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se relaciono el aplicativo USR_CLCRS con el servicio  PIDE RENIEC REST';
ELSE
    RAISE NOTICE 'Ya estaba relacionado el aplicativo USR_CLCRS con el servicio  PIDE RENIEC REST';
END IF;


END$$;
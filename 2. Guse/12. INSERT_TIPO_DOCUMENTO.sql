/***********************************************************************************************   
AUTOR		:	rbendezuv
PROPOSITO	:	Registrar datos iniciales de MAE_TIPO_DOCUMENTO
CREADO 		:	02/06/2024
ALCANCE		:	Proyecto servicio web rest gestion de usuarios externos
OBSERVACION	:	El DBA debe asignar el valor correspondiente a las variables 
				(var_c_aud_uidred, var_c_aud_pc, var_c_aud_mcaddr) debido a que 
				esos datos no se pueden obtener del motor de base de datos.
************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    rruiz             27/02/2023      Registrar datos iniciales de MAE_TIPO_DOCUMENTO
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

-- SIN DOCUMENTO
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_tipo_documento 
               WHERE UPPER(TRIM(x_tipo_documento)) = 'SIN DOCUMENTO'
                 AND UPPER(TRIM(x_abreviatura)) = '<NINGUNO>') THEN
    INSERT INTO serviciosexternos.mae_tipo_documento(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr) 
    VALUES ('0', 'SIN DOCUMENTO', '<Ninguno>', '1', var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se inserto el tipo de documento SIN DOCUMENTO';
ELSE
    RAISE NOTICE 'Ya estaba registrado el tipo de documento SIN DOCUMENTO';
END IF;

-- DOCUMENTO NACIONAL DE IDENTIDAD
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_tipo_documento 
               WHERE UPPER(TRIM(x_tipo_documento)) = 'DOCUMENTO NACIONAL DE IDENTIDAD'
                 AND UPPER(TRIM(x_abreviatura)) = 'D.N.I') THEN
    INSERT INTO serviciosexternos.mae_tipo_documento(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr) 
    VALUES ('1', 'DOCUMENTO NACIONAL DE IDENTIDAD', 'D.N.I', '1', var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se inserto el tipo de documento DOCUMENTO NACIONAL DE IDENTIDAD';
ELSE
    RAISE NOTICE 'Ya estaba registrado el tipo de documento DOCUMENTO NACIONAL DE IDENTIDAD';
END IF;

-- REGISTRO UNICO DEL CONTRIBUYENTE
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_tipo_documento 
               WHERE UPPER(TRIM(x_tipo_documento)) = 'REGISTRO UNICO DEL CONTRIBUYENTE'
                 AND UPPER(TRIM(x_abreviatura)) = 'R.U.C') THEN
    INSERT INTO serviciosexternos.mae_tipo_documento(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr) 
    VALUES ('2', 'REGISTRO UNICO DEL CONTRIBUYENTE', 'R.U.C', '1', var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se inserto el tipo de documento REGISTRO UNICO DEL CONTRIBUYENTE';
ELSE
    RAISE NOTICE 'Ya estaba registrado el tipo de documento REGISTRO UNICO DEL CONTRIBUYENTE';
END IF;

-- PASAPORTE
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_tipo_documento 
               WHERE UPPER(TRIM(x_tipo_documento)) = 'PASAPORTE'
                 AND UPPER(TRIM(x_abreviatura)) = 'P.S') THEN
    INSERT INTO serviciosexternos.mae_tipo_documento(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr) 
    VALUES ('5', 'PASAPORTE', 'P.S', '1', var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se inserto el tipo de documento PASAPORTE';
ELSE
    RAISE NOTICE 'Ya estaba registrado el tipo de documento PASAPORTE';
END IF;

-- CARNET DE EXTRANJERIA
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_tipo_documento 
               WHERE UPPER(TRIM(x_tipo_documento)) = 'CARNET DE EXTRANJERIA'
                 AND UPPER(TRIM(x_abreviatura)) = 'C.E') THEN
    INSERT INTO serviciosexternos.mae_tipo_documento(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr) 
    VALUES ('6', 'CARNET DE EXTRANJERIA', 'C.E', '1', var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se inserto el tipo de documento CARNET DE EXTRANJERIA';
ELSE
    RAISE NOTICE 'Ya estaba registrado el tipo de documento CARNET DE EXTRANJERIA';
END IF;

-- CARNET DE TRABAJO
IF NOT EXISTS (SELECT 1 
               FROM serviciosexternos.mae_tipo_documento 
               WHERE UPPER(TRIM(x_tipo_documento)) = 'CARNET DE TRABAJO'
                 AND UPPER(TRIM(x_abreviatura)) = 'C.T.') THEN
    INSERT INTO serviciosexternos.mae_tipo_documento(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr) 
    VALUES ('H', 'CARNET DE TRABAJO', 'C.T.', '1', var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred, var_c_aud_pc, var_c_aud_ip, var_c_aud_mcaddr);
    RAISE NOTICE 'Se insertó el tipo de documento CARNET DE TRABAJO';
ELSE
    RAISE NOTICE 'Ya estaba registrado el tipo de documento CARNET DE TRABAJO';
END IF;

COMMIT;
END $$;



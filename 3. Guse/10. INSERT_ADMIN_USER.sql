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
declare
	var_f_aud timestamp := localtimestamp;
	var_b_aud CHARACTER varying(1) := 'I';
	var_c_aud_uid CHARACTER varying(30) := CURRENT_USER;
	var_c_aud_uidred CHARACTER varying(30) := 'PC-DESARROLLO';
	var_c_aud_pc CHARACTER varying(30) := 'PC-DESARROLLO';
	var_c_aud_ip CHARACTER varying(15) := cast(host(inet_client_addr()) as varchar(15));
	var_c_aud_mcaddr CHARACTER varying(17) := '00-09-00-00-00-00';
	n_opcion_1 integer;
	n_opcion_2 integer;
	n_opcion_perfil integer;
	n_perfil_admin integer;
	n_perfil_adminclientes integer;
	n_usuario_max integer;
	n_persona_max integer;
	n_perfil_max integer;
begin


n_opcion_1 := (select nextval('"serviciosexternos"."useq_mae_opcion"'));
n_usuario_max := (select nextval('"serviciosexternos"."useq_mae_usuario"'));
n_persona_max := (select nextval('"serviciosexternos"."useq_mae_persona"'));
n_perfil_max := (select nextval('"serviciosexternos"."useq_mae_perfil"'));

--Crear Perfil ADMINISTRADOR DE SISTEMA
IF NOT EXISTS(SELECT 1 FROM serviciosexternos.mae_perfil WHERE x_perfil='ADMINISTRADOR DE SISTEMA') THEN    
    INSERT INTO serviciosexternos.mae_perfil (n_perfil,x_perfil,c_rol_seguridad,x_descripcion,l_activo,f_registro,f_aud,b_aud,c_aud_uid,c_aud_uidred,c_aud_pc,c_aud_ip,c_aud_mcaddr) VALUES
        (n_perfil_max,'ADMINISTRADOR DE SISTEMA','AGUSE01','perfil que tiene completo acceso','1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
    RAISE NOTICE 'Se creó el perfil ADMINISTRADOR DE SISTEMA';
ELSE
	RAISE NOTICE 'Ya estaba creado el perfil ADMINISTRADOR DE SISTEMA';
END IF;

--Crear Perfil ADMINISTRADOR DE ACCESOS
IF NOT EXISTS(SELECT 1 FROM serviciosexternos.mae_perfil WHERE x_perfil='ADMINISTRADOR DE ACCESOS') THEN    
    INSERT INTO serviciosexternos.mae_perfil (n_perfil,x_perfil,c_rol_seguridad,x_descripcion,l_activo,f_registro,f_aud,b_aud,c_aud_uid,c_aud_uidred,c_aud_pc,c_aud_ip,c_aud_mcaddr) VALUES
        (n_perfil_max+1,'ADMINISTRADOR DE ACCESOS','AGUSE02','perfil que gestiona los accesos','1', var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
    RAISE NOTICE 'Se creó el perfil ADMINISTRADOR DE ACCESOS';
ELSE
	RAISE NOTICE 'Ya estaba creado el perfil ADMINISTRADOR DE ACCESOS';
END IF;

n_perfil_admin := (select n_perfil from serviciosexternos.mae_perfil where x_perfil = 'ADMINISTRADOR DE SISTEMA');
n_perfil_adminclientes := (select n_perfil from serviciosexternos.mae_perfil where x_perfil = 'ADMINISTRADOR DE ACCESOS');


--Crear Persona
IF NOT EXISTS(SELECT 1 FROM serviciosexternos.mae_persona WHERE x_documento_identidad='20159981216') THEN    
	
    INSERT INTO serviciosexternos.mae_persona(n_persona, b_tipo_documento, x_nombres, x_primer_apellido, x_segundo_apellido, f_nacimiento, x_documento_identidad,
     x_direccion, x_email, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
	VALUES (n_persona_max,(select b_tipo_documento from serviciosexternos.mae_tipo_documento WHERE x_abreviatura='R.U.C'),'PODER JUDICIAL',null,null,null,'20159981216',null,null,'1',
			var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	RAISE NOTICE 'Se creó la persona PODER JUDICIAL';
ELSE
	RAISE NOTICE 'Ya estaba creado la persona PODER JUDICIAL';
END IF;

--Crear Usuario
IF NOT EXISTS(SELECT 1 FROM serviciosexternos.mae_usuario WHERE x_usuario='ADMIN') THEN  
    
	INSERT INTO serviciosexternos.mae_usuario (n_usuario, n_persona, n_perfil, x_usuario, x_password, f_cambio_clave, l_activo, f_registro, 
                                                f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
	VALUES (n_usuario_max,(SELECT n_persona FROM serviciosexternos.mae_persona WHERE x_documento_identidad='20159981216'),n_perfil_admin,'ADMIN','m-FweTff5iw*',null,'1',
			var_f_aud, var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	RAISE NOTICE 'Se creó el usuario ADMIN';
ELSE
	RAISE NOTICE 'Ya estaba creado el usuario ADMIN';
END IF;

-- Crear opciones
IF NOT EXISTS(SELECT 1 FROM serviciosexternos.mae_opcion WHERE x_opcion='servicios') THEN 
	INSERT INTO serviciosexternos.mae_opcion (n_opcion,x_opcion,x_endpoint,x_icono,l_activo,
										f_aud,b_aud,c_aud_uid,c_aud_uidred,c_aud_pc,c_aud_ip,c_aud_mcaddr)
	VALUES (n_opcion_1,'servicios','/procesos/servicios','pi pi-book','1',
			var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	RAISE NOTICE 'Se creo la opcion Mantenimiento Servicios';
ELSE
	RAISE NOTICE 'Ya estaba creada la opcion Mantenimiento Servicios';
END IF;
n_opcion_2 := (select nextval('"serviciosexternos"."useq_mae_opcion"'));
IF NOT EXISTS(SELECT 1 FROM serviciosexternos.mae_opcion WHERE x_opcion='clientes') THEN 	
	INSERT INTO serviciosexternos.mae_opcion (n_opcion,x_opcion,x_endpoint,x_icono,l_activo,
										f_aud,b_aud,c_aud_uid,c_aud_uidred,c_aud_pc,c_aud_ip,c_aud_mcaddr)
	VALUES (n_opcion_2,'clientes','/procesos/clientes','pi pi-clone','1',
			var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	RAISE NOTICE 'Se creo la opcion Mantenimiento Clientes';
ELSE
	RAISE NOTICE 'Ya estaba creada la opcion Mantenimiento Clientes';
END IF;
n_opcion_perfil := (select nextval('"serviciosexternos"."useq_mae_opcion_perfil"'));

-- Relacionar opciones con el perfil ADMINISTRADOR DE SISTEMA
IF NOT EXISTS(SELECT 1 FROM serviciosexternos.mae_opcion_perfil WHERE n_perfil=(select n_perfil from serviciosexternos.mae_perfil mp where upper(trim(x_perfil))='ADMINISTRADOR DE SISTEMA')
                                                                AND n_opcion=(select n_opcion from serviciosexternos.mae_opcion where upper(trim(x_opcion)) = 'Proceso Servicios')) THEN
	INSERT INTO serviciosexternos.mae_opcion_perfil (n_opcion_perfil,n_opcion,n_perfil,l_activo,
							f_aud,b_aud,c_aud_uid,c_aud_uidred,c_aud_pc,c_aud_ip,c_aud_mcaddr)
			VALUES (n_opcion_perfil,n_opcion_1,n_perfil_admin,'1',
			var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	RAISE NOTICE 'Se asigno la opcion Mantenimiento Servicios al perfil ADMINISTRADOR DE SISTEMA';
ELSE
	RAISE NOTICE 'Ya estaba asignado la opcion Mantenimiento Servicios al perfil ADMINISTRADOR DE SISTEMA';
END IF;

n_opcion_perfil := (select nextval('"serviciosexternos"."useq_mae_opcion_perfil"'));

IF NOT EXISTS(SELECT 1 FROM serviciosexternos.mae_opcion_perfil WHERE n_perfil=(select n_perfil from serviciosexternos.mae_perfil mp where upper(trim(x_perfil))='ADMINISTRADOR DE SISTEMA')
                                                                AND n_opcion=(select n_opcion from serviciosexternos.mae_opcion where upper(trim(x_opcion)) = 'Proceso Clientes')) THEN
	INSERT INTO serviciosexternos.mae_opcion_perfil (n_opcion_perfil,n_opcion,n_perfil,l_activo,
							f_aud,b_aud,c_aud_uid,c_aud_uidred,c_aud_pc,c_aud_ip,c_aud_mcaddr)
			VALUES (n_opcion_perfil,n_opcion_2,n_perfil_admin,'1',
			var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	RAISE NOTICE 'Se asigno la opcion Mantenimiento Clientes al perfil ADMINISTRADOR DE SISTEMA';
ELSE
	RAISE NOTICE 'Ya estaba asignado la opcion Mantenimiento Clientes al perfil ADMINISTRADOR DE SISTEMA';
END IF;

n_opcion_perfil := (select nextval('"serviciosexternos"."useq_mae_opcion_perfil"'));
-- Relacionar opciones con el perfil administrador de accesos
IF NOT EXISTS(SELECT 1 FROM serviciosexternos.mae_opcion_perfil WHERE n_perfil=(select n_perfil from serviciosexternos.mae_perfil mp where upper(trim(x_perfil))='ADMINISTRADOR DE ACCESOS')
                                                                AND n_opcion=(select n_opcion from serviciosexternos.mae_opcion where upper(trim(x_opcion)) = 'Proceso Clientes')) THEN
	INSERT INTO serviciosexternos.mae_opcion_perfil (n_opcion_perfil,n_opcion,n_perfil,l_activo,
							f_aud,b_aud,c_aud_uid,c_aud_uidred,c_aud_pc,c_aud_ip,c_aud_mcaddr)
			VALUES (n_opcion_perfil,n_opcion_2,n_perfil_adminclientes,'1',
			var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	RAISE NOTICE 'Se asigno la opcion Mantenimiento Clientes al perfil ADMINISTRADOR DE ACCESOS';
ELSE
	RAISE NOTICE 'Ya estaba asignado la opcion Mantenimiento Clientes al perfil ADMINISTRADOR DE ACCESOS';
END IF;
END$$;			

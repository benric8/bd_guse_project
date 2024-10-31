/***********************************************************************************************   
AUTOR		:	rbendezuv
PROPOSITO	:	Creación de funciones trigger
CREADO 		:	31/05/2024
ALCANCE		:	servicio web rest gestion de usuarios externos
   
************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    rbendezuv          31/05/2024      Creación de funciones trigger
************************************************************************************************/ 
CREATE OR REPLACE FUNCTION serviciosexternos.ufn_mae_tipo_documento()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$
BEGIN
    IF (TG_OP = 'DELETE') THEN        
        INSERT INTO serviciosexternos.aud_mae_tipo_documento(
            n_trns_id,
            --trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            --negocio
            b_tipo_documento,
            x_tipo_documento,
            x_abreviatura,
            l_activo,
            f_registro,
            --control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        )
        VALUES (
            nextval('serviciosexternos.useq_aud_mae_tipo_documento'), 
            --TRAZABILIDAD
            CURRENT_TIMESTAMP,
            'D',
            session_user,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr,
            --negocio
            OLD.b_tipo_documento,
            OLD.x_tipo_documento,
            OLD.x_abreviatura,
            OLD.l_activo,
            OLD.f_registro,
            --control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );     
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO serviciosexternos.aud_mae_tipo_documento(
            n_trns_id,
            --trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            --negocio
            b_tipo_documento,
            x_tipo_documento,
            x_abreviatura,
            l_activo,
            f_registro,
            --control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        )
        VALUES (
            nextval('serviciosexternos.useq_aud_mae_tipo_documento'), 
            --TRAZABILIDAD
            CURRENT_TIMESTAMP,
            'U',
            session_user,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr,
            --negocio
            OLD.b_tipo_documento,
            OLD.x_tipo_documento,
            OLD.x_abreviatura,
            OLD.l_activo,
            OLD.f_registro,
            --control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );  
        RETURN OLD;
    ELSE
        RETURN NULL;
    END IF;
END;
$function$;

CREATE OR REPLACE FUNCTION serviciosexternos.ufn_mae_persona()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO serviciosexternos.aud_mae_persona(
            n_trns_id,
            --trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            --negocio
            n_persona,
            b_tipo_documento,
            x_nombres,
            x_primer_apellido,
            x_segundo_apellido,
            f_nacimiento,
            x_documento_identidad,
            x_direccion,
            x_email,
            l_activo,
            f_registro,
            --control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        ) VALUES (
            nextval('serviciosexternos.useq_aud_mae_persona'), 
            --trazabilidad
            CURRENT_TIMESTAMP,
            'D',
            session_user,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr,
            --negocio
            OLD.n_persona,
            OLD.b_tipo_documento,
            OLD.x_nombres,
            OLD.x_primer_apellido,
            OLD.x_segundo_apellido,
            OLD.f_nacimiento,
            OLD.x_documento_identidad,
            OLD.x_direccion,
            OLD.x_email,
            OLD.l_activo,
            OLD.f_registro,
            --control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO serviciosexternos.aud_mae_persona(
            n_trns_id,
            --trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            --negocio
            n_persona,
            b_tipo_documento,
            x_nombres,
            x_primer_apellido,
            x_segundo_apellido,
            f_nacimiento,
            x_documento_identidad,
            x_direccion,
            x_email,
            l_activo,
            f_registro,
            --control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        ) VALUES (
            nextval('serviciosexternos.useq_aud_mae_persona'), 
            --trazabilidad
            CURRENT_TIMESTAMP,
            'U',
            session_user,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr,
            --negocio
            OLD.n_persona,
            OLD.b_tipo_documento,
            OLD.x_nombres,
            OLD.x_primer_apellido,
            OLD.x_segundo_apellido,
            OLD.f_nacimiento,
            OLD.x_documento_identidad,
            OLD.x_direccion,
            OLD.x_email,
            OLD.l_activo,
            OLD.f_registro,
            --control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );
        RETURN OLD;
    ELSE
        RETURN NULL;
    END IF;
END;
$function$;

CREATE OR REPLACE FUNCTION serviciosexternos.ufn_mae_usuario()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO serviciosexternos.aud_mae_usuario(
            n_trns_id,
            --trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            --negocio
            n_usuario,
            n_persona,
            n_perfil,
            x_usuario,
            x_password,
            f_cambio_clave,
            l_activo,
            f_registro,
            --control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        ) VALUES (
            nextval('serviciosexternos.useq_aud_mae_usuario'), 
            --trazabilidad
            CURRENT_TIMESTAMP,
            'D',
            session_user,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr,
            --negocio
            OLD.n_usuario,
            OLD.n_persona,
            OLD.n_perfil,
            OLD.x_usuario,
            OLD.x_password,
            OLD.f_cambio_clave,
            OLD.l_activo,
            OLD.f_registro,
            --control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO serviciosexternos.aud_mae_usuario(
            n_trns_id,
            --trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            --negocio
            n_usuario,
            n_persona,
            n_perfil,
            x_usuario,
            x_password,
            f_cambio_clave,
            l_activo,
            f_registro,
            --control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        ) VALUES (
            nextval('serviciosexternos.useq_aud_mae_usuario'), 
            --trazabilidad
            CURRENT_TIMESTAMP,
            'U',
            session_user,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr,
            --negocio
            OLD.n_usuario,
            OLD.n_persona,
            OLD.n_perfil,
            OLD.x_usuario,
            OLD.x_password,
            OLD.f_cambio_clave,
            OLD.l_activo,
            OLD.f_registro,
            --control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );
        RETURN OLD;
    ELSE
        RETURN NULL;
    END IF;
END;
$function$;

CREATE OR REPLACE FUNCTION serviciosexternos.ufn_mae_opcion()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO serviciosexternos.aud_mae_opcion(
            n_trns_id,
            --trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            --negocio
            n_opcion,
            x_opcion,
            x_endpoint,
            l_activo,
            f_registro,
            --control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        ) VALUES (
            nextval('serviciosexternos.useq_aud_mae_opcion'), 
            --trazabilidad
            CURRENT_TIMESTAMP,
            'D',
            session_user,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr,
            --negocio
            OLD.n_opcion,
            OLD.x_opcion,
            OLD.x_endpoint,
            OLD.l_activo,
            OLD.f_registro,
            --control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO serviciosexternos.aud_mae_opcion(
            n_trns_id,
            --trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            --negocio
            n_opcion,
            x_opcion,
            x_endpoint,
            l_activo,
            f_registro,
            --control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        ) VALUES (
            nextval('serviciosexternos.useq_aud_mae_opcion'), 
            --trazabilidad
            CURRENT_TIMESTAMP,
            'U',
            session_user,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr,
            --negocio
            OLD.n_opcion,
            OLD.x_opcion,
            OLD.x_endpoint,
            OLD.l_activo,
            OLD.f_registro,
            --control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );
        RETURN OLD;
    ELSE
        RETURN NULL;
    END IF;
END;
$function$;

CREATE OR REPLACE FUNCTION serviciosexternos.ufn_mae_perfil()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO serviciosexternos.aud_mae_perfil(
            n_trns_id,
            --trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            --negocio
            n_perfil,
            x_perfil,
            c_rol_seguridad,
            x_descripcion,
            l_activo,
            f_registro,
            --control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        ) VALUES (
            nextval('serviciosexternos.useq_aud_mae_perfil'), 
            --trazabilidad
            CURRENT_TIMESTAMP,
            'D',
            session_user,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr,
            --negocio
            OLD.n_perfil,
            OLD.x_perfil,
            OLD.c_rol_seguridad,
            OLD.x_descripcion,
            OLD.l_activo,
            OLD.f_registro,
            --control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO serviciosexternos.aud_mae_perfil(
            n_trns_id,
            --trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            --negocio
            n_perfil,
            x_perfil,
            c_rol_seguridad,
            x_descripcion,
            l_activo,
            f_registro,
            --control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        ) VALUES (
            nextval('serviciosexternos.useq_aud_mae_perfil'), 
            --trazabilidad
            CURRENT_TIMESTAMP,
            'U',
            session_user,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr,
            --negocio
            OLD.n_perfil,
            OLD.x_perfil,
            OLD.c_rol_seguridad,
            OLD.x_descripcion,
            OLD.l_activo,
            OLD.f_registro,
            --control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );
        RETURN OLD;
    ELSE
        RETURN NULL;
    END IF;
END;
$function$;

CREATE OR REPLACE FUNCTION serviciosexternos.ufn_mae_opcion_perfil()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    IF (TG_OP = 'DELETE') THEN
		INSERT INTO serviciosexternos.aud_mae_opcion_perfil(
			n_trns_id,
			--trazabilidad
			f_trns,
			b_trns,
			c_trns_uid,
			c_trns_pc,
			n_trns_ip,
			c_trns_mcaddr,
			--negocio
			n_opcion_perfil,
			n_opcion,
			n_perfil,
			l_activo,
			f_registro,
			--control
			f_aud,
			b_aud,
			c_aud_uid,
			c_aud_uidred,
			c_aud_pc,
			c_aud_ip,
			c_aud_mcaddr

		) VALUES (
			nextval('serviciosexternos.useq_aud_mae_opcion_perfil'), 
			--trazabilidad
			CURRENT_TIMESTAMP,
			'D',
			CURRENT_USER,
			OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr,
			--negocio
			OLD.n_opcion_perfil,
			OLD.n_opcion,
			OLD.n_perfil,
			OLD.l_activo,
			OLD.f_registro,
			--control
			OLD.f_aud,
			OLD.b_aud,
			OLD.c_aud_uid,
			OLD.c_aud_uidred,
			OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr
		);
		RETURN OLD;
	ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO serviciosexternos.aud_mae_opcion_perfil(
			n_trns_id,
			--trazabilidad
			f_trns,
			b_trns,
			c_trns_uid,
			c_trns_pc,
			n_trns_ip,
			c_trns_mcaddr,
			--negocio
			n_opcion_perfil,
			n_opcion,
			n_perfil,
			l_activo,
			f_registro,
			--control
			f_aud,
			b_aud,
			c_aud_uid,
			c_aud_uidred,
			c_aud_pc,
			c_aud_ip,
			c_aud_mcaddr
		) VALUES (
			nextval('serviciosexternos.useq_aud_mae_opcion_perfil'), 
			--trazabilidad
			CURRENT_TIMESTAMP,
            'U',
            session_user,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr,
			--negocio
			OLD.n_opcion_perfil,
			OLD.n_opcion,
			OLD.n_perfil,
			OLD.l_activo,
			OLD.f_registro,
			--control
			OLD.f_aud,
			OLD.b_aud,
			OLD.c_aud_uid,
			OLD.c_aud_uidred,
			OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr
		);
		RETURN OLD;
	ELSE
        RETURN NULL;
    END IF;
END;
$function$;


CREATE OR REPLACE FUNCTION serviciosexternos.ufn_mae_entidad()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO serviciosexternos.aud_mae_entidad(
            n_trns_id,
            -- trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            -- negocio
            n_entidad,
            x_entidad,
            x_descripcion,
            l_activo,
            f_registro,
            -- control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        ) VALUES (
            nextval('serviciosexternos.useq_aud_mae_entidad'),
            -- trazabilidad
            CURRENT_TIMESTAMP,
            'D',
            CURRENT_USER,
            OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr,
            -- negocio
            OLD.n_entidad,
            OLD.x_entidad,
            OLD.x_descripcion,
            OLD.l_activo,
            OLD.f_registro,
            -- control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO serviciosexternos.aud_mae_entidad(
            n_trns_id,
            -- trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            -- negocio
            n_entidad,
            x_entidad,
            x_descripcion,
            l_activo,
            f_registro,
            -- control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        ) VALUES (
            nextval('serviciosexternos.useq_aud_mae_entidad'),
            -- trazabilidad
            CURRENT_TIMESTAMP,
            'U',
            CURRENT_USER,
            OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr,
            -- negocio
            OLD.n_entidad,
            OLD.x_entidad,
            OLD.x_descripcion,
            OLD.l_activo,
            OLD.f_registro,
            -- control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );
        RETURN OLD;
    ELSE
        RETURN NULL;
    END IF;
END;
$function$;

CREATE OR REPLACE FUNCTION serviciosexternos.ufn_mae_servicio()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    IF (TG_OP = 'DELETE') THEN
		INSERT INTO serviciosexternos.aud_mae_servicio(
			n_trns_id,
			--trazabilidad
			f_trns,
			b_trns,
			c_trns_uid,
			c_trns_pc,
			n_trns_ip,
			c_trns_mcaddr,
			--negocio
			n_servicio,
			n_entidad,
			x_nombre_servicio,
			x_descripcion,
			x_url,
			n_cuota,
			l_actualizar_credencial,
			n_dias_actualizar_credencial,
			l_activo,
			f_registro,
			--control
			f_aud,
			b_aud,
			c_aud_uid,
			c_aud_uidred,
			c_aud_pc,
			c_aud_ip,
			c_aud_mcaddr

		)VALUES(
			nextval('serviciosexternos.useq_aud_mae_servicio'), 
			--trazabilidad
			CURRENT_TIMESTAMP,
			'D',
			CURRENT_USER,
			OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr,
			--negocio
			OLD.n_servicio,
			OLD.n_entidad,
			OLD.x_nombre_servicio,
			OLD.x_descripcion,
			OLD.x_url,
			OLD.n_cuota,
			OLD.l_actualizar_credencial,
			OLD.n_dias_actualizar_credencial,
			OLD.l_activo,
			OLD.f_registro,
			--control
			OLD.f_aud,
			OLD.b_aud,
			OLD.c_aud_uid,
			OLD.c_aud_uidred,
			OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr
		);
		RETURN OLD;
	ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO serviciosexternos.aud_mae_servicio(
			n_trns_id,
			--trazabilidad
			f_trns,
			b_trns,
			c_trns_uid,
			c_trns_pc,
			n_trns_ip,
			c_trns_mcaddr,
			--negocio
			n_servicio,
			n_entidad,
			x_nombre_servicio,
			x_descripcion,
			x_url,
			n_cuota,
			l_actualizar_credencial,
			n_dias_actualizar_credencial,
			l_activo,
			f_registro,
			--control
			f_aud,
			b_aud,
			c_aud_uid,
			c_aud_uidred,
			c_aud_pc,
			c_aud_ip,
			c_aud_mcaddr
		)VALUES(
			nextval('serviciosexternos.useq_aud_mae_servicio'), 
			--trazabilidad
			CURRENT_TIMESTAMP,
            'U',
            session_user,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr,
			--negocio
			OLD.n_servicio,
			OLD.n_entidad,
			OLD.x_nombre_servicio,
			OLD.x_descripcion,
			OLD.x_url,
			OLD.n_cuota,
			OLD.l_actualizar_credencial,
			OLD.n_dias_actualizar_credencial,
			OLD.l_activo,
			OLD.f_registro,
			--control
			OLD.f_aud,
			OLD.b_aud,
			OLD.c_aud_uid,
			OLD.c_aud_uidred,
			OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr
		);
		RETURN OLD;
	ELSE
        RETURN NULL;
    END IF;
END;
$function$;

CREATE OR REPLACE FUNCTION serviciosexternos.ufn_mae_servicio_aplicativo()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    IF (TG_OP = 'DELETE') THEN
		INSERT INTO serviciosexternos.aud_mae_servicio_aplicativo(
			n_trns_id,
			--trazabilidad
			f_trns,
			b_trns,
			c_trns_uid,
			c_trns_pc,
			n_trns_ip,
			c_trns_mcaddr,
			--negocio
			n_servicio_aplicativo,
			n_servicio,
			n_aplicativo,
			l_activo,
			f_registro,
			--control
			f_aud,
			b_aud,
			c_aud_uid,
			c_aud_uidred,
			c_aud_pc,
			c_aud_ip,
			c_aud_mcaddr

		)VALUES(
			nextval('serviciosexternos.useq_aud_mae_servicio_aplicativo'), 
			--trazabilidad
			CURRENT_TIMESTAMP,
			'D',
			CURRENT_USER,
			OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr,
			--negocio
			OLD.n_servicio_aplicativo,
			OLD.n_servicio,
			OLD.n_aplicativo,
			OLD.l_activo,
			OLD.f_registro,
			--control
			OLD.f_aud,
			OLD.b_aud,
			OLD.c_aud_uid,
			OLD.c_aud_uidred,
			OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr
		);
		RETURN OLD;
	ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO serviciosexternos.aud_mae_servicio_aplicativo(
			n_trns_id,
			--trazabilidad
			f_trns,
			b_trns,
			c_trns_uid,
			c_trns_pc,
			n_trns_ip,
			c_trns_mcaddr,
			--negocio
			n_servicio_aplicativo,
			n_servicio,
			n_aplicativo,
			l_activo,
			f_registro,
			--control
			f_aud,
			b_aud,
			c_aud_uid,
			c_aud_uidred,
			c_aud_pc,
			c_aud_ip,
			c_aud_mcaddr
		)VALUES(
			nextval('serviciosexternos.useq_aud_mae_servicio_aplicativo'), 
			--trazabilidad
			CURRENT_TIMESTAMP,
            'U',
            session_user,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr,
			--negocio
			OLD.n_servicio_aplicativo,
			OLD.n_servicio,
			OLD.n_aplicativo,
			OLD.l_activo,
			OLD.f_registro,
			--control
			OLD.f_aud,
			OLD.b_aud,
			OLD.c_aud_uid,
			OLD.c_aud_uidred,
			OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr
		);
		RETURN OLD;
	ELSE
        RETURN NULL;
    END IF;
END;
$function$;

CREATE OR REPLACE FUNCTION serviciosexternos.ufn_mae_aplicativo()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO serviciosexternos.aud_mae_aplicativo(
            n_trns_id,
            -- trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            -- negocio
            n_aplicativo,
            x_aplicativo,
            x_descripcion,
            l_activo,
            f_registro,
            -- control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        ) VALUES (
            nextval('serviciosexternos.useq_aud_mae_aplicativo'),
            -- trazabilidad
            CURRENT_TIMESTAMP,
            'D',
            CURRENT_USER,
            OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr,
            -- negocio
            OLD.n_aplicativo,
            OLD.x_aplicativo,
            OLD.x_descripcion,
            OLD.l_activo,
            OLD.f_registro,
            -- control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO serviciosexternos.aud_mae_aplicativo(
            n_trns_id,
            -- trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            -- negocio
            n_aplicativo,
            x_aplicativo,
            x_descripcion,
            l_activo,
            f_registro,
            -- control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        ) VALUES (
            nextval('serviciosexternos.useq_aud_mae_aplicativo'),
            -- trazabilidad
            CURRENT_TIMESTAMP,
            'U',
            CURRENT_USER,
            OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr,
            -- negocio
            OLD.n_aplicativo,
            OLD.x_aplicativo,
            OLD.x_descripcion,
            OLD.l_activo,
            OLD.f_registro,
            -- control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );
        RETURN OLD;
    ELSE
        RETURN NULL;
    END IF;
END;
$function$;


CREATE OR REPLACE FUNCTION serviciosexternos.ufn_mae_cliente()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    IF (TG_OP = 'DELETE') THEN
		INSERT INTO serviciosexternos.aud_mae_cliente(
			n_trns_id,
			--trazabilidad
			f_trns,
			b_trns,
			c_trns_uid,
			c_trns_pc,
			n_trns_ip,
			c_trns_mcaddr,
			--negocio
			n_cliente,
			n_persona,
			n_aplicativo,
			x_usuario,
			x_clave,
			n_cuota,
			x_usuario_registra,
			x_usurio_actualiza,
			f_actualizacion,
			f_actualizacion_fallida,
			l_principal,
			l_activo,
			f_registro,
			--control
			f_aud,
			b_aud,
			c_aud_uid,
			c_aud_uidred,
			c_aud_pc,
			c_aud_ip,
			c_aud_mcaddr

		)VALUES(
			nextval('serviciosexternos.useq_aud_mae_cliente'), 
			--trazabilidad
			CURRENT_TIMESTAMP,
			'D',
			CURRENT_USER,
			OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr,
			--negocio
			OLD.n_cliente,
			OLD.n_persona,
			OLD.n_aplicativo,
			OLD.x_usuario,
			OLD.x_clave,
			OLD.n_cuota,
			OLD.x_usuario_registra,
			OLD.x_usuario_actualiza,
			OLD.f_actualizacion,
			OLD.f_actualizacion_fallida,
			OLD.l_principal,
			OLD.l_activo,
			OLD.f_registro,
			--control
			OLD.f_aud,
			OLD.b_aud,
			OLD.c_aud_uid,
			OLD.c_aud_uidred,
			OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr
		);
		RETURN OLD;
	ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO serviciosexternos.aud_mae_cliente(
			n_trns_id,
			--trazabilidad
			f_trns,
			b_trns,
			c_trns_uid,
			c_trns_pc,
			n_trns_ip,
			c_trns_mcaddr,
			--negocio
			n_cliente,
			n_persona,
			n_aplicativo,
			x_usuario,
			x_clave,
			n_cuota,
			x_usuario_registra,
			x_usurio_actualiza,
			f_actualizacion,
			f_actualizacion_fallida,
			l_principal,
			l_activo,
			f_registro,
			--control
			f_aud,
			b_aud,
			c_aud_uid,
			c_aud_uidred,
			c_aud_pc,
			c_aud_ip,
			c_aud_mcaddr
		)VALUES(
			nextval('serviciosexternos.useq_aud_mae_cliente'), 
			--trazabilidad
			CURRENT_TIMESTAMP,
            'U',
            session_user,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr,
			--negocio
			OLD.n_cliente,
			OLD.n_persona,
			OLD.n_aplicativo,
			OLD.x_usuario,
			OLD.x_clave,
			OLD.n_cuota,
			OLD.x_usuario_registra,
			OLD.x_usurio_actualiza,
			OLD.f_actualizacion,
			OLD.f_actualizacion_fallida,
			OLD.l_principal,
			OLD.l_activo,
			OLD.f_registro,
			--control
			OLD.f_aud,
			OLD.b_aud,
			OLD.c_aud_uid,
			OLD.c_aud_uidred,
			OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr
		);
		RETURN OLD;
	ELSE
        RETURN NULL;
    END IF;
END;
$function$;


CREATE OR REPLACE FUNCTION serviciosexternos.ufn_mov_consumo_cuota()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO serviciosexternos.aud_mov_consumo_cuota(
            n_trns_id,
            -- trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            -- negocio
            n_consumo_cuota,
            n_cliente,
            f_consumo_cuota,
            n_cuota_consumida,
            l_activo,
            f_registro,
            -- control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        ) VALUES (
            nextval('serviciosexternos.useq_aud_mov_consumo_cuota'),
            -- trazabilidad
            CURRENT_TIMESTAMP,
            'D',
            CURRENT_USER,
            OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr,
            -- negocio
            OLD.n_consumo_cuota,
            OLD.n_cliente,
            OLD.f_consumo_cuota,
            OLD.n_cuota_consumida,
            OLD.l_activo,
            OLD.f_registro,
            -- control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO serviciosexternos.aud_mov_consumo_cuota(
            n_trns_id,
            -- trazabilidad
            f_trns,
            b_trns,
            c_trns_uid,
            c_trns_pc,
            n_trns_ip,
            c_trns_mcaddr,
            -- negocio
            n_consumo_cuota,
            n_cliente,
            f_consumo_cuota,
            n_cuota_consumida,
            l_activo,
            f_registro,
            -- control
            f_aud,
            b_aud,
            c_aud_uid,
            c_aud_uidred,
            c_aud_pc,
            c_aud_ip,
            c_aud_mcaddr
        ) VALUES (
            nextval('serviciosexternos.useq_aud_mov_consumo_cuota'),
            -- trazabilidad
            CURRENT_TIMESTAMP,
            'U',
            CURRENT_USER,
            OLD.c_aud_pc,
			OLD.c_aud_ip,
			OLD.c_aud_mcaddr,
            -- negocio
            OLD.n_consumo_cuota,
            OLD.n_cliente,
            OLD.f_consumo_cuota,
            OLD.n_cuota_consumida,
            OLD.l_activo,
            OLD.f_registro,
            -- control
            OLD.f_aud,
            OLD.b_aud,
            OLD.c_aud_uid,
            OLD.c_aud_uidred,
            OLD.c_aud_pc,
            OLD.c_aud_ip,
            OLD.c_aud_mcaddr
        );
        RETURN OLD;
    ELSE
        RETURN NULL;
    END IF;
END;
$function$;

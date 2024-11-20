/***********************************************************************************************   
AUTOR			:	RBENDEZUV
PROPOSITO		:	Registrar las operaciones de usuarios-servicios-externos-api-rest
CREADO 			:	03/06/2024 12:00
VERSION     	: 	1.0
BASE DE DATOS	:	Seguridad
OBSERVACION		:	El DBA debe asignar el valor correspondiente a las variables 
					(var_c_aud_uidred, var_c_aud_pc, var_c_aud_mcaddr) debido a que 
					esos datos no se pueden obtener del motor de base de datos.
************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    RBENDEZUV         03/06/2024 12:00      Registrar operaciones para el ser consumidos por los clientes del api
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
IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/servicios')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/servicios',
		'Endpoint para administrar los metodos POST, PUT y GET de servicios',
		'/servicios-externos-api/servicios',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/servicios';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/servicios';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/personas')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/personas',
		'Endpoint para administrar los metodos POST, PUT y GET de personas',
		'/servicios-externos-api/personas',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/personas';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/personas';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/entidades')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/entidades',
		'Endpoint para administrar los metodos POST, PUT y GET de entidades',
		'/servicios-externos-api/entidades',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/entidades';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/entidades';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/clientes')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/clientes',
		'Endpoint para administrar los metodos POST, PUT y GET de clientes',
		'/servicios-externos-api/clientes',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/clientes';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/clientes';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/aplicativos')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/aplicativos',
		'Endpoint para administrar los metodos POST, PUT y GET de aplicativos',
		'/servicios-externos-api/aplicativos',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/aplicativos';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/aplicativos';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/aplicativos/combo')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/aplicativos/combo',
		'Método para listar aplicativos en combos',
		'/servicios-externos-api/aplicativos/combo',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/aplicativos/combo';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/aplicativos/combo';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/aplicativos/asociar-aplicativo')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/aplicativos/asociar-aplicativo',
		'Método para asociar los servicios con los aplicativos.',
		'/servicios-externos-api/aplicativos/asociar-aplicativo',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/aplicativos/asociar-aplicativo';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/aplicativos/asociar-aplicativo';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/entidades/combo')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/entidades/combo',
		'Método para listar las entidades en combo.',
		'/servicios-externos-api/entidades/combo',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/entidades/combo';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/entidades/combo';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/personas/combo')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/personas/combo',
		'Método para listar las personas en combo.',
		'/servicios-externos-api/personas/combo',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/personas/combo';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/personas/combo';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/personas/tipos-documento/combo')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/personas/tipos-documento/combo',
		'Método para listar los tipos de documento en un combo.',
		'/servicios-externos-api/personas/tipos-documento/combo',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/personas/tipos-documento/combo';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/personas/tipos-documento/combo';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/personas/siga/consultar-usuario')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/personas/siga/consultar-usuario',
		'Método para obtener los datos de una persona por medio del DNI.',
		'/servicios-externos-api/personas/siga/consultar-usuario',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/personas/siga/consultar-usuario';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/personas/siga/consultar-usuario';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/clientes/actualizar-credencial')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/clientes/actualizar-credencial',
		'Método para actualizar la contrasela de los clientes que consumen la pide.',
		'/servicios-externos-api/clientes/actualizar-credencial',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/clientes/actualizar-credencial';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/clientes/actualizar-credencial';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/servicios/combo')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/servicios/combo',
		'Método para listar los servicios en formato de combo.',
		'/servicios-externos-api/servicios/combo',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/servicios/combo';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/servicios/combo';
	END IF;


IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/admin/login')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/admin/login',
		'Método para Iniciar sesion en el aplicativo.',
		'/servicios-externos-api/admin/login',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/admin/login';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/admin/login';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/clientes/cuota')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='GUSEWS01'),
		'/clientes/cuota@io',
		'Método para obtener los clientes con cuota por codigo de aplicativo.',
		'/servicios-externos-api/clientes/cuota',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/clientes/cuota';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/clientes/cuota';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/admin/opciones')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/admin/opciones',
		'Método para listar las opciones del perfil.',
		'/servicios-externos-api/admin/opciones',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/admin/opciones';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/admin/opciones';
	END IF;


IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/admin/usuarios')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/admin/usuarios',
		'Método para crear usuarios del sistema.',
		'/servicios-externos-api/admin/usuarios',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/admin/usuarios';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/admin/usuarios';
	END IF;

IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/admin/usuarios/cambiar-password')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/admin/usuarios/cambiar-password',
		'Método para cambiar la contraseña de los usuarios.',
		'/servicios-externos-api/admin/usuarios/cambiar-password',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/admin/usuarios/cambiar-password';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/admin/usuarios/cambiar-password';
	END IF;

	IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/clientes/registrar/consumo-cuota')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='GUSEWS01'),
		'/clientes/registrar/consumo-cuota@io',
		'Método para obtener los clientes con registrar/consumo-cuota por codigo de aplicativo.',
		'/servicios-externos-api/clientes/registrar/consumo-cuota',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/clientes/registrar/consumo-cuota';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/clientes/registrar/consumo-cuota';
	END IF;

	IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/clientes/actualizar-credencial' AND
					n_rol=(SELECT n_rol FROM seguridad.mae_rol WHERE C_ROL='GUSEJOB01'))
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='GUSEJOB01'),
		'/clientes/actualizar-credencial@io',
		'Método para actualizar la contrasela de los clientes que consumen la pide.',
		'/servicios-externos-api/clientes/actualizar-credencial',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/clientes/actualizar-credencial';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/clientes/actualizar-credencial';
	END IF;

	IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/clientes' AND 
					n_rol=(SELECT n_rol FROM seguridad.mae_rol WHERE C_ROL='AGUSE02'))
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE02'),
		'/clientes',
		'Endpoint para administrar los metodos POST, PUT y GET de clientes',
		'/servicios-externos-api/clientes',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/clientes';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/clientes';
	END IF;

	
	IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/admin/opciones' AND
					n_rol=(SELECT n_rol FROM seguridad.mae_rol WHERE C_ROL='AGUSE02'))
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE02'),
		'/admin/opciones',
		'Método para listar las opciones del perfil.',
		'/servicios-externos-api/admin/opciones',
		'1', 
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/admin/opciones';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/admin/opciones';
	END IF;

	IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/clientes/actualizar-credencial' AND
					n_rol=(SELECT n_rol FROM seguridad.mae_rol WHERE C_ROL='AGUSE02')) 
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE02'),
		'/clientes/actualizar-credencial',
		'Método para actualizar la contrasela de los clientes que consumen la pide.',
		'/servicios-externos-api/clientes/actualizar-credencial',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/clientes/actualizar-credencial';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/clientes/actualizar-credencial';
	END IF;

	IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/admin/perfiles')
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE01'),
		'/admin/perfiles',
		'Método para listar las perfiles disponibles en el servicio.',
		'/servicios-externos-api/admin/perfiles',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/admin/perfiles';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/admin/perfiles';
	END IF;

	IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/personas/combo'  AND
					n_rol=(SELECT n_rol FROM seguridad.mae_rol WHERE C_ROL='AGUSE02'))
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE02'),
		'/personas/combo',
		'Método para listar las personas en combo.',
		'/servicios-externos-api/personas/combo',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/personas/combo';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/personas/combo';
	END IF;	

	
IF NOT EXISTS(SELECT 1 FROM seguridad.mae_operacion WHERE x_endpoint='/servicios-externos-api/aplicativos/combo'  AND
					n_rol=(SELECT n_rol FROM seguridad.mae_rol WHERE C_ROL='AGUSE02'))
	THEN
		INSERT INTO seguridad.mae_operacion
			(n_operacion, n_aplicativo, n_rol, x_operacion, x_descripcion, x_endpoint, l_activo,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
		VALUES ( Nextval('seguridad.mae_operacion_seq'),
		(SELECT n_aplicativo FROM seguridad.mae_aplicativo WHERE c_aplicativo = 'GUSEA'),
		(SELECT n_rol FROM seguridad.mae_rol WHERE c_rol ='AGUSE02'),
		'/aplicativos/combo',
		'Método para listar aplicativos en combos',
		'/servicios-externos-api/aplicativos/combo',
		'1',
		var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
	 	RAISE NOTICE 'Se creo la operacion con endpoint /servicios-externos-api/aplicativos/combo';
	ELSE
		RAISE NOTICE 'Ya estaba registrado la operacion con endpoint /servicios-externos-api/aplicativos/combo';
	END IF;
COMMIT;
END $$;
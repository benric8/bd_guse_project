/***********************************************************************************************   
AUTOR			:	RBENDEZUV
PROPOSITO		:	Registrar el aplicativo Servicio usuarios-servicios-externos-api-rest
CREADO 			:	03/06/2024 12:00
VERSION     	: 	1.0
BASE DE DATOS	:	Seguridad
OBSERVACION		:	El DBA debe asignar el valor correspondiente a las variables 
					(var_c_aud_uidred, var_c_aud_pc, var_c_aud_mcaddr) debido a que 
					esos datos no se pueden obtener del motor de base de datos.
************************************************************************************************   
ID	  AUTOR	            FECHA	     		PROPOSITO                                                               
--    --------------	------------		------------------------------------------------------------   
@1    RBENDEZUV         03/06/2024 12:00      Registrar el aplicativo Servicio usuarios-servicios-externos-api-rest
************************************************************************************************/

/* REGISTRA APLICATIVO QUE PROVEE LOS METODOS DEL WS*/
DO $$
	DECLARE var_f_aud timestamp := localtimestamp;
	DECLARE var_b_aud CHARACTER varying(1) := 'I';
	DECLARE var_c_aud_uid CHARACTER varying(30) := CURRENT_USER;
	DECLARE var_c_aud_uidred CHARACTER varying(30) := 'PC-DESARROLLO';
	DECLARE var_c_aud_pc CHARACTER varying(30) := 'PC-DESARROLLO';
	DECLARE var_c_aud_ip CHARACTER varying(15) := cast(host(inet_client_addr()) as varchar(15));
	DECLARE var_c_aud_mcaddr CHARACTER varying(17) := '00-09-00-00-00-00';
BEGIN
INSERT INTO seguridad.mae_aplicativo(
	n_aplicativo, c_aplicativo, x_aplicativo, x_descripcion, n_tipo_aplicativo, l_activo,
	f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(
	nextval('seguridad.mae_aplicativo_seq'),'GUSEA','Servicio usuarios-servicios-externos-api-rest',
	'Api rest de gestion de usraios a servicios externos',
	(SELECT n_tipo_aplicativo FROM seguridad.mae_tipo_aplicativo WHERE x_tipo_aplicativo='REST'), '1',
 	var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
 COMMIT;
 END $$;
 
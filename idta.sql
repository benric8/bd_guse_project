this.sf.getCurrentSession().enableFilter(MaeOpcionPerfil.F_IDPERFIL)
			.setParameter(MaeOpcionPerfil.P_IDPERFIL, maeUsuario.getPerfil().getNPerfil());
			
			this.sf.getCurrentSession().enableFilter(MaeOpcionPerfil.F_ACTIVO)
			.setParameter(MaeOpcionPerfil.P_ACTIVO, ConstantesProject.ACTIVO_ESTADO);
			
			List<OpcionDTO> opcions = new ArrayList<OpcionDTO>();
			
			TypedQuery<MaeOpcionPerfil> queryOP = this.sf.getCurrentSession().createNamedQuery(MaeOpcionPerfil.NQ_FILTERS, MaeOpcionPerfil.class);
			queryOP.getResultList().forEach(item -> {
				opcions.add(new OpcionDTO(
						item.getOpcion().getNombre(), 
						item.getOpcion().getUrl(), 
						item.getOpcion().getIcono(), 
						item.getOpcion().getActivo().equalsIgnoreCase(ConstantesProject.ACTIVO_ESTADO) ? ConstantesProject.ACTIVO_DESCRICION : ConstantesProject.INACTIVO_DESCRIPCION ));
			});
			
			usuarioDTO.setOpcions(opcions);

			loginResponse.setIndicador(ConstantesProject.RPTA_1);
			loginResponse.setMensaje("Acceso exitoso.");
			loginResponse.setUsuario(usuarioDTO);
		} catch (NoResultException not) {
			loginResponse.setIndicador(ConstantesProject.RPTA_0);
			loginResponse.setMensaje("El usuario no existe o está inactivo.");
		} catch (Exception e) {
			logger.error("{} Error dao login: {}", cuo, e.getMessage());
			throw new Exception(e);
		}
		return loginResponse;
		
CREATE SCHEMA IF NOT EXISTS serviciosexternos AUTHORIZATION "usrServiciosExternos";
COMMENT ON SCHEMA serviciosexternos IS 'Esquema para  modelo serviciosexternos';
GRANT ALL ON SCHEMA serviciosexternos TO uc_guseapi_serviciosexternos;
GRANT SELECT ON ALL TABLES IN SCHEMA serviciosexternos TO uc_guseapi_serviciosexternos;

GRANT ALL ON SCHEMA serviciosexternos TO uc_guseapi_serviciosexternos;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA serviciosexternos TO uc_guseapi_serviciosexternos;
GRANT USAGE,SELECT ON ALL SEQUENCES IN SCHEMA serviciosexternos TO uc_guseapi_serviciosexternos;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA serviciosexternos TO uc_guseapi_serviciosexternos;

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
	nextval('seguridad.mae_aplicativo_seq'),'CSWS','Servicio Web consulta-siga-ws',
	'Web Service ws rest de consulta siga',
	(SELECT n_tipo_aplicativo FROM seguridad.mae_tipo_aplicativo WHERE x_tipo_aplicativo='REST'), '1',
 	var_f_aud, var_b_aud, var_c_aud_uid, var_c_aud_uidred,var_c_aud_pc,var_c_aud_ip,var_c_aud_mcaddr);
 COMMIT;
 END $$;
 

INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('0', 'SIN DOCUMENTO', '<Ninguno>', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);


INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('1', 'DOCUMENTO NACIONAL DE IDENTIDAD', 'D.N.I', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('2', 'REGISTRO UNICO DEL CONTRIBUYENTE', 'R.U.C', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('3', 'LIBRETA MILITAR', 'L.M', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('4', 'PARTIDA DE NACIMIENTO', 'P.N', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('5', 'PASAPORTE', 'P.S', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('6', 'CARNET DE EXTRANJERIA', 'C.E', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('7', 'CARNET DE ABOGADO', 'C.A.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('8', 'EXTRANJERO', 'EXTRANJERO', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('9', 'CARNET FF.PP.', 'CARNET FF.PP.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('A', 'CARNET FF.AA.', 'CARNET FF.AA.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('B', 'PERMISO TEMPORAL DE PERMANENCIA (PTP)', 'P.T.P', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('C', 'CEDULA DE IDENTIDAD', 'C.I.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('D', 'CARNET SEGURO SOCIAL', 'C.S.S.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('E', 'CARNET UNIVERSITARIO', 'C.U.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('F', 'PARTIDA DE MATRIMONIO', 'P.M.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('G', 'SALVOCONDUCTO', 'SALV.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('H', 'CARNET DE TRABAJO', 'C.T.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('I', 'LIBRETA ELECTORAL', 'L.E.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('J', 'LIBRETA ELECTORAL MECANIZADA', 'LE.MEC', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('K', 'LIBRETA TRIBUTARIA', 'L.TRIB', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('L', 'TARJETA DE PROPIEDAD', 'TARJ.PROP.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('M', 'BOLETA MILITAR', 'BOL.MIL.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('N', 'BREVETE', 'BREVETE', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('O', 'CARNET DE SOLICITANTE DE REFUGIO', 'T.D.S.R.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('P', 'DOCUMENTO DE VIAJE O LAISSEZ-PASSER POR RAZONES HUMANITARIAS', 'D.V.L.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);
INSERT INTO serviciosexternos.mae_tipo_documento
(b_tipo_documento, x_tipo_documento, x_abreviatura, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES('Q', 'DOCUMENTO DE IDENTIDAD DE OTRO ESTADO', 'D.I.O.E.', '1', '2023-07-02 10:45:53.182', '2023-07-02 10:45:53.182', 'I', 'postgres', 'postgres', 'postgres', '172.34.12.71', NULL);

INSERT INTO serviciosexternos.mae_persona
(n_persona, b_tipo_documento, x_nombres, x_primer_apellido, x_segundo_apellido,  x_documento_identidad,  l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_persona'), '1', 'RICHARD', 'BENDEZU', 'VILLENA',  '46300972',  '1'::character varying, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'I'::character varying, CURRENT_USER, '', '', '', '');


INSERT INTO serviciosexternos.mae_usuario
(n_usuario, n_persona, x_usuario, x_password,  l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_usuario'), 1, 'ADMIN', 'm-FweTff5iw*',  '1'::character varying, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'I'::character varying, CURRENT_USER, '', '', '', '');


INSERT INTO serviciosexternos.mae_perfil
(n_perfil, x_perfil, c_rol_seguridad, x_descripcion, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_perfil'), 'ADMINISTRADOR', 'AGUSE01', 'perfil que tiene completo acceso', '1'::character varying, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'I'::character varying, CURRENT_USER, '', '', '', '');


INSERT INTO serviciosexternos.mae_opcion
(n_opcion, x_opcion, x_endpoint, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_opcion'), 'Listar Entidad combo', 'combo/entidades', '1'::character varying, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'I'::character varying, CURRENT_USER, '', '', '', '');

INSERT INTO serviciosexternos.mae_opcion
(n_opcion, x_opcion, x_endpoint, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_opcion'), 'Listar Entidad combo', 'combo/aplicativos', '1'::character varying, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'I'::character varying, CURRENT_USER, '', '', '', '');


INSERT INTO serviciosexternos.mae_opcion_perfil
(n_opcion_perfil, n_opcion, n_perfil, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_opcion_perfil'), 1, 1, '1'::character varying, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'I'::character varying, CURRENT_USER, '', '', '', '');

INSERT INTO serviciosexternos.mae_opcion_perfil
(n_opcion_perfil, n_opcion, n_perfil, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_opcion_perfil'), 2, 1, '1'::character varying, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'I'::character varying, CURRENT_USER, '', '', '', '');

INSERT INTO serviciosexternos.mae_usuario_perfil
(n_usuario_perfil, n_usuario, n_perfil, l_activo, f_registro, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, c_aud_ip, c_aud_mcaddr)
VALUES(nextval('serviciosexternos.useq_mae_usuario_perfil'), 1, 1, '1'::character varying, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'I'::character varying, CURRENT_USER, '', '', '', '');


select mp.x_perfil , mp.c_rol_seguridad ,mo.x_endpoint  from serviciosexternos.mae_perfil mp 
inner join serviciosexternos.mae_usuario_perfil mup on mup.n_perfil = mp.n_perfil 
inner join serviciosexternos.mae_opcion_perfil mop on mop.n_perfil = mp.n_perfil 
inner join serviciosexternos.mae_opcion mo on mo.n_opcion = mop.n_opcion 
inner join serviciosexternos.mae_usuario mu on mu.n_usuario = mup.n_usuario 
where mu.x_usuario ='ADMIN'

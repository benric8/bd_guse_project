/***********************************************************************************************   
AUTOR		  :	rbendezuv
PROPOSITO	:	Actualización  triggers para almacenar los datos correctos en las tablas de auditoria en la base de datos pjSeguridad.
CREADO 		:	05/11/2024 09:00
ALCANCE		:	Proyecto depositoJudicialCentralizado
OBSERVACIONES:  Ejecutar el siguiente script con un usuario que tenga permisos necesarios
   
************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    rbendezuv         05/11/2024 09:00    Actualización  triggers para almacenar los datos correctos en las tablas de auditoria en la base de datos pjSeguridad.
************************************************************************************************/
/*::::::::::::::::::::Cfg_SistemaConexion:::::::::::*/

-- Verificar y eliminar triggers existentes
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'Utg_Cfg_SistemaConexion' AND type = 'TR')
	BEGIN
	    DROP TRIGGER uid_seguridad.Utg_Cfg_SistemaConexion
	    PRINT 'Trigger Utg_Cfg_SistemaConexion eliminado exitosamente.'
	END
ELSE
    PRINT 'El trigger Utg_Cfg_SistemaConexion no existía.'
GO
-- Crear nuevamente los triggers con los cambios realizados
CREATE TRIGGER uid_seguridad.Utg_Cfg_SistemaConexion
    ON uid_seguridad.Cfg_SistemaConexion
    FOR UPDATE, DELETE AS
BEGIN
     DECLARE @XTYPE CHAR(1)
	DECLARE @n_aud_ip VARCHAR(15)

    IF EXISTS (SELECT 'X' FROM deleted)
        SELECT @XTYPE = 'D'
    IF EXISTS (SELECT 'X' FROM inserted)
    BEGIN
        IF (@XTYPE = 'D')
            SELECT @XTYPE = 'U'
        ELSE
            SELECT @XTYPE = 'I'
    END

    			SET @n_aud_ip = (SELECT ipaddr from master..sysprocesses where spid = @@SPID)BEGI			
	N
        INSERT INTO pjSeguridad.uid_seguridad.Aud_Cfg_SistemaConexion (
            f_trns, b_trns, c_trns_uid, c_trns_pc, n_trns_ip, c_trns_mcaddr,
            n_idConexion, n_idSistema, f_registro, x_observacion,
            l_estadoRegistro, n_usuarioOperacion, f_aud, b_aud,
            c_aud_uid, c_aud_uidred, c_aud_pc, n_aud_ip, c_aud_mcaddr
        )
        SELECT
            GETDATE(), @XTYPE, user_name(), host_name(), @n_aud_ip, null,
            n_idConexion, n_idSistema, f_registro, x_observacion,
            l_estadoRegistro, n_usuarioOperacion, f_aud, b_aud,
            c_aud_uid, c_aud_uidred, c_aud_pc, n_aud_ip, c_aud_mcaddr
        FROM deleted
    END
END
GO
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'Utg_Cfg_SistemaConexion' AND type = 'TR')
    PRINT 'Trigger Utg_Cfg_SistemaConexion creado exitosamente.'
ELSE
    PRINT 'Error: Trigger Utg_Cfg_SistemaConexion no se creó correctamente.'
GO

/*:::::::::::::::::MAE_TIPOCONEXION::::::::::::::*/

-- Verificar y eliminar triggers existentes
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'Utg_Mae_TipoConexion' AND type = 'TR')
	BEGIN
	    DROP TRIGGER uid_seguridad.Utg_Mae_TipoConexion
	    PRINT 'Trigger Utg_Mae_TipoConexion eliminado exitosamente.'
	END
ELSE
    PRINT 'El trigger Utg_Mae_TipoConexion no existía.'
GO
-- Crear nuevamente los triggers con los cambios realizados
CREATE TRIGGER uid_seguridad.Utg_Mae_TipoConexion
	ON uid_seguridad.Mae_TipoConexion
	FOR UPDATE, DELETE AS
BEGIN
	DECLARE @XTYPE CHAR(1)
	DECLARE @n_aud_ip VARCHAR(15)

	IF EXISTS (SELECT 'X' FROM deleted)
		SELECT @XTYPE = 'D'
	IF EXISTS (SELECT 'X' FROM inserted)
		BEGIN
		IF (@XTYPE = 'D')
			SELECT @XTYPE = 'U'
		ELSE
			SELECT @XTYPE = 'I'
		END
			SET @n_aud_ip = (SELECT ipaddr from master..sysprocesses where spid = @@SPID)

            INSERT INTO pjSeguridad.uid_seguridad.Aud_Mae_TipoConexion(f_trns,    b_trns, c_trns_uid,  c_trns_pc,   n_trns_ip, c_trns_mcaddr,
			n_idTipoConexion, x_nombre, l_estadoRegistro, n_usuarioOperacion, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, n_aud_ip, c_aud_mcaddr)
			SELECT GETDATE(), @XTYPE, user_name(), host_name(), @n_aud_ip, null, n_idTipoConexion, x_nombre, l_estadoRegistro,
			n_usuarioOperacion, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, n_aud_ip, c_aud_mcaddr FROM deleted
END
GO
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'Utg_Mae_TipoConexion' AND type = 'TR')
    PRINT 'Trigger Utg_Mae_TipoConexion creado exitosamente.'
ELSE
    PRINT 'Error: Trigger Utg_Mae_TipoConexion no se creó correctamente.'
GO
/*:::::::::::::::::::::MAE_CONEXION::::::::::::::::::::::::::*/
-- Verificar y eliminar triggers existentes
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'Utg_Mae_Conexion' AND type = 'TR')
	BEGIN
	    DROP TRIGGER uid_seguridad.Utg_Mae_Conexion
	    PRINT 'Trigger Utg_Mae_Conexion eliminado exitosamente.'
	END
ELSE
    PRINT 'El trigger Utg_Mae_Conexion no existía.'
GO
-- Crear nuevamente los triggers con los cambios realizados

CREATE TRIGGER uid_seguridad.Utg_Mae_Conexion
	ON uid_seguridad.Mae_Conexion
	FOR UPDATE, DELETE AS
BEGIN
	DECLARE @XTYPE CHAR(1)
	DECLARE @n_aud_ip VARCHAR(15)

	IF EXISTS (SELECT 'X' FROM deleted)
		SELECT @XTYPE = 'D'
	IF EXISTS (SELECT 'X' FROM inserted)
		BEGIN
		IF (@XTYPE = 'D')
			SELECT @XTYPE = 'U'
		ELSE
			SELECT @XTYPE = 'I'
		END
			SET @n_aud_ip = (SELECT ipaddr from master..sysprocesses where spid = @@SPID)

            INSERT INTO pjSeguridad.uid_seguridad.Aud_Mae_Conexion(f_trns,    b_trns, c_trns_uid,  c_trns_pc,   n_trns_ip, c_trns_mcaddr,
			n_idConexion, n_idTipoConexion, n_idBaseDatos, x_nombre, x_jndi, x_usuario,x_clave, f_registro, l_estadoRegistro, n_usuarioOperacion,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, n_aud_ip, c_aud_mcaddr)
			SELECT GETDATE(), @XTYPE, user_name(), host_name(), @n_aud_ip, null, n_idConexion, n_idTipoConexion, n_idBaseDatos, x_nombre, x_jndi,
			x_usuario,x_clave, f_registro, l_estadoRegistro, n_usuarioOperacion,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, n_aud_ip, c_aud_mcaddr FROM deleted
END
GO
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'Utg_Mae_Conexion' AND type = 'TR')
    PRINT 'Trigger Utg_Mae_Conexion creado exitosamente.'
ELSE
    PRINT 'Error: Trigger Utg_Mae_Conexion no se creó correctamente.'
GO

/*:::::::::::::::::MAE_TIPOBASEDATOS::::::::::::::::::*/
-- Verificar y eliminar triggers existentes
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'Utg_Mae_TipoBaseDatos' AND type = 'TR')
	BEGIN
	    DROP TRIGGER uid_seguridad.Utg_Mae_TipoBaseDatos
	    PRINT 'Trigger Utg_Mae_TipoBaseDatos eliminado exitosamente.'
	END
ELSE
    PRINT 'El trigger Utg_Mae_TipoBaseDatos no existía.'
GO
-- Crear nuevamente los triggers con los cambios realizados

CREATE TRIGGER uid_seguridad.Utg_Mae_TipoBaseDatos
	ON uid_seguridad.Mae_TipoBaseDatos
	FOR UPDATE, DELETE AS
BEGIN
	DECLARE @XTYPE CHAR(1)
	DECLARE @n_aud_ip VARCHAR(15)

	IF EXISTS (SELECT 'X' FROM deleted)
		SELECT @XTYPE = 'D'
	IF EXISTS (SELECT 'X' FROM inserted)
		BEGIN
		IF (@XTYPE = 'D')
			SELECT @XTYPE = 'U'
		ELSE
			SELECT @XTYPE = 'I'
		END
			SET @n_aud_ip = (SELECT ipaddr from master..sysprocesses where spid = @@SPID)

            INSERT INTO pjSeguridad.uid_seguridad.Aud_Mae_TipoBaseDatos(f_trns,    b_trns, c_trns_uid,  c_trns_pc,   n_trns_ip, c_trns_mcaddr,
			n_idTipoBaseDatos, x_nombre, l_estadoRegistro, n_usuarioOperacion, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, n_aud_ip, c_aud_mcaddr)
			SELECT GETDATE(), @XTYPE, user_name(), host_name(), @n_aud_ip, null, n_idTipoBaseDatos, x_nombre, l_estadoRegistro,
			n_usuarioOperacion, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, n_aud_ip, c_aud_mcaddr FROM deleted

END
GO
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'Utg_Mae_TipoBaseDatos' AND type = 'TR')
    PRINT 'Trigger Utg_Mae_TipoBaseDatos creado exitosamente.'
ELSE
    PRINT 'Error: Trigger Utg_Mae_TipoBaseDatos no se creó correctamente.'
GO
/*::::::::::::::::::::::::Cfg_BaseDatosSede:::::::::::::::::::::::::::*/

-- Verificar y eliminar triggers existentes
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'Utg_Cfg_BaseDatosSede' AND type = 'TR')
	BEGIN
	    DROP TRIGGER uid_seguridad.Utg_Cfg_BaseDatosSede
	    PRINT 'Trigger Utg_Cfg_BaseDatosSede eliminado exitosamente.'
	END
ELSE
    PRINT 'El trigger Utg_Cfg_BaseDatosSede no existía.'
GO
-- Crear nuevamente los triggers con los cambios realizados
CREATE TRIGGER uid_seguridad.Utg_Cfg_BaseDatosSede
	ON uid_seguridad.Cfg_BaseDatosSede
	FOR UPDATE, DELETE AS
BEGIN
	DECLARE @XTYPE CHAR(1)
	DECLARE @n_aud_ip VARCHAR(15)

	IF EXISTS (SELECT 'X' FROM deleted)
		SELECT @XTYPE = 'D'
	IF EXISTS (SELECT 'X' FROM inserted)
		BEGIN
		IF (@XTYPE = 'D')
			SELECT @XTYPE = 'U'
		ELSE
			SELECT @XTYPE = 'I'
		END
			SET @n_aud_ip = (SELECT ipaddr from master..sysprocesses where spid = @@SPID)

            INSERT INTO pjSeguridad.uid_seguridad.Aud_Cfg_BaseDatosSede(f_trns,    b_trns, c_trns_uid,  c_trns_pc,   n_trns_ip, c_trns_mcaddr,
			n_idBaseDatosSede, n_idBaseDatos, c_distrito, c_org_jurisd, x_nom_org_jurisd_corto, c_especialidad, l_estadoRegistro, n_usuarioOperacion,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, n_aud_ip, c_aud_mcaddr)
			SELECT GETDATE(), @XTYPE, user_name(), host_name(), @n_aud_ip, null, n_idBaseDatosSede, n_idBaseDatos, c_distrito, c_org_jurisd,
			x_nom_org_jurisd_corto, c_especialidad, l_estadoRegistro, n_usuarioOperacion,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, n_aud_ip, c_aud_mcaddr FROM deleted
END
GO
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'Utg_Cfg_BaseDatosSede' AND type = 'TR')
    PRINT 'Trigger Utg_Cfg_BaseDatosSede creado exitosamente.'
ELSE
    PRINT 'Error: Trigger Utg_Cfg_BaseDatosSede no se creó correctamente.'
GO

/*::::::::::::::::::::::Mae_Esquema:::::::::::::::::::::::::::::::*/

-- Verificar y eliminar triggers existentes
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'Utg_Mae_Esquema' AND type = 'TR')
	BEGIN
	    DROP TRIGGER uid_seguridad.Utg_Mae_Esquema
	    PRINT 'Trigger Utg_Mae_Esquema eliminado exitosamente.'
	END
ELSE
    PRINT 'El trigger Utg_Mae_Esquema no existía.'
GO
-- Crear nuevamente los triggers con los cambios realizados
CREATE TRIGGER uid_seguridad.Utg_Mae_Esquema
	ON uid_seguridad.Mae_Esquema
	FOR UPDATE, DELETE AS
BEGIN
	DECLARE @XTYPE CHAR(1)
	DECLARE @n_aud_ip VARCHAR(15)

	IF EXISTS (SELECT 'X' FROM deleted)
		SELECT @XTYPE = 'D'
	IF EXISTS (SELECT 'X' FROM inserted)
		BEGIN
		IF (@XTYPE = 'D')
			SELECT @XTYPE = 'U'
		ELSE
			SELECT @XTYPE = 'I'
		END
			SET @n_aud_ip = (SELECT ipaddr from master..sysprocesses where spid = @@SPID)

            INSERT INTO pjSeguridad.uid_seguridad.Aud_Mae_Esquema(
			f_trns, b_trns, c_trns_uid, c_trns_pc, n_trns_ip, c_trns_mcaddr,
			n_idEsquema, x_esquema, n_idBaseDatos, l_estadoRegistro, n_usuarioOperacion, f_aud, b_aud, c_aud_uid, c_aud_uidred,
			c_aud_pc, n_aud_ip, c_aud_mcaddr)
			SELECT GETDATE(), @XTYPE, user_name(), host_name(), @n_aud_ip, null,
			n_idEsquema, x_esquema, n_idBaseDatos, l_estadoRegistro, n_usuarioOperacion, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, n_aud_ip, c_aud_mcaddr FROM deleted

END
GO
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'Utg_Mae_Esquema' AND type = 'TR')
    PRINT 'Trigger Utg_Mae_Esquema creado exitosamente.'
ELSE
    PRINT 'Error: Trigger Utg_Mae_Esquema no se creó correctamente.'
GO
/*::::::::::::::::::::::::Mae_BaseDatos:::::::::::::::::::::::::::*/

-- Verificar y eliminar triggers existentes
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'Utg_Mae_BaseDatos' AND type = 'TR')
	BEGIN
	    DROP TRIGGER uid_seguridad.Utg_Mae_BaseDatos
	    PRINT 'Trigger Utg_Mae_BaseDatos eliminado exitosamente.'
	END
ELSE
    PRINT 'El trigger Utg_Mae_BaseDatos no existía.'
GO
-- Crear nuevamente los triggers con los cambios realizados
CREATE TRIGGER uid_seguridad.Utg_Mae_BaseDatos
	ON uid_seguridad.Mae_BaseDatos
	FOR UPDATE, DELETE AS
BEGIN
	DECLARE @XTYPE CHAR(1)
	DECLARE @n_aud_ip VARCHAR(15)

	IF EXISTS (SELECT 'X' FROM deleted)
		SELECT @XTYPE = 'D'
	IF EXISTS (SELECT 'X' FROM inserted)
		BEGIN
		IF (@XTYPE = 'D')
			SELECT @XTYPE = 'U'
		ELSE
			SELECT @XTYPE = 'I'
		END
			SET @n_aud_ip = (SELECT ipaddr from master..sysprocesses where spid = @@SPID)

            INSERT INTO pjSeguridad.uid_seguridad.Aud_Mae_BaseDatos(f_trns,    b_trns, c_trns_uid,  c_trns_pc,   n_trns_ip, c_trns_mcaddr,
			n_idBaseDatos,c_distrito, n_idTipoBaseDatos, x_edicion, x_nombre, x_descripcion, x_ipServidor, x_puerto, x_instancia, l_esPrincipal, f_registro, l_estadoRegistro,
			n_usuarioOperacion, f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, n_aud_ip, c_aud_mcaddr)
			SELECT GETDATE(), @XTYPE, user_name(), host_name(), @n_aud_ip, null, n_idBaseDatos,c_distrito, n_idTipoBaseDatos, x_edicion, x_nombre, x_descripcion,
			x_ipServidor, x_puerto, x_instancia, l_esPrincipal, f_registro, l_estadoRegistro, n_usuarioOperacion,
			f_aud, b_aud, c_aud_uid, c_aud_uidred, c_aud_pc, n_aud_ip, c_aud_mcaddr FROM deleted

END
GO
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'Utg_Mae_BaseDatos' AND type = 'TR')
    PRINT 'Trigger Utg_Mae_BaseDatos creado exitosamente.'
ELSE
    PRINT 'Error: Trigger Utg_Mae_BaseDatos no se creó correctamente.'
GO
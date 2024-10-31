/***********************************************************************************************   
AUTOR		:	rbendezuv
PROPOSITO	:	Creación de tablas de auditoria
CREADO 		:	31/05/2024
ALCANCE		:	Proyecto SERVICIOS EXTERNOS
   
************************************************************************************************   
ID	  AUTOR	          FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    rbendezuv       31/05/2024    Creación de tablas de auditoria
************************************************************************************************/ 
DO $$
BEGIN
-- Tabla aud_mae_tipo_documento
DROP TABLE IF EXISTS serviciosexternos.aud_mae_tipo_documento CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.aud_mae_tipo_documento (
    N_TRNS_ID INT8 NOT NULL,
    -- TRAZABILIDAD
    F_TRNS TIMESTAMP(6),
    B_TRNS VARCHAR(1),
    C_TRNS_UID VARCHAR(30),
    C_TRNS_PC VARCHAR(30),
    N_TRNS_IP VARCHAR(15),
    C_TRNS_MCADDR VARCHAR(17),
    -- NEGOCIO
    b_tipo_documento CHAR(1) NOT NULL,
    x_tipo_documento VARCHAR(70) NOT NULL,
    x_abreviatura VARCHAR(20) NOT NULL,
    l_activo VARCHAR(1) NOT NULL,
    f_registro TIMESTAMP NOT NULL,
    -- CONTROL
    f_aud TIMESTAMP NOT NULL,
    b_aud VARCHAR(1) NOT NULL,
    c_aud_uid VARCHAR(30),
    c_aud_uidred VARCHAR(30),
    c_aud_pc VARCHAR(30),
    c_aud_ip VARCHAR(40),
    c_aud_mcaddr VARCHAR(17),
    CONSTRAINT pk_aud_mae_tipo_documento PRIMARY KEY (N_TRNS_ID)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla aud_mae_persona
DROP TABLE IF EXISTS serviciosexternos.aud_mae_persona CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.aud_mae_persona (
    N_TRNS_ID INT8 NOT NULL,
    -- TRAZABILIDAD
    F_TRNS TIMESTAMP(6),
    B_TRNS VARCHAR(1),
    C_TRNS_UID VARCHAR(30),
    C_TRNS_PC VARCHAR(30),
    N_TRNS_IP VARCHAR(15),
    C_TRNS_MCADDR VARCHAR(17),
    -- NEGOCIO
   n_persona INT8 NOT NULL,
  b_tipo_documento CHAR(1) NOT NULL,
  x_nombres VARCHAR(60),
  x_primer_apellido VARCHAR(60),
  x_segundo_apellido VARCHAR(60),
  f_nacimiento TIMESTAMP(6),
  x_documento_identidad VARCHAR(20),
  x_direccion VARCHAR(150),
  x_email VARCHAR(50),
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP NOT NULL,
    -- CONTROL
    f_aud TIMESTAMP NOT NULL,
    b_aud VARCHAR(1) NOT NULL,
    c_aud_uid VARCHAR(30),
    c_aud_uidred VARCHAR(30),
    c_aud_pc VARCHAR(30),
    c_aud_ip VARCHAR(40),
    c_aud_mcaddr VARCHAR(17),
    CONSTRAINT pk_aud_mae_persona PRIMARY KEY (N_TRNS_ID)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla aud_mae_opcion
DROP TABLE IF EXISTS serviciosexternos.aud_mae_opcion CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.aud_mae_opcion (
    N_TRNS_ID INT8 NOT NULL,
    -- TRAZABILIDAD
    F_TRNS TIMESTAMP(6),
    B_TRNS VARCHAR(1),
    C_TRNS_UID VARCHAR(30),
    C_TRNS_PC VARCHAR(30),
    N_TRNS_IP VARCHAR(15),
    C_TRNS_MCADDR VARCHAR(17),
    -- NEGOCIO
    n_opcion int2 NOT NULL,
  x_opcion varchar(100) NOT NULL,
  x_endpoint varchar(100) NOT NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP NOT NULL,
    -- CONTROL
    f_aud TIMESTAMP NOT NULL,
    b_aud VARCHAR(1) NOT NULL,
    c_aud_uid VARCHAR(30),
    c_aud_uidred VARCHAR(30),
    c_aud_pc VARCHAR(30),
    c_aud_ip VARCHAR(40),
    c_aud_mcaddr VARCHAR(17),
    CONSTRAINT pk_aud_mae_opcion PRIMARY KEY (N_TRNS_ID)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla aud_mae_perfil
DROP TABLE IF EXISTS serviciosexternos.aud_mae_perfil CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.aud_mae_perfil (
    N_TRNS_ID INT8 NOT NULL,
    -- TRAZABILIDAD
    F_TRNS TIMESTAMP(6),
    B_TRNS VARCHAR(1),
    C_TRNS_UID VARCHAR(30),
    C_TRNS_PC VARCHAR(30),
    N_TRNS_IP VARCHAR(15),
    C_TRNS_MCADDR VARCHAR(17),
    -- NEGOCIO
    n_perfil int2 NOT NULL,
  x_perfil varchar(30) NOT NULL,
  c_rol_seguridad varchar(10) NOT NULL,
  x_descripcion varchar(100) NOT NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP NOT NULL,
    -- CONTROL
    f_aud TIMESTAMP NOT NULL,
    b_aud VARCHAR(1) NOT NULL,
    c_aud_uid VARCHAR(30),
    c_aud_uidred VARCHAR(30),
    c_aud_pc VARCHAR(30),
    c_aud_ip VARCHAR(40),
    c_aud_mcaddr VARCHAR(17),
    CONSTRAINT pk_aud_mae_perfil PRIMARY KEY (N_TRNS_ID)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla aud_mae_usuario
DROP TABLE IF EXISTS serviciosexternos.aud_mae_usuario CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.aud_mae_usuario (
    N_TRNS_ID INT8 NOT NULL,
    -- TRAZABILIDAD
    F_TRNS TIMESTAMP(6),
    B_TRNS VARCHAR(1),
    C_TRNS_UID VARCHAR(30),
    C_TRNS_PC VARCHAR(30),
    N_TRNS_IP VARCHAR(15),
    C_TRNS_MCADDR VARCHAR(17),
    -- NEGOCIO
  n_usuario int2 NOT NULL,
  n_persona int8 NOT NULL,
  n_perfil int2 NOT NULL,
  x_usuario varchar(30) NOT NULL,
  x_password varchar(15) NOT NULL,
  f_cambio_clave timestamp(6) NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP NOT NULL,
    -- CONTROL
    f_aud TIMESTAMP NOT NULL,
    b_aud VARCHAR(1) NOT NULL,
    c_aud_uid VARCHAR(30),
    c_aud_uidred VARCHAR(30),
    c_aud_pc VARCHAR(30),
    c_aud_ip VARCHAR(40),
    c_aud_mcaddr VARCHAR(17),
    CONSTRAINT pk_aud_mae_usuario PRIMARY KEY (N_TRNS_ID)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla aud_mae_opcion_perfil
DROP TABLE IF EXISTS serviciosexternos.aud_mae_opcion_perfil CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.aud_mae_opcion_perfil (
    N_TRNS_ID INT8 NOT NULL,
    -- TRAZABILIDAD
    F_TRNS TIMESTAMP(6),
    B_TRNS VARCHAR(1),
    C_TRNS_UID VARCHAR(30),
    C_TRNS_PC VARCHAR(30),
    N_TRNS_IP VARCHAR(15),
    C_TRNS_MCADDR VARCHAR(17),
    -- NEGOCIO
  n_opcion_perfil int4 NOT NULL,
  n_opcion int2 NOT NULL,
  n_perfil int2 NOT NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP NOT NULL,
    -- CONTROL
    f_aud TIMESTAMP NOT NULL,
    b_aud VARCHAR(1) NOT NULL,
    c_aud_uid VARCHAR(30),
    c_aud_uidred VARCHAR(30),
    c_aud_pc VARCHAR(30),
    c_aud_ip VARCHAR(40),
    c_aud_mcaddr VARCHAR(17),
    CONSTRAINT pk_aud_mae_opcion_perfil PRIMARY KEY (N_TRNS_ID)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla aud_mae_entidad
DROP TABLE IF EXISTS serviciosexternos.aud_mae_entidad CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.aud_mae_entidad (
    N_TRNS_ID INT8 NOT NULL,
    -- TRAZABILIDAD
    F_TRNS TIMESTAMP(6),
    B_TRNS VARCHAR(1),
    C_TRNS_UID VARCHAR(30),
    C_TRNS_PC VARCHAR(30),
    N_TRNS_IP VARCHAR(15),
    C_TRNS_MCADDR VARCHAR(17),
    -- NEGOCIO
  n_entidad int2 NOT NULL,
  x_entidad varchar(150) NOT NULL,
  x_documento varchar(15) NOT NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP NOT NULL,
    -- CONTROL
    f_aud TIMESTAMP NOT NULL,
    b_aud VARCHAR(1) NOT NULL,
    c_aud_uid VARCHAR(30),
    c_aud_uidred VARCHAR(30),
    c_aud_pc VARCHAR(30),
    c_aud_ip VARCHAR(40),
    c_aud_mcaddr VARCHAR(17),
    CONSTRAINT pk_aud_mae_entidad PRIMARY KEY (N_TRNS_ID)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla mae_servicio
DROP TABLE IF EXISTS serviciosexternos.aud_mae_servicio CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.aud_mae_servicio (
    N_TRNS_ID INT8 NOT NULL,
    -- TRAZABILIDAD
    F_TRNS TIMESTAMP(6),
    B_TRNS VARCHAR(1),
    C_TRNS_UID VARCHAR(30),
    C_TRNS_PC VARCHAR(30),
    N_TRNS_IP VARCHAR(40),
    C_TRNS_MCADDR VARCHAR(17),
    -- NEGOCIO
   n_servicio int2 NOT NULL,
  n_entidad int2 NOT NULL,
  x_nombre_servicio varchar(150) NOT NULL,
  x_descripcion varchar(150) NOT NULL,
  x_url varchar(150),
  l_actualizar_credencial VARCHAR(1) DEFAULT '1' NOT NULL,
  n_dias_actualizar_credencial integer,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP NOT NULL,
    -- CONTROL
    f_aud TIMESTAMP(6) NOT NULL,
    b_aud VARCHAR(1) NOT NULL,
    c_aud_uid VARCHAR(30),
    c_aud_uidred VARCHAR(30),
    c_aud_pc VARCHAR(30),
    c_aud_ip VARCHAR(40),
    c_aud_mcaddr VARCHAR(17),
    CONSTRAINT pk_aud_mae_servicio PRIMARY KEY (N_TRNS_ID)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla mae_aplicativo
DROP TABLE IF EXISTS serviciosexternos.aud_mae_aplicativo CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.aud_mae_aplicativo (
    N_TRNS_ID INT8 NOT NULL,
    -- TRAZABILIDAD
    F_TRNS TIMESTAMP(6),
    B_TRNS VARCHAR(1),
    C_TRNS_UID VARCHAR(30),
    C_TRNS_PC VARCHAR(30),
    N_TRNS_IP VARCHAR(40),
    C_TRNS_MCADDR VARCHAR(17),
    -- NEGOCIO
  n_aplicativo int2 NOT NULL,
  x_aplicativo varchar(150) NOT NULL,
  x_descripcion varchar(150) NOT NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP NOT NULL,
    -- CONTROL
    f_aud TIMESTAMP(6) NOT NULL,
    b_aud VARCHAR(1) NOT NULL,
    c_aud_uid VARCHAR(30),
    c_aud_uidred VARCHAR(30),
    c_aud_pc VARCHAR(30),
    c_aud_ip VARCHAR(40),
    c_aud_mcaddr VARCHAR(17),
    CONSTRAINT pk_aud_mae_aplicativo PRIMARY KEY (N_TRNS_ID)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla mae_servicio_aplicativo
DROP TABLE IF EXISTS serviciosexternos.aud_mae_servicio_aplicativo CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.aud_mae_servicio_aplicativo (
    N_TRNS_ID INT8 NOT NULL,
    -- TRAZABILIDAD
    F_TRNS TIMESTAMP(6),
    B_TRNS VARCHAR(1),
    C_TRNS_UID VARCHAR(30),
    C_TRNS_PC VARCHAR(30),
    N_TRNS_IP VARCHAR(40),
    C_TRNS_MCADDR VARCHAR(17),
    -- NEGOCIO
  n_servicio_aplicativo int4 NOT NULL,
  n_servicio int2 NOT NULL,
  n_aplicativo int2 NOT NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP NOT NULL,
    -- CONTROL
    f_aud TIMESTAMP(6) NOT NULL,
    b_aud VARCHAR(1) NOT NULL,
    c_aud_uid VARCHAR(30),
    c_aud_uidred VARCHAR(30),
    c_aud_pc VARCHAR(30),
    c_aud_ip VARCHAR(40),
    c_aud_mcaddr VARCHAR(17),
    CONSTRAINT pk_aud_mae_servicio_aplicativo PRIMARY KEY (N_TRNS_ID)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla mae_cliente
DROP TABLE IF EXISTS serviciosexternos.aud_mae_cliente CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.aud_mae_cliente (
    N_TRNS_ID INT8 NOT NULL,
    -- TRAZABILIDAD
    F_TRNS TIMESTAMP(6),
    B_TRNS VARCHAR(1),
    C_TRNS_UID VARCHAR(30),
    C_TRNS_PC VARCHAR(30),
    N_TRNS_IP VARCHAR(40),
    C_TRNS_MCADDR VARCHAR(17),
    -- NEGOCIO
  n_cliente int2 NOT NULL,
  n_persona int8 NOT NULL,
  n_aplicativo int2 NOT NULL,
  x_usuario varchar(15) NOT NULL,
  x_clave varchar(50) NOT NULL,
  n_cuota int2 NOT NULL,
  x_usuario_registra varchar(30) NOT NULL,
  x_usuario_actualiza varchar(30),
  f_actualizacion date ,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP NOT NULL,
    -- CONTROL
    f_aud TIMESTAMP(6) NOT NULL,
    b_aud VARCHAR(1) NOT NULL,
    c_aud_uid VARCHAR(30),
    c_aud_uidred VARCHAR(30),
    c_aud_pc VARCHAR(30),
    c_aud_ip VARCHAR(40),
    c_aud_mcaddr VARCHAR(17),
    CONSTRAINT pk_aud_mae_cliente PRIMARY KEY (N_TRNS_ID)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla mov_consumo_cuota
DROP TABLE IF EXISTS serviciosexternos.aud_mov_consumo_cuota CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.aud_mov_consumo_cuota (
    N_TRNS_ID INT8 NOT NULL,
    -- TRAZABILIDAD
    F_TRNS TIMESTAMP(6),
    B_TRNS VARCHAR(1),
    C_TRNS_UID VARCHAR(30),
    C_TRNS_PC VARCHAR(30),
    N_TRNS_IP VARCHAR(40),
    C_TRNS_MCADDR VARCHAR(17),
    -- NEGOCIO
  n_consumo_cuota int2 NOT NULL,
  n_cliente int2 NOT NULL,
  f_consumo_cuota date,
  n_cuota_consumida integer DEFAULT 0 NOT NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP NOT NULL,
    -- CONTROL
    f_aud TIMESTAMP(6) NOT NULL,
    b_aud VARCHAR(1) NOT NULL,
    c_aud_uid VARCHAR(30),
    c_aud_uidred VARCHAR(30),
    c_aud_pc VARCHAR(30),
    c_aud_ip VARCHAR(40),
    c_aud_mcaddr VARCHAR(17),
    CONSTRAINT pk_aud_mae_consumo_cuota PRIMARY KEY (N_TRNS_ID)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Mensajes de creación de tablas
    RAISE NOTICE 'Todas las tablas han sido creadas exitosamente en el esquema serviciosexternos.';

EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Error al crear las tablas: %', SQLERRM;
END $$;
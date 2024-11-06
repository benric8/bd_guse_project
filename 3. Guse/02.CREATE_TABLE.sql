/***********************************************************************************************
AUTOR		:	rbendezuv
PROPOSITO	:	Creación de tablas de negocio
CREADO 		:	31/05/2024
ALCANCE		:	Proyecto SERVICIOS EXTERNOS

************************************************************************************************
ID	  AUTOR	          FECHA	     	PROPOSITO
--    --------------	------------	------------------------------------------------------------
@1    rbendezuv       31/05/2024    Creación de tablas de negocio
************************************************************************************************/
DO $$
BEGIN
-- Tabla mae_tipo_documento
DROP TABLE IF EXISTS serviciosexternos.mae_tipo_documento CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.mae_tipo_documento (
  b_tipo_documento CHAR(1) NOT NULL,
  x_tipo_documento VARCHAR(70) NOT NULL,
  x_abreviatura VARCHAR(20) NOT NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  --CONTROL
  f_aud TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  b_aud VARCHAR(1) DEFAULT 'I' NOT NULL,
  c_aud_uid VARCHAR(30) DEFAULT CURRENT_USER,
  c_aud_uidred VARCHAR(30),
  c_aud_pc VARCHAR(30),
  c_aud_ip VARCHAR(40),
  c_aud_mcaddr VARCHAR(17),
  CONSTRAINT pk_mae_tipo_documento PRIMARY KEY (b_tipo_documento)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla mae_persona
DROP TABLE IF EXISTS serviciosexternos.mae_persona CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.mae_persona (
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
  f_registro TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  --CONTROL
  f_aud TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  b_aud VARCHAR(1) DEFAULT 'I' NOT NULL,
  c_aud_uid VARCHAR(30) DEFAULT CURRENT_USER,
  c_aud_uidred VARCHAR(30),
  c_aud_pc VARCHAR(30),
  c_aud_ip VARCHAR(40),
  c_aud_mcaddr VARCHAR(17),
  CONSTRAINT pk_mae_persona PRIMARY KEY (n_persona),
  CONSTRAINT fk_mae_persona_01 FOREIGN KEY (b_tipo_documento) REFERENCES serviciosexternos.mae_tipo_documento (b_tipo_documento)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";



-- Tabla mae_opcion
DROP TABLE IF EXISTS serviciosexternos.mae_opcion CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.mae_opcion (
  n_opcion int2 NOT NULL,
  x_opcion varchar(100) NOT NULL,
  x_endpoint varchar(100) NOT NULL,
  x_icono VARCHAR (30) ,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  --CONTROL
  f_aud TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  b_aud VARCHAR(1) DEFAULT 'I' NOT NULL,
  c_aud_uid VARCHAR(30) DEFAULT CURRENT_USER,
  c_aud_uidred VARCHAR(30),
  c_aud_pc VARCHAR(30),
  c_aud_ip VARCHAR(40),
  c_aud_mcaddr VARCHAR(17),
  CONSTRAINT pk_mae_opcion PRIMARY KEY (n_opcion)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla mae_perfil
DROP TABLE IF EXISTS serviciosexternos.mae_perfil CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.mae_perfil (
  n_perfil int2 NOT NULL,
  x_perfil varchar(30) NOT NULL,
  c_rol_seguridad varchar(10) NOT NULL,
  x_descripcion varchar(100) NOT NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  --CONTROL
  f_aud TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  b_aud VARCHAR(1) DEFAULT 'I' NOT NULL,
  c_aud_uid VARCHAR(30) DEFAULT CURRENT_USER,
  c_aud_uidred VARCHAR(30),
  c_aud_pc VARCHAR(30),
  c_aud_ip VARCHAR(40),
  c_aud_mcaddr VARCHAR(17),
  CONSTRAINT pk_mae_perfil PRIMARY KEY (n_perfil)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla mae_usuario
DROP TABLE IF EXISTS serviciosexternos.mae_usuario CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.mae_usuario (
  n_usuario int2 NOT NULL,
  n_persona int8 NOT NULL,
  n_perfil int2 NOT NULL,
  x_usuario varchar(30) NOT NULL,
  x_password varchar(15) NOT NULL,
  f_cambio_clave timestamp(6) NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  --CONTROL
  f_aud TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  b_aud VARCHAR(1) DEFAULT 'I' NOT NULL,
  c_aud_uid VARCHAR(30) DEFAULT CURRENT_USER,
  c_aud_uidred VARCHAR(30),
  c_aud_pc VARCHAR(30),
  c_aud_ip VARCHAR(40),
  c_aud_mcaddr VARCHAR(17),
  CONSTRAINT pk_mae_usuario PRIMARY KEY (n_usuario),
  CONSTRAINT fk_mae_usuario_01 FOREIGN KEY (n_persona) REFERENCES serviciosexternos.mae_persona (n_persona),
  CONSTRAINT fk_mae_usuario_02 FOREIGN KEY (n_perfil) REFERENCES serviciosexternos.mae_perfil (n_perfil)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla mae_opcion_perfil
DROP TABLE IF EXISTS serviciosexternos.mae_opcion_perfil CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.mae_opcion_perfil (
  n_opcion_perfil int4 NOT NULL,
  n_opcion int2 NOT NULL,
  n_perfil int2 NOT NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  --CONTROL
  f_aud TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  b_aud VARCHAR(1) DEFAULT 'I' NOT NULL,
  c_aud_uid VARCHAR(30) DEFAULT CURRENT_USER,
  c_aud_uidred VARCHAR(30),
  c_aud_pc VARCHAR(30),
  c_aud_ip VARCHAR(40),
  c_aud_mcaddr VARCHAR(17),
  CONSTRAINT pk_mae_opcion_perfil PRIMARY KEY (n_opcion_perfil),
  CONSTRAINT fk_mae_opcion_perfil_01 FOREIGN KEY (n_opcion) REFERENCES serviciosexternos.mae_opcion (n_opcion),
  CONSTRAINT fk_mae_opcion_perfil_02 FOREIGN KEY (n_perfil) REFERENCES serviciosexternos.mae_perfil (n_perfil)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla mae_entidad
DROP TABLE IF EXISTS serviciosexternos.mae_entidad CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.mae_entidad (
  n_entidad int2 NOT NULL,
  x_entidad varchar(150) NOT NULL,
  x_documento varchar(15) NOT NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  --CONTROL
  f_aud TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  b_aud VARCHAR(1) DEFAULT 'I' NOT NULL,
  c_aud_uid VARCHAR(30) DEFAULT CURRENT_USER,
  c_aud_uidred VARCHAR(30),
  c_aud_pc VARCHAR(30),
  c_aud_ip VARCHAR(40),
  c_aud_mcaddr VARCHAR(17),
  CONSTRAINT pk_mae_entidad PRIMARY KEY (n_entidad)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla mae_servicio
DROP TABLE IF EXISTS serviciosexternos.mae_servicio CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.mae_servicio (
  n_servicio int2 NOT NULL,
  n_entidad int2 NOT NULL,
  x_nombre_servicio varchar(150) NOT NULL,
  x_descripcion varchar(150) NOT NULL,
  x_url varchar(150),
  l_actualizar_credencial VARCHAR(1) DEFAULT '1' NOT NULL,
  n_dias_actualizar_credencial integer,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  --CONTROL
  f_aud TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  b_aud VARCHAR(1) DEFAULT 'I' NOT NULL,
  c_aud_uid VARCHAR(30) DEFAULT CURRENT_USER,
  c_aud_uidred VARCHAR(30),
  c_aud_pc VARCHAR(30),
  c_aud_ip VARCHAR(40),
  c_aud_mcaddr VARCHAR(17),
  CONSTRAINT pk_mae_servicio PRIMARY KEY (n_servicio),
  CONSTRAINT fk_mae_servicio_01 FOREIGN KEY (n_entidad) REFERENCES serviciosexternos.mae_entidad (n_entidad)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla mae_aplicativo
DROP TABLE IF EXISTS serviciosexternos.mae_aplicativo CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.mae_aplicativo (
  n_aplicativo int2 NOT NULL,
  c_aplicativo varchar(10) NOT NULL,
  x_aplicativo varchar(150) NOT NULL,
  x_descripcion varchar(150) NOT NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  --CONTROL
  f_aud TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  b_aud VARCHAR(1) DEFAULT 'I' NOT NULL,
  c_aud_uid VARCHAR(30) DEFAULT CURRENT_USER,
  c_aud_uidred VARCHAR(30),
  c_aud_pc VARCHAR(30),
  c_aud_ip VARCHAR(40),
  c_aud_mcaddr VARCHAR(17),
  CONSTRAINT pk_mae_aplicativo PRIMARY KEY (n_aplicativo)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Tabla mae_servicio_aplicativo
DROP TABLE IF EXISTS serviciosexternos.mae_servicio_aplicativo CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.mae_servicio_aplicativo (
  n_servicio_aplicativo int4 NOT NULL,
  n_servicio int2 NOT NULL,
  n_aplicativo int2 NOT NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  --CONTROL
  f_aud TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  b_aud VARCHAR(1) DEFAULT 'I' NOT NULL,
  c_aud_uid VARCHAR(30) DEFAULT CURRENT_USER,
  c_aud_uidred VARCHAR(30),
  c_aud_pc VARCHAR(30),
  c_aud_ip VARCHAR(40),
  c_aud_mcaddr VARCHAR(17),
  CONSTRAINT pk_mae_servicio_aplicativo PRIMARY KEY (n_servicio_aplicativo),
  CONSTRAINT fk_mae_servicio_aplicativo_01 FOREIGN KEY (n_servicio) REFERENCES serviciosexternos.mae_servicio (n_servicio),
  CONSTRAINT fk_mae_servicio_aplicativo_02 FOREIGN KEY (n_aplicativo) REFERENCES serviciosexternos.mae_aplicativo (n_aplicativo)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";


-- Tabla mov_consumo_cuota
DROP TABLE IF EXISTS serviciosexternos.mov_consumo_cuota CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.mov_consumo_cuota (
  n_consumo_cuota int2 NOT NULL,
  f_consumo_cuota date,
  n_cuota_consumida integer DEFAULT 0 NOT NULL,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  --CONTROL
  f_aud TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  b_aud VARCHAR(1) DEFAULT 'I' NOT NULL,
  c_aud_uid VARCHAR(30) DEFAULT CURRENT_USER,
  c_aud_uidred VARCHAR(30),
  c_aud_pc VARCHAR(30),
  c_aud_ip VARCHAR(40),
  c_aud_mcaddr VARCHAR(17),
  CONSTRAINT pk_mov_consumo_cuota PRIMARY KEY (n_consumo_cuota)
) TABLESPACE "TBS_SERVICIOS_EXTERNOS";


-- Tabla mae_cliente
DROP TABLE IF EXISTS serviciosexternos.mae_cliente CASCADE;
CREATE TABLE IF NOT EXISTS serviciosexternos.mae_cliente (
  n_cliente int2 NOT NULL,
  n_persona int8 NOT NULL,
  n_aplicativo int2 NOT NULL,
  n_consumo_cuota int2 NOT NULL,
  x_usuario varchar(15) NOT NULL,
  x_clave varchar(50) NOT NULL,
  n_cuota int2 NOT NULL,
  x_usuario_registra varchar(30) NOT NULL,
  x_usuario_actualiza varchar(30),
  f_actualizacion date ,
  l_activo VARCHAR(1) DEFAULT '1' NOT NULL,
  f_registro TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  --CONTROL
  f_aud TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
  b_aud VARCHAR(1) DEFAULT 'I' NOT NULL,
  c_aud_uid VARCHAR(30) DEFAULT CURRENT_USER,
  c_aud_uidred VARCHAR(30),
  c_aud_pc VARCHAR(30),
  c_aud_ip VARCHAR(40),
  c_aud_mcaddr VARCHAR(17),
  CONSTRAINT pk_mae_cliente PRIMARY KEY (n_cliente),
  CONSTRAINT fk_mae_cliente_01 FOREIGN KEY (n_persona) REFERENCES serviciosexternos.mae_persona (n_persona),
  CONSTRAINT fk_mae_cliente_02 FOREIGN KEY (n_aplicativo) REFERENCES serviciosexternos.mae_aplicativo (n_aplicativo),
  CONSTRAINT fk_mov_consumo_cuota_01 FOREIGN KEY (n_consumo_cuota) REFERENCES serviciosexternos.mov_consumo_cuota(n_consumo_cuota)
    ) TABLESPACE "TBS_SERVICIOS_EXTERNOS";

-- Mensajes de creación de tablas
    RAISE NOTICE 'Todas las tablas han sido creadas exitosamente en el esquema serviciosexternos.';

EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Error al crear las tablas: %', SQLERRM;
END $$;
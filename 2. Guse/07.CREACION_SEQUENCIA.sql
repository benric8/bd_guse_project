/***********************************************************************************************   
AUTOR		:	rbendezuv
PROPOSITO	:	Creación de secuencias
CREADO 		:	31/05/2024
ALCANCE		:	Servicio web rest Gestion de usuarios externos
   
************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    rbendezuv           31/05/2024      Creación de secuencias
************************************************************************************************/ 

CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_aud_mae_tipo_documento START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_mae_persona START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_aud_mae_persona START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_mae_usuario START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_aud_mae_usuario START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_mae_opcion START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_aud_mae_opcion START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_mae_perfil START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_aud_mae_perfil START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_mae_opcion_perfil START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_aud_mae_opcion_perfil START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_mae_usuario_perfil START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_aud_mae_usuario_perfil START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_mae_entidad START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_aud_mae_entidad START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_mae_servicio START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_aud_mae_servicio START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_mae_aplicativo START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_aud_mae_aplicativo START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_mae_servicio_aplicativo START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_aud_mae_servicio_aplicativo START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_mae_cliente START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_aud_mae_cliente START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_mae_consumo_cuota START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS serviciosexternos.useq_aud_mae_consumo_cuota START WITH 1 INCREMENT BY 1;
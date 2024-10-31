/***********************************************************************************************   
AUTOR		:	rbendezuv
PROPOSITO	:	Creción de triggers 
CREADO 		:	31/05/2024
ALCANCE		:	servicio web rest gestion de usuarios externos
   
************************************************************************************************   
ID	  AUTOR	            FECHA	     	PROPOSITO                                                               
--    --------------	------------	------------------------------------------------------------   
@1    rbendezuv          31/05/2024      Creción de triggers 
************************************************************************************************/ 

create trigger utg_mae_tipo_documento after
delete or update
on  serviciosexternos.mae_tipo_documento for each row execute function serviciosexternos.ufn_mae_tipo_documento();

create trigger utg_mae_persona after
delete or update
on  serviciosexternos.mae_persona for each row execute function serviciosexternos.ufn_mae_persona();

create trigger utg_mae_usuario after
delete or update
on  serviciosexternos.mae_usuario for each row execute function serviciosexternos.ufn_mae_usuario();

create trigger utg_mae_opcion after
delete or update
on  serviciosexternos.mae_opcion for each row execute function serviciosexternos.ufn_mae_opcion();

create trigger utg_mae_perfil after
delete or update
on  serviciosexternos.mae_perfil for each row execute function serviciosexternos.ufn_mae_perfil();

create trigger utg_mae_opcion_perfil after
delete or update
on  serviciosexternos.mae_opcion_perfil for each row execute function serviciosexternos.ufn_mae_opcion_perfil();

create trigger utg_mae_entidad after
delete or update
on  serviciosexternos.mae_entidad for each row execute function serviciosexternos.ufn_mae_entidad();

create trigger utg_mae_servicio after
delete or update
on  serviciosexternos.mae_servicio for each row execute function serviciosexternos.ufn_mae_servicio();

create trigger utg_mae_aplicativo after
delete or update
on  serviciosexternos.mae_aplicativo for each row execute function serviciosexternos.ufn_mae_aplicativo();

create trigger utg_mae_servicio_aplicativo after
delete or update
on  serviciosexternos.mae_servicio_aplicativo for each row execute function serviciosexternos.ufn_mae_servicio_aplicativo();

create trigger utg_mae_cliente after
delete or update
on  serviciosexternos.mae_cliente for each row execute function serviciosexternos.ufn_mae_cliente();

create trigger utg_mov_consumo_cuota after
delete or update
on  serviciosexternos.mov_consumo_cuota for each row execute function serviciosexternos.ufn_mov_consumo_cuota();
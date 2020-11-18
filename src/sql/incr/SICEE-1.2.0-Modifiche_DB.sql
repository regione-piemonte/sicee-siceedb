/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

ALTER TABLE SICEE_T_LIMITEQH_PIEMONTE ADD (FLG_EDIFICIO  CHAR(1));

ALTER TABLE SICEE_D_DEST_USO ADD (FLG_EDIFICIO  CHAR(1));

ALTER TABLE SICEE_T_LIMITEQH_PIEMONTE MODIFY(GG_5000 NUMBER(6,2));
 
ALTER TABLE SICEE_T_LIMITEQH_PIEMONTE MODIFY(GG_3000 NUMBER(6,2));


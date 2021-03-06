/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

alter table SICEE_T_VERIFYSIGNANDCERT add CONTROLLO_BATCH CHAR(1) DEFAULT 'N' NULL;

alter table SICEE_T_VERIFYSIGNANDCERT add ESITO_FIRMA VARCHAR2(2);

alter table SICEE_T_FIRMA_MARCA add CADES_COMPLIANT VARCHAR2(5);

ALTER TABLE SICEE_D_MOTIVO_RILASCIO ADD FLG_VISIBILE_COMBO  CHAR(1);

ALTER TABLE SICEE_D_MOTIVO_SOST ADD FLG_VISIBILE_COMBO  CHAR(1);

CREATE INDEX IE_SICEE_T_CERTIFICATO_05 ON SICEE_T_CERTIFICATO (FK_STATO)
TABLESPACE SICEE_SMALL_IDX;

CREATE INDEX IE_SICEE_T_CERTIFICATO_06 ON SICEE_T_CERTIFICATO (ID_CERTIFICATORE)
TABLESPACE SICEE_SMALL_IDX;

CREATE INDEX IE_SICEE_T_CERTIFICATO_07 ON SICEE_T_CERTIFICATO (ID_PROV, ID_COMUNE) 
TABLESPACE SICEE_SMALL_IDX;




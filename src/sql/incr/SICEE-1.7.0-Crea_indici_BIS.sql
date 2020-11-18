/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

CREATE INDEX IE_SICEE_T_CERTIFICATO_03 ON SICEE.SICEE_T_CERTIFICATO (ID_PROV)
TABLESPACE SICEE_SMALL_IDX;

CREATE INDEX IE_SICEE_T_CERTIFICATO_04 ON SICEE.SICEE_T_CERTIFICATO (ID_COMUNE)
TABLESPACE SICEE_SMALL_IDX;

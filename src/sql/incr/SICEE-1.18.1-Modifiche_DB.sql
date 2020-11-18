/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

ALTER TABLE SICEE.SICEE_T_VERIFY_REPORT MODIFY PROGR_VERIFY_REPORT NUMBER(12,0);

ALTER TABLE SICEE.SICEE_T_DATICATAST_SEC MODIFY  ID_DATICATAST_SEC NUMBER(12,0); 

ALTER TABLE SICEE.SICEE_T_DATI_ESAMI MODIFY ID_DATI_ESAMI NUMBER(12,0);

alter table SICEE_T_DATI_FIRMA MODIFY PROGR_VERIFY_REPORT NUMBER(12,0);

alter table SICEE_T_DATI_BATCH MODIFY PROGR_VERIFY_REPORT NUMBER(12,0);
/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/
ALTER TABLE SICEE_T_TRANSAZIONE_ACE
       ADD  ( CONSTRAINT FK_SICEE_T_CERTIFICATORE_03
              FOREIGN KEY (FK_CERTIFICATORE)
                             REFERENCES SICEE_T_CERTIFICATORE ) ;

alter table SICEE_T_CERTIFICATO modify NOTE VARCHAR2(2000);
alter table SICEE_T_FABBISOGNO modify REND_ACS_ETAGACS NUMBER(17,5);
alter table SICEE_T_DATI_GENERALI modify ETTARI_BOSCO NUMBER(17,5);
alter table SICEE_T_ALTRE_INFO modify ULT_INFO VARCHAR2(2000);
alter table  SICEE_T_ENERGIA_SOPR_INGR modify NOTE_SOPRALL VARCHAR2(2000);

alter table SICEE_T_RISPETTO_NORMATIVE modify MOTIVO_NON_CONFORMITA VARCHAR2(2000);
alter table SICEE_T_RISPETTO_NORMATIVE modify NOTE VARCHAR2(2000);

alter table SICEE_T_CERTIFICATO modify DESC_INDIRIZZO VARCHAR2(160);
alter table SICEE_T_CERTIFICATORE modify DESC_INDIRIZZO VARCHAR2(160);
alter table SICEE_T_AZIENDA modify DESC_INDIRIZZO VARCHAR2(160);
alter table SICEE_T_RUOLI_EDIFICIO modify DESC_INDIRIZZO VARCHAR2(160);







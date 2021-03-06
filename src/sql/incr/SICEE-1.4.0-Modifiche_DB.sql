/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

alter table SICEE_T_RACCOMANDAZIONI disable constraint FK_SICEE_D_PRIORITA_01;
ALTER TABLE SICEE_T_CERTIFICATORE ADD (FLG_ESAME_SOSTENUTO  CHAR(1));

update SICEE_T_RACCOMANDAZIONI set priorita='1 - '||priorita
where priorita='ALTA';
COMMIT;

update SICEE_T_RACCOMANDAZIONI set priorita='2 - '||priorita
where priorita='MEDIA';
COMMIT;

update SICEE_T_RACCOMANDAZIONI set priorita='3 - '||priorita
where priorita='BASSA';
COMMIT;

truncate table SICEE_D_PRIORITA;

ALTER TABLE SICEE.SICEE_D_PRIORITA ADD (DESCR  VARCHAR2(20));

Insert into SICEE.SICEE_D_PRIORITA
   (PRIORITA, DESCR)
 Values
   ('1 - ALTA', 'ALTA');
Insert into SICEE.SICEE_D_PRIORITA
   (PRIORITA, DESCR)
 Values
   ('2 - MEDIA', 'MEDIA');
Insert into SICEE.SICEE_D_PRIORITA
   (PRIORITA, DESCR)
 Values
   ('3 - BASSA', 'BASSA');
COMMIT;

alter table SICEE_T_RACCOMANDAZIONI enable constraint FK_SICEE_D_PRIORITA_01;

ALTER TABLE SICEE.SICEE_T_DATI_GENERALI
 ADD (FLG_USO_PUBBLICO  CHAR(1));
 
 ALTER TABLE SICEE.SICEE_T_CERTIFICATORE
 ADD (EMAIL_PEC  VARCHAR2(70));

ALTER TABLE SICEE.SICEE_T_CERTIFICATORE
 ADD (FLG_NEWSLETTER  CHAR(1));

ALTER TABLE SICEE.SICEE_D_COMBUSTIBILE ADD (FATTORE_EMISSIONE NUMBER(8,5));

 
 CREATE TABLE SICEE_T_DATI_ESAMI (
       ID_DATI_ESAMI        NUMBER(6) NOT NULL,
       FK_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       CORSO_FREQUENTATO    VARCHAR2(1000) NULL,
       DT_MODULO1_DA        DATE NULL,
       DT_MODULO1_A         DATE NULL,
       DT_MODULO2_DA        DATE NULL,
       DT_MODULO2_A         DATE NULL,
       TOTALE_ORE           NUMBER(5) NULL,
       ATT_PARTECIP_EMESSO  VARCHAR2(1000) NULL,
       DT_ATT_PARTECIP      DATE NULL,
       ATT_ESAME_PRESSO     VARCHAR2(1000) NULL,
       DT_ATT_ESAME         DATE NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_T_DATI_ESAMI
       ADD  ( CONSTRAINT PK_SICEE_T_DATI_ESAMI PRIMARY KEY (
              ID_DATI_ESAMI)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;

ALTER TABLE SICEE_T_DATI_ESAMI
       ADD  ( CONSTRAINT FK_SICEE_T_CERTIFICATORE_05
              FOREIGN KEY (FK_CERTIFICATORE)
                             REFERENCES SICEE_T_CERTIFICATORE ) ;
                             
                             
CREATE TABLE SICEE_D_STATO_FILE (
       ID_STATO_FILE        NUMBER(3) NOT NULL,
       DESCR                VARCHAR2(50) NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_D_STATO_FILE
       ADD  ( CONSTRAINT PK_SICEE_D_STATO_FILE PRIMARY KEY (
              ID_STATO_FILE)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;
              

        
CREATE TABLE SICEE_T_ESAMI (
       CODICE_FISCALE       VARCHAR2(16) NOT NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_T_ESAMI
       ADD  ( CONSTRAINT PK_SICEE_T_ESAMI PRIMARY KEY (CODICE_FISCALE)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;        
        
        
                             
ALTER TABLE SICEE_T_DATI_GENERALI MODIFY VOL_LORDO_RISCALDATO NUMBER(14,4);
ALTER TABLE SICEE_T_DATI_GENERALI MODIFY SUP_DISPERDENTE_TOT NUMBER(14,4);
ALTER TABLE SICEE_T_DATI_GENERALI MODIFY FATTORE_FORMA NUMBER(14,4);
ALTER TABLE SICEE_T_DATI_GENERALI MODIFY TRASM_OPACHE NUMBER(14,4);
ALTER TABLE SICEE_T_DATI_GENERALI MODIFY TRASM_TRASP NUMBER(14,4);
ALTER TABLE SICEE_T_DATI_GENERALI MODIFY SU NUMBER(14,4);
ALTER TABLE SICEE_T_DATI_GENERALI MODIFY EMISSIONI_SERRA NUMBER(14,4);

ALTER TABLE SICEE_T_IMP_RISCALDAMENTO_ACS MODIFY POT_RISCALDAMENTO NUMBER(14,4);
ALTER TABLE SICEE_T_IMP_RISCALDAMENTO_ACS MODIFY POT_ACS NUMBER(14,4);

ALTER TABLE SICEE_T_FABBISOGNO MODIFY DOM_RISC_QH NUMBER(14,4);
ALTER TABLE SICEE_T_FABBISOGNO MODIFY LIMITE_REG_QH_LIM NUMBER(14,4);
ALTER TABLE SICEE_T_FABBISOGNO MODIFY FABB_CONDIZ NUMBER(14,4);
ALTER TABLE SICEE_T_FABBISOGNO MODIFY DOM_ACS_QHW NUMBER(14,4);
ALTER TABLE SICEE_T_FABBISOGNO MODIFY EN_ACS_RINNO NUMBER(14,4);
ALTER TABLE SICEE_T_FABBISOGNO MODIFY FABB_ACS NUMBER(14,4);
ALTER TABLE SICEE_T_FABBISOGNO MODIFY FABB_ILLUM NUMBER(14,4);

ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY REND_GENER NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY REND_REGOL NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY REND_EMISS NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY REND_DISTRIB NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY REND_IMP_ETAG NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY IND_RISC_EPI NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY IND_COND_EST NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY IND_ILLUM NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY IND_GLOB_EPLORDO NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY DOM_RISC_QHTO NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY LIMITE_REG_QHTO NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY IND_RISC_EPITO NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY DOM_ACS_QHWTO NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY EN_ACS_RINNO_TO NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY REND_ACS_ETAG_ACSTO NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY FABB_ACS_TO NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY IND_GLOB_EPLORDO_TO NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY ETAG_CONV NUMBER(14,4);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY IND_GLOB_LIMITE_TO NUMBER(14,4);

ALTER TABLE SICEE_T_ALTRE_INFO MODIFY PRESTAZIONE_ENE NUMBER(14,4);
ALTER TABLE SICEE_T_ALTRE_INFO MODIFY LIMITE_NORMA_RISC NUMBER(14,4);
ALTER TABLE SICEE_T_ALTRE_INFO MODIFY LIMITE_NORMA_IMP NUMBER(14,4);
ALTER TABLE SICEE_T_ALTRE_INFO MODIFY VALORE_PREST_PDC NUMBER(14,4);
ALTER TABLE SICEE_T_ALTRE_INFO MODIFY LIMITE_NORMA_PDC NUMBER(14,4);
ALTER TABLE SICEE_T_ALTRE_INFO MODIFY IND_RISC_EPI_NAZ NUMBER(14,4);

ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY ANN_TERMI_FOSSILE NUMBER(14,4);
ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY ANN_ELETT_FOSSILE NUMBER(14,4);
ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY ANN_TERMI_RINNO NUMBER(14,4);
ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY ANN_ELETT_RINNO NUMBER(14,4);
ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY COMPLESS_TERMICO NUMBER(14,4);
ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY COMPLESS_ELETTRICO NUMBER(14,4);

ALTER TABLE SICEE_T_ENERGIA_SOPR_INGR MODIFY EN_TERMICA_PROD NUMBER(14,4);
ALTER TABLE SICEE_T_ENERGIA_SOPR_INGR MODIFY EN_ELETT_PROD NUMBER(14,4);
ALTER TABLE SICEE_T_ENERGIA_SOPR_INGR MODIFY AUTOCONS_TERMICO NUMBER(14,4);
ALTER TABLE SICEE_T_ENERGIA_SOPR_INGR MODIFY AUTOCONS_ELETT NUMBER(14,4);
     
     
UPDATE SICEE_D_COMBUSTIBILE SET FATTORE_EMISSIONE = 0.275
WHERE ID_COMBUSTIBILE=1;

UPDATE SICEE_D_COMBUSTIBILE SET FATTORE_EMISSIONE = 0.264
WHERE ID_COMBUSTIBILE=2;

UPDATE SICEE_D_COMBUSTIBILE SET FATTORE_EMISSIONE = 0.203
WHERE ID_COMBUSTIBILE=3;

UPDATE SICEE_D_COMBUSTIBILE SET FATTORE_EMISSIONE = 0.234
WHERE ID_COMBUSTIBILE=4;

UPDATE SICEE_D_COMBUSTIBILE SET FATTORE_EMISSIONE = 0
WHERE ID_COMBUSTIBILE=5;

UPDATE SICEE_D_COMBUSTIBILE SET FATTORE_EMISSIONE = 0
WHERE ID_COMBUSTIBILE=6;

UPDATE SICEE_D_COMBUSTIBILE SET FATTORE_EMISSIONE = 0.47
WHERE ID_COMBUSTIBILE=7;

UPDATE SICEE_D_COMBUSTIBILE SET FATTORE_EMISSIONE = 0.203
WHERE ID_COMBUSTIBILE=8;

COMMIT;

ALTER TABLE SICEE_T_CERTIFICATO ADD FLG_EDIFICIO_PERFORMANTE CHAR(1);           
ALTER TABLE SICEE_T_CERTIFICATORE ADD SITO_WEB VARCHAR2(50);                 
ALTER TABLE SICEE_W_CERTIFICATORE ADD FLG_CARICATO CHAR(1);


ALTER TABLE SICEE_T_CERTIFICATO ADD FLG_SIGMATER  CHAR(1);                             
                             
                             
ALTER TABLE SICEE_D_COMBUSTIBILE ADD FLG_COMBO_RISCALD  CHAR(1);


Insert into SICEE_D_COMBUSTIBILE
   (ID_COMBUSTIBILE, DESCR, FATTORE_EMISSIONE, FLG_COMBO_RISCALD)
 Values
   (9, 'Solare termico', 0, 'S');
Insert into SICEE_D_COMBUSTIBILE
   (ID_COMBUSTIBILE, DESCR, FATTORE_EMISSIONE, FLG_COMBO_RISCALD)
 Values
   (10, 'Volume d''acs non richiesto (p.to 5.2.1 11300/2)', 0, '');
COMMIT;

UPDATE SICEE_D_COMBUSTIBILE SET FLG_COMBO_RISCALD='S' WHERE ID_COMBUSTIBILE <=9;

COMMIT;


CREATE TABLE SICEE_T_VERIFY_REPORT (
       PROGR_VERIFY_REPORT  NUMBER(6) NOT NULL,
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       PARAMETRI_INPUT      NUMBER(3) NULL,
       FORMATO_FIRMA        NUMBER(3) NULL,
       TIPO_FIRMA           NUMBER(3) NULL,
       NUM_CERTIFICATI_FIRMA NUMBER(3) NULL,
       NUM_MARCHE           NUMBER(3) NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_T_VERIFY_REPORT
       ADD  ( CONSTRAINT PK_SICEE_T_VERIFY_REPORT PRIMARY KEY (
              ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, 
              PROGR_VERIFY_REPORT)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;



ALTER TABLE SICEE_T_VERIFY_REPORT
       ADD  ( CONSTRAINT FK_SICEE_T_CERTIFICATO_13
              FOREIGN KEY (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO)
                             REFERENCES SICEE_T_CERTIFICATO ) ;



CREATE TABLE SICEE_T_DATI_FIRMA (
       ID_DATI_FIRMA        NUMBER(6) NOT NULL,
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       PROGR_VERIFY_REPORT  NUMBER(6) NOT NULL,
       FK_STATO_FILE        NUMBER(3) NOT NULL,
       ERROR_CODE           NUMBER(3) NULL,
       SURNAME              VARCHAR2(100) NULL,
       GIVEN_NAME           VARCHAR2(100) NULL,
       SERIAL_NUMBER        VARCHAR2(100) NULL,
       CA                   VARCHAR2(100) NULL,
       CODICE_FISCALE       VARCHAR2(16) NULL,
       DT_FIRMA             DATE NULL,
       DT_VERIFICA          DATE NULL,
       DT_INIZIO_VAL_CERT   DATE NULL,
       DT_FINE_VAL_CERT     DATE NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_T_DATI_FIRMA
       ADD  ( CONSTRAINT PK_SICEE_T_DATI_FIRMA PRIMARY KEY (
              ID_DATI_FIRMA)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;



ALTER TABLE SICEE_T_DATI_FIRMA
       ADD  ( CONSTRAINT FK_SICEE_T_VERIFY_REPORT_01
              FOREIGN KEY (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, 
              PROGR_VERIFY_REPORT)
                             REFERENCES SICEE_T_VERIFY_REPORT ) ;


ALTER TABLE SICEE_T_DATI_FIRMA
       ADD  ( CONSTRAINT FK_SICEE_D_STATO_FILE_01
              FOREIGN KEY (FK_STATO_FILE)
                             REFERENCES SICEE_D_STATO_FILE ) ;




CREATE TABLE SICEE_D_MAPPING_XML (
       CAMPO_XML            VARCHAR2(300) NULL,
       CAMPO_WEB            VARCHAR2(300) NULL
)
       TABLESPACE SICEE_SMALL_TBL
;







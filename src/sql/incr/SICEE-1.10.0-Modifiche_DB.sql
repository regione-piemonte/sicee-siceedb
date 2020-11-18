/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/
ALTER TABLE SICEE_T_CERTIFICATORE MODIFY(ORDINE VARCHAR2(200));

ALTER TABLE SICEE_T_RIF_INDEX_2015  ADD (DT_CARICAMENTO  DATE);



CREATE TABLE SICEE_T_IMPORT_DATI_2015 (
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       NOME_XML             VARCHAR2(100) NULL,
       UID_INDEX            VARCHAR2(100) NULL,
       DT_CARICAMENTO       DATE NULL
);


ALTER TABLE SICEE_T_IMPORT_DATI_2015
       ADD   CONSTRAINT PK_SICEE_T_IMPORT_DATI_2015 PRIMARY KEY (
              ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO) ;


ALTER TABLE SICEE_T_IMPORT_DATI_2015
       ADD   CONSTRAINT FK_SICEE_T_CERTIFICATO_22
              FOREIGN KEY (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO)
                             REFERENCES SICEE_T_CERTIFICATO  ;
                             
                             
                             
                             
GRANT SELECT,UPDATE,DELETE,INSERT ON SICEE_T_IMPORT_DATI_2015 TO SICEE_RW;

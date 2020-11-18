/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

CREATE TABLE SICEE_T_VERIFYSIGNANDCERT (
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       PROGR_SIGNANDCERT    NUMBER(6) NOT NULL,
       ERROR_CODE           NUMBER(3) NULL,
       TOT_NUM_SIGNATURE    NUMBER(6) NULL,
       TOT_NUM_TIMESTAMP    NUMBER(6) NULL,
       VERIFICATION_DATE    DATE NULL,
       DELIBERATION_COMPLIANT VARCHAR2(20) NULL,
       FILE_TYPE            NUMBER(5) NULL,
       SIGNATURE_TYPE       NUMBER(5) NULL,
       SIGNATURE_FORMAT     NUMBER(5) NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_T_VERIFYSIGNANDCERT
       ADD  ( CONSTRAINT PK_SICEE_T_VERIFYSIGNANDCERT PRIMARY KEY (
              ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, 
              PROGR_SIGNANDCERT)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;
              

CREATE TABLE SICEE_T_FIRMA_MARCA (
       ID_FIRMA_MARCA       NUMBER(10) NOT NULL,
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       PROGR_SIGNANDCERT    NUMBER(6) NOT NULL,
       CERTIFICATE_TYPE     NUMBER(3) NULL,
       COMPLIANCE           VARCHAR2(100) NULL,
       DATE_TIME_SIGNATURE  DATE NULL,
       DIGEST_ALGORITHM     VARCHAR2(100) NULL,
       ERROR_CODE_FIRMA     NUMBER(3) NULL,
       GIVEN_NAME           VARCHAR2(50) NULL,
       SURNAME              VARCHAR2(50) NULL,
       TAX_CODE             VARCHAR2(20) NULL,
       REVOCATION_DATE      DATE NULL,
       CERTIFICATION_AUTHORITY VARCHAR2(200) NULL,
       ERROR_CODE_CERTIFICATO NUMBER(3) NULL,
       SERIAL_NUMBER        VARCHAR2(100) NULL,
       VALID_FROM           DATE NULL,
       VALID_TO             DATE NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_T_FIRMA_MARCA
       ADD  ( CONSTRAINT PK_SICEE_T_FIRMA_MARCA PRIMARY KEY (
              ID_FIRMA_MARCA)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;




ALTER TABLE SICEE_T_VERIFYSIGNANDCERT
       ADD  ( CONSTRAINT FK_SICEE_T_CERTIFICATO_20
              FOREIGN KEY (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO)
                             REFERENCES SICEE_T_CERTIFICATO ) ;



ALTER TABLE SICEE_T_FIRMA_MARCA
       ADD  ( CONSTRAINT FK_SICEE_T_VERIFYSIGN_01
              FOREIGN KEY (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, 
              PROGR_SIGNANDCERT)
                             REFERENCES SICEE_T_VERIFYSIGNANDCERT ) ;
                             
                             
ALTER TABLE SICEE_T_ALTRE_INFO MODIFY(UNI_TS_11300 VARCHAR2(1000));                        
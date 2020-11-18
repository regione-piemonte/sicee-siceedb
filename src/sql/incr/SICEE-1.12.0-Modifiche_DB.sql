/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/
------------------------------------------------------
--  PULIZIA: drop tabelle e sequences
------------------------------------------------------
-- drop table SICEE_T_PARTECIPANTE_2015;
-- drop table SICEE_T_CORSO_2015;
-- drop table SICEE_T_ENTEFORM_CF_2015;
-- drop table SICEE_T_ENTEFORM_2015;
-- drop table SICEE_T_ENTEFORM_SL_2015;
-- drop table SICEE_D_TIPO_ENTEFORM_2015;

-- drop sequence SEQ_SICEE_T_ENTEFORM_SL_2015;
-- drop sequence SEQ_SICEE_T_ENTEFORM_2015;
-- drop sequence SEQ_SICEE_T_CORSO_2015;
-- drop sequence SEQ_SICEE_T_PARTECIPANTE_2015;


CREATE TABLE SICEE_D_TIPO_ENTEFORM_2015
(
  ID_TIPO_ENTEFORM  VARCHAR2(6) NOT NULL,
  DESCR             VARCHAR2(50)
)
TABLESPACE SICEE_SMALL_TBL
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
          )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

ALTER TABLE SICEE_D_TIPO_ENTEFORM_2015 ADD (
  CONSTRAINT PK_SICEE_D_TIPO_ENTEFORM
 PRIMARY KEY
 (ID_TIPO_ENTEFORM)
    USING INDEX 
    TABLESPACE SICEE_SMALL_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
              ));

GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_D_TIPO_ENTEFORM_2015 TO SICEE_RW;



create table SICEE_T_ENTEFORM_SL_2015
(
  ID_ENTE_SL      INTEGER NOT NULL,
  TIPO_SOGGETTO   VARCHAR2(6),
  DENOMINAZIONE   VARCHAR2(100),
  P_IVA           VARCHAR2(11),
  ID_REGIONE      VARCHAR2(6),
  DESC_REGIONE    VARCHAR2(50),
  ID_PROV         VARCHAR2(6),
  DESC_PROV       VARCHAR2(50),
  ID_COMUNE       VARCHAR2(6),
  DESC_COMUNE     VARCHAR2(100),
  ID_INDIRIZZO    VARCHAR2(6),
  DESC_INDIRIZZO  VARCHAR2(160),
  NUM_CIVICO      VARCHAR2(10),
  CAP             VARCHAR2(5),
  REFERENTE       VARCHAR2(100),
  TELEFONO        VARCHAR2(20),
  CELL            VARCHAR2(20),
  EMAIL           VARCHAR2(70),
  EMAIL_PEC       VARCHAR2(70),
  FAX             VARCHAR2(30),
  SITO_WEB        VARCHAR2(50),
  BASE64_LOGO     CLOB,
  PARAMETRI_LOGO  VARCHAR2(50)
)
tablespace SICEE_SMALL_TBL
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          320K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
          )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

alter table SICEE_T_ENTEFORM_SL_2015 ADD (
  CONSTRAINT PK_SICEE_T_ENTEFORM_SL_2015
 PRIMARY KEY
 (ID_ENTE_SL)
    USING INDEX 
    TABLESPACE SICEE_SMALL_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
              ));

ALTER TABLE SICEE_T_ENTEFORM_SL_2015 ADD (
  CONSTRAINT FK_SICEE_D_TIPO_ENTFRM_2015_01
 FOREIGN KEY (TIPO_SOGGETTO) 
 REFERENCES SICEE_D_TIPO_ENTEFORM_2015 (ID_TIPO_ENTEFORM));

grant DELETE, INSERT, SELECT, UPDATE on SICEE_T_ENTEFORM_SL_2015 to SICEE_RW;



create table SICEE_T_ENTEFORM_2015
(
  ID_ENTE         INTEGER NOT NULL,
  FK_ENTE_SL      INTEGER NOT NULL,
  COD_FORM_REG    VARCHAR2(20),
  ID_REGIONE      VARCHAR2(6),
  DESC_REGIONE    VARCHAR2(50),
  ID_PROV         VARCHAR2(6),
  DESC_PROV       VARCHAR2(50),
  ID_COMUNE       VARCHAR2(6),
  DESC_COMUNE     VARCHAR2(100),
  ID_INDIRIZZO    VARCHAR2(6),
  DESC_INDIRIZZO  VARCHAR2(160),
  NUM_CIVICO      VARCHAR2(10),
  CAP             VARCHAR2(5),
  REFERENTE       VARCHAR2(100),
  TELEFONO        VARCHAR2(20),
  CELL            VARCHAR2(20),
  EMAIL           VARCHAR2(70),
  EMAIL_PEC       VARCHAR2(70),
  FAX             VARCHAR2(30),
  SITO_WEB        VARCHAR2(50)
)
tablespace SICEE_SMALL_TBL
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          320K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
          )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


alter table SICEE_T_ENTEFORM_2015 ADD (
  CONSTRAINT PK_SICEE_T_ENTEFORM_2015
 PRIMARY KEY
 (ID_ENTE)
    USING INDEX 
    TABLESPACE SICEE_SMALL_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
              ));

ALTER TABLE SICEE_T_ENTEFORM_2015 ADD (
  CONSTRAINT FK_SICEE_T_ENTEFORM_SL_2015_01
 FOREIGN KEY (FK_ENTE_SL) 
 REFERENCES SICEE_T_ENTEFORM_SL_2015 (ID_ENTE_SL));

 
grant DELETE, INSERT, SELECT, UPDATE on SICEE_T_ENTEFORM_2015 to SICEE_RW;



create table SICEE_T_ENTEFORM_CF_2015
(
  ID_ENTE         INTEGER NOT NULL,
  CF_CERTIFICATO  VARCHAR2(30) NOT NULL,
  RUOLO           VARCHAR2(2) NOT NULL
)
tablespace SICEE_SMALL_TBL
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          320K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
          )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

alter table SICEE_T_ENTEFORM_CF_2015 ADD (
  CONSTRAINT PK_SICEE_T_ENTEFORM_CF_2015
 PRIMARY KEY
 (ID_ENTE, CF_CERTIFICATO)
    USING INDEX 
    TABLESPACE SICEE_SMALL_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
              ));

ALTER TABLE SICEE_T_ENTEFORM_CF_2015 ADD (
  CONSTRAINT FK_SICEE_T_ENTEFORM_2015_01 FOREIGN KEY (ID_ENTE) 
 REFERENCES SICEE_T_ENTEFORM_2015 (ID_ENTE));

grant DELETE, INSERT, SELECT, UPDATE on SICEE_T_ENTEFORM_CF_2015 to SICEE_RW;




create table SICEE_T_CORSO_2015
(
  ID_CORSO        INTEGER NOT NULL,
  FK_ENTE         INTEGER NOT NULL,
  TIPO_CORSO1     VARCHAR2(4),
  TIPO_CORSO2     VARCHAR2(4),
  NUM_CORSO       VARCHAR2(20),
  ANNO_FORMATIVO  VARCHAR2(20),
  TITOLO          VARCHAR2(160),
  TOTALE_ORE      INTEGER,
  TOTALE_MODULI   INTEGER,
  DATA_DAL        DATE,
  DATA_AL         DATE,
  LUOGO_CORSO     VARCHAR2(160),
  DATA_ESAME      DATE,
  N_PARTECIPANTI  INTEGER,
  PROT_APPROV     VARCHAR2(50),
  DATA_APPROV     DATE,
  NOTE            VARCHAR2(500)
)
tablespace SICEE_SMALL_TBL
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          320K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
          )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

alter table SICEE_T_CORSO_2015 ADD (
  CONSTRAINT PK_SICEE_T_CORSO_2015
 PRIMARY KEY
 (ID_CORSO)
    USING INDEX 
    TABLESPACE SICEE_SMALL_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
              ));

ALTER TABLE SICEE_T_CORSO_2015 ADD (
  CONSTRAINT FK_SICEE_T_ENTEFORM_2015_02
 FOREIGN KEY (FK_ENTE) 
 REFERENCES SICEE_T_ENTEFORM_2015 (ID_ENTE));

grant DELETE, INSERT, SELECT, UPDATE on SICEE_T_CORSO_2015 to SICEE_RW;



CREATE TABLE SICEE_T_PARTECIPANTE_2015
(
  ID_PARTECIPANTE         INTEGER      NOT NULL,
  FK_CORSO                INTEGER      NOT NULL,
  CODICE_FISCALE          VARCHAR2(30),
  NOME                    VARCHAR2(30),
  COGNOME                 VARCHAR2(50),
  LUOGO_NASCITA           VARCHAR2(100),
  DATA_NASCITA            DATE,
  FK_TIPO_ISTRUZIONE      NUMBER(3),
  NUM_CERTIFICATORE       VARCHAR2(10),
  ALBO                    VARCHAR2(200),
  DESC_PROV_ALBO          VARCHAR2(30),
  NUM_ISCR_ALBO           VARCHAR2(20),
  DATA_ISCR_ALBO          DATE,
  PERC_FREQ               VARCHAR2(10),
  DATA_ESAME              DATE,
  ESITO_ESAME             VARCHAR2(20),
  LUOGO_ESAME             VARCHAR2(160),
  VOTO_ESAME              VARCHAR2(20),
  TELEFONO                VARCHAR2(50),
  EMAIL                   VARCHAR2(70),
  NOTE                    VARCHAR2(500)
)
TABLESPACE SICEE_SMALL_TBL
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          768K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
          )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

ALTER TABLE SICEE_T_PARTECIPANTE_2015 ADD (
  CONSTRAINT PK_SICEE_T_PARTECIPANTE_2015
 PRIMARY KEY
 (ID_PARTECIPANTE)
    USING INDEX 
    TABLESPACE SICEE_SMALL_IDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
              ));

ALTER TABLE SICEE_T_PARTECIPANTE_2015 ADD (
  CONSTRAINT UNQ_SICEE_T_PARTECIPANTE_2015
 UNIQUE
 (FK_CORSO, CODICE_FISCALE)
    USING INDEX 
    TABLESPACE SICEE_SMALL_TBL
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
              ));

 
 ALTER TABLE SICEE_T_PARTECIPANTE_2015
       ADD  ( CONSTRAINT FK_SICEE_T_CORSO_01
              FOREIGN KEY (FK_CORSO)
                             REFERENCES SICEE_T_CORSO_2015 ) ;

							 
 ALTER TABLE SICEE_T_PARTECIPANTE_2015
       ADD  ( CONSTRAINT FK_SICEE_D_TIPO_ISTRUZIONE_02
              FOREIGN KEY (FK_TIPO_ISTRUZIONE)
                             REFERENCES SICEE_D_TIPO_ISTRUZIONE ) ;

 
 
GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_PARTECIPANTE_2015 TO SICEE_RW;




create sequence SEQ_SICEE_T_ENTEFORM_SL_2015
  start with 5
  maxvalue 999999999999999999999999999
  minvalue 1
  nocycle
  nocache
  noorder;

grant ALTER, SELECT on SEQ_SICEE_T_ENTEFORM_SL_2015 to SICEE_RW;

create sequence SEQ_SICEE_T_ENTEFORM_2015
  start with 10
  maxvalue 999999999999999999999999999
  minvalue 1
  nocycle
  nocache
  noorder;

grant ALTER, SELECT on SEQ_SICEE_T_ENTEFORM_2015 to SICEE_RW;

create sequence SEQ_SICEE_T_CORSO_2015
  start with 20
  maxvalue 999999999999999999999999999
  minvalue 1
  nocycle
  nocache
  noorder;

grant ALTER, SELECT on SEQ_SICEE_T_CORSO_2015 to SICEE_RW;

create sequence SEQ_SICEE_T_PARTECIPANTE_2015
  start with 30
  maxvalue 999999999999999999999999999
  minvalue 1
  nocycle
  nocache
  noorder;

grant ALTER, SELECT on SEQ_SICEE_T_PARTECIPANTE_2015 to SICEE_RW;



-----------------------------------------------------
--     popolamento tabelle
-----------------------------------------------------
insert into SICEE_D_TIPO_ENTEFORM_2015 (ID_TIPO_ENTEFORM, DESCR) values (1, 'Università');
insert into SICEE_D_TIPO_ENTEFORM_2015 (ID_TIPO_ENTEFORM, DESCR) values (2, 'Organismi ed Enti di Ricerca');
insert into SICEE_D_TIPO_ENTEFORM_2015 (ID_TIPO_ENTEFORM, DESCR) values (3, 'Consigli, Ordini e Collegi Professionali');
insert into SICEE_D_TIPO_ENTEFORM_2015 (ID_TIPO_ENTEFORM, DESCR) values (4, 'Agenzia Formativa');
commit;



-----------------------------------------------------
--     modifiche a tabelle esistenti
-----------------------------------------------------
ALTER TABLE SICEE.SICEE_T_DOCUMENTO ADD (FK_CORSO INTEGER);

ALTER TABLE SICEE_T_DOCUMENTO
       ADD  ( CONSTRAINT FK_SICEE_D_TIPODOC_02
              FOREIGN KEY (FK_CORSO)
                             REFERENCES SICEE_T_CORSO_2015 ) ;


insert into SICEE_D_TIPO_DOCUMENTO (ID_TIPO_DOC, DS_TIPO_DOC) values (5, 'TIPO_ATTESTATO_CORSO');
insert into SICEE_D_TIPO_DOCUMENTO (ID_TIPO_DOC, DS_TIPO_DOC) values (6, 'TITOLO_DI_STUDIO');
commit;

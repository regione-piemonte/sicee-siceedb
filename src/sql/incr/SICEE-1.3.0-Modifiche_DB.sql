/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

ALTER TABLE SICEE_T_CERTIFICATORE ADD FLG_CONSENSO_TEL  CHAR(1);

ALTER TABLE SICEE_T_CERTIFICATORE ADD FLG_CONSENSO_EMAIL  CHAR(1);

ALTER TABLE SICEE_T_CERTIFICATORE ADD FLG_CONSENSO_CELL  CHAR(1);

CREATE TABLE SICEE_T_PARAMETRI (
       CODICE               VARCHAR2(150) NULL,
       VALORE               VARCHAR2(150) NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_D_DEST_USO ADD FLG_VISIBILE_COMBO  CHAR(1);

CREATE TABLE SICEE_D_TIPO_DOCUMENTO (
       ID_TIPO_DOC          NUMBER(3) NOT NULL,
       DS_TIPO_DOC          VARCHAR2(100) NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_D_TIPO_DOCUMENTO
       ADD  ( CONSTRAINT PK_SICEE_D_TIPO_DOCUMENTO PRIMARY KEY (
              ID_TIPO_DOC)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;
              
              
CREATE TABLE SICEE_T_DOCUMENTO (
       ID_DOCUMENTO         NUMBER(5) NOT NULL,
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       ID_TIPO_DOC          NUMBER(3) NOT NULL,
       IDENTIFIC_DOC        VARCHAR2(100) NULL,
       DT_UPLOAD            DATE NULL,
       NOME_FILE            VARCHAR2(100) NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_T_DOCUMENTO
       ADD  ( CONSTRAINT PK_SICEE_T_DOCUMENTO PRIMARY KEY (
              ID_DOCUMENTO)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;
              

ALTER TABLE SICEE_T_DOCUMENTO
       ADD  ( CONSTRAINT FK_SICEE_D_TIPODOC_01
              FOREIGN KEY (ID_TIPO_DOC)
                             REFERENCES SICEE_D_TIPO_DOCUMENTO ) ;


ALTER TABLE SICEE_T_DOCUMENTO
       ADD  ( CONSTRAINT FK_SICEE_T_CERTIFICATORE_04
              FOREIGN KEY (ID_CERTIFICATORE)
                             REFERENCES SICEE_T_CERTIFICATORE ) ;


                            
CREATE TABLE SICEE_R_NOTAIO_ACE (
       ID_NOTAIO_ACE        NUMBER(9) NOT NULL,
       ID_NOTAIO            NUMBER(5) NOT NULL,
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       DT_INVIO             DATE NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_R_NOTAIO_ACE
       ADD  ( CONSTRAINT PK_SICEE_R_NOTAIO_ACE PRIMARY KEY (
              ID_NOTAIO_ACE)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;


CREATE TABLE SICEE_T_NOTAIO (
       ID_NOTAIO            NUMBER(5) NOT NULL,
       NOME                 VARCHAR2(50) NULL,
       COGNOME              VARCHAR2(50) NULL,
       CODICE_FISCALE       VARCHAR2(16) NULL,
       EMAIL                VARCHAR2(50) NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_T_NOTAIO
       ADD  ( CONSTRAINT PK_SICEE_T_NOTAIO PRIMARY KEY (ID_NOTAIO)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;


ALTER TABLE SICEE_R_NOTAIO_ACE
       ADD  ( CONSTRAINT FK_SICEE_T_CERTIFICATO_11
              FOREIGN KEY (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO)
                             REFERENCES SICEE_T_CERTIFICATO ) ;


ALTER TABLE SICEE_R_NOTAIO_ACE
       ADD  ( CONSTRAINT FK_SICEE_T_NOTAIO_01
              FOREIGN KEY (ID_NOTAIO)
                             REFERENCES SICEE_T_NOTAIO ) ;

                            
                            
ALTER TABLE SICEE_T_PARAMETRI MODIFY VALORE VARCHAR2(2000);                            

ALTER TABLE SICEE_T_NOTAIO MODIFY EMAIL VARCHAR2(200);                            



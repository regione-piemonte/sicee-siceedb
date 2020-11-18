/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

CREATE TABLE SICEE_T_HD_ACE_FIRMATI (
       ID_HD_ACE_FIRMATI    NUMBER(9) NOT NULL,
       NUM_HD               VARCHAR2(30) NULL,
       DT_APERTURA          DATE NULL,
       DT_RISOLUZIONE       DATE NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_T_HD_ACE_FIRMATI
       ADD  ( CONSTRAINT PK_SICEE_T_HD_ACE_FIRMATI PRIMARY KEY (
              ID_HD_ACE_FIRMATI)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;

CREATE TABLE SICEE_L_LOG_ATTIVITA (
       ID_APPOGGIO          NUMBER NOT NULL,
       FK_HD_ACE_FIRMATI    NUMBER(9) NOT NULL,
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       DT_RISOLUZIONE       DATE NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_L_LOG_ATTIVITA
       ADD  ( CONSTRAINT PK_SICEE_L_LOG_ATTIVITA PRIMARY KEY (
              ID_APPOGGIO)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;
              
CREATE TABLE SICEE_T_APPOGGIO (
       ID_APPOGGIO          NUMBER NOT NULL,
       FK_HD_ACE_FIRMATI    NUMBER(9) NOT NULL,
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       FK_STATO             NUMBER(3) NULL,
       DT_UPLOAD            DATE NULL,
       IDENTIFIC_PDF        VARCHAR2(100) NULL,
       IDENTIFIC_FOTO       VARCHAR2(100) NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_T_APPOGGIO
       ADD  ( CONSTRAINT PK_SICEE_T_APPOGGIO PRIMARY KEY (ID_APPOGGIO)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;



CREATE TABLE SICEE_T_RIMBORSI_ACE (
       ID_RIMBORSO          NUMBER NOT NULL,
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       FK_TRANSAZIONE_ACE   NUMBER NULL,
       DT_RIMBORSO          DATE NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_T_RIMBORSI_ACE
       ADD  ( CONSTRAINT PK_SICEE_T_RIMBORSI_ACE PRIMARY KEY (
              ID_RIMBORSO)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;


              
              
ALTER TABLE SICEE_T_APPOGGIO
       ADD  ( CONSTRAINT FK_SICEE_T_CERTIFICATO_15
              FOREIGN KEY (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO)
                             REFERENCES SICEE_T_CERTIFICATO ) ;


ALTER TABLE SICEE_T_APPOGGIO
       ADD  ( CONSTRAINT FK_SICEE_T_HD_ACE_FIRMATI_02
              FOREIGN KEY (FK_HD_ACE_FIRMATI)
                             REFERENCES SICEE_T_HD_ACE_FIRMATI ) ;


ALTER TABLE SICEE_L_LOG_ATTIVITA
       ADD  ( CONSTRAINT FK_SICEE_T_CERTIFICATO_14
              FOREIGN KEY (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO)
                             REFERENCES SICEE_T_CERTIFICATO ) ;


ALTER TABLE SICEE_L_LOG_ATTIVITA
       ADD  ( CONSTRAINT FK_SICEE_T_HD_ACE_FIRMATI_01
              FOREIGN KEY (FK_HD_ACE_FIRMATI)
                             REFERENCES SICEE_T_HD_ACE_FIRMATI ) ;                            
                             
                             

                             
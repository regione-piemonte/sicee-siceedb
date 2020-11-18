/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

CREATE TABLE SICEE_D_STATO_MDP (
       ID_STATO_MDP         NUMBER(3) NOT NULL,
       DESCR                VARCHAR2(100) NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_D_STATO_MDP
       ADD  ( CONSTRAINT PK_SICEE_D_STATO_MDP PRIMARY KEY (
              ID_STATO_MDP)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;
              
SET DEFINE OFF;
Insert into SICEE.SICEE_D_STATO_MDP
   (ID_STATO_MDP, DESCR)
 Values
   (0, 'NON INITIALIZED ');
Insert into SICEE.SICEE_D_STATO_MDP
   (ID_STATO_MDP, DESCR)
 Values
   (1, 'INIZIALIZED');
Insert into SICEE.SICEE_D_STATO_MDP
   (ID_STATO_MDP, DESCR)
 Values
   (2, 'CONFIGURED');
Insert into SICEE.SICEE_D_STATO_MDP
   (ID_STATO_MDP, DESCR)
 Values
   (3, 'STARTED');
Insert into SICEE.SICEE_D_STATO_MDP
   (ID_STATO_MDP, DESCR)
 Values
   (4, 'SUCCESSFULL');
Insert into SICEE.SICEE_D_STATO_MDP
   (ID_STATO_MDP, DESCR)
 Values
   (5, 'UNSUCCESSFULL');
Insert into SICEE.SICEE_D_STATO_MDP
   (ID_STATO_MDP, DESCR)
 Values
   (6, 'CANCELED');
Insert into SICEE.SICEE_D_STATO_MDP
   (ID_STATO_MDP, DESCR)
 Values
   (7, 'REFUNDED');
Insert into SICEE.SICEE_D_STATO_MDP
   (ID_STATO_MDP, DESCR)
 Values
   (8, 'TO BE CONFIRMED');
COMMIT;
              
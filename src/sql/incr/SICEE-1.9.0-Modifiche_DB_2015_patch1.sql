/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

ALTER TABLE SICEE_W_PREZZI DROP CONSTRAINT PK_SICEE_W_PREZZI;

DELETE FROM SICEE_W_PREZZI;
COMMIT;

ALTER TABLE SICEE.SICEE_W_PREZZI ADD (ID_PREZZI  NUMBER(3) NOT NULL);

ALTER TABLE SICEE.SICEE_W_PREZZI ADD (DT_INIZIO  DATE NOT NULL);

ALTER TABLE SICEE.SICEE_W_PREZZI ADD (DT_FINE  DATE);


ALTER TABLE SICEE_W_PREZZI
       ADD  ( CONSTRAINT PK_SICEE_W_PREZZI PRIMARY KEY (ID_PREZZI)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;

SET DEFINE OFF;
Insert into SICEE_W_PREZZI
   (DESCRIZIONE, VALUTA, ID_PREZZI, DT_INIZIO, DT_FINE)
 Values
   ('ACE', 10, 3, TO_DATE('01/01/2000 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('09/30/2015 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SICEE_W_PREZZI
   (DESCRIZIONE, VALUTA, ID_PREZZI, DT_INIZIO, DT_FINE)
 Values
   ('ACE', 15, 4, TO_DATE('10/01/2015 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL);
Insert into SICEE_W_PREZZI
   (DESCRIZIONE, VALUTA, ID_PREZZI, DT_INIZIO, DT_FINE)
 Values
   ('REGISTRAZIONE', 100, 1, TO_DATE('01/01/2000 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('09/30/2015 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SICEE_W_PREZZI
   (DESCRIZIONE, VALUTA, ID_PREZZI, DT_INIZIO, DT_FINE)
 Values
   ('REGISTRAZIONE', 150, 2, TO_DATE('10/01/2015 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), NULL);
COMMIT;


ALTER TABLE SICEE.SICEE_T_DATI_GENERALI MODIFY(NR_UM NUMBER(4));




ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (FLG_OLD  CHAR(1));
ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (FLG_EDIF_E0  CHAR(1));

ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (EPGL_NREN_GLOBALE  NUMBER(14,4));
ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (EPGL_REN_GLOBALE  NUMBER(14,4));
ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (EMISSIONI_CO2  NUMBER(14,4));

ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (SUP_RAFFRESCATA  NUMBER(14,4));
ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (SUP_RISCALDATA  NUMBER(14,4));
ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (VOL_LORDO_RAFFRESCATO  NUMBER(14,4));

ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (EPH  NUMBER(14,4));
ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (ASOL_ASUP  NUMBER(14,4));
ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (YIE  NUMBER(14,4));

ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (V_SU_RAFF  NUMBER(14,4));
ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (V_SU_RISC  NUMBER(14,4));
ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (S_V_RAFF  NUMBER(14,4));
ALTER TABLE SICEE.SICEE_T_EXPORT_BO  ADD (S_V_RISC  NUMBER(14,4));



ALTER TABLE SICEE.SICEE_T_DATI_FIRMA MODIFY(SURNAME VARCHAR2(500 BYTE));

ALTER TABLE SICEE.SICEE_T_DATI_FIRMA MODIFY(GIVEN_NAME VARCHAR2(500 BYTE));

ALTER TABLE SICEE.SICEE_T_DATI_FIRMA MODIFY(SERIAL_NUMBER VARCHAR2(500 BYTE));

ALTER TABLE SICEE.SICEE_T_DATI_FIRMA MODIFY(CA VARCHAR2(500 BYTE));
/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/
ALTER TABLE SICEE_T_ALTRE_INFO  ADD (ALTRO_SERVIZI_ENERGIA   INTEGER);


  CREATE TABLE SICEE_L_RICERCHE_CTU
  (
    CF_CTU             VARCHAR2(30 BYTE)          NOT NULL,
    DATA_RICERCA       DATE                       NOT NULL,
    MOTIVAZIONE_CTU    VARCHAR2(200 BYTE)         NOT NULL
  );

  ALTER TABLE SICEE_L_RICERCHE_CTU ADD (
    CONSTRAINT PK_SICEE_L_RICERCHE_CTU
    PRIMARY KEY (CF_CTU, DATA_RICERCA));
    

GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_L_RICERCHE_CTU TO SICEE_RW;   
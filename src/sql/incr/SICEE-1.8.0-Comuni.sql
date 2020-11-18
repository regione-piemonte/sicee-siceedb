/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

CREATE TABLE COMUNI
(
  ISTAT        VARCHAR2(6 BYTE),
  DESC_COMUNE  VARCHAR2(50 BYTE),
  DATA_INIZIO  DATE,
  DATA_FINE    DATE
)
TABLESPACE SICEE_SMALL_TBL;

CREATE TABLE PROVINCE
(
  ISTAT           VARCHAR2(6 BYTE),
  DESC_PROVINCIA  VARCHAR2(50 BYTE)
)
TABLESPACE SICEE_SMALL_TBL;

CREATE TABLE REGIONI
(
  ISTAT         VARCHAR2(6 BYTE),
  DESC_REGIONE  VARCHAR2(50 BYTE)
)
TABLESPACE SICEE_SMALL_TBL;

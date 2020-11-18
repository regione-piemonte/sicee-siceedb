/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

ALTER TABLE SICEE_D_TITOLO ADD FLG_MDP  CHAR(1);

UPDATE SICEE_D_TITOLO SET FLG_MDP='S' WHERE SIGLA=3;
COMMIT;

CREATE TABLE SICEE_W_EMAIL_NEWSLETTER (
       EMAIL                VARCHAR2(70) NULL
)
       TABLESPACE SICEE_SMALL_TBL
;

ALTER TABLE SICEE_D_DEST_USO MODIFY SIGLA VARCHAR2(100);
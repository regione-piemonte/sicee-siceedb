/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

GRANT SELECT,UPDATE,DELETE,INSERT ON SICEE_T_VERIFYSIGNANDCERT TO SICEE_RW;
GRANT SELECT,UPDATE,DELETE,INSERT ON SICEE_T_FIRMA_MARCA TO SICEE_RW;

GRANT ALTER,SELECT ON SEQ_SICEE_T_FIRMA_MARCA TO SICEE_RW;
GRANT ALTER,SELECT ON SEQ_SICEE_T_VERIFYSIGNANDCERT TO SICEE_RW;
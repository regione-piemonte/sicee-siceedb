/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/
ALTER TABLE SICEE_T_RUOLI_EDIFICIO ADD ID_REGIONE VARCHAR2(6);
ALTER TABLE SICEE_T_RUOLI_EDIFICIO ADD DESC_REGIONE VARCHAR2(50);
ALTER TABLE SICEE_T_RUOLI_EDIFICIO ADD ID_PROVINCIA VARCHAR2(6);
ALTER TABLE SICEE_T_RUOLI_EDIFICIO ADD DESC_PROVINCIA VARCHAR2(50);
ALTER TABLE SICEE_T_RUOLI_EDIFICIO ADD NUM_CIVICO VARCHAR2(10);

ALTER TABLE SICEE_T_CERTIFICATORE MODIFY EMAIL VARCHAR2(70);

ALTER TABLE SICEE_T_CERTIFICATO ADD NUM_CIVICO VARCHAR2(10);

ALTER TABLE SICEE_T_CERTIFICATO ADD IDENTIFIC_PDF VARCHAR2(100);
ALTER TABLE SICEE_T_CERTIFICATO ADD IDENTIFIC_FOTO VARCHAR2(100);
ALTER TABLE SICEE_T_CERTIFICATO DROP COLUMN FOTO;
ALTER TABLE SICEE_T_CERTIFICATO DROP COLUMN ACE_FIRMATO;

ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY(FK_CLASSE  NULL);

ALTER TABLE SICEE_T_DATI_GENERALI MODIFY(FK_TIPO_EDIFICIO  NULL);

ALTER TABLE SICEE_T_DATI_GENERALI MODIFY(FK_DEST_USO  NULL);

ALTER TABLE SICEE_T_RUOLI_EDIFICIO MODIFY(FK_TIPO_RUOLO  NULL);

ALTER TABLE SICEE_T_CLASSE_ENERGETICA DROP COLUMN PERC_FONTI_RINNOV;

ALTER TABLE SICEE_T_ENERGIA_SOPR_INGR ADD (PERC_FONTI_RINNOV  NUMBER(5,2));

ALTER TABLE SICEE_T_IMP_RISCALDAMENTO_ACS RENAME COLUMN PROGR TO PROGR_CERTIFICATO;


ALTER TABLE SICEE_T_DATI_GENERALI DROP CONSTRAINT FK_SICEE_D_TIPO_EDIFIC_01;

ALTER TABLE SICEE_T_CONSUMI_EDIFICIO DROP CONSTRAINT FK_SICEE_D_TIPO_REGOL_01;

ALTER TABLE SICEE_T_CONSUMI_EDIFICIO DROP CONSTRAINT FK_SICEE_D_TIPO_DISTR_01;

ALTER TABLE SICEE_T_CONSUMI_EDIFICIO DROP CONSTRAINT FK_SICEE_D_TIPO_EROG_01;


DROP TABLE SICEE_D_TIPO_EDIFICIO;

DROP TABLE SICEE_D_TIPO_REGOLAZIONE;

DROP TABLE SICEE_D_TIPO_EROGAZIONE;

DROP TABLE SICEE_D_TIPO_DISTRIB;


ALTER TABLE SICEE_T_CONSUMI_EDIFICIO RENAME COLUMN FK_TIPO_EROG TO DESC_TIPO_EROG;

ALTER TABLE SICEE_T_CONSUMI_EDIFICIO RENAME COLUMN FK_TIPO_DISTRIB TO DESC_TIPO_DISTRIB;

ALTER TABLE SICEE_T_CONSUMI_EDIFICIO RENAME COLUMN FK_TIPO_REG TO DESC_TIPO_REG;

ALTER TABLE SICEE_T_DATI_GENERALI RENAME COLUMN FK_TIPO_EDIFICIO TO DESC_TIPO_EDIFICIO;


ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY(DESC_TIPO_EROG VARCHAR2(100));

ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY(DESC_TIPO_DISTRIB VARCHAR2(100));

ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY(DESC_TIPO_REG VARCHAR2(100));

ALTER TABLE SICEE_T_DATI_GENERALI MODIFY(DESC_TIPO_EDIFICIO VARCHAR2(100));


DROP TABLE SICEE_R_CERT_RUOLI;

ALTER TABLE SICEE_T_RUOLI_EDIFICIO DROP PRIMARY KEY CASCADE;

ALTER TABLE SICEE_T_RUOLI_EDIFICIO DROP COLUMN ID_RUOLO_EDIFICIO;

ALTER TABLE SICEE_T_RUOLI_EDIFICIO ADD ID_CERTIFICATORE VARCHAR2(5) NOT NULL;

ALTER TABLE SICEE_T_RUOLI_EDIFICIO ADD PROGR_CERTIFICATO VARCHAR2(4) NOT NULL;

ALTER TABLE SICEE_T_RUOLI_EDIFICIO ADD ANNO VARCHAR2(4) NOT NULL;

ALTER TABLE SICEE_T_RUOLI_EDIFICIO MODIFY FK_TIPO_RUOLO NOT NULL;


ALTER TABLE SICEE_T_RUOLI_EDIFICIO
       ADD  ( CONSTRAINT PK_SICEE_T_RUOLI_EDIFICIO PRIMARY KEY (
              ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, 
              FK_TIPO_RUOLO)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;


ALTER TABLE SICEE_T_RUOLI_EDIFICIO
       ADD  ( CONSTRAINT FK_SICEE_T_CERTIFICATO_09
              FOREIGN KEY (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO)
                             REFERENCES SICEE_T_CERTIFICATO ) ;


ALTER TABLE SICEE_T_CERTIFICATO ADD LUOGO_DICHIARAZIONE VARCHAR2(100);


ALTER TABLE SICEE_T_DATI_GENERALI MODIFY VOL_LORDO_RISCALDATO NUMBER(12,2);
ALTER TABLE SICEE_T_DATI_GENERALI MODIFY SUP_DISPERDENTE_TOT NUMBER(12,2);
ALTER TABLE SICEE_T_DATI_GENERALI MODIFY FATTORE_FORMA NUMBER(12,2);
ALTER TABLE SICEE_T_DATI_GENERALI MODIFY TRASM_OPACHE NUMBER(12,2);
ALTER TABLE SICEE_T_DATI_GENERALI MODIFY TRASM_TRASP NUMBER(12,2);
ALTER TABLE SICEE_T_DATI_GENERALI MODIFY SU NUMBER(12,2);
ALTER TABLE SICEE_T_DATI_GENERALI MODIFY EMISSIONI_SERRA NUMBER(12,2);
ALTER TABLE SICEE_T_DATI_GENERALI MODIFY ETTARI_BOSCO NUMBER(12,2);

ALTER TABLE SICEE_T_IMP_RISCALDAMENTO_ACS MODIFY POT_RISCALDAMENTO NUMBER(12,2);
ALTER TABLE SICEE_T_IMP_RISCALDAMENTO_ACS MODIFY POT_ACS NUMBER(12,2);


ALTER TABLE SICEE_T_FABBISOGNO MODIFY DOM_RISC_QH NUMBER(12,2);
ALTER TABLE SICEE_T_FABBISOGNO MODIFY LIMITE_REG_QH_LIM NUMBER(12,2);
ALTER TABLE SICEE_T_FABBISOGNO MODIFY FABB_CONDIZ NUMBER(12,2);
ALTER TABLE SICEE_T_FABBISOGNO MODIFY DOM_ACS_QHW NUMBER(12,2);
ALTER TABLE SICEE_T_FABBISOGNO MODIFY EN_ACS_RINNO NUMBER(12,2);
ALTER TABLE SICEE_T_FABBISOGNO MODIFY REND_ACS_ETAGACS NUMBER(12,2);
ALTER TABLE SICEE_T_FABBISOGNO MODIFY FABB_ACS NUMBER(12,2);
ALTER TABLE SICEE_T_FABBISOGNO MODIFY FABB_ILLUM NUMBER(12,2);

ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY REND_GENER NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY REND_REGOL NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY REND_EMISS NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY REND_DISTRIB NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY REND_IMP_ETAG NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY IND_RISC_EPI NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY IND_COND_EST NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY IND_ILLUM NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY IND_GLOB_EPLORDO NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY DOM_RISC_QHTO NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY LIMITE_REG_QHTO NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY IND_RISC_EPITO NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY DOM_ACS_QHWTO NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY EN_ACS_RINNO_TO NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY REND_ACS_ETAG_ACSTO NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY FABB_ACS_TO NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY IND_GLOB_EPLORDO_TO NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY ETAG_CONV NUMBER(12,2);
ALTER TABLE SICEE_T_CLASSE_ENERGETICA MODIFY IND_GLOB_LIMITE_TO NUMBER(12,2);

ALTER TABLE SICEE_T_ALTRE_INFO MODIFY PRESTAZIONE_ENE NUMBER(12,2);
ALTER TABLE SICEE_T_ALTRE_INFO MODIFY LIMITE_NORMA_RISC NUMBER(12,2);
ALTER TABLE SICEE_T_ALTRE_INFO MODIFY LIMITE_NORMA_IMP NUMBER(12,2);
ALTER TABLE SICEE_T_ALTRE_INFO MODIFY VALORE_PREST_PDC NUMBER(12,2);
ALTER TABLE SICEE_T_ALTRE_INFO MODIFY LIMITE_NORMA_PDC NUMBER(12,2);

ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY ANN_TERMI_FOSSILE NUMBER(12,2);
ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY ANN_ELETT_FOSSILE NUMBER(12,2);
ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY ANN_TERMI_RINNO NUMBER(12,2);
ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY ANN_ELETT_RINNO NUMBER(12,2);
ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY COMPLESS_TERMICO NUMBER(12,2);
ALTER TABLE SICEE_T_CONSUMI_EDIFICIO MODIFY COMPLESS_ELETTRICO NUMBER(12,2);

ALTER TABLE SICEE_T_ENERGIA_SOPR_INGR MODIFY ANNO_INSTALL NUMBER(4);
ALTER TABLE SICEE_T_ENERGIA_SOPR_INGR MODIFY EN_TERMICA_PROD NUMBER(12,2);
ALTER TABLE SICEE_T_ENERGIA_SOPR_INGR MODIFY EN_ELETT_PROD NUMBER(12,2);
ALTER TABLE SICEE_T_ENERGIA_SOPR_INGR MODIFY AUTOCONS_TERMICO NUMBER(12,2);
ALTER TABLE SICEE_T_ENERGIA_SOPR_INGR MODIFY AUTOCONS_ELETT NUMBER(12,2);

ALTER TABLE SICEE_T_RUOLI_EDIFICIO MODIFY EMAIL VARCHAR2(70);

ALTER TABLE SICEE_T_DATI_GENERALI MODIFY GRADI_GIORNO NUMBER(6);


ALTER TABLE SICEE_T_RACCOMANDAZIONI MODIFY INTERVENTO NOT NULL;
ALTER TABLE SICEE_T_RACCOMANDAZIONI DROP PRIMARY KEY CASCADE;
DROP INDEX PK_SICEE_T_RACCOMANDAZIONI;
ALTER TABLE SICEE_T_RACCOMANDAZIONI
       ADD  ( CONSTRAINT PK_SICEE_T_RACCOMANDAZIONI PRIMARY KEY (
              ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, PRIORITA, 
              SISTEMA, INTERVENTO)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;


DROP TABLE SICEE_D_GRADI_GIORNO;

CREATE TABLE SICEE_D_GRADI_GIORNO (
       COMUNE               VARCHAR2(50) NOT NULL,
       ID_COMUNE            VARCHAR2(6) NOT NULL,
       ZONA_CLIMATICA       CHAR(1) NULL,
       GRADI_GIORNO         NUMBER(6) NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_D_GRADI_GIORNO
       ADD  ( CONSTRAINT PK_SICEE_D_GRADI_GIORNO PRIMARY KEY (
              ID_COMUNE)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;


ALTER TABLE SICEE_R_DEST_CLASSE MODIFY MAX NUMBER(5);

ALTER TABLE SICEE_T_CERTIFICATO ADD NOME_FOTO VARCHAR2(100);
ALTER TABLE SICEE_T_CERTIFICATO ADD NOME_PDF VARCHAR2(100);
ALTER TABLE SICEE_T_CERTIFICATO ADD DT_UPLOAD DATE;

ALTER TABLE SICEE_T_TRANSAZIONE_REGISTRAZ MODIFY NUM_TRANSAZIONE VARCHAR2(70);
ALTER TABLE SICEE_T_TRANSAZIONE_ACE MODIFY NUM_TRANSAZIONE VARCHAR2(70);

CREATE TABLE SICEE_W_PREZZI (
       DESCRIZIONE          VARCHAR2(100) NOT NULL,
       VALUTA               NUMBER(6,2) NULL
)
       TABLESPACE SICEE_SMALL_TBL
;


ALTER TABLE SICEE_W_PREZZI
       ADD  ( CONSTRAINT PK_SICEE_W_PREZZI PRIMARY KEY (DESCRIZIONE)
       USING INDEX
              TABLESPACE SICEE_SMALL_IDX ) ;

ALTER TABLE SICEE_T_CERTIFICATORE ADD (STATO_ESTERO  VARCHAR2(100));

ALTER TABLE SICEE_T_CERTIFICATO
MODIFY(PARTICELLA VARCHAR2(9));


ALTER TABLE SICEE_T_CERTIFICATO
MODIFY(SUBALTERNO VARCHAR2(4));

ALTER TABLE SICEE_T_ALTRE_INFO
 ADD (IND_RISC_EPI_NAZ  NUMBER(12,2));
 
 
CREATE UNIQUE INDEX UNQ_SICEE_T_CERTIFICATORE ON SICEE_T_CERTIFICATORE
(
       CODICE_FISCALE                 ASC
)
       TABLESPACE SICEE_SMALL_IDX
;
 
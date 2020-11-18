/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

-----------------------------------------------------------------------------
--
--  Tavole richieste da Actis per il motore pagamenti - Esercizio aprile 2018
--  Integrato lo script con le viste od_xx -  confermato da Actis
--
-----------------------------------------------------------------------------

GRANT SELECT ON OD_SICEE_ACE_ANNOCOSTR_CLASSE TO SICEE_RO;



CREATE TABLE SICEE_D_STATO_TRANS_2018 (
       ID_STATO_TRANS_2018  NUMBER(2) NOT NULL,
       DESCR_STATO_TRANS    VARCHAR2(100) NOT NULL
);

ALTER TABLE SICEE_D_STATO_TRANS_2018
       ADD  CONSTRAINT PK_SICEE_D_STATO_TRANS_2018 PRIMARY KEY (
              ID_STATO_TRANS_2018) ;

GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_D_STATO_TRANS_2018 TO SICEE_RW; 


CREATE TABLE SICEE_D_TIPO_OP_2018 (
       ID_TIPO_OP_2018      NUMBER(2) NOT NULL,
       DESCR_TIPO_OP_2018   VARCHAR2(100) NOT NULL
);

ALTER TABLE SICEE_D_TIPO_OP_2018
       ADD  CONSTRAINT PK_SICEE_D_TIPO_OP_2018 PRIMARY KEY (
              ID_TIPO_OP_2018) ;

GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_D_TIPO_OP_2018 TO SICEE_RW; 


CREATE TABLE SICEE_T_CREDITO_2018 (
       ID_CREDITO           NUMBER NOT NULL,
       FK_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       FK_TRANSAZIONE_2018  INTEGER NULL,
       FK_TIPO_OP_2018      NUMBER(2) NOT NULL,
       VALORE_CREDITO_INIZIALE NUMBER NULL,
       VALORE_CREDITO_FINALE NUMBER NULL,
       DATA_OPERAZIONE      DATE NOT NULL,
       VALORE_OPERAZIONE    NUMBER NULL,
       NOTE                 VARCHAR2(50) NULL,
       FK_CERTIFICATORE_CERTIFICATO VARCHAR2(5) NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NULL,
       ANNO                 VARCHAR2(4) NULL
);

ALTER TABLE SICEE_T_CREDITO_2018
       ADD  CONSTRAINT PK_SICEE_T_CREDITO_2018 PRIMARY KEY (
              ID_CREDITO) ;

GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_CREDITO_2018 TO SICEE_RW; 



CREATE TABLE SICEE_T_TRANSAZIONE_2018 (
       ID_TRANSAZIONE_2018  INTEGER NOT NULL,
       FK_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       FK_STATO_TRANS_2018  NUMBER(2) NOT NULL,
       S1_VALORE_TRANSAZIONE NUMBER NOT NULL,
       S1_TIPO_ID_VERSANTE    VARCHAR2(1) NOT NULL
                                   CONSTRAINT DOM_F_G
                                          CHECK (S1_TIPO_ID_VERSANTE IN ('F','G')),
       S1_COD_ID_VERSANTE    VARCHAR2(16) NOT NULL,
       S1_ANAGRAFICA_VERSANTE VARCHAR2(100) NOT NULL,
       S1_ID_TRANSAZIONE_MDP VARCHAR2(50) NOT NULL,
       S1_DT_CREAZIONE_TRANSAZIONE DATE NOT NULL,
       S2_ID_INFORMATIVA_PSP INTEGER NULL,
       S2_IDENTIFICATIVO_PSP VARCHAR2(20) NULL,
       S2_RAG_SOCIALE_PSP    VARCHAR2(100) NULL,
       S2_DESCR_SERVIZIO_PSP VARCHAR2(100) NULL,
       S3_ID_IUV             VARCHAR2(50) NULL,
       S3_DT_AVVIO_TRANSAZIONE DATE NULL,
       DT_CHIUSURA_TRANSAZIONE DATE  NULL,
       XML_RT               CLOB  NULL,
       OP_GETSTATOTRANS_FK_STATO NUMBER(2) NULL,
       OP_GETSTATOTRANS_DT  DATE  NULL
);

ALTER TABLE SICEE_T_TRANSAZIONE_2018
       ADD  CONSTRAINT PK_SICEE_T_TRANSAZIONE_2018 PRIMARY KEY (
              ID_TRANSAZIONE_2018) ;

GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_TRANSAZIONE_2018 TO SICEE_RW; 



ALTER TABLE SICEE_T_CREDITO_2018
       ADD  CONSTRAINT FK_SICEE_T_CERTIFICATO_40
              FOREIGN KEY (FK_CERTIFICATORE_CERTIFICATO, 
              PROGR_CERTIFICATO, ANNO)
                             REFERENCES SICEE_T_CERTIFICATO  ;

ALTER TABLE SICEE_T_CREDITO_2018
       ADD  CONSTRAINT FK_SICEE_D_TIPO_OP_2018_01
              FOREIGN KEY (FK_TIPO_OP_2018)
                             REFERENCES SICEE_D_TIPO_OP_2018  ;

ALTER TABLE SICEE_T_CREDITO_2018
       ADD  CONSTRAINT FK_SICEE_T_TRANSAZIONE_2018_01
              FOREIGN KEY (FK_TRANSAZIONE_2018)
                             REFERENCES SICEE_T_TRANSAZIONE_2018  ;

ALTER TABLE SICEE_T_CREDITO_2018
       ADD  CONSTRAINT FK_SICEE_T_CERTIFICATORE_08
              FOREIGN KEY (FK_CERTIFICATORE)
                             REFERENCES SICEE_T_CERTIFICATORE  ;

ALTER TABLE SICEE_T_TRANSAZIONE_2018
       ADD  CONSTRAINT FK_SICEE_D_STATO_TRANS_2018_01
              FOREIGN KEY (FK_STATO_TRANS_2018)
                             REFERENCES SICEE_D_STATO_TRANS_2018  ;

ALTER TABLE SICEE_T_TRANSAZIONE_2018
       ADD  CONSTRAINT FK_SICEE_T_CERTIFICATORE_09
              FOREIGN KEY (FK_CERTIFICATORE)
                             REFERENCES SICEE_T_CERTIFICATORE  ;



CREATE SEQUENCE SEQ_SICEE_T_CREDITO_2018
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;

GRANT ALTER, SELECT ON SEQ_SICEE_T_CREDITO_2018 TO SICEE_RW;



-----------------------------------------------------------------------------
--   Richieste da Actis il 7/02/2018 ed eseguite in svi
-----------------------------------------------------------------------------
ALTER TABLE SICEE.SICEE_T_CERTIFICATO
 ADD (COORD_CALC_UTM_N  NUMBER);

ALTER TABLE SICEE.SICEE_T_CERTIFICATO
 ADD (COORD_CALC_UTM_E  NUMBER);
 


CREATE TABLE SICEE_D_STATO_TRANS_MDP_2018 (
       ID_STATO_TRANS_MDP_2018 NUMBER(2) NOT NULL,
       DESCR_STATO_TRANS_MDP VARCHAR2(100) NOT NULL
);

ALTER TABLE SICEE_D_STATO_TRANS_MDP_2018
       ADD  CONSTRAINT PK_SICEE_D_STATO_TRANS_MDP_201 PRIMARY KEY (
              ID_STATO_TRANS_MDP_2018) ;

GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_D_STATO_TRANS_MDP_2018 TO SICEE_RW; 



CREATE TABLE SICEE_T_PARAMETRI_MDP (
       ID_PARAMETRI_MDP     INTEGER NOT NULL,
       CODICE               VARCHAR2(50) NULL,
       VALORE               VARCHAR2(500) NULL
);

ALTER TABLE SICEE_T_PARAMETRI_MDP
       ADD  CONSTRAINT PK_SICEE_T_PARAMETRI_MDP PRIMARY KEY (
              ID_PARAMETRI_MDP) ;


GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_PARAMETRI_MDP TO SICEE_RW; 


ALTER TABLE SICEE_T_TRANSAZIONE_2018
       ADD  CONSTRAINT FK_SICEE_D_ST_TRANSMDP2018_01
              FOREIGN KEY (OP_GETSTATOTRANS_FK_STATO)
                             REFERENCES SICEE_D_STATO_TRANS_MDP_2018  ;
 
 -- Trattamento dati
 INSERT INTO SICEE_T_TRANSAZIONE_ACE (
   ID_TRANSAZIONE_ACE, FK_TIPO_PAGAMENTO, NUM_TRANSAZIONE, 
   DATA_TRANSAZIONE, FLG_VERIFICATO, ESEGUITO_NOME, 
   ESEGUITO_COGNOME, FK_CERTIFICATORE, ANNO, 
   QUANTITA, FK_CREDITO) 
VALUES ( 0, 1, null, null, null, null, null, null, null, null,null);

commit;



INSERT INTO SICEE_D_STATO_TRANS_MDP_2018 (ID_STATO_TRANS_MDP_2018, DESCR_STATO_TRANS_MDP) VALUES (0, 'NOTINITIALIZED');
INSERT INTO SICEE_D_STATO_TRANS_MDP_2018 (ID_STATO_TRANS_MDP_2018, DESCR_STATO_TRANS_MDP) VALUES (1, 'INITIALIZED');
INSERT INTO SICEE_D_STATO_TRANS_MDP_2018 (ID_STATO_TRANS_MDP_2018, DESCR_STATO_TRANS_MDP) VALUES (2, 'CONFIGURED');
INSERT INTO SICEE_D_STATO_TRANS_MDP_2018 (ID_STATO_TRANS_MDP_2018, DESCR_STATO_TRANS_MDP) VALUES (3, 'STARTED');
INSERT INTO SICEE_D_STATO_TRANS_MDP_2018 (ID_STATO_TRANS_MDP_2018, DESCR_STATO_TRANS_MDP) VALUES (4, 'SUCCESSFULL');
INSERT INTO SICEE_D_STATO_TRANS_MDP_2018 (ID_STATO_TRANS_MDP_2018, DESCR_STATO_TRANS_MDP) VALUES (5, 'UNSUCCESSFULL');
INSERT INTO SICEE_D_STATO_TRANS_MDP_2018 (ID_STATO_TRANS_MDP_2018, DESCR_STATO_TRANS_MDP) VALUES (6, 'CANCELED');
INSERT INTO SICEE_D_STATO_TRANS_MDP_2018 (ID_STATO_TRANS_MDP_2018, DESCR_STATO_TRANS_MDP) VALUES (7, 'REFUNDED');
INSERT INTO SICEE_D_STATO_TRANS_MDP_2018 (ID_STATO_TRANS_MDP_2018, DESCR_STATO_TRANS_MDP) VALUES (8, 'TO BE CONFIRMED');
INSERT INTO SICEE_D_STATO_TRANS_MDP_2018 (ID_STATO_TRANS_MDP_2018, DESCR_STATO_TRANS_MDP) VALUES (9, 'ATTESA RT');
commit;


INSERT INTO SICEE_D_STATO_TRANS_2018 (ID_STATO_TRANS_2018, DESCR_STATO_TRANS) VALUES (1, 'CREA TRANSAZIONE');
INSERT INTO SICEE_D_STATO_TRANS_2018 (ID_STATO_TRANS_2018, DESCR_STATO_TRANS) VALUES (2, 'URL WIS');
INSERT INTO SICEE_D_STATO_TRANS_2018 (ID_STATO_TRANS_2018, DESCR_STATO_TRANS) VALUES (3, 'AVVIO TRANSAZIONE');
INSERT INTO SICEE_D_STATO_TRANS_2018 (ID_STATO_TRANS_2018, DESCR_STATO_TRANS) VALUES (4, 'ATTESA RT');
INSERT INTO SICEE_D_STATO_TRANS_2018 (ID_STATO_TRANS_2018, DESCR_STATO_TRANS) VALUES (5, 'PAGAMENTO OK');
INSERT INTO SICEE_D_STATO_TRANS_2018 (ID_STATO_TRANS_2018, DESCR_STATO_TRANS) VALUES (6, 'FALLITO');
INSERT INTO SICEE_D_STATO_TRANS_2018 (ID_STATO_TRANS_2018, DESCR_STATO_TRANS) VALUES (7, 'ANNULLATO');
INSERT INTO SICEE_D_STATO_TRANS_2018 (ID_STATO_TRANS_2018, DESCR_STATO_TRANS) VALUES (8, 'PAGAMENTO KO');
INSERT INTO SICEE_D_STATO_TRANS_2018 (ID_STATO_TRANS_2018, DESCR_STATO_TRANS) VALUES (9, 'PAGAMENTYO KO AUTOMATICO');
commit;
-------
 
 -------------------------------------------------------------------------------
--
--  Viste modificate + nuova vista richieste da Actis il 23/04/2018  SVI + TST
--  Esercizio Giugno 2018
--
-------------------------------------------------------------------------------
 create or replace view OD_SICEE_APE_DESTUSO_CLASSE as 
select DESCR AS KEY_CLASSE
    , SUM(TOT_E11) AS E_11
    , SUM(TOT_E11bis) AS E_11_bis
    , SUM(TOT_E12) AS E_12
    , SUM(TOT_E13) AS E_13
    , SUM(TOT_E2) AS E_2
    , SUM(TOT_E3) AS E_3
    , SUM(TOT_E41) AS E_41
    , SUM(TOT_E42) AS E_42
    , SUM(TOT_E43) AS E_43
    , SUM(TOT_E5) AS E5
    , SUM(TOT_E61) AS E_61
    , SUM(TOT_E62) AS E_62
    , SUM(TOT_E63) AS E_63
    , SUM(TOT_E7) AS E7
    , SUM(TOT_E8) AS E8
    ,TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
 from
(
select id_classe,sicee_d_classe_energetica.descr, sigla
, case
    when sigla like 'E1(1)' then 1
    else 0
  end tot_E11
, case
    when sigla like 'E1(1) bis' then 1
    else 0
  end tot_E11bis
, case
    when sigla like 'E1(2)' then 1
    else 0
  end tot_E12
, case
    when sigla like 'E1(3)' then 1
    else 0
  end tot_E13
, case
    when sigla like 'E2' then 1
    else 0
  end tot_E2
, case
    when sigla like 'E3' then 1
    else 0
  end tot_E3
, case
    when sigla like 'E4(1)' then 1
    else 0
  end tot_E41
, case
    when sigla like 'E4(2)' then 1
    else 0
  end tot_E42
, case
    when sigla like 'E4(3)' then 1
    else 0
  end tot_E43
, case
    when sigla like 'E5' then 1
    else 0
  end tot_E5
, case
    when sigla like 'E6(1)' then 1
    else 0
  end tot_E61
, case
    when sigla like 'E6(2)' then 1
    else 0
  end tot_E62
, case
    when sigla like 'E6(3)' then 1
    else 0
  end tot_E63
, case
    when sigla like 'E7' then 1
    else 0
  end tot_E7
, case
    when sigla like 'E8' then 1
    else 0
  end tot_E8
from sicee_d_classe_energetica,sicee_t_dati_generali,sicee_t_dati_ener_2015,sicee_t_certificato, sicee_d_dest_uso_2015
where sicee_t_certificato.ID_CERTIFICATORE = sicee_t_dati_ener_2015.ID_CERTIFICATORE
  and sicee_t_certificato.PROGR_CERTIFICATO = sicee_t_dati_ener_2015.PROGR_CERTIFICATO
  and sicee_t_certificato.ANNO = sicee_t_dati_ener_2015.ANNO
  and sicee_t_certificato.ID_CERTIFICATORE = sicee_t_dati_generali.ID_CERTIFICATORE
  and sicee_t_certificato.PROGR_CERTIFICATO = sicee_t_dati_generali.PROGR_CERTIFICATO
  and sicee_t_certificato.ANNO = sicee_t_dati_generali.ANNO
  and sicee_t_dati_ener_2015.fk_classe_energetica = sicee_d_classe_energetica.ID_CLASSE
  and sicee_t_certificato.fk_stato = 3
  and sicee_t_certificato.flg_old='N'
  and sicee_d_dest_uso_2015.id_dest_uso_2015 = sicee_t_dati_generali.fk_dest_uso_2015
  and to_number(sicee_t_certificato.id_certificatore) > 100
  AND TO_CHAR(SICEE_T_CERTIFICATO.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
)
group by  DESCR
order by 1;

GRANT SELECT ON OD_SICEE_APE_DESTUSO_CLASSE TO SICEE_RO;
GRANT SELECT ON OD_SICEE_APE_DESTUSO_CLASSE TO SICEE_RW;



CREATE OR REPLACE FORCE VIEW V_DATI_GENERALI
(id_certificato, NUM_CERTIFICATORE, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, 
 DESC_PROV, DESC_COMUNE, DESC_INDIRIZZO, NUM_CIVICO, CAP, 
 PIANO, INTERNO, COORD_N, COORD_E, CODICE_COMUNE_CATASTALE, 
 RIF_CATASTO, SEZIONE, FOGLIO, PARTICELLA, SUBALTERNO, 
 DATA_INVIO_FILE, DT_SCADENZA, FK_DICHIARAZIONE, COD_FISC_COCERTIFICATORE, DESCR_DESTINAZIONE_USO, 
 FLG_RESIDENZIALE, FLG_ATTIVO, DESTINAZIONE_USO, FLG_USO_PUBBLICO, ANNO_COSTRUZIONE, 
 ANNO_ULT_RIST, VOL_LORDO_RISCALDATO, SUP_RISCALDATA, SUP_RAFFRESCATA, SUP_DISPERDENTE, 
 VOL_LORDO_RAFFRESCATO, ZONA_CLIMATICA, NR_UM, OGGETTO_APE, DESCR_TIPO_RISTRUTT, 
 DESCR_TIPOLOGIA_EDILIZIA, DESCR_PROPRIETA_EDIF, DESCR_TIPOLOGIA_COSTRUTT, MOTIVAZIONE_RILASCIO, DICH_INPIPENDENZA, 
 INFO_MIGL_PREST_ENERG, FLG_SOPRALLUOGO, DATA_SOPRALLUOGO, NOTE_SOPRALLUOGO, NOTE_SEGNALAZIONI, 
 FLG_SW1, FLG_SW2, MOTIVO_ALTRO)
AS 
select distinct RAWTOHEX(substr(c.id_certificatore,1,3)||c.ANNO||c.PROGR_CERTIFICATO||c.ID_CERTIFICATORE),
cert.NUM_CERTIFICATORE,
    c.ID_CERTIFICATORE , 
    c.PROGR_CERTIFICATO, 
    c.ANNO,
    C.DESC_PROV,
    C.DESC_COMUNE,
    c.DESC_INDIRIZZO,
    c.NUM_CIVICO,
    c.cap,
    c.piano,
    c.interno,
    c.coord_n,
    c.coord_e,
    c.codice_comune_catastale,
    c.rif_catasto,
    c.SEZIONE,
    c.FOGLIO,
    c.PARTICELLA,
    c.SUBALTERNO,
    c.DT_UPLOAD Data_invio_file,
    c.dt_scadenza,    
    c.FK_DICHIARAZIONE,
    c.cod_fisc_cocertificatore,
dd.descr descr_destinazione_uso,
dd.flg_residenziale,
dd.flg_attivo,
DD.SIGLA DESTINAZIONE_USO,
    dg.FLG_USO_PUBBLICO,
    DG.ANNO_COSTRUZIONE,
    dg.ANNO_ULT_RIST,
    dg.vol_lordo_riscaldato,
    dg.sup_riscaldata,
    dg.sup_raffrescata,
    dg.sup_disperdente,
    dg.vol_lordo_raffrescato,
    dg.zona_climatica,
    dg.nr_um,    
og.descr oggetto_ape,
    tr.descr descr_tipo_ristrutt,
te.descr descr_tipologia_edilizia,
   pe.descr descr_proprieta_edif,
tc.descr descr_tipologia_costrutt,
M.DESCR Motivazione_Rilascio,
    a.dich_inpipendenza,
    a.info_migl_prest_energ,
    a.flg_sopralluogo,
    a.data_sopralluogo,
    a.note_sopralluogo,
    a.note_segnalazioni,
    a.flg_sw1,
    a.flg_sw2,
    a.motivo_altro
from    sicee_t_certificatore cert,
        sicee_t_certificato c,
        sicee_t_dati_generali dg,
        sicee_d_dest_uso_2015 dd,
        sicee_d_classe_energetica ca,
        SICEE_D_MOTIVO_RILASCIO M,
        SICEE_T_ALTRE_INFO A,
        sicee_d_titolo tit,
        sicee_d_qualita_involucro ql,
        sicee_d_tipol_edilizia_2015 te,
        sicee_d_tipo_ristrutt_2015 tr,
        sicee_d_proprieta_edif_2015 pe,
        sicee_d_tipol_costrutt_2015 tc,
        sicee_d_oggetto_ape_2015 og
where c.ID_CERTIFICATORE = dg.ID_CERTIFICATORE (+) and
    c.ANNO = dg.ANNO (+) and
    c.PROGR_CERTIFICATO = dg.PROGR_CERTIFICATO (+) and
    c.FK_STATO = 3 and 
    c.flg_old='N' and
    C.ID_CERTIFICATORE = A.ID_CERTIFICATORE (+) AND
    C.PROGR_CERTIFICATO = A.PROGR_CERTIFICATO (+) AND
    C.ANNO = A.ANNO (+) AND
    A.FK_MOTIVO = M.ID_MOTIVO (+) AND
    a.FK_QUALITA_INVO = ql.ID_QUALITA(+) and
    a.FK_CLASSE_192_05 = ca.ID_CLASSE (+) and
    DG.FK_DEST_USO_2015 = DD.ID_DEST_USO_2015 (+) and
    cert.ID_CERTIFICATORE = c.ID_CERTIFICATORE and
    te.id_tipol_edilizia(+) = dg.fk_tipol_edilizia and
    pe.id_proprieta_edi(+) = dg.fk_proprieta_edi and
    tc.id_tipol_costrutt (+) = dg.fk_tipol_costruttiva and 
    og.id_oggetto_ape (+) = dg.fk_oggetto_ape and 
    tr.id_tipo_ristrutturaz (+) = dg.fk_tipo_ristrutturaz and 
--    c.dt_upload > to_date('30/09/2015','dd/mm/yyyy') and
    to_number (c.id_certificatore) > 100
 order by c.id_certificatore,c.progr_certificato,c.anno;
 
 
 
 
CREATE OR REPLACE FORCE VIEW V_DATIGEN_CONSUMI
(nr_riga, id_certificato, NUM_CERTIFICATORE, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, 
 DESC_PROV, DESC_COMUNE, DESC_INDIRIZZO, NUM_CIVICO, CAP, 
 PIANO, INTERNO, COORD_N, COORD_E, CODICE_COMUNE_CATASTALE, 
 RIF_CATASTO, SEZIONE, FOGLIO, PARTICELLA, SUBALTERNO, 
 DATA_INVIO_FILE, DT_SCADENZA, FK_DICHIARAZIONE, COD_FISC_COCERTIFICATORE, DESCR_DESTINAZIONE_USO, 
 FLG_RESIDENZIALE, FLG_ATTIVO, DESTINAZIONE_USO, FLG_USO_PUBBLICO, ANNO_COSTRUZIONE, 
 ANNO_ULT_RIST, VOL_LORDO_RISCALDATO, SUP_RISCALDATA, SUP_RAFFRESCATA, SUP_DISPERDENTE, 
 VOL_LORDO_RAFFRESCATO, ZONA_CLIMATICA, NR_UM, OGGETTO_APE, DESCR_TIPO_RISTRUTT, 
 DESCR_TIPOLOGIA_EDILIZIA, DESCR_PROPRIETA_EDIF, DESCR_TIPOLOGIA_COSTRUTT, MOTIVAZIONE_RILASCIO, DICH_INPIPENDENZA, 
 INFO_MIGL_PREST_ENERG, FLG_SOPRALLUOGO, DATA_SOPRALLUOGO, NOTE_SOPRALLUOGO, NOTE_SEGNALAZIONI, 
 FLG_SW1, FLG_SW2, MOTIVO_ALTRO, ID_QTA_CONSUMI, UNITA_MISURA, 
 TIPO_COMBUSTIBILE, QUANTITA, ALTRO_DESCR_COMB)
AS 
SELECT distinct rownum,
       v_dati_generali.id_certificato,
       v_dati_generali.num_certificatore, v_dati_generali.id_certificatore,
       v_dati_generali.progr_certificato, v_dati_generali.anno,
       v_dati_generali.desc_prov, v_dati_generali.desc_comune,
       v_dati_generali.desc_indirizzo, v_dati_generali.num_civico,
       v_dati_generali.cap, v_dati_generali.piano, v_dati_generali.interno,
       v_dati_generali.coord_n, v_dati_generali.coord_e,
       v_dati_generali.codice_comune_catastale, v_dati_generali.rif_catasto,
       v_dati_generali.sezione, v_dati_generali.foglio,
       v_dati_generali.particella, v_dati_generali.subalterno,
       v_dati_generali.data_invio_file, v_dati_generali.dt_scadenza,
       v_dati_generali.fk_dichiarazione,
       v_dati_generali.cod_fisc_cocertificatore,
       v_dati_generali.descr_destinazione_uso,
       v_dati_generali.flg_residenziale, v_dati_generali.flg_attivo,
       v_dati_generali.destinazione_uso, v_dati_generali.flg_uso_pubblico,
       v_dati_generali.anno_costruzione, v_dati_generali.anno_ult_rist,
       v_dati_generali.vol_lordo_riscaldato, v_dati_generali.sup_riscaldata,
       v_dati_generali.sup_raffrescata, v_dati_generali.sup_disperdente,
       v_dati_generali.vol_lordo_raffrescato, v_dati_generali.zona_climatica,
       v_dati_generali.nr_um, v_dati_generali.oggetto_ape,
       v_dati_generali.descr_tipo_ristrutt,
       v_dati_generali.descr_tipologia_edilizia,
       v_dati_generali.descr_proprieta_edif,
       v_dati_generali.descr_tipologia_costrutt,
       v_dati_generali.motivazione_rilascio,
       v_dati_generali.dich_inpipendenza,
       v_dati_generali.info_migl_prest_energ, v_dati_generali.flg_sopralluogo,
       v_dati_generali.data_sopralluogo, v_dati_generali.note_sopralluogo,
       v_dati_generali.note_segnalazioni, v_dati_generali.flg_sw1,
       v_dati_generali.flg_sw2, v_dati_generali.motivo_altro,
       sicee_t_qta_consumi_2015.id_qta_consumi,
       sicee_d_unita_misura_2015.descr unita_misura,
       sicee_d_combustibile.descr tipo_combustibile,
       sicee_t_qta_consumi_2015.quantita,
       sicee_t_qta_consumi_2015.altro_descr_comb
  FROM v_dati_generali,
       sicee_t_qta_consumi_2015,
       sicee_d_combustibile,
       sicee_d_unita_misura_2015
 WHERE (    (sicee_d_combustibile.id_combustibile =
                                      sicee_t_qta_consumi_2015.fk_combustibile
            )
        AND (sicee_d_unita_misura_2015.id_unita_misura =
                                      sicee_t_qta_consumi_2015.fk_unita_misura
            )
        AND (v_dati_generali.id_certificatore (+)= sicee_t_qta_consumi_2015.id_certificatore)
        AND (v_dati_generali.progr_certificato(+) = sicee_t_qta_consumi_2015.progr_certificato)
        AND (v_dati_generali.anno(+) = sicee_t_qta_consumi_2015.anno)
        AND id_certificato is not null
       );


       
       
       
       
       
CREATE OR REPLACE FORCE VIEW V_DATIGEN_ENERGETICI
(id_certificato, NUM_CERTIFICATORE, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, 
 DESC_PROV, DESC_COMUNE, DESC_INDIRIZZO, NUM_CIVICO, CAP, 
 PIANO, INTERNO, COORD_N, COORD_E, CODICE_COMUNE_CATASTALE, 
 RIF_CATASTO, SEZIONE, FOGLIO, PARTICELLA, SUBALTERNO, 
 DATA_INVIO_FILE, DT_SCADENZA, FK_DICHIARAZIONE, COD_FISC_COCERTIFICATORE, DESCR_DESTINAZIONE_USO, 
 FLG_RESIDENZIALE, FLG_ATTIVO, DESTINAZIONE_USO, FLG_USO_PUBBLICO, ANNO_COSTRUZIONE, 
 ANNO_ULT_RIST, VOL_LORDO_RISCALDATO, SUP_RISCALDATA, SUP_RAFFRESCATA, SUP_DISPERDENTE, 
 VOL_LORDO_RAFFRESCATO, ZONA_CLIMATICA, NR_UM, OGGETTO_APE, DESCR_TIPO_RISTRUTT, 
 DESCR_TIPOLOGIA_EDILIZIA, DESCR_PROPRIETA_EDIF, DESCR_TIPOLOGIA_COSTRUTT, MOTIVAZIONE_RILASCIO, DICH_INPIPENDENZA, 
 INFO_MIGL_PREST_ENERG, FLG_SOPRALLUOGO, DATA_SOPRALLUOGO, NOTE_SOPRALLUOGO, NOTE_SEGNALAZIONI, 
 FLG_SW1, FLG_SW2, MOTIVO_ALTRO, CLASSE_ENERGETICA, CE_RACC_TOTALE, 
 EPH, EPH_LIMITE, YIE, ASOL_ASUP, FLG_EDIF_E0, 
 FLG_CLIMAT_INVERNALE, FLG_CLIMAT_ESTIVA, FLG_VENTIL_MECCANICA, FLG_PROD_H2O_SANITARIA, FLG_ILLUMINAZIONE, 
 FLG_TRASPORTO_PERS_COSE, ENERGIA_ESPORTATA, EPGL_NREN_RACC_TOTALE, EPGL_REN_GLOBALE, EPGL_NREN_GLOBALE, 
 EMISSIONI_CO2, EPGL_NREN_NUOVI, EPGL_NREN_ESISTENTI, EPGL_NREN_RIF, FLG_SMILE_INVERNO, 
 FLG_SMILE_ESTATE, RAPPORTO_SV)
AS 
SELECT distinct v_dati_generali.id_certificato,
       v_dati_generali.num_certificatore, v_dati_generali.id_certificatore,
       v_dati_generali.progr_certificato, v_dati_generali.anno,
       v_dati_generali.desc_prov, v_dati_generali.desc_comune,
       v_dati_generali.desc_indirizzo, v_dati_generali.num_civico,
       v_dati_generali.cap, v_dati_generali.piano, v_dati_generali.interno,
       v_dati_generali.coord_n, v_dati_generali.coord_e,
       v_dati_generali.codice_comune_catastale, v_dati_generali.rif_catasto,
       v_dati_generali.sezione, v_dati_generali.foglio,
       v_dati_generali.particella, v_dati_generali.subalterno,
       v_dati_generali.data_invio_file, v_dati_generali.dt_scadenza,
       v_dati_generali.fk_dichiarazione,
       v_dati_generali.cod_fisc_cocertificatore,
       v_dati_generali.descr_destinazione_uso,
       v_dati_generali.flg_residenziale, v_dati_generali.flg_attivo,
       v_dati_generali.destinazione_uso, v_dati_generali.flg_uso_pubblico,
       v_dati_generali.anno_costruzione, v_dati_generali.anno_ult_rist,
       v_dati_generali.vol_lordo_riscaldato, v_dati_generali.sup_riscaldata,
       v_dati_generali.sup_raffrescata, v_dati_generali.sup_disperdente,
       v_dati_generali.vol_lordo_raffrescato, v_dati_generali.zona_climatica,
       v_dati_generali.nr_um, v_dati_generali.oggetto_ape,
       v_dati_generali.descr_tipo_ristrutt,
       v_dati_generali.descr_tipologia_edilizia,
       v_dati_generali.descr_proprieta_edif,
       v_dati_generali.descr_tipologia_costrutt,
       v_dati_generali.motivazione_rilascio,
       v_dati_generali.dich_inpipendenza,
       v_dati_generali.info_migl_prest_energ, v_dati_generali.flg_sopralluogo,
       v_dati_generali.data_sopralluogo, v_dati_generali.note_sopralluogo,
       v_dati_generali.note_segnalazioni, v_dati_generali.flg_sw1,
       v_dati_generali.flg_sw2, v_dati_generali.motivo_altro,
       sicee_d_classe_energetica.descr classe_energetica,
       en_2.descr ce_racc_totale, sicee_t_dati_ener_2015.eph,
       sicee_t_dati_ener_2015.eph_limite, sicee_t_dati_ener_2015.yie,
       sicee_t_dati_ener_2015.asol_asup, sicee_t_dati_ener_2015.flg_edif_e0,
       sicee_t_dati_ener_2015.flg_climat_invernale,
       sicee_t_dati_ener_2015.flg_climat_estiva,
       sicee_t_dati_ener_2015.flg_ventil_meccanica,
       sicee_t_dati_ener_2015.flg_prod_h2o_sanitaria,
       sicee_t_dati_ener_2015.flg_illuminazione,
       sicee_t_dati_ener_2015.flg_trasporto_pers_cose,
       sicee_t_dati_ener_2015.energia_esportata,
       sicee_t_dati_ener_2015.epgl_nren_racc_totale,
       sicee_t_dati_ener_2015.epgl_ren_globale,
       sicee_t_dati_ener_2015.epgl_nren_globale,
       sicee_t_dati_ener_2015.emissioni_co2,
       sicee_t_dati_ener_2015.epgl_nren_nuovi,
       sicee_t_dati_ener_2015.epgl_nren_esistenti,
       sicee_t_dati_ener_2015.epgl_nren_rif,
       sicee_t_dati_ener_2015.flg_smile_inverno,
       sicee_t_dati_ener_2015.flg_smile_estate,
       sicee_t_dati_ener_2015.rapporto_sv
  FROM v_dati_generali,
       sicee_t_dati_ener_2015,
       sicee_d_classe_energetica,
       sicee_d_classe_energetica en_2
 WHERE (    (sicee_d_classe_energetica.id_classe =
                                   sicee_t_dati_ener_2015.fk_classe_energetica
            )
        AND (en_2.id_classe = sicee_t_dati_ener_2015.fk_ce_racc_totale)
        AND (v_dati_generali.id_certificatore(+) =
                                       sicee_t_dati_ener_2015.id_certificatore)
        AND (v_dati_generali.progr_certificato(+) =
                                      sicee_t_dati_ener_2015.progr_certificato)
        AND (v_dati_generali.anno(+) = sicee_t_dati_ener_2015.anno)
        AND id_certificato is not null 
       );





CREATE OR REPLACE FORCE VIEW V_DATIGEN_IMPIANTI
(nr_riga, id_certificato, NUM_CERTIFICATORE, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, 
 DESC_PROV, DESC_COMUNE, DESC_INDIRIZZO, NUM_CIVICO, CAP, 
 PIANO, INTERNO, COORD_N, COORD_E, CODICE_COMUNE_CATASTALE, 
 RIF_CATASTO, SEZIONE, FOGLIO, PARTICELLA, SUBALTERNO, 
 DATA_INVIO_FILE, DT_SCADENZA, FK_DICHIARAZIONE, COD_FISC_COCERTIFICATORE, DESCR_DESTINAZIONE_USO, 
 FLG_RESIDENZIALE, FLG_ATTIVO, DESTINAZIONE_USO, FLG_USO_PUBBLICO, ANNO_COSTRUZIONE, 
 ANNO_ULT_RIST, VOL_LORDO_RISCALDATO, SUP_RISCALDATA, SUP_RAFFRESCATA, SUP_DISPERDENTE, 
 VOL_LORDO_RAFFRESCATO, ZONA_CLIMATICA, NR_UM, OGGETTO_APE, DESCR_TIPO_RISTRUTT, 
 DESCR_TIPOLOGIA_EDILIZIA, DESCR_PROPRIETA_EDIF, DESCR_TIPOLOGIA_COSTRUTT, MOTIVAZIONE_RILASCIO, DICH_INPIPENDENZA, 
 INFO_MIGL_PREST_ENERG, FLG_SOPRALLUOGO, DATA_SOPRALLUOGO, NOTE_SOPRALLUOGO, NOTE_SEGNALAZIONI, 
 FLG_SW1, FLG_SW2, MOTIVO_ALTRO, ID_DETTAGLIO_IMP, PROGRESSIVO_DETT, 
 COMBUSTIBILE, SERV_ENER, TIPO_IMPIANTO, ANNO_INSTALL, POTENZA_NOMIN_KW, 
 CODICE_IMPIANTO_CIT)
AS 
SELECT distinct rownum, v_dati_generali.id_certificato,
       v_dati_generali.num_certificatore, v_dati_generali.id_certificatore,
       v_dati_generali.progr_certificato, v_dati_generali.anno,
       v_dati_generali.desc_prov, v_dati_generali.desc_comune,
       v_dati_generali.desc_indirizzo, v_dati_generali.num_civico,
       v_dati_generali.cap, v_dati_generali.piano, v_dati_generali.interno,
       v_dati_generali.coord_n, v_dati_generali.coord_e,
       v_dati_generali.codice_comune_catastale, v_dati_generali.rif_catasto,
       v_dati_generali.sezione, v_dati_generali.foglio,
       v_dati_generali.particella, v_dati_generali.subalterno,
       v_dati_generali.data_invio_file, v_dati_generali.dt_scadenza,
       v_dati_generali.fk_dichiarazione,
       v_dati_generali.cod_fisc_cocertificatore,
       v_dati_generali.descr_destinazione_uso,
       v_dati_generali.flg_residenziale, v_dati_generali.flg_attivo,
       v_dati_generali.destinazione_uso, v_dati_generali.flg_uso_pubblico,
       v_dati_generali.anno_costruzione, v_dati_generali.anno_ult_rist,
       v_dati_generali.vol_lordo_riscaldato, v_dati_generali.sup_riscaldata,
       v_dati_generali.sup_raffrescata, v_dati_generali.sup_disperdente,
       v_dati_generali.vol_lordo_raffrescato, v_dati_generali.zona_climatica,
       v_dati_generali.nr_um, v_dati_generali.oggetto_ape,
       v_dati_generali.descr_tipo_ristrutt,
       v_dati_generali.descr_tipologia_edilizia,
       v_dati_generali.descr_proprieta_edif,
       v_dati_generali.descr_tipologia_costrutt,
       v_dati_generali.motivazione_rilascio,
       v_dati_generali.dich_inpipendenza,
       v_dati_generali.info_migl_prest_energ, v_dati_generali.flg_sopralluogo,
       v_dati_generali.data_sopralluogo, v_dati_generali.note_sopralluogo,
       v_dati_generali.note_segnalazioni, v_dati_generali.flg_sw1,
       v_dati_generali.flg_sw2, v_dati_generali.motivo_altro,
       sicee_t_det_imp_2015.id_dettaglio_imp,
       sicee_t_det_imp_2015.progressivo_dett,
       sicee_d_combustibile.descr combustibile,
       sicee_d_serv_ener_2015.descr serv_ener,
       sicee_t_det_imp_2015.tipo_impianto, sicee_t_det_imp_2015.anno_install,
       sicee_t_det_imp_2015.potenza_nomin_kw,
       sicee_t_det_imp_2015.codice_impianto_cit
  FROM v_dati_generali,
       sicee_t_det_imp_2015,
       sicee_d_combustibile,
       sicee_d_serv_ener_2015
 WHERE (    (sicee_d_combustibile.id_combustibile =
                                          sicee_t_det_imp_2015.fk_combustibile
            )
        AND (sicee_d_serv_ener_2015.id_serv_ener =
                                             sicee_t_det_imp_2015.fk_serv_ener
            )
        AND (v_dati_generali.id_certificatore(+) =
                                         sicee_t_det_imp_2015.id_certificatore)
        AND (v_dati_generali.progr_certificato(+) =
                                        sicee_t_det_imp_2015.progr_certificato)
        AND (v_dati_generali.anno(+) = sicee_t_det_imp_2015.anno)
        AND id_certificato is not null
       );







CREATE OR REPLACE FORCE VIEW V_DATIGEN_RACCOMAND
(nr_riga, id_certificato, NUM_CERTIFICATORE, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, 
 DESC_PROV, DESC_COMUNE, DESC_INDIRIZZO, NUM_CIVICO, CAP, 
 PIANO, INTERNO, COORD_N, COORD_E, CODICE_COMUNE_CATASTALE, 
 RIF_CATASTO, SEZIONE, FOGLIO, PARTICELLA, SUBALTERNO, 
 DATA_INVIO_FILE, DT_SCADENZA, FK_DICHIARAZIONE, COD_FISC_COCERTIFICATORE, DESCR_DESTINAZIONE_USO, 
 FLG_RESIDENZIALE, FLG_ATTIVO, DESTINAZIONE_USO, FLG_USO_PUBBLICO, ANNO_COSTRUZIONE, 
 ANNO_ULT_RIST, VOL_LORDO_RISCALDATO, SUP_RISCALDATA, SUP_RAFFRESCATA, SUP_DISPERDENTE, 
 VOL_LORDO_RAFFRESCATO, ZONA_CLIMATICA, NR_UM, OGGETTO_APE, DESCR_TIPO_RISTRUTT, 
 DESCR_TIPOLOGIA_EDILIZIA, DESCR_PROPRIETA_EDIF, DESCR_TIPOLOGIA_COSTRUTT, MOTIVAZIONE_RILASCIO, DICH_INPIPENDENZA, 
 INFO_MIGL_PREST_ENERG, FLG_SOPRALLUOGO, DATA_SOPRALLUOGO, NOTE_SOPRALLUOGO, NOTE_SEGNALAZIONI, 
 FLG_SW1, FLG_SW2, MOTIVO_ALTRO, ID_RACCOMANDAZIONE, CODICE_REN, 
 CLASSE_ENERGETICA, TIPO_INTERVENTO, FLG_RISTRUTTURAZIONE, NR_ANNI_RIT_INVEST, EPGL_NREN_SINGOLO_INT)
AS 
SELECT distinct rownum, v_dati_generali.id_certificato,
       v_dati_generali.num_certificatore, v_dati_generali.id_certificatore,
       v_dati_generali.progr_certificato, v_dati_generali.anno,
       v_dati_generali.desc_prov, v_dati_generali.desc_comune,
       v_dati_generali.desc_indirizzo, v_dati_generali.num_civico,
       v_dati_generali.cap, v_dati_generali.piano, v_dati_generali.interno,
       v_dati_generali.coord_n, v_dati_generali.coord_e,
       v_dati_generali.codice_comune_catastale, v_dati_generali.rif_catasto,
       v_dati_generali.sezione, v_dati_generali.foglio,
       v_dati_generali.particella, v_dati_generali.subalterno,
       v_dati_generali.data_invio_file, v_dati_generali.dt_scadenza,
       v_dati_generali.fk_dichiarazione,
       v_dati_generali.cod_fisc_cocertificatore,
       v_dati_generali.descr_destinazione_uso,
       v_dati_generali.flg_residenziale, v_dati_generali.flg_attivo,
       v_dati_generali.destinazione_uso, v_dati_generali.flg_uso_pubblico,
       v_dati_generali.anno_costruzione, v_dati_generali.anno_ult_rist,
       v_dati_generali.vol_lordo_riscaldato, v_dati_generali.sup_riscaldata,
       v_dati_generali.sup_raffrescata, v_dati_generali.sup_disperdente,
       v_dati_generali.vol_lordo_raffrescato, v_dati_generali.zona_climatica,
       v_dati_generali.nr_um, v_dati_generali.oggetto_ape,
       v_dati_generali.descr_tipo_ristrutt,
       v_dati_generali.descr_tipologia_edilizia,
       v_dati_generali.descr_proprieta_edif,
       v_dati_generali.descr_tipologia_costrutt,
       v_dati_generali.motivazione_rilascio,
       v_dati_generali.dich_inpipendenza,
       v_dati_generali.info_migl_prest_energ, v_dati_generali.flg_sopralluogo,
       v_dati_generali.data_sopralluogo, v_dati_generali.note_sopralluogo,
       v_dati_generali.note_segnalazioni, v_dati_generali.flg_sw1,
       v_dati_generali.flg_sw2, v_dati_generali.motivo_altro,
       sicee_t_raccomand_2015.id_raccomandazione,
       sicee_t_raccomand_2015.codice_ren,
       sicee_d_classe_energetica.descr classe_energetica,
       sicee_t_raccomand_2015.tipo_intervento,
       sicee_t_raccomand_2015.flg_ristrutturazione,
       sicee_t_raccomand_2015.nr_anni_rit_invest,
       sicee_t_raccomand_2015.epgl_nren_singolo_int
  FROM v_dati_generali, sicee_t_raccomand_2015, sicee_d_classe_energetica
 WHERE (    (v_dati_generali.id_certificatore(+) =
                                       sicee_t_raccomand_2015.id_certificatore)
        AND (v_dati_generali.progr_certificato(+) =
                                      sicee_t_raccomand_2015.progr_certificato)
        AND (v_dati_generali.anno(+) = sicee_t_raccomand_2015.anno)
        AND (sicee_d_classe_energetica.id_classe(+) =
                                   sicee_t_raccomand_2015.fk_classe_energetica)
        AND id_certificato is not null
       );


-----------------------------------------------------------------------------
--
--  Nuove viste richieste da Actis il 23/04/2018  SVI + TST
--
-----------------------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW V_T_IMPORT_DATI_2015
(id_certificato, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, NOME_XML, 
 UID_INDEX, DT_CARICAMENTO)
AS 
select RAWTOHEX(substr(id_certificatore,1,3)||ANNO||PROGR_CERTIFICATO||ID_CERTIFICATORE),
ID_CERTIFICATORE,
PROGR_CERTIFICATO,ANNO,NOME_XML,UID_INDEX,DT_CARICAMENTO 
from SICEE_T_IMPORT_DATI_2015;


CREATE OR REPLACE FORCE VIEW V_T_IMPORT_DATI_LOG_2015
(nr_riga, id_certificato, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, TIMESTAMP, 
 PASSO_VALIDAZIONE, MESSAGGIO_ERRORE)
AS 
select distinct rownum, RAWTOHEX(substr(id_certificatore,1,3)||ANNO||PROGR_CERTIFICATO||ID_CERTIFICATORE),
ID_CERTIFICATORE,PROGR_CERTIFICATO,ANNO,TIMESTAMP,PASSO_VALIDAZIONE,MESSAGGIO_ERRORE
from SICEE_T_IMPORT_DATI_LOG_2015;


CREATE OR REPLACE FORCE VIEW V_T_IMPDATI_XML_2015
(id_certificato, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, F_XML)
AS 
select RAWTOHEX(substr(id_certificatore,1,3)||ANNO||PROGR_CERTIFICATO||ID_CERTIFICATORE),
ID_CERTIFICATORE,PROGR_CERTIFICATO,ANNO,F_XML from SICEE_T_IMPDATI_XML_2015;


CREATE OR REPLACE FORCE VIEW V_T_DATI_XML_2015
(id_certificato, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, FK_PROPRIETA_EDI, 
 FK_TIPO_VENTILAZIONE, DT_TITOLO_ABILITATIVO, FLG_SISTEMA_CONTABILIZZAZIONE, HT, SUP_DISP_TOT_OPACA, 
 SUP_DISP_TOT_TRASP, TRASMITTANZA_MED_SUP_OPACHE, TRASMITTANZA_MED_SUP_TRASP, PORTATA_VENTILAZIONE_TOT, EFFICIENZA_RECUPERO_MEDIO, 
 GRADI_GIORNO, DT_SOPRALLUOGO, SW_UTILIZZATO, NUM_CERTIF_SW)
AS 
select RAWTOHEX(substr(id_certificatore,1,3)||ANNO||PROGR_CERTIFICATO||ID_CERTIFICATORE),
ID_CERTIFICATORE,PROGR_CERTIFICATO,ANNO,FK_PROPRIETA_EDI,FK_TIPO_VENTILAZIONE,DT_TITOLO_ABILITATIVO,
FLG_SISTEMA_CONTABILIZZAZIONE,HT,SUP_DISP_TOT_OPACA,SUP_DISP_TOT_TRASP,TRASMITTANZA_MED_SUP_OPACHE,
TRASMITTANZA_MED_SUP_TRASP,PORTATA_VENTILAZIONE_TOT,EFFICIENZA_RECUPERO_MEDIO,GRADI_GIORNO,DT_SOPRALLUOGO,
SW_UTILIZZATO,NUM_CERTIF_SW from SICEE_T_DATI_XML_2015;


CREATE OR REPLACE FORCE VIEW V_T_DATI_XML_ED_RIF_2015
(id_certificato, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, QH, 
 QC, EPHND, EPCND, EPH, EPC, 
 EPW, EPV, EPL, EPGLNR, EPGLR, 
 EPGLTOT, ETAH, ETAC, ETAW)
AS 
select RAWTOHEX(substr(id_certificatore,1,3)||ANNO||PROGR_CERTIFICATO||ID_CERTIFICATORE),
ID_CERTIFICATORE,PROGR_CERTIFICATO,ANNO,QH,QC,EPHND,EPCND,EPH,EPC,EPW,EPV,EPL,
EPGLNR,EPGLR,EPGLTOT,ETAH,ETAC,ETAW from SICEE_T_DATI_XML_ED_RIF_2015;


CREATE OR REPLACE FORCE VIEW V_T_DATI_XML_ED_REALE_2015
(id_certificato, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, FABB_RISC_INVOLUCRO_EXTRA_FLUS, 
 FABB_RISC_INVOLUCRO_TRASMISSIO, FABB_RISC_INVOLUCRO_VENTILAZIO, FABB_RISC_INVOLUCRO_APPORTI_SO, FABB_RISC_INVOLUCRO_APPORTI_IN, FABB_RISC_INVOLUCRO_APPORTI_LA, 
 FABB_RISC_INVOLUCRO_QHND, FABB_RISC_INVOLUCRO_QLR, FABB_RISC_INVOLUCRO_QHIMP, FABB_RISC_IMPIANTO_ETAR, FABB_RISC_IMPIANTO_ETAD, 
 FABB_RISC_IMPIANTO_ETAE, FABB_RISC_IMPIANTO_ETAG)
AS 
select RAWTOHEX(substr(id_certificatore,1,3)||ANNO||PROGR_CERTIFICATO||ID_CERTIFICATORE),
ID_CERTIFICATORE,PROGR_CERTIFICATO,ANNO,FABB_RISC_INVOLUCRO_EXTRA_FLUS,FABB_RISC_INVOLUCRO_TRASMISSIO,
FABB_RISC_INVOLUCRO_VENTILAZIO,FABB_RISC_INVOLUCRO_APPORTI_SO,FABB_RISC_INVOLUCRO_APPORTI_IN,FABB_RISC_INVOLUCRO_APPORTI_LA,
FABB_RISC_INVOLUCRO_QHND,FABB_RISC_INVOLUCRO_QLR,FABB_RISC_INVOLUCRO_QHIMP,FABB_RISC_IMPIANTO_ETAR,FABB_RISC_IMPIANTO_ETAD,
FABB_RISC_IMPIANTO_ETAE,FABB_RISC_IMPIANTO_ETAG from SICEE_T_DATI_XML_ED_REALE_2015;


CREATE OR REPLACE FORCE VIEW V_T_EXPORT_BO
(id_certificato, ANNO, ID_CERTIFICATORE, PROGR_CERTIFICATO, FK_STATO, 
 DT_INIZIO, DT_UPLOAD, DESC_PROV, ID_PROV, DESC_COMUNE, 
 ID_COMUNE, DESC_INDIRIZZO, NUM_CIVICO, SEZIONE, FOGLIO, 
 PARTICELLA, SUBALTERNO, GRADI_GIORNO, PIANO, NUM_PIANI_COMPLESSIVI, 
 FK_DEST_USO, FK_CARATT_EDIFICIO, DESC_TIPO_EDIFICIO, ANNO_COSTRUZIONE, ANNO_ULT_RIST, 
 VOL_LORDO_RISCALDATO, SUP_DISPERDENTE_TOT, SU, V_SU, FATTORE_FORMA, 
 TRASM_OPACHE, TRASM_TRASP, FK_TIPO_IMPIANTO, FK_COMBUSTIBILE_RISC, FK_COMBUSTIBILE_ACS, 
 FK_CLASSE, FK_CLASSE_192_05, DOM_RISC_QH, DOM_RISC_QHTO, DOM_ACS_QHW, 
 DOM_ACS_QHWTO, FLG_FABB_ACS, EN_ACS_RINNO, DOM_ACS_QHW_SU, REND_IMP_ETAG, 
 REND_ACS_ETAGACS, VALORE_PREST_PDC, IND_RISC_EPI, IND_RISC_EPITO, FLG_FABB_MAX_INDICE, 
 FABB_ACS, IND_GLOB_EPLORDO, IND_GLOB_EPLORDO_TO, FK_MOTIVO, METODOLOGIA_CALCOLO, 
 SW_UTILIZZATO, PRESTAZIONE_ENE, NUM_APPARTAMENTI, UI_SERVITE, POT_RISCALDAMENTO, 
 FK_CLASSE_EFF_RISC, GEN_ANNO_RISC, FLG_CONT_RIP, REND_GENER, REND_REGOL, 
 REND_EMISS, REND_DISTRIB, FLG_OLD, FLG_EDIF_E0, EPGL_NREN_GLOBALE, 
 EPGL_REN_GLOBALE, EMISSIONI_CO2, SUP_RAFFRESCATA, SUP_RISCALDATA, VOL_LORDO_RAFFRESCATO, 
 EPH, ASOL_ASUP, YIE, V_SU_RAFF, V_SU_RISC, 
 S_V_RAFF, S_V_RISC)
AS 
select RAWTOHEX(substr(id_certificatore,1,3)||ANNO||PROGR_CERTIFICATO||ID_CERTIFICATORE),
ANNO,ID_CERTIFICATORE,PROGR_CERTIFICATO,FK_STATO,DT_INIZIO,DT_UPLOAD,DESC_PROV,
ID_PROV,DESC_COMUNE,ID_COMUNE,DESC_INDIRIZZO,NUM_CIVICO,SEZIONE,FOGLIO,PARTICELLA,SUBALTERNO,
GRADI_GIORNO,PIANO,NUM_PIANI_COMPLESSIVI,FK_DEST_USO,FK_CARATT_EDIFICIO,DESC_TIPO_EDIFICIO,ANNO_COSTRUZIONE,
ANNO_ULT_RIST,VOL_LORDO_RISCALDATO,SUP_DISPERDENTE_TOT,SU,V_SU,FATTORE_FORMA,TRASM_OPACHE,TRASM_TRASP,
FK_TIPO_IMPIANTO,FK_COMBUSTIBILE_RISC,FK_COMBUSTIBILE_ACS,FK_CLASSE,FK_CLASSE_192_05,DOM_RISC_QH,DOM_RISC_QHTO,
DOM_ACS_QHW,DOM_ACS_QHWTO,FLG_FABB_ACS,EN_ACS_RINNO,DOM_ACS_QHW_SU,REND_IMP_ETAG,REND_ACS_ETAGACS,
VALORE_PREST_PDC,IND_RISC_EPI,IND_RISC_EPITO,FLG_FABB_MAX_INDICE,FABB_ACS,IND_GLOB_EPLORDO,IND_GLOB_EPLORDO_TO,
FK_MOTIVO,METODOLOGIA_CALCOLO,SW_UTILIZZATO,PRESTAZIONE_ENE,NUM_APPARTAMENTI,UI_SERVITE,POT_RISCALDAMENTO,
FK_CLASSE_EFF_RISC,GEN_ANNO_RISC,FLG_CONT_RIP,REND_GENER,REND_REGOL,REND_EMISS,REND_DISTRIB,FLG_OLD,
FLG_EDIF_E0,EPGL_NREN_GLOBALE,EPGL_REN_GLOBALE,EMISSIONI_CO2,SUP_RAFFRESCATA,SUP_RISCALDATA,VOL_LORDO_RAFFRESCATO,
EPH,ASOL_ASUP,YIE,V_SU_RAFF,V_SU_RISC,S_V_RAFF,S_V_RISC from SICEE_T_EXPORT_BO;




GRANT SELECT ON V_T_IMPORT_DATI_2015 TO SICEE_RW;
GRANT SELECT ON V_T_IMPORT_DATI_LOG_2015 TO SICEE_RW;
GRANT SELECT ON V_T_IMPDATI_XML_2015 TO SICEE_RW;
GRANT SELECT ON V_T_DATI_XML_2015 TO SICEE_RW;
GRANT SELECT ON V_T_DATI_XML_ED_RIF_2015 TO SICEE_RW;
GRANT SELECT ON V_T_DATI_XML_ED_REALE_2015 TO SICEE_RW;
GRANT SELECT ON V_T_EXPORT_BO TO SICEE_RW;


GRANT SELECT ON V_T_IMPORT_DATI_2015 TO SICEE_RO;
GRANT SELECT ON V_T_IMPORT_DATI_LOG_2015 TO SICEE_RO;
GRANT SELECT ON V_T_IMPDATI_XML_2015 TO SICEE_RO;
GRANT SELECT ON V_T_DATI_XML_2015 TO SICEE_RO;
GRANT SELECT ON V_T_DATI_XML_ED_RIF_2015 TO SICEE_RO;
GRANT SELECT ON V_T_DATI_XML_ED_REALE_2015 TO SICEE_RO;
GRANT SELECT ON V_T_EXPORT_BO TO SICEE_RO;



-----------------------------------------------------------------------------
--
--   Vista modificata richiesta da Actis il 28/05/2018  SVI + TST
--
-----------------------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW OD_SICEE_APE_INVIATI (INVIATI, DATA_INVIO) AS 
select count(*) inviati, TO_DATE (TO_CHAR (c.dt_upload, 'YYYY-MON-DD HH24:MI:SS'),'YYYY-MON-DD HH24:MI:SS')  data_invio
from SICEE_T_CERTIFICATO c 
where c.dt_upload is not null
group by TO_DATE (TO_CHAR (c.dt_upload,'YYYY-MON-DD HH24:MI:SS'),'YYYY-MON-DD HH24:MI:SS')
order by TO_DATE (TO_CHAR (c.dt_upload, 'YYYY-MON-DD HH24:MI:SS'), 'YYYY-MON-DD HH24:MI:SS')  desc;

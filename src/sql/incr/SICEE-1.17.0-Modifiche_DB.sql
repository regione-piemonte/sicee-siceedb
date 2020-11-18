/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

-- RILASCIO DI LUGLIO che slitterà a settembre ..... forse ottobre
-----------------------------------------------------------------------------------------
-- 18/05/2017 - Modifiche (richieste via mail da Todaro) ed eseguite in svi 
-- eseguite in test il 4/9/2017 - v. mail Todaro
-----------------------------------------------------------------------------------------

CREATE TABLE SICEE_T_ACTA (
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       VOLUME               VARCHAR2(10) NULL,
       ID_DOC_ACTA          VARCHAR2(500) NULL,
       ID_CLASSIFICAZIONE_ACTA VARCHAR2(500) NULL,
       TIPO_DOCUMENTO_ACTA  VARCHAR2(100) NULL,
       FAILED_STEP_ACTA     VARCHAR2(100) NULL,
       TIMESTAMP_ARCHIVIAZIONE DATE NULL,
       NUMERO_PROTOCOLLO    VARCHAR2(20) NULL,
       MAIL_INVIATA         VARCHAR2(70) NULL,
       TIMESTAMP_PROTOCOLLO DATE NULL,
       ID_PROTOCOLLO_ACTA  VARCHAR2(500)
);

ALTER TABLE SICEE_T_ACTA
       ADD CONSTRAINT PK_SICEE_T_ACTA PRIMARY KEY (
              ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO) ;

GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_ACTA TO SICEE_RW; 



CREATE TABLE SICEE_T_ACTA_LOG (
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       TIMESTAMP_LOG        DATE NOT NULL,
       DESC_LOG             VARCHAR2(500) NULL
);

ALTER TABLE SICEE_T_ACTA_LOG
       ADD CONSTRAINT PK_SICEE_T_ACTA_LOG PRIMARY KEY (
              ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, 
              TIMESTAMP_LOG) ;

GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_ACTA_LOG TO SICEE_RW; 


-- 09/06/2017 - modificata in seguito alla mail di Todaro
-- eseguite in test il 4/9/2017 - v. mail Todaro
CREATE TABLE SICEE_T_PARAMETRI_ACTA (
       ID_PARAMETRI_ACTA    INTEGER NOT NULL,
       CODICE               VARCHAR2(50) NULL,
       VALORE               VARCHAR2(500) NULL
);

ALTER TABLE SICEE_T_PARAMETRI_ACTA
       ADD CONSTRAINT PK_SICEE_T_PARAMETRI_ACTA PRIMARY KEY (
              ID_PARAMETRI_ACTA) ;

GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_PARAMETRI_ACTA TO SICEE_RW; 
			  
			  
			  
			  
ALTER TABLE SICEE_T_ACTA
       ADD CONSTRAINT FK_SICEE_T_CERTIFICATO_51
              FOREIGN KEY (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO)
                             REFERENCES SICEE_T_CERTIFICATO ;


ALTER TABLE SICEE_T_ACTA_LOG
       ADD CONSTRAINT FK_SICEE_T_ACTA_01
              FOREIGN KEY (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO)
                             REFERENCES SICEE_T_ACTA ;
                             
                             
                             
                             
                             
ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_REALE_2015
MODIFY(FABB_RISC_INVOLUCRO_EXTRA_FLUS NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_REALE_2015
MODIFY(FABB_RISC_INVOLUCRO_TRASMISSIO NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_REALE_2015
MODIFY(FABB_RISC_INVOLUCRO_VENTILAZIO NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_REALE_2015
MODIFY(FABB_RISC_INVOLUCRO_APPORTI_SO NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_REALE_2015
MODIFY(FABB_RISC_INVOLUCRO_APPORTI_IN NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_REALE_2015
MODIFY(FABB_RISC_INVOLUCRO_APPORTI_LA NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_REALE_2015
MODIFY(FABB_RISC_INVOLUCRO_QHND NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_REALE_2015
MODIFY(FABB_RISC_INVOLUCRO_QLR NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_REALE_2015
MODIFY(FABB_RISC_INVOLUCRO_QHIMP NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_REALE_2015
MODIFY(FABB_RISC_IMPIANTO_ETAR NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_REALE_2015
MODIFY(FABB_RISC_IMPIANTO_ETAD NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_REALE_2015
MODIFY(FABB_RISC_IMPIANTO_ETAE NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_REALE_2015
MODIFY(FABB_RISC_IMPIANTO_ETAG NUMBER);




ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(QH NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(QC NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(EPHND NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(EPCND NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(EPH NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(EPC NUMBER);


ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(EPW NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(EPV NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(EPL NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(EPGLNR NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(EPGLR NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(EPGLTOT NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(ETAH NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(ETAC NUMBER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_ED_RIF_2015
MODIFY(ETAW NUMBER);

                             

-----------------------------------------------------------------------------------------------------
-- Modifiche effettuate il 21/08/2017 richieste da Todaro (mail 28/07/2017) in svi, tst, coll e prod
-- e tenute come promemoria. Per la messa im esercizio è stata lasciata solo la ALTER TABLE.
--UPDATE SICEE_T_RACCOMAND_2015 SET FLG_RISTRUTTURAZIONE = 'S' where FLG_RISTRUTTURAZIONE = '1';
--UPDATE SICEE_T_RACCOMAND_2015 SET FLG_RISTRUTTURAZIONE = 'N' where FLG_RISTRUTTURAZIONE = '0';
--commit;
-----------------------------------------------------------------------------------------------------

-- eseguite in test il 4/9/2017 - v. mail Todaro

ALTER TABLE SICEE_T_RACCOMAND_2015 add CONSTRAINT DOM_S_N_RISTR CHECK (FLG_RISTRUTTURAZIONE IN ('S','N'));






-----------------------------------------------------------------------------------------------------
-- Modifiche effettuate il 22/08/2017 richieste da Todaro/Hubina (mail 22/08/2017) solo in svi (Tod)
-- eseguite in test il 4/9/2017 - v. mail Todaro
-----------------------------------------------------------------------------------------------------
ALTER TABLE SICEE_T_SIAPE ADD FLG_DA_ELABORARE     CHAR(1) DEFAULT 'S' NOT NULL
                                   CONSTRAINT DOM_S_N_ELAB
                                          CHECK (FLG_DA_ELABORARE IN ('S','N'));
                                          
                                          
-----------------------------------------------------------------------------------------------------
-- Modifiche effettuate il 25/08/2017 richieste da Todaro/Actis (mail 25/08/2017) solo in svi (Tod)
-- eseguite in test il 4/9/2017 - v. mail Todaro
-----------------------------------------------------------------------------------------------------
ALTER TABLE SICEE.SICEE_D_MOTIVO_RILASCIO ADD (FLAG_NON_VALIDO_DLGS192_2005 CHAR(1) NULL
     CONSTRAINT DOM_S_N_NON_VAL
         CHECK (FLAG_NON_VALIDO_DLGS192_2005 IN ('S','N')));





-----------------------------------------------------------------------------------------
-- 22/06/2017 - Modifiche (richieste da HUBINA) ed eseguite in svi
-- eseguite in test 5/9/2017 (v. mail Todaro)
-----------------------------------------------------------------------------------------
ALTER TABLE SICEE.SICEE_T_SIAPE
 ADD (DATA_CREAZIONE  DATE);

ALTER TABLE SICEE.SICEE_T_SIAPE
 ADD (XML_SIAPE  CLOB);



CREATE TABLE SICEE_T_SIAPE_LOG (
       ID_SIAPE_LOG         NUMBER NOT NULL,
       FK_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       FK_TIPO_AZIONE       INTEGER NOT NULL,
       FLG_MAIL_INVIATA     CHAR(1) DEFAULT 'N' NULL
                                   CONSTRAINT DOM_S_N155
                                          CHECK (FLG_MAIL_INVIATA IN ('S','N')),
       DATA_OPERAZIONE      DATE NULL,
       CODICE_ESITO         INTEGER NULL,
       MSG_ESITO            VARCHAR2(200) NULL
);

ALTER TABLE SICEE_T_SIAPE_LOG
       ADD CONSTRAINT PK_SICEE_T_SIAPE_LOG PRIMARY KEY (
              ID_SIAPE_LOG)  ;



CREATE TABLE SICEE_T_PARAMETRI_SIAPE (
       ID_PARAMETRI_SIAPE   INTEGER NOT NULL,
       CODICE               VARCHAR2(50) NULL,
       VALORE               VARCHAR2(500) NULL
);

ALTER TABLE SICEE_T_PARAMETRI_SIAPE
       ADD  CONSTRAINT PK_SICEE_T_PARAMETRI_SIAPE PRIMARY KEY (
              ID_PARAMETRI_SIAPE) ;


ALTER TABLE SICEE_T_SIAPE_LOG
       ADD  CONSTRAINT FK_SICEE_T_SIAPE_01
              FOREIGN KEY (FK_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, 
              FK_TIPO_AZIONE)
                             REFERENCES SICEE_T_SIAPE ;
                             
GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_SIAPE_LOG TO SICEE_RW; 
GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_PARAMETRI_SIAPE TO SICEE_RW; 


CREATE SEQUENCE SEQ_SICEE_T_SIAPE_LOG
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;

GRANT ALTER, SELECT ON SEQ_SICEE_T_SIAPE_LOG TO SICEE_RW;




--------------------------------------------------------------------
--
--Richieste da Actis per Open Data (invito 04/10/2017)
--------------------------------------------------------------------
RENAME OD_SICEE_ANNOCOSTR_CLASSE  TO OD_SICEE_ACE_ANNOCOSTR_CLASSE;

CREATE OR REPLACE FORCE VIEW OD_SICEE_ACE_ANNOCOSTR_CLASSE
(KEY_CLASSE, FINO_AL_1900, DAL_1901_AL_1920, DAL_1921_AL_1945, DAL_1946_AL_1960, 
 DAL_1961_AL_1975, DAL_1976_AL_1990, DAL_1991_AL_2005, DOPO_2005, DATA_AGGIORNAMENTO_RECORD)
AS 
select DESCR AS KEY_CLASSE
    , SUM(TOT_1900) AS FINO_AL_1900
    , SUM(TOT_1920) AS DAL_1901_AL_1920
    , SUM(TOT_1945) AS DAL_1921_AL_1945
    , SUM(TOT_1960) AS DAL_1946_AL_1960
    , SUM(TOT_1975) AS DAL_1961_AL_1975
    , SUM(TOT_1990) AS DAL_1976_AL_1990
    , SUM(TOT_2005) AS DAL_1991_AL_2005
    , SUM(TOT_2006) AS DOPO_2005
    ,TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
 from
(
select id_classe,descr, anno_costruzione
, case
    when anno_costruzione <= 1900 then 1
    else 0
  end tot_1900
, case
    when anno_costruzione between 1901 and 1920 then 1
    else 0
  end tot_1920
, case
    when anno_costruzione between 1921 and 1945 then 1
    else 0
  end tot_1945
, case
    when anno_costruzione between 1946 and 1960 then 1
    else 0
  end tot_1960
, case
    when anno_costruzione between 1961 and 1975 then 1
    else 0
  end tot_1975
, case
    when anno_costruzione between 1976 and 1990 then 1
    else 0
  end tot_1990
, case
    when anno_costruzione between 1991 and 2005 then 1
    else 0
  end tot_2005
, case
    when anno_costruzione > 2005 then 1
    else 0
  end tot_2006
from sicee_d_classe_energetica,sicee_t_dati_generali,sicee_t_classe_energetica,sicee_t_certificato
where sicee_t_certificato.ID_CERTIFICATORE = sicee_t_classe_energetica.ID_CERTIFICATORE
  and sicee_t_certificato.PROGR_CERTIFICATO = sicee_t_classe_energetica.PROGR_CERTIFICATO
  and sicee_t_certificato.ANNO = sicee_t_classe_energetica.ANNO
  and sicee_t_certificato.ID_CERTIFICATORE = sicee_t_dati_generali.ID_CERTIFICATORE
  and sicee_t_certificato.PROGR_CERTIFICATO = sicee_t_dati_generali.PROGR_CERTIFICATO
  and sicee_t_certificato.ANNO = sicee_t_dati_generali.ANNO
  and sicee_t_classe_energetica.FK_CLASSE = sicee_d_classe_energetica.ID_CLASSE
  and sicee_t_certificato.fk_stato = 3
  and sicee_t_certificato.flg_old='S'
  and to_number(sicee_t_certificato.id_certificatore) > 100
  AND TO_CHAR(SICEE_T_CERTIFICATO.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
)
group by  DESCR
order by 1;




CREATE OR REPLACE FORCE VIEW OD_SICEE_ACE_ANNOCOSTR_VOLUME
(KEY_ANNO_COSTRUZIONE, VOLUMETRIA_CERTIFICATA, DATA_AGGIORNAMENTO_RECORD)
AS 
select case when anno_costruzione <= 1900  then 'FASCIA 1 - fino al 1900'
            when anno_costruzione between 1901 and 1920 then 'FASCIA 2 - 1901-1920'
            when anno_costruzione between 1921 and 1945 then 'FASCIA 3 - 1921-1945'
            when anno_costruzione between 1946 and 1960 then 'FASCIA 4 - 1946-1960'
            when anno_costruzione between 1961 and 1975 then 'FASCIA 5 - 1961-1975'
            when anno_costruzione between 1976 and 1990 then 'FASCIA 6 - 1976-1990'
            when anno_costruzione between 1991 and 2005 then 'FASCIA 7 - 1991-2005'
             when anno_costruzione between 2006 and 2016 then 'FASCIA 8 - 2006-2016'
            when anno_costruzione >= 2017 then 'FASCIA 9 - dopo il 2017'
        else 'altri'
end KEY_ANNO_COSTRUZIONE
, sum(VOL_LORDO_RISCALDATO) VOLUMETRIA_CERTIFICATA
, TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
FROM sicee_t_dati_generali, sicee_t_certificato
where sicee_t_certificato.fk_stato=3 and sicee_t_certificato.id_certificatore > 100
    and sicee_t_certificato.id_certificatore=sicee_t_dati_generali.ID_CERTIFICATORE
    and sicee_t_certificato.progr_certificato=sicee_t_dati_generali.progr_certificato
    and sicee_t_certificato.anno=sicee_t_dati_generali.anno
    AND TO_CHAR(SICEE_T_CERTIFICATO.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
    and sicee_t_certificato.flg_old='S'
group by case when anno_costruzione <= 1900  then 'FASCIA 1 - fino al 1900'
            when anno_costruzione between 1901 and 1920 then 'FASCIA 2 - 1901-1920'
            when anno_costruzione between 1921 and 1945 then 'FASCIA 3 - 1921-1945'
            when anno_costruzione between 1946 and 1960 then 'FASCIA 4 - 1946-1960'
            when anno_costruzione between 1961 and 1975 then 'FASCIA 5 - 1961-1975'
            when anno_costruzione between 1976 and 1990 then 'FASCIA 6 - 1976-1990'
            when anno_costruzione between 1991 and 2005 then 'FASCIA 7 - 1991-2005'
            when anno_costruzione between 2006 and 2016 then 'FASCIA 8 - 2006-2016'
            when anno_costruzione >= 2017 then 'FASCIA 9 - dopo il 2017'
        else 'altri'
end
order by 1;



CREATE OR REPLACE FORCE VIEW OD_SICEE_APE_ANNOCOSTR_VOLUME
(KEY_ANNO_COSTRUZIONE, VOLUMETRIA_CERTIFICATA, DATA_AGGIORNAMENTO_RECORD)
AS 
select case when anno_costruzione <= 1900  then 'FASCIA 1 - fino al 1900'
            when anno_costruzione between 1901 and 1920 then 'FASCIA 2 - 1901-1920'
            when anno_costruzione between 1921 and 1945 then 'FASCIA 3 - 1921-1945'
            when anno_costruzione between 1946 and 1960 then 'FASCIA 4 - 1946-1960'
            when anno_costruzione between 1961 and 1975 then 'FASCIA 5 - 1961-1975'
            when anno_costruzione between 1976 and 1990 then 'FASCIA 6 - 1976-1990'
            when anno_costruzione between 1991 and 2005 then 'FASCIA 7 - 1991-2005'
             when anno_costruzione between 2006 and 2016 then 'FASCIA 8 - 2006-2016'
            when anno_costruzione >= 2017 then 'FASCIA 9 - dopo il 2017'
        else 'altri'
end KEY_ANNO_COSTRUZIONE
, sum(VOL_LORDO_RISCALDATO) VOLUMETRIA_CERTIFICATA
, TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
FROM sicee_t_dati_generali, sicee_t_certificato
where sicee_t_certificato.fk_stato=3 and sicee_t_certificato.id_certificatore > 100
    and sicee_t_certificato.id_certificatore=sicee_t_dati_generali.ID_CERTIFICATORE
    and sicee_t_certificato.progr_certificato=sicee_t_dati_generali.progr_certificato
    and sicee_t_certificato.anno=sicee_t_dati_generali.anno
    AND TO_CHAR(SICEE_T_CERTIFICATO.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
    and sicee_t_certificato.flg_old='N'
group by case when anno_costruzione <= 1900  then 'FASCIA 1 - fino al 1900'
            when anno_costruzione between 1901 and 1920 then 'FASCIA 2 - 1901-1920'
            when anno_costruzione between 1921 and 1945 then 'FASCIA 3 - 1921-1945'
            when anno_costruzione between 1946 and 1960 then 'FASCIA 4 - 1946-1960'
            when anno_costruzione between 1961 and 1975 then 'FASCIA 5 - 1961-1975'
            when anno_costruzione between 1976 and 1990 then 'FASCIA 6 - 1976-1990'
            when anno_costruzione between 1991 and 2005 then 'FASCIA 7 - 1991-2005'
            when anno_costruzione between 2006 and 2016 then 'FASCIA 8 - 2006-2016'
            when anno_costruzione >= 2017 then 'FASCIA 9 - dopo il 2017'
        else 'altri'
end
order by 1;

GRANT SELECT ON OD_SICEE_APE_ANNOCOSTR_VOLUME TO SICEE_RO;
GRANT SELECT ON OD_SICEE_APE_ANNOCOSTR_VOLUME TO SICEE_RW;



CREATE OR REPLACE FORCE VIEW OD_SICEE_APE_COMBUSTIBILE
(KEY_TIPO_COMBUSTIBILE, NUMERO_APE, DATA_AGGIORNAMENTO_RECORD)
AS 
select  TIPO_COMBUSTIBILE AS KEY_TIPO_COMBUSTIBILE, NUMERO_APE
, TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
from (
select  comb.ID_COMBUSTIBILE id_comb,  comb.DESCR TIPO_COMBUSTIBILE , count(*) NUMERO_APE
from    SICEE_T_CERTIFICATO c, SICEE_T_DET_IMP_2015 imp, sicee_d_combustibile comb
where   c.fk_stato=3 and
        c.id_certificatore>100 and
        c.progr_certificato = imp.PROGR_CERTIFICATO and
        c.anno = imp.anno and
        c.id_CERTIFICATORE = imp.id_CERTIFICATORE and
        imp.FK_COMBUSTIBILE = comb.ID_COMBUSTIBILE AND
        imp.fk_serv_ener=1  AND--Solo riscaldamento
        TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
group by comb.ID_COMBUSTIBILE , comb.DESCR )
order by 1;

GRANT SELECT ON OD_SICEE_APE_COMBUSTIBILE TO SICEE_RO;
GRANT SELECT ON OD_SICEE_APE_COMBUSTIBILE TO SICEE_RW;


CREATE OR REPLACE FORCE VIEW OD_SICEE_APE_COMUNE_CLASSE
(KEY_ISTAT_COMUNE, DESC_COMUNE, CLASSE_A4, CLASSE_A3, CLASSE_A2, 
 CLASSE_A1, CLASSE_B, CLASSE_C, CLASSE_D, CLASSE_E, 
 CLASSE_F, CLASSE_G, DATA_AGGIORNAMENTO_RECORD)
AS 
SELECT ISTAT KEY_ISTAT_COMUNE
      ,DESC_COMUNE
      ,SUM(TOT_A4) CLASSE_A4
      ,SUM(TOT_A3) CLASSE_A3
      ,SUM(TOT_A2) CLASSE_A2
      ,SUM(TOT_A1) CLASSE_A1
      ,SUM(TOT_B) CLASSE_B
      ,SUM(TOT_C) CLASSE_C
      ,SUM(TOT_D) CLASSE_D
      ,SUM(TOT_E) CLASSE_E
      ,SUM(TOT_F) CLASSE_F
      ,SUM(TOT_G) CLASSE_G
      ,TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
  FROM (SELECT comuni.istat
              ,comuni.desc_comune
              ,CL.DESCR
              ,DECODE(DESCR, 'A4', 1, 0) TOT_A4
              ,DECODE(DESCR, 'A3', 1, 0) TOT_A3
              ,DECODE(DESCR, 'A2', 1, 0) TOT_A2
              ,DECODE(DESCR, 'A1', 1, 0) TOT_A1
              ,DECODE(DESCR, 'B', 1, 0) TOT_B
              ,DECODE(DESCR, 'C', 1, 0) TOT_C
              ,DECODE(DESCR, 'D', 1, 0) TOT_D
              ,DECODE(DESCR, 'E', 1, 0) TOT_E
              ,DECODE(DESCR, 'F', 1, 0) TOT_F
              ,DECODE(DESCR, 'G', 1, 0) TOT_G
          FROM SICEE_T_CERTIFICATO       C
              ,sicee_t_dati_ener_2015 CE
              ,SICEE_D_CLASSE_ENERGETICA CL
              ,COMUNI
         WHERE c.fk_stato = 3
           AND to_number(c.id_certificatore) > 100
           AND c.id_comune(+) = comuni.istat
           AND SUBSTR(COMUNI.ISTAT, 1, 3) IN
               ('001', '002', '003', '004', '005', '006', '096', '103')
           AND c.progr_certificato = ce.PROGR_CERTIFICATO
           AND c.anno = ce.anno
           AND c.ID_CERTIFICATORE = ce.ID_CERTIFICATORE
           AND cl.ID_CLASSE = ce.fk_classe_energetica
           AND TO_CHAR(C.DT_UPLOAD, 'YYYYMMDD') <=
               TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)), 'YYYYMMDD'))
 GROUP BY istat, desc_comune
 ORDER BY 1;


GRANT SELECT ON OD_SICEE_APE_COMUNE_CLASSE TO SICEE_RO;
GRANT SELECT ON OD_SICEE_APE_COMUNE_CLASSE TO SICEE_RW;



CREATE OR REPLACE FORCE VIEW OD_SICEE_APE_DEST_USO
(KEY_DESTINAZIONE_USO, NUMERO_APE, DATA_AGGIORNAMENTO_RECORD)
AS 
select DESTINAZIONE_USO AS KEY_DESTINAZIONE_USO, NUMERO_APE
, TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
from (
select  du.id_dest_uso_2015 id_dest, du.sigla DESTINAZIONE_USO, count(*) NUMERO_APE
from    SICEE_T_CERTIFICATO c, SICEE_T_dati_generali dg, sicee_d_dest_uso_2015 du
where   c.fk_stato=3 and
        c.id_certificatore>100 and
        TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD') and
        c.progr_certificato = dg.PROGR_CERTIFICATO and
        c.anno = dg.anno and
        c.id_CERTIFICATORE = dg.id_CERTIFICATORE and
        du.id_dest_uso_2015 = dg.fk_dest_uso_2015
group by du.id_dest_uso_2015, du.sigla )
order by  1;

GRANT SELECT ON OD_SICEE_APE_DEST_USO TO SICEE_RO;
GRANT SELECT ON OD_SICEE_APE_DEST_USO TO SICEE_RW;



CREATE OR REPLACE FORCE VIEW OD_SICEE_ACE_MOTIVO_RIL
(KEY_MOTIVO_RILASCIO, NUMERO_ACE, DATA_AGGIORNAMENTO_RECORD)
AS 
select motivazione_rilascio AS KEY_MOTIVO_RILASCIO, NUMERO_ACE
, TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
from (
select  mr.ID_MOTIVO motivo, mr.descr MOTIVAZIONE_RILASCIO,count(*) NUMERO_ACE
from    SICEE_T_CERTIFICATO c, SICEE_T_ALTRE_INFO ai, sicee_d_motivo_rilascio mr
where   c.fk_stato=3 and
        c.id_certificatore>100 and
        c.progr_certificato = ai.PROGR_CERTIFICATO and
        c.anno = ai.anno and
        c.id_CERTIFICATORE = ai.id_CERTIFICATORE and
        mr.ID_MOTIVO = ai.FK_MOTIVO  AND
      TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
      and c.flg_old='S'
group by mr.ID_MOTIVO, mr.descr )
order by 1;



CREATE OR REPLACE FORCE VIEW OD_SICEE_APE_MOTIVO_RIL
(KEY_MOTIVO_RILASCIO, KEY_MOTIVO_RILASCIO2, NUMERO_APE, DATA_AGGIORNAMENTO_RECORD)
AS 
select motivazione_rilascio AS KEY_MOTIVO_RILASCIO, MOTIVAZIONE_RILASCIO2 AS KEY_MOTIVO_RILASCIO2, NUMERO_APE
, TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
from (
select  mr.ID_MOTIVO motivo, mr.descr MOTIVAZIONE_RILASCIO,mr2.ID_MOTIVO motivo2, mr2.descr MOTIVAZIONE_RILASCIO2,count(*) NUMERO_APE
from    SICEE_T_CERTIFICATO c, SICEE_T_ALTRE_INFO ai, sicee_d_motivo_rilascio mr, sicee_d_motivo_rilascio mr2
where   c.fk_stato=3 and
        c.id_certificatore>100 and
        c.progr_certificato = ai.PROGR_CERTIFICATO and
        c.anno = ai.anno and
        c.id_CERTIFICATORE = ai.id_CERTIFICATORE and
        mr.ID_MOTIVO = ai.FK_MOTIVO  AND
        ai.altro_servizi_energia=mr2.id_motivo (+) and
      TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
      and c.flg_old='N'
group by mr.ID_MOTIVO, mr.descr, mr2.ID_MOTIVO, mr2.descr )
order by 1;

GRANT SELECT ON OD_SICEE_APE_MOTIVO_RIL TO SICEE_RO;
GRANT SELECT ON OD_SICEE_APE_MOTIVO_RIL TO SICEE_RW;



CREATE OR REPLACE FORCE VIEW OD_SICEE_APE_ANNOCOSTR_CLASSE
(KEY_CLASSE, FINO_AL_1900, DAL_1901_AL_1920, DAL_1921_AL_1945, DAL_1946_AL_1960, 
 DAL_1961_AL_1975, DAL_1976_AL_1990, DAL_1991_AL_2005, DAL_2006_AL_2016, DOPO_2016, 
 DATA_AGGIORNAMENTO_RECORD)
AS 
select DESCR AS KEY_CLASSE
    , SUM(TOT_1900) AS FINO_AL_1900
    , SUM(TOT_1920) AS DAL_1901_AL_1920
    , SUM(TOT_1945) AS DAL_1921_AL_1945
    , SUM(TOT_1960) AS DAL_1946_AL_1960
    , SUM(TOT_1975) AS DAL_1961_AL_1975
    , SUM(TOT_1990) AS DAL_1976_AL_1990
    , SUM(TOT_2005) AS DAL_1991_AL_2005
    , SUM(TOT_2016) AS DAL_2006_AL_2016
    , SUM(TOT_2017) AS DOPO_2016
    ,TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
 from
(
select id_classe,descr, anno_costruzione
, case
    when anno_costruzione <= 1900 then 1
    else 0
  end tot_1900
, case
    when anno_costruzione between 1901 and 1920 then 1
    else 0
  end tot_1920
, case
    when anno_costruzione between 1921 and 1945 then 1
    else 0
  end tot_1945
, case
    when anno_costruzione between 1946 and 1960 then 1
    else 0
  end tot_1960
, case
    when anno_costruzione between 1961 and 1975 then 1
    else 0
  end tot_1975
, case
    when anno_costruzione between 1976 and 1990 then 1
    else 0
  end tot_1990
, case
    when anno_costruzione between 1991 and 2005 then 1
    else 0
  end tot_2005
, case
    when anno_costruzione between 2006 and 2016 then 1
    else 0
  end tot_2016
, case
    when anno_costruzione > 2016 then 1
    else 0
  end tot_2017
from sicee_d_classe_energetica,sicee_t_dati_generali,sicee_t_dati_ener_2015,sicee_t_certificato
where sicee_t_certificato.ID_CERTIFICATORE = sicee_t_dati_ener_2015.ID_CERTIFICATORE
  and sicee_t_certificato.PROGR_CERTIFICATO = sicee_t_dati_ener_2015.PROGR_CERTIFICATO
  and sicee_t_certificato.ANNO = sicee_t_dati_ener_2015.ANNO
  and sicee_t_certificato.ID_CERTIFICATORE = sicee_t_dati_generali.ID_CERTIFICATORE
  and sicee_t_certificato.PROGR_CERTIFICATO = sicee_t_dati_generali.PROGR_CERTIFICATO
  and sicee_t_certificato.ANNO = sicee_t_dati_generali.ANNO
  and sicee_t_dati_ener_2015.fk_classe_energetica = sicee_d_classe_energetica.ID_CLASSE
  and sicee_t_certificato.fk_stato = 3
  and sicee_t_certificato.flg_old='N'
  and to_number(sicee_t_certificato.id_certificatore) > 100
  AND TO_CHAR(SICEE_T_CERTIFICATO.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
)
group by  DESCR
order by 1;

GRANT SELECT ON OD_SICEE_APE_ANNOCOSTR_CLASSE TO SICEE_RO;
GRANT SELECT ON OD_SICEE_APE_ANNOCOSTR_CLASSE TO SICEE_RW;



CREATE OR REPLACE FORCE VIEW OD_SICEE_APE_INVIATI
(INVIATI, DATA_INVIO)
AS 
select count(*) inviati ,TO_DATE(c.dt_upload, 'DD/MM/YYYY')  data_invio
from SICEE_T_CERTIFICATO c 
where c.dt_upload is not null
group by TO_DATE(c.dt_upload, 'DD/MM/YYYY') 
order by TO_DATE(c.dt_upload, 'DD/MM/YYYY') desc;

GRANT SELECT ON OD_SICEE_APE_INVIATI TO SICEE_RO;
GRANT SELECT ON OD_SICEE_APE_INVIATI TO SICEE_RW;



CREATE OR REPLACE FORCE VIEW OD_SICEE_APE_ED_EN_ZERO
(KEY_ISTAT_COMUNE, DESC_COMUNE, EDIF_E0_NO, EDIF_E0_SI, DATA_AGGIORNAMENTO_RECORD)
AS 
SELECT ISTAT KEY_ISTAT_COMUNE
      ,DESC_COMUNE
      ,SUM(N) EDIF_E0_NO
      ,SUM(S) EDIF_E0_SI
      ,TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
  FROM (SELECT comuni.istat
              ,comuni.desc_comune
              ,CE.FLG_EDIF_E0
              ,DECODE(FLG_EDIF_E0, 'N', 1, 0) N
              ,DECODE(FLG_EDIF_E0, 'S', 1, 0) S
          FROM SICEE_T_CERTIFICATO       C
              ,sicee_t_dati_ener_2015 CE
              ,COMUNI
         WHERE c.fk_stato = 3
           AND to_number(c.id_certificatore) > 100
           AND c.id_comune(+) = comuni.istat
           AND SUBSTR(COMUNI.ISTAT, 1, 3) IN
               ('001', '002', '003', '004', '005', '006', '096', '103')
           AND c.progr_certificato = ce.PROGR_CERTIFICATO
           AND c.anno = ce.anno
           AND c.ID_CERTIFICATORE = ce.ID_CERTIFICATORE
           AND TO_CHAR(C.DT_UPLOAD, 'YYYYMMDD') <=
               TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)), 'YYYYMMDD'))
 GROUP BY istat, desc_comune
 ORDER BY 1;

GRANT SELECT ON OD_SICEE_APE_ED_EN_ZERO TO SICEE_RO;
GRANT SELECT ON OD_SICEE_APE_ED_EN_ZERO TO SICEE_RW;



CREATE OR REPLACE FORCE VIEW V_DATI_GENERALI
(NUM_CERTIFICATORE, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, DESC_PROV, 
 DESC_COMUNE, DESC_INDIRIZZO, NUM_CIVICO, CAP, PIANO, 
 INTERNO, COORD_N, COORD_E, CODICE_COMUNE_CATASTALE, RIF_CATASTO, 
 SEZIONE, FOGLIO, PARTICELLA, SUBALTERNO, DATA_INVIO_FILE, 
 DT_SCADENZA, FK_DICHIARAZIONE, COD_FISC_COCERTIFICATORE, DESCR_DESTINAZIONE_USO, FLG_RESIDENZIALE, 
 FLG_ATTIVO, DESTINAZIONE_USO, FLG_USO_PUBBLICO, ANNO_COSTRUZIONE, ANNO_ULT_RIST, 
 VOL_LORDO_RISCALDATO, SUP_RISCALDATA, SUP_RAFFRESCATA, SUP_DISPERDENTE, VOL_LORDO_RAFFRESCATO, 
 ZONA_CLIMATICA, NR_UM, OGGETTO_APE, DESCR_TIPO_RISTRUTT, DESCR_TIPOLOGIA_EDILIZIA, 
 DESCR_PROPRIETA_EDIF, DESCR_TIPOLOGIA_COSTRUTT, MOTIVAZIONE_RILASCIO, DICH_INPIPENDENZA, INFO_MIGL_PREST_ENERG, 
 FLG_SOPRALLUOGO, DATA_SOPRALLUOGO, NOTE_SOPRALLUOGO, NOTE_SEGNALAZIONI, FLG_SW1, 
 FLG_SW2, MOTIVO_ALTRO)
AS 
select distinct
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
    to_number (c.id_certificatore) > 100
 order by c.id_certificatore,c.progr_certificato,c.anno;

GRANT SELECT ON V_DATI_GENERALI TO SICEE_RO;
GRANT SELECT ON V_DATI_GENERALI TO SICEE_RW;



CREATE OR REPLACE FORCE VIEW V_DATIGEN_CONSUMI
(NUM_CERTIFICATORE, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, DESC_PROV, 
 DESC_COMUNE, DESC_INDIRIZZO, NUM_CIVICO, CAP, PIANO, 
 INTERNO, COORD_N, COORD_E, CODICE_COMUNE_CATASTALE, RIF_CATASTO, 
 SEZIONE, FOGLIO, PARTICELLA, SUBALTERNO, DATA_INVIO_FILE, 
 DT_SCADENZA, FK_DICHIARAZIONE, COD_FISC_COCERTIFICATORE, DESCR_DESTINAZIONE_USO, FLG_RESIDENZIALE, 
 FLG_ATTIVO, DESTINAZIONE_USO, FLG_USO_PUBBLICO, ANNO_COSTRUZIONE, ANNO_ULT_RIST, 
 VOL_LORDO_RISCALDATO, SUP_RISCALDATA, SUP_RAFFRESCATA, SUP_DISPERDENTE, VOL_LORDO_RAFFRESCATO, 
 ZONA_CLIMATICA, NR_UM, OGGETTO_APE, DESCR_TIPO_RISTRUTT, DESCR_TIPOLOGIA_EDILIZIA, 
 DESCR_PROPRIETA_EDIF, DESCR_TIPOLOGIA_COSTRUTT, MOTIVAZIONE_RILASCIO, DICH_INPIPENDENZA, INFO_MIGL_PREST_ENERG, 
 FLG_SOPRALLUOGO, DATA_SOPRALLUOGO, NOTE_SOPRALLUOGO, NOTE_SEGNALAZIONI, FLG_SW1, 
 FLG_SW2, MOTIVO_ALTRO, ID_QTA_CONSUMI, UNITA_MISURA, TIPO_COMBUSTIBILE, 
 QUANTITA, ALTRO_DESCR_COMB)
AS 
SELECT distinct v_dati_generali.num_certificatore, v_dati_generali.id_certificatore,
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
       );


GRANT SELECT ON V_DATIGEN_CONSUMI TO SICEE_RO;
GRANT SELECT ON V_DATIGEN_CONSUMI TO SICEE_RW;



CREATE OR REPLACE FORCE VIEW V_DATIGEN_ENERGETICI
(NUM_CERTIFICATORE, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, DESC_PROV, 
 DESC_COMUNE, DESC_INDIRIZZO, NUM_CIVICO, CAP, PIANO, 
 INTERNO, COORD_N, COORD_E, CODICE_COMUNE_CATASTALE, RIF_CATASTO, 
 SEZIONE, FOGLIO, PARTICELLA, SUBALTERNO, DATA_INVIO_FILE, 
 DT_SCADENZA, FK_DICHIARAZIONE, COD_FISC_COCERTIFICATORE, DESCR_DESTINAZIONE_USO, FLG_RESIDENZIALE, 
 FLG_ATTIVO, DESTINAZIONE_USO, FLG_USO_PUBBLICO, ANNO_COSTRUZIONE, ANNO_ULT_RIST, 
 VOL_LORDO_RISCALDATO, SUP_RISCALDATA, SUP_RAFFRESCATA, SUP_DISPERDENTE, VOL_LORDO_RAFFRESCATO, 
 ZONA_CLIMATICA, NR_UM, OGGETTO_APE, DESCR_TIPO_RISTRUTT, DESCR_TIPOLOGIA_EDILIZIA, 
 DESCR_PROPRIETA_EDIF, DESCR_TIPOLOGIA_COSTRUTT, MOTIVAZIONE_RILASCIO, DICH_INPIPENDENZA, INFO_MIGL_PREST_ENERG, 
 FLG_SOPRALLUOGO, DATA_SOPRALLUOGO, NOTE_SOPRALLUOGO, NOTE_SEGNALAZIONI, FLG_SW1, 
 FLG_SW2, MOTIVO_ALTRO, CLASSE_ENERGETICA, CE_RACC_TOTALE, EPH, 
 EPH_LIMITE, YIE, ASOL_ASUP, FLG_EDIF_E0, FLG_CLIMAT_INVERNALE, 
 FLG_CLIMAT_ESTIVA, FLG_VENTIL_MECCANICA, FLG_PROD_H2O_SANITARIA, FLG_ILLUMINAZIONE, FLG_TRASPORTO_PERS_COSE, 
 ENERGIA_ESPORTATA, EPGL_NREN_RACC_TOTALE, EPGL_REN_GLOBALE, EPGL_NREN_GLOBALE, EMISSIONI_CO2, 
 EPGL_NREN_NUOVI, EPGL_NREN_ESISTENTI, EPGL_NREN_RIF, FLG_SMILE_INVERNO, FLG_SMILE_ESTATE, 
 RAPPORTO_SV)
AS 
SELECT v_dati_generali.num_certificatore, v_dati_generali.id_certificatore,
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
       );


GRANT SELECT ON V_DATIGEN_ENERGETICI TO SICEE_RO;
GRANT SELECT ON V_DATIGEN_ENERGETICI TO SICEE_RW;



CREATE OR REPLACE FORCE VIEW V_DATIGEN_IMPIANTI
(NUM_CERTIFICATORE, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, DESC_PROV, 
 DESC_COMUNE, DESC_INDIRIZZO, NUM_CIVICO, CAP, PIANO, 
 INTERNO, COORD_N, COORD_E, CODICE_COMUNE_CATASTALE, RIF_CATASTO, 
 SEZIONE, FOGLIO, PARTICELLA, SUBALTERNO, DATA_INVIO_FILE, 
 DT_SCADENZA, FK_DICHIARAZIONE, COD_FISC_COCERTIFICATORE, DESCR_DESTINAZIONE_USO, FLG_RESIDENZIALE, 
 FLG_ATTIVO, DESTINAZIONE_USO, FLG_USO_PUBBLICO, ANNO_COSTRUZIONE, ANNO_ULT_RIST, 
 VOL_LORDO_RISCALDATO, SUP_RISCALDATA, SUP_RAFFRESCATA, SUP_DISPERDENTE, VOL_LORDO_RAFFRESCATO, 
 ZONA_CLIMATICA, NR_UM, OGGETTO_APE, DESCR_TIPO_RISTRUTT, DESCR_TIPOLOGIA_EDILIZIA, 
 DESCR_PROPRIETA_EDIF, DESCR_TIPOLOGIA_COSTRUTT, MOTIVAZIONE_RILASCIO, DICH_INPIPENDENZA, INFO_MIGL_PREST_ENERG, 
 FLG_SOPRALLUOGO, DATA_SOPRALLUOGO, NOTE_SOPRALLUOGO, NOTE_SEGNALAZIONI, FLG_SW1, 
 FLG_SW2, MOTIVO_ALTRO, ID_DETTAGLIO_IMP, PROGRESSIVO_DETT, COMBUSTIBILE, 
 SERV_ENER, TIPO_IMPIANTO, ANNO_INSTALL, POTENZA_NOMIN_KW, CODICE_IMPIANTO_CIT)
AS 
SELECT v_dati_generali.num_certificatore, v_dati_generali.id_certificatore,
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
       );

GRANT SELECT ON V_DATIGEN_IMPIANTI TO SICEE_RO;
GRANT SELECT ON V_DATIGEN_IMPIANTI TO SICEE_RW;


CREATE OR REPLACE FORCE VIEW V_DATIGEN_RACCOMAND
(NUM_CERTIFICATORE, ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, DESC_PROV, 
 DESC_COMUNE, DESC_INDIRIZZO, NUM_CIVICO, CAP, PIANO, 
 INTERNO, COORD_N, COORD_E, CODICE_COMUNE_CATASTALE, RIF_CATASTO, 
 SEZIONE, FOGLIO, PARTICELLA, SUBALTERNO, DATA_INVIO_FILE, 
 DT_SCADENZA, FK_DICHIARAZIONE, COD_FISC_COCERTIFICATORE, DESCR_DESTINAZIONE_USO, FLG_RESIDENZIALE, 
 FLG_ATTIVO, DESTINAZIONE_USO, FLG_USO_PUBBLICO, ANNO_COSTRUZIONE, ANNO_ULT_RIST, 
 VOL_LORDO_RISCALDATO, SUP_RISCALDATA, SUP_RAFFRESCATA, SUP_DISPERDENTE, VOL_LORDO_RAFFRESCATO, 
 ZONA_CLIMATICA, NR_UM, OGGETTO_APE, DESCR_TIPO_RISTRUTT, DESCR_TIPOLOGIA_EDILIZIA, 
 DESCR_PROPRIETA_EDIF, DESCR_TIPOLOGIA_COSTRUTT, MOTIVAZIONE_RILASCIO, DICH_INPIPENDENZA, INFO_MIGL_PREST_ENERG, 
 FLG_SOPRALLUOGO, DATA_SOPRALLUOGO, NOTE_SOPRALLUOGO, NOTE_SEGNALAZIONI, FLG_SW1, 
 FLG_SW2, MOTIVO_ALTRO, ID_RACCOMANDAZIONE, CODICE_REN, CLASSE_ENERGETICA, 
 TIPO_INTERVENTO, FLG_RISTRUTTURAZIONE, NR_ANNI_RIT_INVEST, EPGL_NREN_SINGOLO_INT)
AS 
SELECT v_dati_generali.num_certificatore, v_dati_generali.id_certificatore,
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
       );

GRANT SELECT ON V_DATIGEN_RACCOMAND TO SICEE_RO;
GRANT SELECT ON V_DATIGEN_RACCOMAND TO SICEE_RW;

DROP VIEW OD_SICEE_APE_TOT;

---------------------------------------------------------------------------------------------------
-- 11/10/2017 - Modifiche (richieste via mail da Todaro) ed eseguite in svi e test e poi annullate
----------------------------------------------------------------------------------------------------
--ALTER TABLE SICEE.SICEE_T_SIAPE MODIFY(DATA_CREAZIONE TIMESTAMP(6));
--ALTER TABLE SICEE.SICEE_T_SIAPE_LOG MODIFY(DATA_OPERAZIONE TIMESTAMP(6));


-- 12/10/2017 - Modifica (richiesta via mail da Todaro) ed eseguita in svi e test 
ALTER TABLE SICEE.SICEE_T_CERTIFICATO ADD (CF_UTENTE_SOSTITUZIONE  VARCHAR2(30));



---------------------------------------------------------------------------------------------------
-- 26/10/2017 - Modifiche (richieste via mail da Actis il 23/10) ed eseguite in svi e test  
----------------------------------------------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW OD_SICEE_CERTIFICATORI_TITOLO
(KEY_TITOLO, NUM_CERTIFICATORI, DATA_AGGIORNAMENTO_RECORD)
AS 
SELECT TIT.DENOMINAZIONE AS KEY_TITOLO, COUNT(*) NUM_CERTIFICATORI
, TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
from sicee_t_certificatore t, SICEE_D_istruzione TIT
WHERE
T.FK_istruzione = TIT.ID_ISTRUZIONE AND
TO_NUMBER(T.ID_CERTIFICATORE) > 100 AND
TO_DATE(TO_CHAR(T.DT_ISCR_ELENCO,'YYYYMMDD'),'YYYYMMDD') <= last_day(ADD_MONTHS(SYSDATE,-1))
AND (T.DT_SCADENZA_ELENCO IS NULL
    OR TO_DATE(TO_CHAR(T.DT_SCADENZA_ELENCO,'YYYYMMDD'),'YYYYMMDD') >= last_day(ADD_MONTHS(SYSDATE,-1))
    )
GROUP BY TIT.DENOMINAZIONE
ORDER BY TIT.DENOMINAZIONE;

GRANT SELECT ON OD_SICEE_CERTIFICATORI_TITOLO TO SICEE_RO;
GRANT SELECT ON OD_SICEE_CERTIFICATORI_TITOLO TO SICEE_RW;

---------------------------------------------------------------------------------------------------
-- 26/10/2017 - Modifiche (richieste via mail da Hubina il 25/10) ed eseguite in svi e test 
----------------------------------------------------------------------------------------------------
ALTER TABLE SICEE.SICEE_T_SIAPE ADD (NOTE  VARCHAR2(2000));


---------------------------------------------------------------------------------------------------
-- 03/11/2017 - Modifiche (richieste Actis calata giù) ed eseguite in svi e test 
----------------------------------------------------------------------------------------------------
CREATE TABLE SICEE_T_HD_DATI_TRATTATI (
       ID_HD_DATI_TRATTATI  NUMBER(9) NOT NULL,
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       DT_TRATTAMENTO       DATE NULL,
       ID_REMEDY            VARCHAR2(30) NULL,
       DESCRIZIONE          VARCHAR2(1000) NULL
);

ALTER TABLE SICEE_T_HD_DATI_TRATTATI
       ADD  CONSTRAINT PK_SICEE_T_HD_DATI_TRATTATI PRIMARY KEY (
              ID_HD_DATI_TRATTATI)  ;

GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_HD_DATI_TRATTATI TO SICEE_RW; 


GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_IMPORT_DATI_2015 TO SICEE_RO;
GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_IMPDATI_XML_2015 TO SICEE_RO;
GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_DATI_XML_2015 TO SICEE_RO;
GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_DATI_XML_ED_RIF_2015 TO SICEE_RO;
GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_DATI_XML_ED_REALE_2015 TO SICEE_RO;
GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_IMPORT_DATI_LOG_2015 TO SICEE_RO;





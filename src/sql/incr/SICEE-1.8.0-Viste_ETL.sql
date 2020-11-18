/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

drop view V_ACE_ANNOCOSTR_CLASSE;
drop view V_ACE_COMUNE_CLASSE;


create or replace view OD_SICEE_ACE_COMUNE_CLASSE as
SELECT ISTAT KEY_ISTAT_COMUNE
      ,DESC_COMUNE
      ,SUM(TOT_A_PIU) CLASSE_A_PIU
      ,SUM(TOT_A) CLASSE_A
      ,SUM(TOT_B) CLASSE_B
      ,SUM(TOT_C) CLASSE_C
      ,SUM(TOT_D) CLASSE_D
      ,SUM(TOT_E) CLASSE_E
      ,SUM(TOT_F) CLASSE_F
      ,SUM(TOT_G) CLASSE_G
      ,SUM(TOT_NC) CLASSE_NC
      ,TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
  FROM (SELECT comuni.istat
              ,comuni.desc_comune
              ,CL.DESCR
              ,DECODE(DESCR, 'A+', 1, 0) TOT_A_PIU
              ,DECODE(DESCR, 'A', 1, 0) TOT_A
              ,DECODE(DESCR, 'B', 1, 0) TOT_B
              ,DECODE(DESCR, 'C', 1, 0) TOT_C
              ,DECODE(DESCR, 'D', 1, 0) TOT_D
              ,DECODE(DESCR, 'E', 1, 0) TOT_E
              ,DECODE(DESCR, 'F', 1, 0) TOT_F
              ,DECODE(DESCR, 'G', 1, 0) TOT_G
              ,DECODE(DESCR, 'NC', 1, 0) TOT_NC
          FROM SICEE_T_CERTIFICATO       C
              ,SICEE_T_CLASSE_ENERGETICA CE
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
           AND cl.ID_CLASSE = ce.FK_CLASSE
           AND TO_CHAR(C.DT_UPLOAD, 'YYYYMMDD') <=
               TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)), 'YYYYMMDD'))
 GROUP BY istat, desc_comune
 ORDER BY 1;


create or replace view OD_SICEE_ANNOCOSTR_CLASSE as
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
  and to_number(sicee_t_certificato.id_certificatore) > 100
  AND TO_CHAR(SICEE_T_CERTIFICATO.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
)
group by  DESCR
order by 1
;


create or replace view OD_SICEE_ACE_ANNOCOSTR_VOLUME as
select case when anno_costruzione <= 1900  then 'FASCIA 1 - fino al 1900'
            when anno_costruzione between 1901 and 1920 then 'FASCIA 2 - 1901-1920'
            when anno_costruzione between 1921 and 1945 then 'FASCIA 3 - 1921-1945'
            when anno_costruzione between 1946 and 1960 then 'FASCIA 4 - 1946-1960'
            when anno_costruzione between 1961 and 1975 then 'FASCIA 5 - 1961-1975'
            when anno_costruzione between 1976 and 1990 then 'FASCIA 6 - 1976-1990'
            when anno_costruzione between 1991 and 2005 then 'FASCIA 7 - 1991-2005'
            when anno_costruzione >= 2006 then 'FASCIA 8 - dopo il 2005'
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
group by case when anno_costruzione <= 1900  then 'FASCIA 1 - fino al 1900'
            when anno_costruzione between 1901 and 1920 then 'FASCIA 2 - 1901-1920'
            when anno_costruzione between 1921 and 1945 then 'FASCIA 3 - 1921-1945'
            when anno_costruzione between 1946 and 1960 then 'FASCIA 4 - 1946-1960'
            when anno_costruzione between 1961 and 1975 then 'FASCIA 5 - 1961-1975'
            when anno_costruzione between 1976 and 1990 then 'FASCIA 6 - 1976-1990'
            when anno_costruzione between 1991 and 2005 then 'FASCIA 7 - 1991-2005'
            when anno_costruzione >= 2006 then 'FASCIA 8 - dopo il 2005'
        else 'altri'
end
order by 1;


create or replace view OD_SICEE_ACE_TIPO_IMPIANTO as
select  TIPOLOGIA_IMPIANTO AS KEY_TIPO_IMPIANTO, NUMERO_ACE
, TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
from (
  select  ti.ID_TIPO_IMPIANTO id_tipo,  ti.DESCR TIPOLOGIA_IMPIANTO , count(*) NUMERO_ACE
  from    SICEE_T_CERTIFICATO c, SICEE_T_CONSUMI_EDIFICIO CE, sicee_d_tipo_impianto ti
  where   c.fk_stato=3 and 
          c.id_certificatore>100 and
          c.progr_certificato = ce.PROGR_CERTIFICATO and 
          c.anno = ce.anno and 
          c.id_CERTIFICATORE = ce.id_CERTIFICATORE and 
          ce.FK_TIPO_IMPIANTO = ti.ID_TIPO_IMPIANTO AND
  TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
  group by ti.ID_TIPO_IMPIANTO , ti.DESCR
  )
order by 1;



create or replace view OD_SICEE_ACE_COMBUSTIBILE as
select  TIPO_COMBUSTIBILE AS KEY_TIPO_COMBUSTIBILE, NUMERO_ACE 
, TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
from (
select  comb.ID_COMBUSTIBILE id_comb,  comb.DESCR TIPO_COMBUSTIBILE , count(*) NUMERO_ACE
from    SICEE_T_CERTIFICATO c, SICEE_T_IMP_RISCALDAMENTO_ACS imp, sicee_d_combustibile comb
where   c.fk_stato=3 and 
        c.id_certificatore>100 and
        c.progr_certificato = imp.PROGR_CERTIFICATO and 
        c.anno = imp.anno and 
        c.id_CERTIFICATORE = imp.id_CERTIFICATORE and 
        imp.FK_COMBUSTIBILE_RISC = comb.ID_COMBUSTIBILE AND
        TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
group by comb.ID_COMBUSTIBILE , comb.DESCR )
order by 1;



create or replace view OD_SICEE_ACE_DEST_USO as
select DESTINAZIONE_USO AS KEY_DESTINAZIONE_USO, NUMERO_ACE 
, TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
from (
select  du.ID_DEST_USO id_dest, du.sigla DESTINAZIONE_USO, count(*) NUMERO_ACE
from    SICEE_T_CERTIFICATO c, SICEE_T_dati_generali dg, sicee_d_dest_uso du
where   c.fk_stato=3 and 
        c.id_certificatore>100 and
        TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD') and
        c.progr_certificato = dg.PROGR_CERTIFICATO and 
        c.anno = dg.anno and 
        c.id_CERTIFICATORE = dg.id_CERTIFICATORE and 
        du.ID_DEST_USO = dg.FK_DEST_USO
group by du.ID_DEST_USO, du.sigla )
order by  1;



create or replace view OD_SICEE_ACE_MOTIVO_RIL as
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
group by mr.ID_MOTIVO, mr.descr )
order by 1;


CREATE OR REPLACE VIEW OD_SICEE_CERTIFICATORI_TITOLO as
SELECT TIT.DESCR AS KEY_TITOLO, COUNT(*) NUM_CERTIFICATORI
, TO_DATE(TO_CHAR(last_day(ADD_MONTHS(SYSDATE, -1)),'DD/MM/YYYY'),'DD/MM/YYYY') DATA_AGGIORNAMENTO_RECORD
from sicee_t_certificatore t, SICEE_D_TITOLO TIT
WHERE 
T.FK_TITOLO = TIT.ID_TITOLO AND
TO_NUMBER(T.ID_CERTIFICATORE) > 100 AND
TO_DATE(TO_CHAR(T.DT_ISCR_ELENCO,'YYYYMMDD'),'YYYYMMDD') <= last_day(ADD_MONTHS(SYSDATE,-1))
AND (T.DT_SCADENZA_ELENCO IS NULL
    OR TO_DATE(TO_CHAR(T.DT_SCADENZA_ELENCO,'YYYYMMDD'),'YYYYMMDD') >= last_day(ADD_MONTHS(SYSDATE,-1))
    )
GROUP BY TIT.DESCR
ORDER BY COUNT(*) DESC;
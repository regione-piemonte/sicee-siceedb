/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

create table SICEE_L_ACCESSO (
dt_accesso       date,
codice_fiscale   varchar2(16),
nome             varchar2(100),
cognome          varchar2(100),
ruolo            varchar2(50)
);

alter table SICEE_L_ACCESSO
  add constraint PK_SICEE_L_ACCESSO primary key (DT_ACCESSO)
  using index 
  tablespace SICEE_IDX;

grant select, insert, update, delete on SICEE_L_ACCESSO to SICEE_RW;

create or replace view OD_SICEE_APE_ANNOCOSTR_COMUNE as
select ISTAT KEY_ISTAT_COMUNE
,DESC_COMUNE
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
    (select comuni.istat
    ,comuni.desc_comune, anno_costruzione
    , case when anno_costruzione <= 1900 then 1 else 0 end tot_1900
    , case when anno_costruzione between 1901 and 1920 then 1 else 0 end tot_1920
    , case when anno_costruzione between 1921 and 1945 then 1 else 0 end tot_1945
    , case when anno_costruzione between 1946 and 1960 then 1 else 0 end tot_1960
    , case when anno_costruzione between 1961 and 1975 then 1 else 0 end tot_1975
    , case when anno_costruzione between 1976 and 1990 then 1 else 0 end tot_1990
    , case when anno_costruzione between 1991 and 2005 then 1 else 0 end tot_2005
    , case when anno_costruzione between 2006 and 2016 then 1 else 0 end tot_2016
    , case when anno_costruzione > 2016 then 1 else 0 end tot_2017
    from sicee_d_classe_energetica,sicee_t_dati_generali,sicee_t_dati_ener_2015,sicee_t_certificato, comuni
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
    AND sicee_t_certificato.id_comune(+) = comuni.istat
    AND SUBSTR(COMUNI.ISTAT, 1, 3) IN
    ('001', '002', '003', '004', '005', '006', '096', '103')
    )
group by istat, desc_comune
order by 1;

GRANT SELECT ON "SICEE"."OD_SICEE_APE_ANNOCOSTR_COMUNE" TO "SICEE_RO";
GRANT SELECT ON "SICEE"."OD_SICEE_APE_ANNOCOSTR_COMUNE" TO "SICEE_RW";

GRANT SELECT ON SICEE_D_TIPO_CORSO TO SICEE_RO;

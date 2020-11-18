/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

create or replace view v_ace_annocostr_classe as
select classe.descr,classe1 "fino al 1900",classe2 "dal 1901 al 1920",classe3 "dal 1921 al 1945",classe4 "dal 1946 al 1960",
       classe5 "dal 1961 al 1975",classe6 "dal 1976 al 1990", classe7 "dal 1991 al 2005",classe8 "dopo il 2005"
from sicee_d_classe_energetica classe,
(select id_classe,descr, count(*) as classe1
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
  and anno_costruzione <=1900
group by id_classe,descr) classe1,
(select id_classe,descr, count(*) as classe2
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
  and anno_costruzione between 1901 and 1920
group by id_classe,descr) classe2,
(select id_classe,descr, count(*) as classe3
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
  and anno_costruzione between 1921 and 1945
group by id_classe,descr) classe3,
(select id_classe,descr, count(*) as classe4
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
  and anno_costruzione between 1946 and 1960
group by id_classe,descr) classe4,
(select id_classe,descr, count(*) as classe5
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
  and anno_costruzione between 1961 and 1975
group by id_classe,descr) classe5,
(select id_classe,descr, count(*) as classe6
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
  and anno_costruzione between 1976 and 1990
group by id_classe,descr) classe6,
(select id_classe,descr, count(*) as classe7
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
  and anno_costruzione between 1991 and 2005
group by id_classe,descr) classe7,
(select id_classe,descr, count(*) as classe8
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
  and anno_costruzione >=2006
group by id_classe,descr) classe8
where classe.descr = classe1.descr
  and classe.descr = classe2.descr
  and classe.descr = classe3.descr
  and classe.descr = classe4.descr
  and classe.descr = classe5.descr
  and classe.descr = classe6.descr
  and classe.descr = classe7.descr
  and classe.descr = classe8.descr
order by classe.descr;


create or replace view v_ace_comune_classe as
select distinct cer.desc_comune,aa as "A+", a ,b,c,d,e,f,g,nc
from
(select desc_comune,count(*) a
from    SICEE_T_CERTIFICATO c, SICEE_T_classe_energetica ce, sicee_d_classe_energetica cl
where   c.fk_stato = 3 and
        to_number(c.id_certificatore) > 100 and
        c.progr_certificato=ce.PROGR_CERTIFICATO and
        c.anno=ce.anno and
        c.ID_CERTIFICATORE = ce.ID_CERTIFICATORE and
        cl.ID_CLASSE = ce.FK_CLASSE  AND
        TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
        and descr='A'
group by desc_comune) A,
(select desc_comune,count(*) b
from    SICEE_T_CERTIFICATO c, SICEE_T_classe_energetica ce, sicee_d_classe_energetica cl
where   c.fk_stato = 3 and
        to_number(c.id_certificatore) > 100 and
        c.progr_certificato=ce.PROGR_CERTIFICATO and
        c.anno=ce.anno and
        c.ID_CERTIFICATORE = ce.ID_CERTIFICATORE and
        cl.ID_CLASSE = ce.FK_CLASSE  AND
        TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
        and descr='B'
group by desc_comune) b,
(select desc_comune,count(*) c
from    SICEE_T_CERTIFICATO c, SICEE_T_classe_energetica ce, sicee_d_classe_energetica cl
where   c.fk_stato = 3 and
        to_number(c.id_certificatore) > 100 and
        c.progr_certificato=ce.PROGR_CERTIFICATO and
        c.anno=ce.anno and
        c.ID_CERTIFICATORE = ce.ID_CERTIFICATORE and
        cl.ID_CLASSE = ce.FK_CLASSE  AND
        TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
        and descr='C'
group by desc_comune) c,
(select desc_comune,count(*) d
from    SICEE_T_CERTIFICATO c, SICEE_T_classe_energetica ce, sicee_d_classe_energetica cl
where   c.fk_stato = 3 and
        to_number(c.id_certificatore) > 100 and
        c.progr_certificato=ce.PROGR_CERTIFICATO and
        c.anno=ce.anno and
        c.ID_CERTIFICATORE = ce.ID_CERTIFICATORE and
        cl.ID_CLASSE = ce.FK_CLASSE  AND
        TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
        and descr='D'
group by desc_comune) d,
(select desc_comune,count(*) e
from    SICEE_T_CERTIFICATO c, SICEE_T_classe_energetica ce, sicee_d_classe_energetica cl
where   c.fk_stato = 3 and
        to_number(c.id_certificatore) > 100 and
        c.progr_certificato=ce.PROGR_CERTIFICATO and
        c.anno=ce.anno and
        c.ID_CERTIFICATORE = ce.ID_CERTIFICATORE and
        cl.ID_CLASSE = ce.FK_CLASSE  AND
        TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
        and descr='E'
group by desc_comune) e,
(select desc_comune,count(*) f
from    SICEE_T_CERTIFICATO c, SICEE_T_classe_energetica ce, sicee_d_classe_energetica cl
where   c.fk_stato = 3 and
        to_number(c.id_certificatore) > 100 and
        c.progr_certificato=ce.PROGR_CERTIFICATO and
        c.anno=ce.anno and
        c.ID_CERTIFICATORE = ce.ID_CERTIFICATORE and
        cl.ID_CLASSE = ce.FK_CLASSE  AND
        TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
        and descr='F'
group by desc_comune) f,
(select desc_comune,count(*) g
from    SICEE_T_CERTIFICATO c, SICEE_T_classe_energetica ce, sicee_d_classe_energetica cl
where   c.fk_stato = 3 and
        to_number(c.id_certificatore) > 100 and
        c.progr_certificato=ce.PROGR_CERTIFICATO and
        c.anno=ce.anno and
        c.ID_CERTIFICATORE = ce.ID_CERTIFICATORE and
        cl.ID_CLASSE = ce.FK_CLASSE  AND
        TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
        and descr='G'
group by desc_comune) g,
(select desc_comune,count(*) nc
from    SICEE_T_CERTIFICATO c, SICEE_T_classe_energetica ce, sicee_d_classe_energetica cl
where   c.fk_stato = 3 and
        to_number(c.id_certificatore) > 100 and
        c.progr_certificato=ce.PROGR_CERTIFICATO and
        c.anno=ce.anno and
        c.ID_CERTIFICATORE = ce.ID_CERTIFICATORE and
        cl.ID_CLASSE = ce.FK_CLASSE  AND
        TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
        and descr='NC'
group by desc_comune) nc,
(select desc_comune,count(*) aa
from    SICEE_T_CERTIFICATO c, SICEE_T_classe_energetica ce, sicee_d_classe_energetica cl
where   c.fk_stato = 3 and
        to_number(c.id_certificatore) > 100 and
        c.progr_certificato=ce.PROGR_CERTIFICATO and
        c.anno=ce.anno and
        c.ID_CERTIFICATORE = ce.ID_CERTIFICATORE and
        cl.ID_CLASSE = ce.FK_CLASSE  AND
        TO_CHAR(C.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
        and descr='A+'
group by desc_comune) aa,
sicee_t_certificato cer
where cer.desc_comune is not null
  and cer.fk_stato = 3
  and to_number(cer.id_certificatore) > 100
  AND TO_CHAR(CER.DT_UPLOAD,'YYYYMMDD') <= TO_CHAR(last_day(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
  and cer.desc_comune=a.desc_comune(+)
  and cer.desc_comune=b.desc_comune(+)
  and cer.desc_comune=c.desc_comune(+)
  and cer.desc_comune=d.desc_comune(+)
  and cer.desc_comune=e.desc_comune(+)
  and cer.desc_comune=f.desc_comune(+)
  and cer.desc_comune=g.desc_comune(+)
  and cer.desc_comune=nc.desc_comune(+)
  and cer.desc_comune=aa.desc_comune(+);
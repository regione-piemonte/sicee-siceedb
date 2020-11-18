/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

-- Create_L_ANNULLAMENTO
CREATE TABLE SICEE_L_ANNULLAMENTO (
ID_ANNULLAMENTO      NUMBER NOT NULL,
DT_ANNULLAMENTO      DATE NOT NULL,
MOTIVO_ANNULLAMENTO  VARCHAR2(2000),
ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
ANNO                 VARCHAR2(4) NOT NULL
)
tablespace SICEE_TBL;

alter table SICEE_L_ANNULLAMENTO
  add constraint PK_SICEE_L_ANNULLAMENTO primary key (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO)
  using index 
  tablespace SICEE_IDX
;

alter table SICEE_L_ANNULLAMENTO
  add constraint fk_sicee_t_certificato_52 foreign key (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO)
  references SICEE_T_CERTIFICATO (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO);

grant select, insert, update, delete on SICEE_L_ANNULLAMENTO to SICEE_RW;

-- Create sequence 
create sequence SEQ_SICEE_L_ANNULLAMENTO
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

GRANT ALTER, SELECT ON SEQ_SICEE_L_ANNULLAMENTO TO SICEE_RW;

-- Alter_SICEE_T_EXPORT_BO
ALTER TABLE SICEE_T_EXPORT_BO ADD 
(
  dt_scadenza           DATE  NULL 
);

-- Create_D_TIPO_CORSO
CREATE TABLE SICEE_D_TIPO_CORSO
(
  id_tipo_corso         NUMBER(3)  NOT NULL ,
  descrizione           VARCHAR2(50)  NULL ,
  descrizione_attestato  VARCHAR2(500)  NULL ,
  flg_abilitato         CHAR(1)  NULL 
)
TABLESPACE SICEE_TBL;



CREATE UNIQUE INDEX PK_SICEE_D_TIPO_CORSO ON SICEE_D_TIPO_CORSO
(id_tipo_corso  ASC)
TABLESPACE SICEE_IDX;



ALTER TABLE SICEE_D_TIPO_CORSO
  ADD CONSTRAINT  PK_SICEE_D_TIPO_CORSO PRIMARY KEY (id_tipo_corso);



ALTER TABLE SICEE_T_CORSO_2015 ADD
(
  fk_tipo_corso         NUMBER(3)  NULL 
);



ALTER TABLE SICEE_T_CORSO_2015
  ADD (CONSTRAINT  FK_SICEE_D_TIPO_CORSO_01 FOREIGN KEY (fk_tipo_corso) REFERENCES SICEE_D_TIPO_CORSO(id_tipo_corso) ON DELETE SET NULL);
  

GRANT ALTER, SELECT ON SICEE_D_TIPO_CORSO TO SICEE_RW;  

-- Insert_D_TIPO_CORSO
insert into SICEE_D_TIPO_CORSO (ID_TIPO_CORSO, DESCRIZIONE, DESCRIZIONE_ATTESTATO, FLG_ABILITATO)
values (1, 'Aggiornamento (10 + ore) Regionale', 'Corso di Aggiornamento di tecnici certificatori energetici ai sensi della DGR 24-2360 del 02/11/2015', '1');

insert into SICEE_D_TIPO_CORSO (ID_TIPO_CORSO, DESCRIZIONE, DESCRIZIONE_ATTESTATO, FLG_ABILITATO)
values (2, 'Formazione (80 + ore) - Nazionale', 'Corso di Formazione e superamento esame per tecnici certificatori energetici ai sensi del DPR 75/2013', '1');

insert into SICEE_D_TIPO_CORSO (ID_TIPO_CORSO, DESCRIZIONE, DESCRIZIONE_ATTESTATO, FLG_ABILITATO)
values (3, 'Formazione (80 + ore) - Regionale', 'Corso di Formazione e superamento esame per tecnici certificatori energetici ai sensi della DGR 24-2360 del 02/11/2015', '1');

insert into SICEE_D_TIPO_CORSO (ID_TIPO_CORSO, DESCRIZIONE, DESCRIZIONE_ATTESTATO, FLG_ABILITATO)
values (4, 'Raccordo (40 + ore)', 'Corso di raccordo formativo ai sensi della DGR 43-8097 del 14/12/2018', '1');

-- Update_D_TIPO_CORSO
UPDATE SICEE_T_CORSO_2015 
SET fk_tipo_corso = 1
WHERE tipo_corso1 = 'AGG';

UPDATE SICEE_T_CORSO_2015 
SET fk_tipo_corso = 2
WHERE tipo_corso1 = 'FORM'
AND tipo_corso2 = 'NAZ';

UPDATE SICEE_T_CORSO_2015 
SET fk_tipo_corso = 3
WHERE tipo_corso1 = 'FORM'
AND tipo_corso2 = 'REG';

-- Update_SICEE_T_EXPORT_BO
select count(*)
from sicee_t_certificato c;
-- dev 9723
-- test 908313

select count(*)
from sicee_t_certificato c
where c.dt_scadenza is not null;
-- dev 1072
-- test 891132

--select c.id_certificatore, c.progr_certificato, c.anno, c.dt_scadenza
--from sicee_t_certificato c
--where c.dt_scadenza is not null
-- dev 1072

select count(*)
from sicee_t_export_bo e;
-- dev 1068
-- test 887198

select count(*)
from sicee_t_certificato c, sicee_t_export_bo e
where c.dt_scadenza is not null
and c.id_certificatore = e.id_certificatore
and c.progr_certificato = e.progr_certificato
and c.anno = e.anno;
-- dev 1068
-- test 886945

--select c.id_certificatore, c.progr_certificato, c.anno, c.dt_scadenza
--from sicee_t_certificato c, sicee_t_export_bo e
--where c.dt_scadenza is not null
--and c.id_certificatore = e.id_certificatore
--and c.progr_certificato = e.progr_certificato
--and c.anno = e.anno
-- dev 1068

update sicee_t_export_bo e
set e.dt_scadenza = (
  select c.dt_scadenza
  from sicee_t_certificato c
  where c.dt_scadenza is not null
  and c.id_certificatore = e.id_certificatore
  and c.progr_certificato = e.progr_certificato
  and c.anno = e.anno
)
where (e.id_certificatore, e.progr_certificato, e.anno) IN (
select c.id_certificatore, c.progr_certificato, c.anno
from sicee_t_certificato c, sicee_t_export_bo e
where c.dt_scadenza is not null
and c.id_certificatore = e.id_certificatore
and c.progr_certificato = e.progr_certificato
and c.anno = e.anno
);

select count(*)
from sicee_t_export_bo e
where dt_scadenza is not null;

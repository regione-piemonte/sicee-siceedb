/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/
Insert into SICEE.SICEE_D_CLASSE_EFFICIENZA
   (ID_CLASSE_EFF, DESCR)
 Values
   (1, 'non disponibile');
Insert into SICEE.SICEE_D_CLASSE_EFFICIENZA
   (ID_CLASSE_EFF, DESCR)
 Values
   (5, '4 stella');
Insert into SICEE.SICEE_D_CLASSE_EFFICIENZA
   (ID_CLASSE_EFF, DESCR)
 Values
   (2, '1 stella');
Insert into SICEE.SICEE_D_CLASSE_EFFICIENZA
   (ID_CLASSE_EFF, DESCR)
 Values
   (3, '2 stella');
Insert into SICEE.SICEE_D_CLASSE_EFFICIENZA
   (ID_CLASSE_EFF, DESCR)
 Values
   (4, '3 stella');
COMMIT;

Insert into SICEE.SICEE_D_CLASSE_ENERGETICA
   (ID_CLASSE, DESCR, FLG_NAZIONALE_19205)
 Values
   (2, 'A', 'S');
Insert into SICEE.SICEE_D_CLASSE_ENERGETICA
   (ID_CLASSE, DESCR, FLG_NAZIONALE_19205)
 Values
   (3, 'B', 'S');
Insert into SICEE.SICEE_D_CLASSE_ENERGETICA
   (ID_CLASSE, DESCR, FLG_NAZIONALE_19205)
 Values
   (4, 'C', 'S');
Insert into SICEE.SICEE_D_CLASSE_ENERGETICA
   (ID_CLASSE, DESCR, FLG_NAZIONALE_19205)
 Values
   (6, 'E', 'S');
Insert into SICEE.SICEE_D_CLASSE_ENERGETICA
   (ID_CLASSE, DESCR)
 Values
   (9, 'NC');
Insert into SICEE.SICEE_D_CLASSE_ENERGETICA
   (ID_CLASSE, DESCR, FLG_NAZIONALE_19205)
 Values
   (1, 'A+', 'S');
Insert into SICEE.SICEE_D_CLASSE_ENERGETICA
   (ID_CLASSE, DESCR, FLG_NAZIONALE_19205)
 Values
   (5, 'D', 'S');
Insert into SICEE.SICEE_D_CLASSE_ENERGETICA
   (ID_CLASSE, DESCR, FLG_NAZIONALE_19205)
 Values
   (7, 'F', 'S');
Insert into SICEE.SICEE_D_CLASSE_ENERGETICA
   (ID_CLASSE, DESCR, FLG_NAZIONALE_19205)
 Values
   (8, 'G', 'S');
COMMIT;


Insert into SICEE.SICEE_D_COMBUSTIBILE
   (ID_COMBUSTIBILE, DESCR)
 Values
   (1, 'Olio combustibile');
Insert into SICEE.SICEE_D_COMBUSTIBILE
   (ID_COMBUSTIBILE, DESCR)
 Values
   (2, 'Gasolio');
Insert into SICEE.SICEE_D_COMBUSTIBILE
   (ID_COMBUSTIBILE, DESCR)
 Values
   (3, 'Gas naturale');
Insert into SICEE.SICEE_D_COMBUSTIBILE
   (ID_COMBUSTIBILE, DESCR)
 Values
   (5, 'Biomassa solida');
Insert into SICEE.SICEE_D_COMBUSTIBILE
   (ID_COMBUSTIBILE, DESCR)
 Values
   (4, 'GPL');
Insert into SICEE.SICEE_D_COMBUSTIBILE
   (ID_COMBUSTIBILE, DESCR)
 Values
   (6, 'Biomassa liquida');
COMMIT;

Insert into SICEE.SICEE_D_DATI_INGRESSO
   (ID_DATI, DESCR)
 Values
   (2, 'Rilievo su edificio');
Insert into SICEE.SICEE_D_DATI_INGRESSO
   (ID_DATI, DESCR)
 Values
   (1, 'Documentazione progettuale');
COMMIT;


Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (1, 'E1', 'Edifici adibiti a residenza e assimilabili');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (5, 'E2', 'Edifici adibiti ad uffici e assimilabili:');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (6, 'E3', 'cura di minori o anziani nonchˆ le s');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (9, 'E4 (2)', 'Mostre, musei e biblioteche, luoghi di culto ');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (12, 'E6', 'Edifici adibiti ad attivita'' sportive');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (15, 'E6 (3)', 'Servizi di supporto alle attivita'' sportive');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (2, 'E1 (1)', 'Abitazione adibite a residenza con carattere continuativo, ');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (3, 'E1 (2)', 'Abitazione adibite a residenza ');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (4, 'E1 (3)', 'Edifici adibiti ad albergo, pensione ed attivita'' similari');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (7, 'E4', 'Edifici adibiti ad attivita'' ricreative, associative o di culto e assimilabili ');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (8, 'E4 (1)', 'Cinema, teatri, sale di riunioni per congressi  ');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (10, 'E4 (3)', 'Bar, ristoranti, sale da ballo');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (11, 'E5', 'Edifici adibiti ad attivita'' commerciali e assimilabili; ');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (13, 'E6 (1)', 'Piscine, saune e assimilabili ');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (14, 'E6 (2)', 'Palestre e assimilabili ');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (16, 'E7', 'Edifici adibiti ad attivita'' scolastiche a tutti i livelli e assimilabili ');
Insert into SICEE.SICEE_D_DEST_USO
   (ID_DEST_USO, SIGLA, DESCR)
 Values
   (17, 'E8', 'Edifici adibiti ad attivita'' industriali ed artigianali e assimilabili ');
COMMIT;

Insert into SICEE.SICEE_D_DICHIARAZIONE
   (ID_DICHIARAZIONE, DESCR)
 Values
   (1, 'nel caso di certificazione di edifici di nuova costruzione, l''assenza di conflitto di interessi, ovvero il non coinvolgimento diretto o indiretto nel processo di progettazione e realizzazione dell''edificio oggetto della presente certificazione o con i produttori dei materiali e dei componenti in esso incorporati nonch‰ rispetto ai vantaggi che possano derivarne al richiedente');
Insert into SICEE.SICEE_D_DICHIARAZIONE
   (ID_DICHIARAZIONE, DESCR)
 Values
   (2, 'nel caso di certificazione di edifici esistenti, l''assenza di conflitto di interessi, ovvero di non coinvolgimento diretto o indiretto con i produttori dei materiali e dei componenti in esso incorporati nonch‰ rispetto ai vantaggi che possano derivarne al richiedente');
Insert into SICEE.SICEE_D_DICHIARAZIONE
   (ID_DICHIARAZIONE, DESCR)
 Values
   (3, 'nel caso di certificazione di edifici pubblici o di uso pubblico, di operare in nome e per conto dell''ente pubblico ovvero dell''organismo di diritto pubblico proprietario dell''edificio oggetto del presente attestato di certificazione energetica e di agire per le finalit€ istituzionali proprie di tali enti ed organismi');
COMMIT;

Insert into SICEE.SICEE_D_MOTIVO_RILASCIO
   (ID_MOTIVO, DESCR)
 Values
   (2, 'Ristrutturazione edilizia');
Insert into SICEE.SICEE_D_MOTIVO_RILASCIO
   (ID_MOTIVO, DESCR)
 Values
   (6, 'Ampliamento in deroga (LR 20/2009)');
Insert into SICEE.SICEE_D_MOTIVO_RILASCIO
   (ID_MOTIVO, DESCR)
 Values
   (1, 'Nuova costruzione');
Insert into SICEE.SICEE_D_MOTIVO_RILASCIO
   (ID_MOTIVO, DESCR)
 Values
   (3, 'Riqualificazione energetica');
Insert into SICEE.SICEE_D_MOTIVO_RILASCIO
   (ID_MOTIVO, DESCR)
 Values
   (4, 'Passaggio di proprieta''');
Insert into SICEE.SICEE_D_MOTIVO_RILASCIO
   (ID_MOTIVO, DESCR)
 Values
   (5, 'Locazione');
Insert into SICEE.SICEE_D_MOTIVO_RILASCIO
   (ID_MOTIVO, DESCR)
 Values
   (7, 'Modifica delle prestazioni energetiche');
COMMIT;

Insert into SICEE.SICEE_D_NORMATIVA
   (ID_NORMA, DESCR, DT_INIZIO, DT_FINE)
 Values
   (2, 'L.10/91', TO_DATE('08/01/1994 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('10/07/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SICEE.SICEE_D_NORMATIVA
   (ID_NORMA, DESCR, DT_INIZIO, DT_FINE)
 Values
   (1, 'L.373/76', TO_DATE('02/21/1978 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('07/31/1994 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SICEE.SICEE_D_NORMATIVA
   (ID_NORMA, DESCR, DT_INIZIO, DT_FINE)
 Values
   (3, 'DLgs.192/05', TO_DATE('10/08/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('02/23/2007 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SICEE.SICEE_D_NORMATIVA
   (ID_NORMA, DESCR, DT_INIZIO, DT_FINE)
 Values
   (4, 'DCR 98-1247', TO_DATE('02/24/2007 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('12/31/4321 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
COMMIT;


Insert into SICEE.SICEE_D_PRIORITA
   (PRIORITA)
 Values
   ('ALTA');
Insert into SICEE.SICEE_D_PRIORITA
   (PRIORITA)
 Values
   ('BASSA');
Insert into SICEE.SICEE_D_PRIORITA
   (PRIORITA)
 Values
   ('MEDIA');
COMMIT;

Insert into SICEE.SICEE_D_QUALITA_INVOLUCRO
   (ID_QUALITA, DESCR)
 Values
   (4, 'IV');
Insert into SICEE.SICEE_D_QUALITA_INVOLUCRO
   (ID_QUALITA, DESCR)
 Values
   (5, 'V');
Insert into SICEE.SICEE_D_QUALITA_INVOLUCRO
   (ID_QUALITA, DESCR)
 Values
   (1, 'I');
Insert into SICEE.SICEE_D_QUALITA_INVOLUCRO
   (ID_QUALITA, DESCR)
 Values
   (2, 'II');
Insert into SICEE.SICEE_D_QUALITA_INVOLUCRO
   (ID_QUALITA, DESCR)
 Values
   (3, 'III');
COMMIT;


Insert into SICEE.SICEE_D_RUOLO
   (ID_TIPO_RUOLO, DESCR)
 Values
   (1, 'Progettista');
Insert into SICEE.SICEE_D_RUOLO
   (ID_TIPO_RUOLO, DESCR)
 Values
   (2, 'Direttore lavori');
Insert into SICEE.SICEE_D_RUOLO
   (ID_TIPO_RUOLO, DESCR)
 Values
   (3, 'Costruttore');
COMMIT;


Insert into SICEE.SICEE_D_SISTEMA_RACC
   (SISTEMA)
 Values
   ('EDIFICIO');
Insert into SICEE.SICEE_D_SISTEMA_RACC
   (SISTEMA)
 Values
   ('IMPIANTO');
COMMIT;


Insert into SICEE.SICEE_D_STATO_CERT
   (ID_STATO, DESCR)
 Values
   (1, 'Bozza');
Insert into SICEE.SICEE_D_STATO_CERT
   (ID_STATO, DESCR)
 Values
   (2, 'Inviato');
Insert into SICEE.SICEE_D_STATO_CERT
   (ID_STATO, DESCR)
 Values
   (0, 'Nuovo');
COMMIT;


Insert into SICEE.SICEE_D_TIPO_IMPIANTO
   (ID_TIPO_IMPIANTO, DESCR)
 Values
   (1, 'Autonomo');
Insert into SICEE.SICEE_D_TIPO_IMPIANTO
   (ID_TIPO_IMPIANTO, DESCR)
 Values
   (2, 'Centralizzato');
COMMIT;



update SICEE.SICEE_D_TITOLO set DESCR = 'Ingegnere'
where ID_TITOLO ='1';

update SICEE.SICEE_D_TITOLO set DESCR = 'Architetto'
where ID_TITOLO ='2';

update SICEE.SICEE_D_TITOLO set DESCR = 'Geometra'
where ID_TITOLO ='3';

update SICEE.SICEE_D_TITOLO set DESCR = 'Perito'
where ID_TITOLO ='4';


COMMIT;

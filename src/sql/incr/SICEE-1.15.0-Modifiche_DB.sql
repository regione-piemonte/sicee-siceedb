/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/
-----------------------------------------------------------------
-- 17/02/2017 - Modifiche richieste da Actis (mail) solo su DEV
-----------------------------------------------------------------

ALTER TABLE SICEE.SICEE_T_CERTIFICATO MODIFY(DESC_INDIRIZZO VARCHAR2(255 BYTE));
ALTER TABLE SICEE.SICEE_T_DET_IMP_2015 MODIFY(TIPO_IMPIANTO VARCHAR2(255 BYTE));
ALTER TABLE SICEE.SICEE_T_ALTRE_INFO MODIFY(SW_UTILIZZATO VARCHAR2(255 BYTE));
ALTER TABLE SICEE.SICEE_T_DATI_GENERALI ADD (CODICE_EDIFICIO_SCOLASTICO  VARCHAR2(10));

ALTER TABLE SICEE_T_CERTIFICATO DROP CONSTRAINT DOM_NCEU_NCT;
ALTER TABLE SICEE_T_CERTIFICATO ADD CONSTRAINT DOM_NCEU_NCT CHECK (RIF_CATASTO IN ('NCEU','NCT', 'CT'));
 
 
 
 
INSERT INTO SICEE_D_UNITA_MISURA_2015 (ID_UNITA_MISURA, DESCR) VALUES (4 ,'Sm' );
INSERT INTO SICEE_D_TIPO_RISTRUTT_2015 (DESCR, ID_TIPO_RISTRUTTURAZ) VALUES ('nessuno',6 );
INSERT INTO SICEE_D_COMBUSTIBILE (ID_COMBUSTIBILE,DESCR,COD_XML,FLG_CONSUMI, FLG_VETTORE_EN_EXPORT,FLG_VETTORE_DET_IMP) VALUES ( 214,'Gasolio',14, 'N','N','S');
INSERT INTO SICEE_D_COMBUSTIBILE (ID_COMBUSTIBILE,DESCR,COD_XML,FLG_CONSUMI, FLG_VETTORE_EN_EXPORT,FLG_VETTORE_DET_IMP) VALUES ( 215,'Olio combustibile',15, 'N','N','S');



-----------------------------------------------------------------
-- 02/03/2017 -  solo su DEV
-- Integrazioni richieste da Actis (doc SICEE_SFU-01-V01-adeguamento tracciato nazionale V3vsV5.doc) 
--
--20/03/2017 ulteriori richieste da Actis (mail 17/03/2017 + doc)
-----------------------------------------------------------------

--INSERT INTO SICEE_D_DICHIARAZIONE (ID_DICHIARAZIONE, DESCR) VALUES (100,'Il sottoscritto certificatore, consapevole delle responsabilità assunte ai sensi degli artt.359 e 481 del Codice Penale, DICHIARA di aver svolto con indipendenza ed imparzialità di giudizio l''attività di Soggetto Certificatore del sistema edificio impianto oggetto del presente attestato e l''assenza di conflitto di interessi ai sensi dell''art.3 del D.P.R. 16 aprile 2013, n. 75.' );
INSERT INTO SICEE_D_DICHIARAZIONE (ID_DICHIARAZIONE, DESCR) VALUES (100,'Nel caso di certificazione di edifici di nuova costruzione, il sottoscritto certificatore, consapevole delle responsabilità assunte ai sensi degli artt.359 e 481 del Codice Penale, DICHIARA di aver svolto con indipendenza ed imparzialità di giudizio l''attività di Soggetto Certificatore del sistema edificio impianto oggetto del presente attestato e l''assenza di conflitto di interessi ai sensi dell''art.3 del D.P.R. 16 aprile 2013, n. 75.In particolare si dichiara l''assenza di conflitto di interessi, tra l''altro espressa attraverso il non coinvolgimento diretto o indiretto nel processo di progettazione e realizzazione dell''edificio da certificare o con i produttori dei materiali e dei componenti in esso incorporati nonchè rispetto ai vantaggi che possono derivarne al richiedente, che in ogni caso non deve essere nè il coniuge , nè un parente fino al quarto grado.' );

--INSERT INTO SICEE_D_DICHIARAZIONE (ID_DICHIARAZIONE, DESCR) VALUES (101,'nel caso di certificazione di edifici di nuova costruzione, l''assenza di conflitto di interessi, tra l''altro espressa attraverso il non coinvolgimento diretto o indiretto nel processo di progettazione e realizzazione dell''edificio da certificare o con i produttori dei materiali e dei componenti in esso incorporati nonchè rispetto ai vantaggi che possono derivarne al richiedente, che in ogni caso non deve essere nè il coniuge , nè un parente fino al quarto grado' );
INSERT INTO SICEE_D_DICHIARAZIONE (ID_DICHIARAZIONE, DESCR) VALUES (101,'Nel caso di certificazione di edifici esistenti, il sottoscritto certificatore, consapevole delle responsabilità assunte ai sensi degli artt.359 e 481 del Codice Penale, DICHIARA di aver svolto con indipendenza ed imparzialità di giudizio l''attività di Soggetto Certificatore del sistema edificio impianto oggetto del presente attestato e l''assenza di conflitto di interessi ai sensi dell''art.3 del D.P.R. 16 aprile 2013, n. 75.In particolare  si dichiara  l''assenza di conflitto di interessi, ovvero di non coinvolgimento diretto o indiretto con i produttori dei materiali e dei componenti in esso incorporati nonchè rispetto ai vantaggi che possono derivarne al richiedente, che in ogni caso non deve essere nè coniuge , nè parente fino al quarto grado' );

--INSERT INTO SICEE_D_DICHIARAZIONE (ID_DICHIARAZIONE, DESCR) VALUES (102,'nel caso di certificazione di edifici esistenti, l''assenza di conflitto di interessi, ovvero di non coinvolgimento diretto o indiretto con i produttori dei materiali e dei componenti in esso incorporati nonchè rispetto ai vantaggi che possono derivarne al richiedente, che in ogni caso non deve essere nè coniuge , nè parente fino al quarto grado' );
INSERT INTO SICEE_D_DICHIARAZIONE (ID_DICHIARAZIONE, DESCR) VALUES (102,'Nel caso di certificazione di edifici pubblici o di uso pubblico eseguita da dipendente, il sottoscritto certificatore, consapevole delle responsabilità assunte ai sensi degli artt.359 e 481 del Codice Penale, DICHIARA di aver svolto con indipendenza ed imparzialità di giudizio l''attività di Soggetto Certificatore del sistema edificio impianto oggetto del presente attestato e l''assenza di conflitto di interessi ai sensi dell''art.3 del D.P.R. 16 aprile 2013, n. 75.In particolare si dichiara di operare in nome e per conto dell''ente pubblico ovvero dell''organismo di diritto pubblico proprietario dell''edificio oggetto del presente attestato di certificazione energetica e di agire per le finalità istituzionali proprie di tali enti e organismi' );

--INSERT INTO SICEE_D_DICHIARAZIONE (ID_DICHIARAZIONE, DESCR) VALUES (103,'nel caso di certificazione di edifici pubblici o di uso pubblico, di operare in nome e per conto dell''ente pubblico ovvero dell''organismo di diritto pubblico proprietario dell''edificio oggetto del presente attestato  di certificazione energetica e di agire per le finalità istituzionali proprie di tali enti e organismi' );
--INSERT INTO SICEE_D_DICHIARAZIONE (ID_DICHIARAZIONE, DESCR) VALUES (104,'certificazione eseguita da dipendente e che operi per conto di ente pubblico ovvero di organismo di diritto pubblico operante nel settore dell''energia e dell''edilizia (art. 3, il comma 1-bis del D.P.R. 16 aprile 2013, n. 75)' );        
commit;


update SICEE_D_MOTIVO_RILASCIO set DESCR = 'Situazione ante-operam - Richiesta finanziamento POR FESR 14-20' where ID_MOTIVO = 203;
update SICEE_D_MOTIVO_RILASCIO set DESCR = 'Situazione post-operam - Richiesta finanziamento POR FESR 14-20' where ID_MOTIVO = 204;

update SICEE_D_MOTIVO_RILASCIO set FLG_ATTIVO = 1 where ID_MOTIVO = 203;
update SICEE_D_MOTIVO_RILASCIO set FLG_ATTIVO = 1 where ID_MOTIVO = 204;

commit;


INSERT INTO SICEE_D_TIPOL_EDILIZIA_2015 (ID_TIPOL_EDILIZIA, DESCR) VALUES (9,'Altro' );
commit;

UPDATE SICEE_D_TIPOL_EDILIZIA_2015 
SET    DESCR             = 'Edificio isolato (monofamiliare)'
WHERE  ID_TIPOL_EDILIZIA = 0 ;

UPDATE SICEE_D_TIPOL_EDILIZIA_2015 
SET    DESCR             = 'Edificio isolato (bifamiliare)'
WHERE  ID_TIPOL_EDILIZIA = 1 ;

UPDATE SICEE_D_TIPOL_EDILIZIA_2015 
SET    DESCR             = 'Edificio isolato (plurifamiliare)'
WHERE  ID_TIPOL_EDILIZIA = 2 ;

UPDATE SICEE_D_TIPOL_EDILIZIA_2015 
SET    DESCR             = 'Edificio in Linea'
WHERE  ID_TIPOL_EDILIZIA = 3 ;

UPDATE SICEE_D_TIPOL_EDILIZIA_2015 
SET    DESCR             = 'Edificio a Schiera'
WHERE  ID_TIPOL_EDILIZIA = 4 ;

UPDATE SICEE_D_TIPOL_EDILIZIA_2015 
SET    DESCR             = 'Edificio a Corte'
WHERE  ID_TIPOL_EDILIZIA = 5 ;

UPDATE SICEE_D_TIPOL_EDILIZIA_2015 
SET    DESCR             = 'Edificio a Torre'
WHERE  ID_TIPOL_EDILIZIA = 6 ;

UPDATE SICEE_D_TIPOL_EDILIZIA_2015 
SET    DESCR             = 'Edificio a Blocco'
WHERE  ID_TIPOL_EDILIZIA = 7 ;

UPDATE SICEE_D_TIPOL_EDILIZIA_2015 
SET    DESCR             = 'Edificio a Piastra'
WHERE  ID_TIPOL_EDILIZIA = 8 ;

commit;


UPDATE SICEE_T_DATI_GENERALI SET FK_TIPOL_EDILIZIA = 0 WHERE  FK_TIPOL_EDILIZIA = 9 ;
commit;
UPDATE SICEE_T_DATI_GENERALI SET FK_TIPOL_EDILIZIA = 3 WHERE  FK_TIPOL_EDILIZIA = 0 ;
commit;
UPDATE SICEE_T_DATI_GENERALI SET FK_TIPOL_EDILIZIA = 9 WHERE  FK_TIPOL_EDILIZIA = 3 ;
commit;


UPDATE SICEE_T_DATI_GENERALI SET FK_TIPOL_EDILIZIA = 2 WHERE  FK_TIPOL_EDILIZIA = 9 ;
commit;
UPDATE SICEE_T_DATI_GENERALI SET FK_TIPOL_EDILIZIA = 4 WHERE  FK_TIPOL_EDILIZIA = 0 ;
commit;
UPDATE SICEE_T_DATI_GENERALI SET FK_TIPOL_EDILIZIA = 9 WHERE  FK_TIPOL_EDILIZIA = 4 ;
commit;

UPDATE SICEE_T_DATI_GENERALI SET FK_TIPOL_EDILIZIA = 9 WHERE  FK_TIPOL_EDILIZIA in (5,6,7,8) ;
commit;




INSERT INTO SICEE_D_TIPOL_COSTRUTT_2015 (ID_TIPOL_COSTRUTT, DESCR) VALUES (7,'Struttura in legno' );
commit;
INSERT INTO SICEE_D_TIPOL_COSTRUTT_2015 (ID_TIPOL_COSTRUTT, DESCR) VALUES (8,'Struttura prefabbricata in c.a.' );
commit;
INSERT INTO SICEE_D_TIPOL_COSTRUTT_2015 (ID_TIPOL_COSTRUTT, DESCR) VALUES (9,'Struttura mista (c.a. e laterizi)' );
commit;
INSERT INTO SICEE_D_TIPOL_COSTRUTT_2015 (ID_TIPOL_COSTRUTT, DESCR) VALUES (10,'Struttura mista (c.a. e acciaio)' );
commit;
INSERT INTO SICEE_D_TIPOL_COSTRUTT_2015 (ID_TIPOL_COSTRUTT, DESCR) VALUES (11,'Struttura mista (acciaio e muratura' );
commit;
INSERT INTO SICEE_D_TIPOL_COSTRUTT_2015 (ID_TIPOL_COSTRUTT, DESCR) VALUES (12,'Struttura mista (muratura e legno)' );
commit;
INSERT INTO SICEE_D_TIPOL_COSTRUTT_2015 (ID_TIPOL_COSTRUTT, DESCR) VALUES (13,'Struttura mista (altro)' );
commit;
INSERT INTO SICEE_D_TIPOL_COSTRUTT_2015 (ID_TIPOL_COSTRUTT, DESCR) VALUES (14,'Altro' );
commit;


UPDATE SICEE_D_TIPOL_COSTRUTT_2015 
SET    DESCR             = 'Struttura in muratura portante'
WHERE  ID_TIPOL_COSTRUTT = 0 ;
UPDATE SICEE_D_TIPOL_COSTRUTT_2015 
SET    DESCR             = 'Struttura in c.a. (con chiusure in laterizi)'
WHERE  ID_TIPOL_COSTRUTT = 1 ;
UPDATE SICEE_D_TIPOL_COSTRUTT_2015 
SET    DESCR             = 'Struttura in c.a. (con chiusure continue in vetro)'
WHERE  ID_TIPOL_COSTRUTT = 2 ;
UPDATE SICEE_D_TIPOL_COSTRUTT_2015 
SET    DESCR             = 'Struttura in c.a. (con chiusure in pannelli prefabbricati)'
WHERE  ID_TIPOL_COSTRUTT = 3 ;
UPDATE SICEE_D_TIPOL_COSTRUTT_2015 
SET    DESCR             = 'Struttura in acciaio (con chiusure in muratura)'
WHERE  ID_TIPOL_COSTRUTT = 4 ;
UPDATE SICEE_D_TIPOL_COSTRUTT_2015 
SET    DESCR             = 'Struttura in acciaio (con facciate continue in vetro)'
WHERE  ID_TIPOL_COSTRUTT = 5 ;
UPDATE SICEE_D_TIPOL_COSTRUTT_2015 
SET    DESCR             = 'Struttura in acciaio (con chiusure in pannelli prefabbricati)'
WHERE  ID_TIPOL_COSTRUTT = 6 ;


UPDATE SICEE_T_DATI_GENERALI SET FK_TIPOL_COSTRUTTIVA = 2 WHERE FK_TIPOL_COSTRUTTIVA = 14 ;
commit;

UPDATE SICEE_T_DATI_GENERALI SET FK_TIPOL_COSTRUTTIVA = 4 WHERE FK_TIPOL_COSTRUTTIVA = 13 ;
commit;

UPDATE SICEE_T_DATI_GENERALI SET FK_TIPOL_COSTRUTTIVA = 14 WHERE FK_TIPOL_COSTRUTTIVA = 2 ;
commit;

UPDATE SICEE_T_DATI_GENERALI SET FK_TIPOL_COSTRUTTIVA = 3 WHERE FK_TIPOL_COSTRUTTIVA = 7 ;
commit;

UPDATE SICEE_T_DATI_GENERALI SET FK_TIPOL_COSTRUTTIVA = 5 WHERE FK_TIPOL_COSTRUTTIVA = 8 ;
commit;

UPDATE SICEE_T_DATI_GENERALI SET FK_TIPOL_COSTRUTTIVA = 6 WHERE FK_TIPOL_COSTRUTTIVA = 14 ;
commit;



--------------------------------------------------------------
-- 08/03/2017 mail di Todaro - fatto in svi
--------------------------------------------------------------

--drop TABLE SICEE_D_TIPO_IMPIANTO_2015;
CREATE TABLE SICEE_D_TIPO_IMPIANTO_2015 (
       ID_TIPO_IMPIANTO     NUMBER(3) NOT NULL,
       DESCR                VARCHAR2(100) NOT NULL
);

ALTER TABLE SICEE_D_TIPO_IMPIANTO_2015
       ADD  ( CONSTRAINT PK_SICEE_D_TIPO_IMPIANTO_2015 PRIMARY KEY (
              ID_TIPO_IMPIANTO) ) ;
              
              
              
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 0, 'Caldaia standard ');
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 1, 'Caldaia a condensazione'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 2, 'Stufa o caminetto'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 3, 'Riscaldamento elettrico'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 4, 'HP elettrica aria-aria'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 5, 'HP elettrica aria-acqua'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 6, 'HP elettrica acqua-aria'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 7, 'HP elettrica acqua-acqua'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 8, 'HP ad assorbimento aria-aria'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 9, 'HP ad assorbimento aria-acqua'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 10, 'HP ad assorbimento acqua-aria'); 


INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 11, 'HP ad assorbimento acqua-acqua'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 12, 'HP a motore endotermico aria-aria'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 13, 'HP a motore endotermico aria-acqua'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 14, 'HP a motore endotermico acqua-aria'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 15, 'HP a motore endotermico acqua-acqua'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 16, 'Impianto solare termico'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 17, 'Impianto fotovoltaico'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 18, 'Cogeneratore'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 19, 'Teleriscaldamento'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 20, 'Eolico'); 

INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 21, 'Ventilatori'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 22, 'Lampade ad incandescenza'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 23, 'Lampade fluorescenti'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 24, 'Lampade a led'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 25, 'Lampade a scarica'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 26, 'Ascensore a motore elettrico a fune con contrappeso'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 27, 'Ascensore a motore elettrico a fune con argano agganciato'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 28, 'Ascensore idraulico'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 29, 'Scala mobile'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 30, 'Marciapiede mobile'); 

INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 31, 'Altro'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 32, 'Scalda-acqua autonomo istantaneo a gas'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 33, 'Scalda-acqua autonomo ad accumulo a gas'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 34, 'Scalda-acqua autonomo a pompa di calore'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 35, 'Scaldacqua a pompa di calore'); 
INSERT INTO SICEE_D_TIPO_IMPIANTO_2015 (ID_TIPO_IMPIANTO, DESCR) VALUES ( 36, 'Boiler elettrico'); 

commit;
                      
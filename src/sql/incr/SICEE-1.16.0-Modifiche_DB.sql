/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/
-----------------------------------------------------------------------------------------
-- 31/05/2017 - Modifiche (richieste via mail da Mariuccia) ed eseguite in svi 
-- In seguito in test
-- Per rilascio di Giugno
-----------------------------------------------------------------------------------------

CREATE TABLE SICEE_T_IMPORT_DATI_LOG_2015 (
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       TIMESTAMP            DATE NOT NULL,
       PASSO_VALIDAZIONE    INTEGER NULL,
       MESSAGGIO_ERRORE     VARCHAR2(500) NULL
);

COMMENT ON COLUMN SICEE_T_IMPORT_DATI_LOG_2015.PASSO_VALIDAZIONE IS '1--> validazione1 
2--> validazione2
3 --> validazione3 
4 --> cntrolli formali sul contenuto';

ALTER TABLE SICEE_T_IMPORT_DATI_LOG_2015
       ADD  CONSTRAINT PK_SICEE_T_IMPORT_DATI_LOG_201 PRIMARY KEY (
              ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, TIMESTAMP) ;


ALTER TABLE SICEE_T_IMPORT_DATI_LOG_2015
       ADD  CONSTRAINT FK_SICEE_T_CERTIFICATO_35
              FOREIGN KEY (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO)
                             REFERENCES SICEE_T_CERTIFICATO ;
                             
GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_IMPORT_DATI_LOG_2015 TO SICEE_RW;



-----------------------------------------------------------------------------------------
-- 17/05/2017 - Modifiche (richieste via mail da Mariuccia) ed eseguite in svi e tst
-----------------------------------------------------------------------------------------

ALTER TABLE SICEE.SICEE_T_DATI_XML_2015
 ADD (GRADI_GIORNO  INTEGER);

ALTER TABLE SICEE.SICEE_T_DATI_XML_2015
 ADD (DT_SOPRALLUOGO  DATE);

ALTER TABLE SICEE.SICEE_T_DATI_XML_2015
 ADD (SW_UTILIZZATO  VARCHAR2(100));

ALTER TABLE SICEE.SICEE_T_DATI_XML_2015
 ADD (NUM_CERTIF_SW  INTEGER);



-----------------------------------------------------------------------------------------
-- Grant che andava assegnato lo scorso rilascio. Visto che l'applicativo non usa la tbl, 
-- SICEE_D_TIPO_IMPIANTO_2015, il grant può essere inserito in questo rilascio. 
-----------------------------------------------------------------------------------------
GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_D_TIPO_IMPIANTO_2015 TO SICEE_RW; 


-----------------------------------------------------------------------------------------
-- 28/04/2017 - Modifiche richiesta da Actis via mail ed eseguite in sviluppo.
-- Inviata mail. 
-- In seguito in test
-----------------------------------------------------------------------------------------
CREATE TABLE SICEE_D_TIPO_AZIONE (
       ID_TIPO_AZIONE       INTEGER NOT NULL,
       DESCR                VARCHAR2(50) NULL
);

ALTER TABLE SICEE_D_TIPO_AZIONE
       ADD   CONSTRAINT PK_SICEE_D_TIPO_AZIONE PRIMARY KEY (ID_TIPO_AZIONE)  ;

GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_D_TIPO_AZIONE TO SICEE_RW; 



CREATE TABLE SICEE_T_SIAPE (
       ID_CERTIFICATORE     VARCHAR2(5) NOT NULL,
       PROGR_CERTIFICATO    VARCHAR2(4) NOT NULL,
       ANNO                 VARCHAR2(4) NOT NULL,
       ID_TIPO_AZIONE       INTEGER NOT NULL
);

ALTER TABLE SICEE_T_SIAPE
       ADD   CONSTRAINT PK_SICEE_T_SIAPE PRIMARY KEY (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO, 
              ID_TIPO_AZIONE)  ;

GRANT DELETE, INSERT, SELECT, UPDATE ON SICEE_T_SIAPE TO SICEE_RW; 



ALTER TABLE SICEE_T_SIAPE
       ADD CONSTRAINT FK_SICEE_D_TIPO_AZIONE_01 
              FOREIGN KEY (ID_TIPO_AZIONE)
                             REFERENCES SICEE_D_TIPO_AZIONE  ;

ALTER TABLE SICEE_T_SIAPE
       ADD  CONSTRAINT FK_SICEE_T_CERTIFICATO_50
              FOREIGN KEY (ID_CERTIFICATORE, PROGR_CERTIFICATO, ANNO)
                             REFERENCES SICEE_T_CERTIFICATO  ;





-----------------------------------------------------------------------------------------
-- 11/04/2017 - Modifiche richiesta da Actis a voce ed eseguite in sviluppo.
-- Inviata mail. 
-- In seguito in test
-----------------------------------------------------------------------------------------
ALTER TABLE SICEE.SICEE_D_RIQ_ENER_2015 ADD (ID_XML  NUMBER(1));

ALTER TABLE SICEE.SICEE_T_DET_IMP_2015 ADD (FK_TIPO_IMPIANTO  NUMBER(3));

ALTER TABLE SICEE_T_DET_IMP_2015 ADD CONSTRAINT FK_SICEE_D_TIPO_IMPI_2015_01
           FOREIGN KEY (FK_TIPO_IMPIANTO) REFERENCES SICEE_D_TIPO_IMPIANTO_2015  ;


ALTER TABLE SICEE_T_DATI_ENER_2015 ADD  FLG_SMILE_INVERNO NUMBER(1) CONSTRAINT DOM_0_1_25
        CHECK (FLG_SMILE_INVERNO IN (0,1,2));
        
ALTER TABLE SICEE_T_DATI_ENER_2015 ADD  FLG_SMILE_ESTATE  NUMBER(1) CONSTRAINT DOM_0_1_26
        CHECK (FLG_SMILE_ESTATE IN (0,1,2));
        
ALTER TABLE SICEE_T_DATI_ENER_2015 ADD  RAPPORTO_SV NUMBER(14,4);

COMMENT ON COLUMN SICEE_T_DATI_ENER_2015.FLG_SMILE_INVERNO IS '0=SORRIDENTE 1=MEDIA 2=TRISTE';
COMMENT ON COLUMN SICEE_T_DATI_ENER_2015.FLG_SMILE_ESTATE IS '0=SORRIDENTE 1=MEDIA 2=TRISTE';




/* verificare che siano andate a buon fine le seguenti insert
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

*/
/*******************************************************************************
 * SPDX-License-Identifier: EUPL-1.2
 * Copyright Regione Piemonte - 2020
 *******************************************************************************/

Insert into SICEE.SICEE_D_STATO_FILE
   (ID_STATO_FILE, DESCR)
 Values
   (1, 'VERIFICATO');
Insert into SICEE.SICEE_D_STATO_FILE
   (ID_STATO_FILE, DESCR)
 Values
   (2, 'SCARTATO');
Insert into SICEE.SICEE_D_STATO_FILE
   (ID_STATO_FILE, DESCR)
 Values
   (3, 'DA VERIFICARE');
COMMIT;


Insert into SICEE.SICEE_T_PARAMETRI
   (CODICE, VALORE)
 Values
   ('PULSANTE_IMPORTA', 'S');
Insert into SICEE.SICEE_T_PARAMETRI
   (CODICE, VALORE)
 Values
   ('ERROR_CODE_2', 'Attenzione!Il file è corrotto o danneggiato');
Insert into SICEE.SICEE_T_PARAMETRI
   (CODICE, VALORE)
 Values
   ('ERROR_CODE_7', 'Attenzione!Il certificato è stato revocato');
Insert into SICEE.SICEE_T_PARAMETRI
   (CODICE, VALORE)
 Values
   ('ERROR_CODE_6', 'Il file è stato inviato correttamente');
Insert into SICEE.SICEE_T_PARAMETRI
   (CODICE, VALORE)
 Values
   ('ERROR_CODE_5', 'Attenzione!L''ente certificatore non è accreditato presso CNIPA');
Insert into SICEE.SICEE_T_PARAMETRI
   (CODICE, VALORE)
 Values
   ('ERROR_CODE_4', 'Attenzione!Icertificato non risulta valido');
Insert into SICEE.SICEE_T_PARAMETRI
   (CODICE, VALORE)
 Values
   ('ERROR_CODE_3', 'Attenzione!file non è stato generato correttamente');
Insert into SICEE.SICEE_T_PARAMETRI
   (CODICE, VALORE)
 Values
   ('ERROR_CODE_1', 'Attenzione!file è corrotto o danneggiato');
Insert into SICEE.SICEE_T_PARAMETRI
   (CODICE, VALORE)
 Values
   ('ERROR_CODE_0', 'Il file è stato inviato correttamente');
Insert into SICEE.SICEE_T_PARAMETRI
   (CODICE, VALORE)
 Values
   ('ERROR_CODE_91', 'Attenzione!Il file non è stato firmato');
Insert into SICEE.SICEE_T_PARAMETRI
   (CODICE, VALORE)
 Values
   ('ERROR_CODE_92', 'Attenzione!Il file non è stato firmato correttamente con estensione .p7m');
Insert into SICEE.SICEE_T_PARAMETRI
   (CODICE, VALORE)
 Values
   ('ERROR_CODE_93', 'Attenzione!Il file non è stato firmato con una firma semplice');
COMMIT;


Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('indirizzoAce', 'datiAnagraficiImm.dtCatastali.descrIndirizzo');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('civicoAce', 'datiAnagraficiImm.dtCatastali.numCiv');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('capAce', 'datiAnagraficiImm.dtCatastali.cap');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('sezione', 'datiAnagraficiImm.dtCatastali.sezione');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('foglio', 'datiAnagraficiImm.dtCatastali.foglio');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('particella', 'datiAnagraficiImm.dtCatastali.particella');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('subalterno', 'datiAnagraficiImm.dtCatastali.subalterno');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('piano', 'datiAnagraficiImm.dtCatastali.piano');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('pianiTotali', 'datiAnagraficiImm.dtCatastali.pianiTot');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('numeroAppartamenti', 'datiAnagraficiImm.dtCatastali.numUnita');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('scala', 'datiAnagraficiImm.dtCatastali.scala');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('interno', 'datiAnagraficiImm.dtCatastali.interno');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('noteAce', 'datiAnagraficiImm.dtCatastali.note');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('nomeCoCertificatore', 'datiAnagraficiImm.dtCoCertificatore.nome');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('cognomeCoCertificatore', 'datiAnagraficiImm.dtCoCertificatore.cognome');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('matricolaCoCertificatore', 'datiAnagraficiImm.dtCoCertificatore.numMatricola');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('destinazioneUso', 'datiTecnici.destUso');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('edificioPubblico', 'datiTecnici.flagUsoPubblico');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('annoCostruzione', 'datiTecnici.annoCostr');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('annoUltimaRistrutturazione', 'datiTecnici.annoUltimaRistrutt');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('tipologiaEdificio', 'datiTecnici.tipologiaEdificio');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('volumeLordoRiscaldato', 'datiTecnici.volLordoRiscald');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('superficieDisperdenteTot', 'datiTecnici.supDispTot');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('fattoreForma', 'datiTecnici.fattoreForma');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('trasmittanzaSupOpache', 'datiTecnici.trasmittanzaOpache');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('trasmittanzaSupTrasparenti', 'datiTecnici.trasmittanzaTrasp');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('zonaClimatica', 'datiAnagraficiImm.dtCatastali.zonaClimatica');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('gradiGiorno', 'datiAnagraficiImm.dtCatastali.gradiGiorno');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('superficieUtile', 'datiTecnici.superficieUtile');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('fabbisognoEnergiaUtileIdeale', 'indFabbisogno.domEnergRiscald');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('limNormativoRegionale', 'indFabbisogno.limNormRegione');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('fabbisognoEnergiaUtileAcs', 'indFabbisogno.domEnergAcqua');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('fabbisognoEnergiaUtileAcsFontiRinno', 'indFabbisogno.energTermAcquaRinnov');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('rendimentoMedioGlobaleStagioneAcsEtagacs', 'indFabbisogno.rendGlobStagioneAcqua');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('indicePrestazioneEnergAcsEpacs', 'indFabbisogno.indPrestEnergAcqua');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('rendimentoGenerazione', 'classeEnerg.locReale.rendGeneraz');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('rendimentoRegolazione', 'classeEnerg.locReale.rendRegolaz');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('rendimentoEmissione', 'classeEnerg.locReale.rendEmissione');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('rendimentoDistribuzione', 'classeEnerg.locReale.rendDistrib');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('rendimentoMedioGlobaleImpiantoTermicoEtag', 'classeEnerg.locReale.rendGlobTermico');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('indicePrestazioneEnergRiscaldamentoEpi', 'classeEnerg.locReale.indPrestEnergRiscald');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('indicePrestazioneEnergGlobaleEplordo', 'classeEnerg.locReale.indPrestEnergGlob');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('fabbisognoEnergiaUtileIdealeTorino', 'classeEnerg.locTeorica.domEnergRiscald');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('limiteNormativaRegionaleTorino', 'classeEnerg.locTeorica.limNormaRegione');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('indicePrestazioneEnergRiscaldamentoEpiTorino', 'classeEnerg.locTeorica.indPrestEnergRiscald');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('fabbisognoEnergiaUtileAcsTorino', 'classeEnerg.locTeorica.domEnergAcqua');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('fabbisognoEnergiaUtileAcsFontiRinnoTorino', 'classeEnerg.locTeorica.energTermAcquaRinnov');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('rendimentoMedioGlobaleAcsEtagAcsTorino', 'classeEnerg.locTeorica.rendGlobStagioneAcqua');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('indicePrestazioneEnergAcsEpacsTorino', 'classeEnerg.locTeorica.indPrestEnergAcqua');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('indicePrestazioneEnergGlobaleEplordoTorino', 'classeEnerg.locTeorica.indPrestEnergGlob');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('codiceClasseEnergica', 'classeEnerg.locTeorica.classeEnerg');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('motivazioneRilascio', 'altreInfo.generali.motivoRilascio');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('metodologiaCalcoloAdottata', 'altreInfo.generali.metodoCalcolo');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('softwareUtilizzato', 'altreInfo.generali.software');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('denominazioneProduttore', 'altreInfo.generali.denomProduttore');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('rispondenzaUNITS11300', 'altreInfo.generali.rispondenzaUNITS11300');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('classeEnergGlobaleNazionaleEdificio', 'altreInfo.energetiche.classeEnergEdificio');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('indicePrestazioneEnergRaggiungibile', 'altreInfo.energetiche.prestEnergRaggiungibile');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('indicePrestazioneEnergRiscaldamentoNazionaleEpiNaz', 'altreInfo.energetiche.indPrestEnergRiscald');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('limiteNormativoNazionaleRiscaldamento', 'altreInfo.energetiche.limNormaNazRiscald');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('qualitaTermicaEstivaEdificio', 'altreInfo.energetiche.qualitaInvolucroRaffresc');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('limiteNormativoRegionaleImpiantoTermico', 'impianti.riscaldamento.limNormRegImpTerm');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('coefficientePrestazionePompaCalore', 'altreInfo.energetiche.prestazPompaCalore');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('limiteNormativoPrestazionePompa', 'altreInfo.energetiche.limNormaPrestPompa');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('altreInformazioniEnergetiche', 'altreInfo.energetiche.altreInfo');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('dataSopralluogo', 'altreInfo.sopralluoghi.data');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('noteSopralluogo', 'altreInfo.sopralluoghi.note');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('datiRedazioneSopralluogo', 'altreInfo.sopralluoghi.tipoRedazione');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('dataRichiestaTitoloAbilitativoCostrRistr', 'rispNorme.dataTitolo');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('rispettoObblighiNormativi', 'rispNorme.autorizzato');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('motivoNonConformita', 'rispNorme.motivoNonConformita');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('noteNormativa', 'rispNorme.note');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('bollinoImpianto', 'impianti.riscaldamento.flgBollino');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('numeroBollinoImpianto', 'impianti.riscaldamento.numBollino');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('codiceImpianto', 'impianti.riscaldamento.codImpianto');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('annoInstallazioneGeneratoreRiscaldamento', 'impianti.riscaldamento.annoInstallGeneratore');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('limiteNormativoRegionaleImpiantoTermico', 'impianti.riscaldamento.limNormRegImpTerm');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('potenzaNominaleComplessivaRiscaldamento', 'impianti.riscaldamento.potNomCompl');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('classeEfficienzaEnergeticaRiscaldamento', 'impianti.riscaldamento.classeEfficienzaEnerg');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('fonteEnergeticaUtilizzataRiscaldamento', 'impianti.riscaldamento.combustibileFossile');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('unitaImmobiliariServite', 'impianti.uiServite');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('contabilizzazioneRipartizione', 'impianti.flgRipartizione');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('tipoImpianto', 'impianti.tipoImpianto');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('tipoTerminaliErogazione', 'impianti.tipoTermErogaz');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('tipoDistribuzione', 'impianti.tipoDistrib');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('tipoRegolazione', 'impianti.tipoRegolaz');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('annoInstallazioneGeneratoreAcs', 'impianti.acqua.annoInstallGeneratore');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('potenzaNominaleComplessivaAcs', 'impianti.acqua.potNomCompl');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('indicePrestazioneEnergGlobaleLimiteTorino', 'classeEnerg.locTeorica.indGlobLimiteTo');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('classeEfficienzaEnergeticaAcs', 'impianti.acqua.classeEfficienzaEnerg');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('fonteEnergeticaUtilizzataAcs', 'impianti.acqua.combustibileFossile');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('emissioniGasSerra', 'gasSerra.emissioniGasSerra');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('superficieBoscoEquivalente', 'gasSerra.supBoscoEquiv');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('annualeTermicoFossile', 'consumiReali.annoTermicoFossile');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('annualeElettricoFossile', 'consumiReali.annoElettricoFossile');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('annualeTermicoFontiRinnovabili', 'consumiReali.annoTermicoRinnov');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('annualeElettricoFontiRinnovabili', 'consumiReali.annoElettricoRinnov');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('medioComplessivoTermico', 'consumiReali.medioTermico');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('medioComplessivoElettrico', 'consumiReali.medioElettrico');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('tecnologieUsoFontiRinnovabili', 'energRinnov.techFontiRinnov');
COMMIT;
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('annoInstallazione', 'energRinnov.annoInstall');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('energiaTermicaProdotta', 'energRinnov.energTermicaProdotta');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('energiaElettricaProdotta', 'energRinnov.energElettricaProdotta');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('autoconsumoTermico', 'energRinnov.autoconsumoTermico');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('autoconsumoElettrico', 'energRinnov.autoconsumoElettrico');
Insert into SICEE.SICEE_D_MAPPING_XML
   (CAMPO_XML, CAMPO_WEB)
 Values
   ('quotaEnergiaCopertaFontiRinnovabili', 'energRinnov.percEnergiaFontiRinnov');
COMMIT;

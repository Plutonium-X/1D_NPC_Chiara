////////////////////////////////////////////////////////////////////////
//Einmischung bei Aegisfeld (Br�ckenviertel)
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS INSPECT 13 MalthisAegisfeld1 // Statement von Matlhis bei Aegisfeld/Br�ckenviertel
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    @0
  == INSPECT IF ~IsValidForPartyDialogue("Malt")~ THEN 
    @1
  == KorganJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    @2 
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Einmischung Bettler (Docks) -->DBEGGAR2!!
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS DBEGGAR2 1 MalthisBettler1 // Statement von Matlhis beim Bettler/Docks
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    @3
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Einmischung Bettler (Docks) -->DBEGGAR2, die Zweite!!
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS DBEGGAR2 7 MalthisBettler2 // Statement von Matlhis beim Bettler/Docks
  == MaltJ   IF ~IsValidForPartyDialogue("Malt") Global("MalthisBettler1","GLOBAL",1)~ THEN 
    @4
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Einmischung bei Hehler (Br�ckenviertel)
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS DMARK1 15 MalthisHehler1 // Statement von Matlhis bei Hehler/Br�ckenviertel
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    @5
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Aussage von Malthis am Lebensbaum (gut)
////////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM PLAYER1 33 // Lebenbaumcheck
  IF ~InParty("Malt")~ 
    THEN EXTERN PLAYER1 LebensbaumMalt
END

APPEND PLAYER1 
  IF ~~ THEN BEGIN LebensbaumMalt
    SAY @6
    IF ~~ THEN REPLY @7 EXTERN MaltJ Leben_1
    IF ~~ THEN REPLY @8 EXTERN MaltJ Leben_2
  END
END

APPEND MaltJ
  IF ~~ THEN BEGIN Leben_1
    SAY @9 
    COPY_TRANS PLAYER1 33
  END
  IF ~~ THEN BEGIN Leben_2
    SAY @10
    COPY_TRANS PLAYER1 33
  END
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Einmischung beim Schattendrachen (AR1402)
////////////////////////////////////////////////////////////////////////
APPEND MaltJ
  IF ~InParty(Myself)
AreaCheck("AR1402")
PartyHasItem("MISC6P") // Schattendrachen-Schutzstein
Global("Malt_Schattendrache","LOCALS",0)
See(Player1)
!StateCheck(Player1,STATE_SLEEPING)~ THEN BEGIN Malt_Schattendrache
   SAY @11
   IF ~~ THEN DO ~SetGlobal("Malt_Schattendrache","LOCALS",1)~ EXIT
  END
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Einmischung bei Valygar und Tolgerias
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//APPEND MaltJ
//  IF ~~ THEN BEGIN MaltValygar1
//    SAY ~Auch wenn es sinnlos sein sollte gegen euch zu k�mpfen! Wir werden Valygar nicht Euch �berlassen. Lasst uns den t�dlichen Tanz tanzen.~
//        IF ~~ THEN EXTERN ~TOLGER2~ 3
//    END
//END
//
//EXTEND_TOP ValygarJ 3
//  IF ~IsValidForPartyDialog("Malt)~ THEN BEGIN Malt_Valygar_Tolgerias
//    SAY ~Auch wenn es sinnlos sein sollte gegen euch zu k�mpfen! Wir werden Valygar nicht Euch �berlassen. Lasst uns den t�dlichen Tanz tanzen.~
//    IF ~~ THEN EXTERN ~MaltJ~ MaltValygar1
//  END
//END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Einmischung bei Adalon (Ar2102)
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS UDSILVER 9 MalthisAdalon1 // Statement von Matlhis beim Silberdrachen
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    @12
  == KeldorJ IF ~!IsValidForPartyDialogue("Anomen") IsValidForPartyDialogue("Malt")~ THEN
    @13
  == AnomenJ  IF ~!IsValidForPartyDialogue("Keldorn") IsValidForPartyDialogue("Malt")~ THEN
    @14
  == MaltJ IF ~IsValidForPartyDialogue("Malt")~  THEN
    @15
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Statement bei der Drowverwandlung (AR2102)
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
APPEND MaltJ
  IF ~InParty(Myself)
AreaCheck("AR2102")
Global("PlayerLooksLikeDrow","GLOBAL",1)
See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
Global("Malt_Drowverwandlung","LOCALS",0)~ THEN BEGIN Malt_Drowverwandlung
   SAY @16
   IF ~~ THEN DO ~SetGlobal("Malt_Drowverwandlung","LOCALS",1)~ EXIT
  END
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Kommentar zu Bodhi (erste Begegnung auf dem Friedhof, AR0800)
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS BODHI 2 MalthisBodhi1 // Statement von Matlhis bei Bodhi
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    @17
  == Bodhi IF ~IsValidForPartyDialogue("Malt") Dead("MKern") Dead("MDindal") ~ THEN
    @18
  == Bodhi IF ~IsValidForPartyDialogue("Malt") !Dead("MKern") !Dead("MDindal") ~ THEN
    @19
  == MaltJ IF ~IsValidForPartyDialogue("Malt")~ THEN 
    @20
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Kommentar zur H�lle ()
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
EXTEND_BOTTOM PLAYER1 25 // 
  IF ~InParty("Malt")~ 
    THEN EXTERN MALTJ Malt_HoelleKommentarCOPY1
END

APPEND MaltJ
  IF ~~ THEN BEGIN Malt_HoelleKommentarCOPY1
     SAY @21
     COPY_TRANS PLAYER1 25
  END
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Kommentar zu Bodhi 2 (erste Gegegnung auf dem Friedhof, AR0800)-->Nicht Funktionst�chtig!!
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//EXTEND_BOTTOM BODHI 21 // Malthis-Check bei Bodhi
//  IF ~InParty("Malt")~ 
//    THEN EXTERN MALTJ Malt_BodhiKommentarCOPY1
//END
//
//APPEND MaltJ
//  IF ~~ THEN BEGIN Malt_BodhiKommentarCOPY1
//     SAY @23
//  END
//END
//
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Kommentar zur Maevar ()
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
EXTEND_BOTTOM MAEVAR 16// Malthis-Check bei Maevar
  IF ~InParty("Malt")~ 
    THEN EXTERN MALTJ Malt_MaevarKommentarCOPY1
END

APPEND MALTJ
  IF ~~ THEN BEGIN Malt_MaevarKommentarCOPY1
     SAY @22
     COPY_TRANS MAEVAR 16
  END
END

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Kommentar zu Bodhi 2 (nach Ablehnung, AR0800)-->
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
APPEND MALTJ
  IF ~InParty(Myself)
AreaCheck("AR0800")	
Global("BodhiAppear","GLOBAL",3)
See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
CombatCounter(0)
Global("Malt_BodhiState1","LOCALS",0)~ THEN BEGIN Malt_BodhiStatement1
   SAY @23
   IF ~~ THEN DO ~SetGlobal("Malt_BodhiState1","LOCALS",1)~ EXIT
  END
END 	
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Kommentar zu Renal -->
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS RENAL 5 MalthisRenal1 // Statement von Matlhis bei Renal
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    @24 
  == RENAL   IF ~!InParty("Yoshimo") IsValidForPartyDialogue("Malt")~ THEN 
    @25
  == RENAL   IF ~InParty("Yoshimo") IsValidForPartyDialogue("Malt")~ THEN 
    @26 
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Kommentar zum verr�ckten Kleriker --> Docks
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS DCLERIC 1 MalthisKleriker1 // Statement von Matlhis 
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    @27
  == DCLERIC IF ~IsValidForPartyDialogue("Malt")~ THEN 
    @28
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    @29
END

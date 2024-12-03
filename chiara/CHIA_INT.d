/////////////////////////////
//Chiara: Dialoge mit anderen Spieler-Charakteren
////////////////////////////
BEGIN V#ChiaB


//Banter mit Aerie -->Start: Aerie
/////////////////////////////////////////////////////////////////////////////////////////
CHAIN
  IF ~Global("Aerie_Chiara","LOCALS",0)
      InParty("V#Chiara")
      See("V#Chiara")
      !StateCheck("V#Chiara",STATE_SLEEPING)~ THEN AerieJ AerieChiarachain
  @0
DO ~SetGlobal("Aerie_Chiara","LOCALS",1)~
  == V#ChiaB
    @1
  == AerieJ
    @2
  == V#ChiaB
    @3
EXIT
/////////////////////////////////////////////////////////////////////////////////////////


//Banter mit Edwin -->Start: Edwin
/////////////////////////////////////////////////////////////////////////////////////////
CHAIN
  IF ~Global("Edwin_Chiara","LOCALS",0)
      InParty("V#Chiara")
      See("V#Chiara")
      !StateCheck("V#Chiara",STATE_SLEEPING)~ THEN EDWINJ EdwinChiarachain
  @4
DO ~SetGlobal("Edwin_Chiara","LOCALS",1)~
  == V#ChiaB
    @5
  == EDWINJ
    @6
EXIT
/////////////////////////////////////////////////////////////////////////////////////////


//Banter mit Jan-->Start: Jan
/////////////////////////////////////////////////////////////////////////////////////////
CHAIN
  IF ~Global("Jan_Chiara","LOCALS",0)
      InParty("V#Chiara")
      See("V#Chiara")
      !StateCheck("V#Chiara",STATE_SLEEPING)~ THEN JanJ JanChiarachain
  @7
DO ~SetGlobal("Jan_Chiara","LOCALS",1)~
  == V#ChiaB
    @8
  == JanJ
    @9
  == V#ChiaB
    @10
   == JanJ
      @11
  == V#ChiaB
      @12
EXIT
/////////////////////////////////////////////////////////////////////////////////////////


//Banter mit Jan-->Start: Jan (2)
/////////////////////////////////////////////////////////////////////////////////////////
CHAIN
  IF ~Global("Jan_Chiara","LOCALS",1)
      InParty("V#Chiara")
      See("V#Chiara")
      !StateCheck("V#Chiara",STATE_SLEEPING)~ THEN JanJ JanChiara2chain
  @13
DO ~SetGlobal("Jan_Chiara","LOCALS",2)~
  == V#ChiaB
    @14
  == JanJ
    @15
  == V#ChiaB
    @16
   == JanJ
    @17
  == V#ChiaB
    @18
EXIT
/////////////////////////////////////////////////////////////////////////////////////////

//Banter mit Anomen-->Start: Anomen (2)
/////////////////////////////////////////////////////////////////////////////////////////
CHAIN
  IF ~Global("Anomen_Chiara","LOCALS",1)
      InParty("V#Chiara")
      See("V#Chiara")
      !StateCheck("V#Chiara",STATE_SLEEPING)~ THEN AnomenJ AnomenChiarachain
  @19
DO ~SetGlobal("Anomen_Chiara","LOCALS",2)~
  == V#ChiaB
    @20
  == AnomenJ
    @21
  == V#ChiaB
    @22
EXIT
/////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////
//Aussage von Chiara am Lebensbaum 
////////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM PLAYER1 33 // Lebenbaumcheck
  IF ~InParty("V#Chiara")~ 
    THEN EXTERN PLAYER1 LebensbaumChiara
END

APPEND PLAYER1 
  IF ~~ THEN BEGIN LebensbaumChiara
    SAY @23
    IF ~~ THEN REPLY @24 EXTERN V#ChiaJ Leben_1
    IF ~~ THEN REPLY @25 EXTERN V#ChiaJ Leben_2
  END
END

APPEND V#ChiaJ
  IF ~~ THEN BEGIN Leben_1
    SAY @26 
    COPY_TRANS PLAYER1 33
  END
  IF ~~ THEN BEGIN Leben_2
    SAY @27
    COPY_TRANS PLAYER1 33
  END
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////


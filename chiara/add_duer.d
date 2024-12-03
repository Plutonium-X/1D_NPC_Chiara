
EXTEND_BOTTOM UDDUER01 10
IF ~InParty("V#Chiara") IsGabber("V#Chiara")~ THEN REPLY @1 GOTO V#add1
IF ~InParty("V#Chiara") !IsGabber("V#Chiara")~ THEN REPLY @1 GOTO V#add2
END

EXTEND_BOTTOM UDDUER01 12
IF ~InParty("V#Chiara") IsGabber("V#Chiara")~ THEN REPLY @1 GOTO V#add1
IF ~InParty("V#Chiara") !IsGabber("V#Chiara")~ THEN REPLY @1 GOTO V#add2
END

EXTEND_BOTTOM UDDUER01 15
IF ~InParty("V#Chiara") IsGabber("V#Chiara")~ THEN REPLY @1 GOTO V#add1
IF ~InParty("V#Chiara") !IsGabber("V#Chiara")~ THEN REPLY @1 GOTO V#add2
END

APPEND UDDUER01

IF ~~ THEN BEGIN V#add1
   SAY @2
       IF ~~ THEN REPLY @3 GOTO V#add3
       IF ~~ THEN REPLY @4 GOTO V#add4
END

IF ~~ THEN BEGIN V#add2
   SAY @2
       IF ~~ THEN REPLY @7 GOTO V#add5
       IF ~~ THEN REPLY @9 GOTO V#add4
END

IF ~~ THEN BEGIN V#add3
   SAY @5
       IF ~~ THEN DO ~StartStore("V#Duer",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN V#add4
   SAY @6
       IF ~~ THEN DO ~StartStore("V#Duer",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN V#add5
   SAY @8
       IF ~~ THEN DO ~StartStore("V#Duer",LastTalkedToBy(Myself))~ EXIT
END

END

BEGIN ~V#Guard~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN V#guard1a
   SAY @1
       IF ~~ THEN GOTO V#guard1b
END

IF ~~ THEN BEGIN V#guard1b
   SAY @2
       IF ~~ THEN REPLY @3 GOTO V#guard2a
       IF ~~ THEN REPLY @12 DO ~SetGlobal("V#AuftrErfahren","GLOBAL",1)~ GOTO V#guard2b
       IF ~~ THEN REPLY @13 GOTO V#guard4c
END

IF ~NumTimesTalkedToGT(0) Global("V#gesucht","GLOBAL",0)~ THEN BEGIN V#guard1c
   SAY @14
       IF ~~ THEN REPLY @15 DO ~SetGlobal("V#AuftrErfahren","GLOBAL",1)~ GOTO V#guard2b
       IF ~Global("V#AuftrErfahren","GLOBAL",1) Global("V#gesucht","GLOBAL",0)~ THEN REPLY @16 GOTO V#guard3
       IF ~~ THEN REPLY @17 GOTO V#guard4c
END

IF ~NumTimesTalkedToGT(0) Global("V#gesucht","GLOBAL",1) !InParty("V#Chiara")~ THEN BEGIN V#guard1d
   SAY @18
       IF ~Dead("V#Chiara")~ THEN REPLY @19 GOTO V#guard4a
       IF ~~ THEN REPLY @20 GOTO V#guard4b
       IF ~~ THEN REPLY @21 GOTO V#guard4c
END

IF ~NumTimesTalkedToGT(0) Global("V#gesucht","GLOBAL",1) InParty("V#Chiara") Global("V#ChiaraWolf","GLOBAL",1)~ THEN BEGIN V#guard1d
   SAY @18
       IF ~Dead("V#Chiara")~ THEN REPLY @19 GOTO V#guard4a
       IF ~~ THEN REPLY @20 GOTO V#guard4b
       IF ~~ THEN REPLY @21 GOTO V#guard4c
END

IF ~InParty("V#Chiara") Global("V#ChiaraWolf","GLOBAL",0)~ THEN BEGIN V#guard1e
   SAY @26
       IF ~~ THEN DO ~SetGlobal("V#gesucht","Global",0) EscapeArea()~ EXTERN V#Chiara KommentarZurWache
END

IF ~~ THEN BEGIN V#guard2a
   SAY @4
       IF ~~ THEN REPLY @5 DO ~SetGlobal("V#AuftrErfahren","GLOBAL",1)~ GOTO V#guard2b
       IF ~~ THEN REPLY @11 GOTO V#guard4c
END

IF ~~ THEN BEGIN V#guard2b
   SAY @6
       IF ~~ THEN REPLY @8 DO ~SetGlobal("V#gesucht","GLOBAL",1)~ GOTO V#guard3
       IF ~~ THEN REPLY @9 GOTO V#guard4c
END

IF ~~ THEN BEGIN V#guard3
   SAY @7
       IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN V#guard4a
   SAY @25
       IF ~~ THEN DO ~ReputationInc(1) EscapeArea() AddexperienceParty(3000)~ EXIT
END

IF ~~ THEN BEGIN V#guard4b
   SAY @22
       IF ~~ THEN REPLY @23 EXIT
       IF ~~ THEN REPLY @24 GOTO V#guard4c
END

IF ~~ THEN BEGIN V#guard4c
   SAY @10
       IF ~~ THEN DO ~SetGlobal("V#gesucht","GLOBAL",0)~ EXIT
END

APPEND V#Chiara

IF ~~ THEN BEGIN KommentarZurWache
   SAY @27
       IF ~~ THEN EXIT
END

END

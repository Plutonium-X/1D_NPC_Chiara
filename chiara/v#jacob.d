BEGIN ~V#Jacob~

IF ~NumTimesTalkedTo(0) Global("V#JoinedParty","GLOBAL",0) Global("V#KickedOut","GLOBAL",0)~ THEN BEGIN V#Jacob1a
   SAY @1
       IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(0) !IsGabber("V#Chiara") Global("V#JoinedParty","GLOBAL",1)~ THEN BEGIN V#Jacob1b
   SAY @2 = @3
       IF ~~ THEN REPLY @4 GOTO V#Jacob2a
       IF ~~ THEN REPLY @5 GOTO V#Jacob2b
       IF ~~ THEN REPLY @6 GOTO V#Jacob2c
END

IF ~NumTimesTalkedToGT(0) !IsGabber("V#Chiara") Global("V#JoinedParty","GLOBAL",1)~ THEN BEGIN V#Jacob1bb
   SAY @7 = @3
       IF ~~ THEN REPLY @4 GOTO V#Jacob2a
       IF ~~ THEN REPLY @5 GOTO V#Jacob2b
       IF ~~ THEN REPLY @6 GOTO V#Jacob2c
END

IF ~NumTimesTalkedTo(0) IsGabber("V#Chiara") Global("V#JoinedParty","GLOBAL",1)~ THEN BEGIN V#Jacob1c
   SAY @15 = @16
       IF ~~ THEN REPLY @18 GOTO V#Jacob2c
       IF ~~ THEN REPLY @4 GOTO V#Jacob2d
       IF ~~ THEN REPLY @5 GOTO V#Jacob2e
END

IF ~NumTimesTalkedToGT(0) IsGabber("V#Chiara") Global("V#JoinedParty","GLOBAL",1)~ THEN BEGIN V#Jacob1c
   SAY @17 = @16
       IF ~~ THEN REPLY @18 GOTO V#Jacob2c
       IF ~~ THEN REPLY @4 GOTO V#Jacob2d
       IF ~~ THEN REPLY @5 GOTO V#Jacob2e
END

IF ~NumTimesTalkedToGT(0) Global("V#JoinedParty","GLOBAL",0) Global("V#KickedOut","GLOBAL",0)~ THEN BEGIN V#Jacob1d
   SAY @8
       IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0) Global("V#JoinedParty","GLOBAL",0) Global("V#KickedOut","GLOBAL",1)~ THEN BEGIN V#Jacob1e
   SAY @9
       IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN V#Jacob2a
   SAY @10
       IF ~~ THEN DO ~StartStore("V#Jacob",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN V#Jacob2b
   SAY @11
       IF ~~ THEN REPLY @12 DO ~StartStore("V#Jacob",LastTalkedToBy(Myself))~ EXIT
       IF ~~ THEN REPLY @13 EXIT
END

IF ~~ THEN BEGIN V#Jacob2c
   SAY @14
       IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN V#Jacob2d
   SAY @19
       IF ~~ THEN DO ~StartStore("V#Jacob",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN V#Jacob2e
   SAY @20
       IF ~~ THEN REPLY @12 DO ~StartStore("V#Jacob",LastTalkedToBy(Myself))~ EXIT
       IF ~~ THEN REPLY @13 EXIT
END

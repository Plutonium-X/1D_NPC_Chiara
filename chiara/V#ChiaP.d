BEGIN ~V#ChiaP~

IF ~Global("V#KickedOut","GLOBAL",0) Global("V#JoinedParty","GLOBAL",1) Global("V#knowBhaal","GLOBAL",0) Global("V#Wolfform","GLOBAL",0)~ THEN BEGIN v#chiap1a
   SAY @1
       IF ~~ THEN REPLY @2 GOTO v#chiap2a
       IF ~~ THEN REPLY @3 GOTO v#chiap2b
END

IF ~Global("V#KickedOut","GLOBAL",0) Global("V#JoinedParty","GLOBAL",1) Global("V#knowBhaal","GLOBAL",1) Global("V#trustsme","GLOBAL",0) Global("V#Wolfform","GLOBAL",0)~ THEN BEGIN v#chiap1b
   SAY @4
       IF ~~ THEN DO ~SetGlobal("V#KickedOut","GLOBAL",1) SetGlobal("V#JoinedParty","GLOBAL",0) MoveGlobal("AR0701","V#Chiara",[1209.2419])~ EXIT
END

IF ~Global("V#KickedOut","GLOBAL",0) Global("V#JoinedParty","GLOBAL",1) Global("V#knowBhaal","GLOBAL",1) Global("V#trustsme","GLOBAL",1) Global("V#Wolfform","GLOBAL",0)~ THEN BEGIN v#chiap1c
   SAY @5
       IF ~~ THEN REPLY @6 GOTO v#chiap2a
       IF ~~ THEN REPLY @7 GOTO v#chiap2c
END

IF ~Global("V#KickedOut","GLOBAL",0) Global("V#JoinedParty","GLOBAL",1) Global("V#Wolfform","GLOBAL",1)~ THEN BEGIN v#chiap1d
   SAY @8
       IF ~~ THEN DO ~SetGlobal("V#KickedOut","GLOBAL",1) SetGlobal("V#JoinedParty","GLOBAL",0) MoveGlobal("AR0701","V#Chiara",[1209.2419])~ EXIT
END

IF ~~ THEN BEGIN v#chiap2a
   SAY @9
       IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN v#chiap2b
   SAY @10
       IF ~~ THEN REPLY @11 DO ~SetGlobal("V#KickedOut","GLOBAL",1) SetGlobal("V#JoinedParty","GLOBAL",0) MoveGlobal("AR0701","V#Chiara",[1209.2419])~ EXIT
END

IF ~~ THEN BEGIN v#chiap2c
   SAY @12
       IF ~~ THEN DO ~SetGlobal("V#KickedOut","GLOBAL",1) SetGlobal("V#JoinedParty","GLOBAL",0) MoveGlobal("AR0701","V#Chiara",[1209.2419])~ EXIT
END

IF ~Global("V#KickedOut","GLOBAL",1) Global("V#JoinedParty","GLOBAL",0)~ THEN BEGIN v#chiap3
   SAY @13
       IF ~~ THEN REPLY @14 DO ~JoinParty() SetGlobal("V#KickedOut","GLOBAL",0) SetGlobal("V#JoinedParty","GLOBAL",1)~ EXIT
       IF ~~ THEN REPLY @15 EXIT
END

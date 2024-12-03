EXTEND_BOTTOM PPINN01 0
IF ~InParty("V#Chiara") IsGabber("V#Chiara")~ THEN REPLY @1 GOTO V#add1
IF ~InParty("V#Chiara") !IsGabber("V#Chiara")~ THEN REPLY @1 GOTO V#add2
END

APPEND PPINN01

IF ~~ THEN BEGIN V#add1
   SAY @2
       IF ~~ THEN REPLY @4 GOTO V#add3
END

IF ~~ THEN BEGIN V#add2
   SAY @3
       IF ~~ THEN REPLY @5 GOTO V#add3
END

IF ~~ THEN BEGIN V#add3
   SAY @6
       IF ~~ THEN DO ~SetGlobal("V#ErfährtVonRelaed","GLOBAL",1)~ EXIT
END

END

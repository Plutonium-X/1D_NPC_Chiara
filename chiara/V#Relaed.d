BEGIN ~V#Relaed~

IF ~True()~ THEN BEGIN 1
   SAY @1
       IF ~Global("V#ErfährtVonRelaed","GLOBAL",1)~ THEN REPLY @2 GOTO 2
       IF ~~ THEN REPLY @3 EXIT
END

IF ~~ THEN BEGIN 2
   SAY @4
       IF ~~ THEN DO ~StartStore("V#Relaed",LastTalkedToBy(Myself))~ EXIT
END

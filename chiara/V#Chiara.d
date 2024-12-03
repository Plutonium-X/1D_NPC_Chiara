EXTEND_BOTTOM LEHTIN 0
  IF ~OR(2) 
CharName("Chiara Marna Rhie-Tara de Velastan",LastTalkedToBy)
CharName("Chiara",LastTalkedToBy)~ THEN REPLY ~Gewährt mir Zugang zu den unteren Gewölben, Bursche! Und zwar schnell!~
    GOTO chiaralethin
  IF ~!CharName("Chiara Marna Rhie-Tara de Velastan",LastTalkedToBy)
!CharName("Chiara",LastTalkedToBy) 
InParty("V#Chiara")~ THEN REPLY ~Eine Kameradin von mir möchte gern die unteren Gewölbe sehen! Wir haben dort einige Geschäfte zu erledigen!~
    GOTO chiaralethin
END

APPEND LEHTIN
  IF ~~ THEN BEGIN chiaralethin
     SAY ~Nun gut, ich will keinen Ärger mit Jakob! Geht also runter!~
     IF ~~ THEN DO ~SetGlobal("Backroom","GLOBAL",1) Unlock("DOOR17") Unlock("DOOR25")~ EXIT
  END
END

REPLACE WELLYN
  IF ~~ THEN BEGIN 5 // from: 13.3 11.2 9.2 4.1 3.1
  	SAY #27012 /* ~Oh...(schluchz!) Ich will... ich will doch nur Männlein! (schluchz!) Wo ist meine Mama? (schluchz!) ...Mama? Bist du das?...~ */
  	IF ~~ THEN DO ~SetGlobal("V#AusrasterChiara","GLOBAL",1)~ EXIT
  END

  IF ~~ THEN BEGIN 6 // from: 13.2 4.2 3.2
  	SAY #27014 /* ~Oh...(schluchz!) Ich will... ich will doch nur Männlein! (schluchz!) Wo ist meine Mama? (schluchz!) ...Mama? Bist du das?...~ */
  IF ~~ THEN DO ~SetGlobal("V#AusrasterChiara","GLOBAL",1)~ EXIT
  END
END


BEGIN ~V#ChiaJ~

IF ~Global("TannerWarningChiara","AR0502",1) InParty(Myself)~ THEN BEGIN V#TannerWarning
   SAY ~<CHARNAME>, bitte passt auf wo Ihr hintretet. Ich weiß nicht warum, aber ich spüre Gefahr.~
    IF ~~ THEN DO ~SetGlobal("TannerWarningChiara","AR0502",1)~ EXIT
END

IF ~Global("Littleman","GLOBAL",1)
Global("ChiaraWellynKom","LOCALS",0)~ THEN BEGIN V#ChiaraWellyn
   SAY ~Das arme Kind! Wie kann jemand nur ein unschuldiges Kind töten und es ausrauben? Es macht mich so wütend zu wissen, dass dieser Dreckskerl noch freirumrennt! <CHARNAME>, wir müssen den Kerl finden und stellen.~
   IF ~~ THEN DO ~SetGlobal("ChiaraWellynKom","LOCALS",1)~ EXIT
END
 
IF ~Global("V#AusrasterChiara","GLOBAL",1)~ THEN BEGIN V#ChiaraHCWellyn
   SAY ~WAS??? Wir helfen diesem armen Jungen nicht!? Oh wartet, <CHARNAME>! Ihr werdet mich kennenlernen! Untote, eilt herbei!~
   IF ~~ THEN DO ~SetGlobal("V#AusrasterChiara","GLOBAL",2) CreateCreatureObject("GRREVEN",Myself,1,1,1) CreateCreatureObject("V#GREVEN",Myself,1,1,1) CreateCreatureObject("V#GREVEN",Myself,1,1,1) Enemy()~ EXIT
END
 

BEGIN ~V#Chiara~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN V#intr1
   SAY @1
       IF ~~ THEN REPLY @2 GOTO V#intr2
       IF ~~ THEN REPLY @8 GOTO V#intr2
       IF ~Global("V#gesucht","GLOBAL",1)~ THEN REPLY @9 GOTO V#intr3
       IF ~~ THEN REPLY @19 GOTO V#intr4
       IF ~~ THEN REPLY @20 EXIT
END

IF ~NumTimesTalkedToGT(0) Global("V#JoinedParty","GLOBAL",0)~ THEN BEGIN V#intr1b
   SAY @21
       IF ~Global("V#gesucht","GLOBAL",1)~ THEN REPLY @22 GOTO V#intr4
       IF ~~ THEN REPLY @23 GOTO V#intr5
       IF ~~ THEN REPLY @24 EXIT
END

IF ~~ THEN BEGIN V#intr2
   SAY @3
       IF ~~ THEN REPLY @4 GOTO V#intr2b
       IF ~Global("V#gesucht","GLOBAL",1)~ THEN REPLY @17 GOTO V#intr2b
       IF ~~ THEN REPLY @18 GOTO V#intr4
END

IF ~~ THEN BEGIN V#intr3
   SAY @10
       IF ~~ THEN REPLY @11 GOTO V#intr2b
       IF ~~ THEN REPLY @16 GOTO V#intr4
END

IF ~~THEN BEGIN V#intr2b
   SAY @5
       IF ~~ THEN REPLY @6 GOTO V#intr4
       IF ~~ THEN REPLY @12 GOTO V#intr5b
       IF ~~ THEN REPLY @14 GOTO V#intr5
END

IF ~~ THEN BEGIN V#intr4
   SAY @7
       IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN V#intr5
   SAY @15
       IF ~~ THEN DO ~SetGlobal("V#JoinedParty","GLOBAL",1) JoinParty()~ EXIT
END

IF ~~ THEN BEGIN V#intr5b
   SAY @13
       IF ~~ THEN EXIT
END

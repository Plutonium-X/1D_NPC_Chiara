////////////////////////////////////////////////////////////////////////
//Einmischung bei Aegisfeld (Br�ckenviertel)
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS INSPECT 13 MalthisAegisfeld1 // Statement von Matlhis bei Aegisfeld/Br�ckenviertel
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Wir sind alle verdammt! Diese Unschuldigen waren die ersten, die die Verdamnis zu sp�ren bekommen haben! Wir sind alle verflucht! Tod und Verderben wird weiterhin diese Leute ereilen! Lasst uns aufgeben, solange noch Zeit daf�r ist!~ [MALTH17]
  == INSPECT IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Bei Helm, warum seid Ihr so pessemistisch?! Es ist sicherlich keine einfache Situation, aber man sollte zumindest versuchen, sie zu meistern!~
  == KorganJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Es ist eine wahre Freude, unserer Miesmuschel zuzuh�ren! Bei Clanggedin! Geht mit Optimusmus an die Sache!~ 
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Einmischung Bettler (Docks) -->DBEGGAR2!!
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS DBEGGAR2 1 MalthisBettler1 // Statement von Matlhis beim Bettler/Docks
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Die Gr��e der Stadt hat ihn in die Verdamnis gef�hrt! Und dies f�r alle Zeiten! Diese Schicksale machen mich traurig! Die Goldm�nze wird sein Schicksal nur hinausz�gern, mehr nicht!~
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Einmischung Bettler (Docks) -->DBEGGAR2, die Zweite!!
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS DBEGGAR2 7 MalthisBettler2 // Statement von Matlhis beim Bettler/Docks
  == MaltJ   IF ~IsValidForPartyDialogue("Malt") Global("MalthisBettler1","GLOBAL",1)~ THEN 
    ~Ich habe es euch prophezeit! Die Goldm�nze wird sein Schicksal nur hinausz�gern! Und so ist es auch gekommen!~
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Einmischung bei Hehler (Br�ckenviertel)
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS DMARK1 15 MalthisHehler1 // Statement von Matlhis bei Hehler/Br�ckenviertel
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Von dieser �Macht� habe ich auch schon geh�rt. Sie scheinen geheimnisvoll und m�chtig zu sein. Den Schattendieben haben sie schon einen Haufen Verluste zugef�gt. Wir sollten auf der Hut sein!~
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
    SAY ~Malthis hat Euch nun einen langen Weg begleitet. Vielen Gefahren habt Ihr zusammen getrotzt. Ihr habt die Kampferfahrung von Malthis sch�tzen gelernt, trotz seiner melancholische Art! Trotz - vielleicht auch gerade aufgrund - seiner Vergangenheit, war ein treuer Weggef�hrte.~
    IF ~~ THEN REPLY ~Malthis, Ihr seid ein tapferer Mann! Ihr m�sst mich nicht begleiten! Ich wei� nicht, was uns hinter der Barriere erwarten wird. Wollt Ihr Euch wirklich weiterhin mir anschlie�en? Ich wei�, dass Ihr auch andere Verpflichtungen habt.~ EXTERN MaltJ Leben_1
    IF ~~ THEN REPLY ~Ich kann nicht verlangen, dass Ihr mir weiterhin folgt. Aber Ihr wart recht brauchbar und Eure F�higkeiten k�nnten weiter von Nutzen sein. Ich w�rde mich freuen, wenn Ihr mich weiter unterst�tzt.~ EXTERN MaltJ Leben_2
  END
END

APPEND MaltJ
  IF ~~ THEN BEGIN Leben_1
    SAY ~(Sieht euch kurz an) Ihr ... und Eure Freunde habt mir viel mehr gegeben, als ich je wieder gut machen kann. Ihr habt mir dabei geholfen, mich selbst zu finden und zu erfahren, was ich bin. Ihr habt mir beigestanden, als ich Euch am meisten gebraucht habe. Nun ist es an mir, Euch beizustehn. Ihr k�nnt auf mich z�hlen. Lasst uns zusammen diesem Zauberer in seinen verdammten Magierhintern treten!~ 
    COPY_TRANS PLAYER1 33
  END
  IF ~~ THEN BEGIN Leben_2
    SAY ~So sinnlos es auch sein mag, ich werfe Euch weiterhin die Treue halten. Wir k�nnen unserem Schicksal nicht entgehen, aber vielleicht k�nnen wir es abmildern!~
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
   SAY ~Wir sollten uns ruhig verhalten! Solange wir im Besitz des Schutzsteines sind, kann uns nichts passieren!~
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
    ~Unser Leben.... ist nun nicht mehr ganz so sinnlos. Solch ein beindruckendes Wesen habe ich noch nie zu Gesicht bekommen!� Wirklich ein Wesen, bei dem man tr�umen kann und es nur beobachten m�chte!~
  == KeldorJ IF ~!IsValidForPartyDialogue("Anomen") IsValidForPartyDialogue("Malt")~ THEN
    ~Ich bin erfreut, Euch in einer anderer Gem�tsstimmung zu sehen! Ich h�tte nicht gedacht, dass irgendetwas Eure Melancholie bes�nftigen k�nnte!~
  == AnomenJ  IF ~!IsValidForPartyDialogue("Keldorn") IsValidForPartyDialogue("Malt")~ THEN
    ~Solche Worte aus Eurem Munde! Ich bin �berrascht, dass Eure Hoffnungslosigkeit besiegt werden k�nnte, wenn auch nur f�r einen Moment!~
  == MaltJ IF ~IsValidForPartyDialogue("Malt")~  THEN
    ~Darf man nicht mal von einer solchen Sch�nheit beeindruckt sein? Dieser Drache ist doch wirklich ein vollkommenes Gesch�pf, welches man auf Faer�n nicht oft antriffft.� Welch gro�es Gl�ck uns Tymora da beschert! Oh, wie wird uns Loviatar mit der Erinnerung an dieses Gesch�pf qu�len, wenn wir es nicht mehr sehen k�nnen? Mein Leben ist nun noch sinnloser als vorher, nun da ich ein solch wunderbares Gesch�pf gesehen habe und wei�,  dass ich mich an dessen Anblick nicht immer erfreuen kann!~
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
   SAY ~<CHARNAME>, ich bin nicht wirklich zufrieden mit diesem Aussehen! Unsere Lage wird in dieser Gestalt nur hoffnungsloser! Wieder ein Zeichen f�r die ewige Verdamnis dieser Gruppe!~
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
    ~Ihr...Ihr kommt mir bekannt vor?! Irgendetwas in Euch erinnert mich an mich! Wer oder was seid Ihr nur!~
  == Bodhi IF ~IsValidForPartyDialogue("Malt") Dead("MKern") Dead("MDindal") ~ THEN
    ~Ah, wenn das nicht der liebe Malthis ist! Ja, ich kenne Euch und Eure Art nur zu gut! Ihr seid in einen schlimmen Krieg verwickelt, mein Freund! Wie ich sehe, habt Ihr die beiden Unf�higen Kern und Dindal get�tet! Ja, ich sp�re, dass Ihr st�rker geworden seid! Keine Sorge! Wir werden sp�ter noch die Gelegenheit haben, miteinander zu sprechen! Nat�rlich nur sofern <CHARNAME> sich f�r meine "Seite" entscheidet!~
  == Bodhi IF ~IsValidForPartyDialogue("Malt") !Dead("MKern") !Dead("MDindal") ~ THEN
    ~Ah, wenn das nicht der liebe Malthis ist! Ja, ich kenne Euch und Eure Art nur zu gut! Ihr seid in einen schlimmen Krieg verwickelt, mein Freund! Keine Sorge! Wir werden sp�ter noch die Gelegenheit haben, miteinander zu sprechen! Nat�rlich nur sofern <CHARNAME> sich f�r meine "Seite" entscheidet!~
  == MaltJ IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Bitte! Entscheidet Euch f�r Bodhies Seite. Vielleicht kann sie Licht in das Dunkel meiner tr�bsinnigen Vergangenheit bringen!~
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
     SAY ~Hier ist es nun wahrlich hoffnungslos! Aber nun gut! Wir werden auch dies l�sen! Koste es, was es wolle!~
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
//     SAY ~Eine ausweglose Situation, in die wir gekommen sind! Ob Eure Entscheidung richtig war, wer kann das schon sagen?~
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
     SAY ~Ob dies jetzt so sinnig war? Ich wage es zu bezweifeln!~
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
   SAY ~Eine ausweglose Situation, in die wir gekommen sind! Ob Eure Entscheidung richtig war, wer kann das schon sagen?~
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
    ~Habt Ihr mir einen Meuchelm�rder auf den Hals gehetzt? Wenn ja, so war es ein sinnloses Unterfangen! Ich habe die arme Seele erl�st!~ 
  == RENAL   IF ~!InParty("Yoshimo") IsValidForPartyDialogue("Malt")~ THEN 
    ~Das war ein bedauerlicher Irrtum! Ich verspreche, dass es nicht wieder vorkommt...voerst jedenfalls nicht!~
  == RENAL   IF ~InParty("Yoshimo") IsValidForPartyDialogue("Malt")~ THEN 
    ~Nun, nun, wer wird den gleich so aufbrausend sein! Was f�r Yoshimo gilt, gilt nat�rlich auch f�r Euch, Malthis! Ich werde befehlen, Euch vorerst in Ruhe zu lassen! Vielleicht finden wir sp�ter noch etwas Zeit zum Plaudern! Ihr seid ein wichtiges Mosaikst�ckchen in dem Puzzel, welches sich Leben nennt! Habt nur Geduld! Und nun weiter im Text!~ 
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Kommentar zum verr�ckten Kleriker --> Docks
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS DCLERIC 1 MalthisKleriker1 // Statement von Matlhis 
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~So sinnlos, es ist so sinnlos. Wir haben andere Probleme, guter Mann! Aber wenn Ihr darauf besteht, dann schaut dem Tod ins Auge! <CHARNAME> wird ihn Euch sicher bereiten!~
  == DCLERIC IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~F�r diese Blasphemie werdet Ihr alle zugrunde gehen! Dies ist ein Versprechen! Cyric, gib mir Kraft!~
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Nun denn, dann sei es so! Auf in den Kampf! Sp�rst du die Gier?~
END

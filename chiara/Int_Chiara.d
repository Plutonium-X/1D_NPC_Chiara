////////////////////////////////////////////////////////////////////////
//Einmischung bei Aegisfeld (Brückenviertel)
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS INSPECT 13 MalthisAegisfeld1 // Statement von Matlhis bei Aegisfeld/Brückenviertel
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Wir sind alle verdammt! Diese Unschuldigen waren die ersten, die die Verdamnis zu spüren bekommen haben! Wir sind alle verflucht! Tod und Verderben wird weiterhin diese Leute ereilen! Lasst uns aufgeben, solange noch Zeit dafür ist!~ [MALTH17]
  == INSPECT IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Bei Helm, warum seid Ihr so pessemistisch?! Es ist sicherlich keine einfache Situation, aber man sollte zumindest versuchen, sie zu meistern!~
  == KorganJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Es ist eine wahre Freude, unserer Miesmuschel zuzuhören! Bei Clanggedin! Geht mit Optimusmus an die Sache!~ 
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Einmischung Bettler (Docks) -->DBEGGAR2!!
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS DBEGGAR2 1 MalthisBettler1 // Statement von Matlhis beim Bettler/Docks
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Die Größe der Stadt hat ihn in die Verdamnis geführt! Und dies für alle Zeiten! Diese Schicksale machen mich traurig! Die Goldmünze wird sein Schicksal nur hinauszögern, mehr nicht!~
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Einmischung Bettler (Docks) -->DBEGGAR2, die Zweite!!
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS DBEGGAR2 7 MalthisBettler2 // Statement von Matlhis beim Bettler/Docks
  == MaltJ   IF ~IsValidForPartyDialogue("Malt") Global("MalthisBettler1","GLOBAL",1)~ THEN 
    ~Ich habe es euch prophezeit! Die Goldmünze wird sein Schicksal nur hinauszögern! Und so ist es auch gekommen!~
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Einmischung bei Hehler (Brückenviertel)
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS DMARK1 15 MalthisHehler1 // Statement von Matlhis bei Hehler/Brückenviertel
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Von dieser ´Macht´ habe ich auch schon gehört. Sie scheinen geheimnisvoll und mächtig zu sein. Den Schattendieben haben sie schon einen Haufen Verluste zugefügt. Wir sollten auf der Hut sein!~
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
    SAY ~Malthis hat Euch nun einen langen Weg begleitet. Vielen Gefahren habt Ihr zusammen getrotzt. Ihr habt die Kampferfahrung von Malthis schätzen gelernt, trotz seiner melancholische Art! Trotz - vielleicht auch gerade aufgrund - seiner Vergangenheit, war ein treuer Weggefährte.~
    IF ~~ THEN REPLY ~Malthis, Ihr seid ein tapferer Mann! Ihr müsst mich nicht begleiten! Ich weiß nicht, was uns hinter der Barriere erwarten wird. Wollt Ihr Euch wirklich weiterhin mir anschließen? Ich weiß, dass Ihr auch andere Verpflichtungen habt.~ EXTERN MaltJ Leben_1
    IF ~~ THEN REPLY ~Ich kann nicht verlangen, dass Ihr mir weiterhin folgt. Aber Ihr wart recht brauchbar und Eure Fähigkeiten könnten weiter von Nutzen sein. Ich würde mich freuen, wenn Ihr mich weiter unterstützt.~ EXTERN MaltJ Leben_2
  END
END

APPEND MaltJ
  IF ~~ THEN BEGIN Leben_1
    SAY ~(Sieht euch kurz an) Ihr ... und Eure Freunde habt mir viel mehr gegeben, als ich je wieder gut machen kann. Ihr habt mir dabei geholfen, mich selbst zu finden und zu erfahren, was ich bin. Ihr habt mir beigestanden, als ich Euch am meisten gebraucht habe. Nun ist es an mir, Euch beizustehn. Ihr könnt auf mich zählen. Lasst uns zusammen diesem Zauberer in seinen verdammten Magierhintern treten!~ 
    COPY_TRANS PLAYER1 33
  END
  IF ~~ THEN BEGIN Leben_2
    SAY ~So sinnlos es auch sein mag, ich werfe Euch weiterhin die Treue halten. Wir können unserem Schicksal nicht entgehen, aber vielleicht können wir es abmildern!~
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
//    SAY ~Auch wenn es sinnlos sein sollte gegen euch zu kämpfen! Wir werden Valygar nicht Euch überlassen. Lasst uns den tödlichen Tanz tanzen.~
//        IF ~~ THEN EXTERN ~TOLGER2~ 3
//    END
//END
//
//EXTEND_TOP ValygarJ 3
//  IF ~IsValidForPartyDialog("Malt)~ THEN BEGIN Malt_Valygar_Tolgerias
//    SAY ~Auch wenn es sinnlos sein sollte gegen euch zu kämpfen! Wir werden Valygar nicht Euch überlassen. Lasst uns den tödlichen Tanz tanzen.~
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
    ~Unser Leben.... ist nun nicht mehr ganz so sinnlos. Solch ein beindruckendes Wesen habe ich noch nie zu Gesicht bekommen!  Wirklich ein Wesen, bei dem man träumen kann und es nur beobachten möchte!~
  == KeldorJ IF ~!IsValidForPartyDialogue("Anomen") IsValidForPartyDialogue("Malt")~ THEN
    ~Ich bin erfreut, Euch in einer anderer Gemütsstimmung zu sehen! Ich hätte nicht gedacht, dass irgendetwas Eure Melancholie besänftigen könnte!~
  == AnomenJ  IF ~!IsValidForPartyDialogue("Keldorn") IsValidForPartyDialogue("Malt")~ THEN
    ~Solche Worte aus Eurem Munde! Ich bin überrascht, dass Eure Hoffnungslosigkeit besiegt werden könnte, wenn auch nur für einen Moment!~
  == MaltJ IF ~IsValidForPartyDialogue("Malt")~  THEN
    ~Darf man nicht mal von einer solchen Schönheit beeindruckt sein? Dieser Drache ist doch wirklich ein vollkommenes Geschöpf, welches man auf Faerùn nicht oft antriffft.  Welch großes Glück uns Tymora da beschert! Oh, wie wird uns Loviatar mit der Erinnerung an dieses Geschöpf quälen, wenn wir es nicht mehr sehen können? Mein Leben ist nun noch sinnloser als vorher, nun da ich ein solch wunderbares Geschöpf gesehen habe und weiß,  dass ich mich an dessen Anblick nicht immer erfreuen kann!~
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
   SAY ~<CHARNAME>, ich bin nicht wirklich zufrieden mit diesem Aussehen! Unsere Lage wird in dieser Gestalt nur hoffnungsloser! Wieder ein Zeichen für die ewige Verdamnis dieser Gruppe!~
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
    ~Ah, wenn das nicht der liebe Malthis ist! Ja, ich kenne Euch und Eure Art nur zu gut! Ihr seid in einen schlimmen Krieg verwickelt, mein Freund! Wie ich sehe, habt Ihr die beiden Unfähigen Kern und Dindal getötet! Ja, ich spüre, dass Ihr stärker geworden seid! Keine Sorge! Wir werden später noch die Gelegenheit haben, miteinander zu sprechen! Natürlich nur sofern <CHARNAME> sich für meine "Seite" entscheidet!~
  == Bodhi IF ~IsValidForPartyDialogue("Malt") !Dead("MKern") !Dead("MDindal") ~ THEN
    ~Ah, wenn das nicht der liebe Malthis ist! Ja, ich kenne Euch und Eure Art nur zu gut! Ihr seid in einen schlimmen Krieg verwickelt, mein Freund! Keine Sorge! Wir werden später noch die Gelegenheit haben, miteinander zu sprechen! Natürlich nur sofern <CHARNAME> sich für meine "Seite" entscheidet!~
  == MaltJ IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Bitte! Entscheidet Euch für Bodhies Seite. Vielleicht kann sie Licht in das Dunkel meiner trübsinnigen Vergangenheit bringen!~
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Kommentar zur Hölle ()
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
EXTEND_BOTTOM PLAYER1 25 // 
  IF ~InParty("Malt")~ 
    THEN EXTERN MALTJ Malt_HoelleKommentarCOPY1
END

APPEND MaltJ
  IF ~~ THEN BEGIN Malt_HoelleKommentarCOPY1
     SAY ~Hier ist es nun wahrlich hoffnungslos! Aber nun gut! Wir werden auch dies lösen! Koste es, was es wolle!~
     COPY_TRANS PLAYER1 25
  END
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Kommentar zu Bodhi 2 (erste Gegegnung auf dem Friedhof, AR0800)-->Nicht Funktionstüchtig!!
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
    ~Habt Ihr mir einen Meuchelmörder auf den Hals gehetzt? Wenn ja, so war es ein sinnloses Unterfangen! Ich habe die arme Seele erlöst!~ 
  == RENAL   IF ~!InParty("Yoshimo") IsValidForPartyDialogue("Malt")~ THEN 
    ~Das war ein bedauerlicher Irrtum! Ich verspreche, dass es nicht wieder vorkommt...voerst jedenfalls nicht!~
  == RENAL   IF ~InParty("Yoshimo") IsValidForPartyDialogue("Malt")~ THEN 
    ~Nun, nun, wer wird den gleich so aufbrausend sein! Was für Yoshimo gilt, gilt natürlich auch für Euch, Malthis! Ich werde befehlen, Euch vorerst in Ruhe zu lassen! Vielleicht finden wir später noch etwas Zeit zum Plaudern! Ihr seid ein wichtiges Mosaikstückchen in dem Puzzel, welches sich Leben nennt! Habt nur Geduld! Und nun weiter im Text!~ 
END
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//Kommentar zum verrückten Kleriker --> Docks
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
INTERJECT_COPY_TRANS DCLERIC 1 MalthisKleriker1 // Statement von Matlhis 
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~So sinnlos, es ist so sinnlos. Wir haben andere Probleme, guter Mann! Aber wenn Ihr darauf besteht, dann schaut dem Tod ins Auge! <CHARNAME> wird ihn Euch sicher bereiten!~
  == DCLERIC IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Für diese Blasphemie werdet Ihr alle zugrunde gehen! Dies ist ein Versprechen! Cyric, gib mir Kraft!~
  == MaltJ   IF ~IsValidForPartyDialogue("Malt")~ THEN 
    ~Nun denn, dann sei es so! Auf in den Kampf! Spürst du die Gier?~
END

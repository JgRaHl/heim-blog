---
title: Grundlegende Mathematik
description: "Die Mathematik der Theorie von Burkhard Heim in den
Elementarstrukturen, Band 1, Kapitel 1 besteht zu einem Großteil aus
Tensorrechnung"
date: 2012-08-26 21:42 +02:00
tags:
---

Um die Heimsche Quantenfeldtheorie zu verstehen, sind diverse
mathematischen Grundlagen erforderlich.

Um die Theorie im Groben zu überblicken, möchte ich an dieser Stelle
nochmal auf die [Podszechschen
Landkarten](http://www.engon.de/protosimplex/downloads/04%20posdzech%20-%20landkarten%20zu%20elementarstrukturen%201998.pdf)
hinweisen. Eine ganz großartige Hilfe. Nun zu den mathematischen
Details.

# Elementarstrukturen: Vorwort: Einführung

Hier wird nicht viel an Mathematik verwendet. Es gibt nur einige
Erklärungen, die aber erst später interessant werden. Es wird auch
definiert, dass für einen Kommutator, der eigentlich $\[a,b\] = ab - ba$
geschrieben wird, an der Stelle $(a\ x\ b)_{+} = ab - ba$ für den
Kommutator und $(a\ x\ b)_{-} = ab + ba$ für den Antikommutator
geschrieben wird. Eine Erklärung des Kommutators findet sich auch in
Susskinds Lecture 8, ziemlich am Anfang. Deswegen spare ich mir hier die
Erklärungen.

Übrigens sieht man, dass beim Druck offenbar keine Expertem am Werk
waren, denn es würd überall der Buchstabe $x$ statt des korrekten
$\times$ verwendet.

Dann wird überall statt des Nablaoperators ($\nabla$) für Gradienten,
Divergenzen und Rotation bzw. Curl die jeweiligen Operatoren $grad$,
$div$ und $rot$ verwendet. Soweit trivial.

Was Heim allerdings vergisst, sind ein paar andere Schreibweisen, die
zwischenzeitlich aus der Mode gekommen sind und/oder völlig unbekannt
sind. Details dazu später.


# Elementarstrukturen Kapitel 1.1: Logische und empirische Basis

Hier nicht viel komplexes in Sicht. Wenn man Heim folgen will, sollte
man die Grundlagen der speziellen Relavitätstheorie beherrschen. Es
reicht aus, die Lorentz-Transformation in den Grundzügen kapiert zu
haben. Es folgt etwas Quantenmechanik auf Niveau eines
Physik-Grundkurses der 12. Klasse. Wer sich nicht mehr so genau an seine
Schulzeit erinnert, kann die Sachen problemlos googlen.

# Elementarstrukturen Kapitel 1.2: Der makromare Hintergrund

Hier wird es langsam komplexer. Newtonsche Gravitationsphysik, neu
aufgerollt. Ich muss zugeben, dass ich den Rest des Kapitels
übersprungen habe, da Heim am Ende von *1.4* mehr oder weniger die
allgemeine Relativitästheorie rauskriegt, die Herleitung war für mich
nicht interessant.

# Elementarstrukturen Kapitel 1.3: Die nichthermitesche Raumzeitstruktur

Hier ist es sinnvoll, mit Differentialgeometrie umgehen zu können.
Einstein verwendet in seiner Allgemeinen Relativitätstheorie die
Riemannsche Geometrie um seine Feldgleichungen zu formulieren. Hat man
diese begriffen, sind Kapitel 1 der Elementarstrukturen recht schnell
verstanden.

Für mich sehr nützliche waren dabei die Vorlesungen von Leonard
Susskind, Professor für theoretische Physik an der Stanford University.
Es gibt auf Youtube Aufnahmen seiner hervorragenden Vorlesung zum Thema Allgemeine
Relativitätstheorie, die auch die mathematischen Grundlagen behandeln.
In 10 Lektionen ist von Tensorrechnung bis zur Einsteinschen
Feldgleichung alles enthalten, was man wissen muss. Sehr nützlich ist
es, sich die sämtlichen Videos runterzuladen und sich dann auf dem Handy
anzusehen. So habe ich über etwa einen Monat lang Physik in der U-Bahn
studiert.

[Hier ist der Link zur gesamten Playlist](http://www.youtube.com/course?list=EC6C8BDEEBA6BDC78D)

Zum Runterladen empfiehlt sich das Tool `youtube-dl`, das es bei vielen
Linux-Distributionen gibt. Einfach folgende Links in eine Textdatei
packen:

    http://www.youtube.com/watch?v=hbmf0bB38h0
    http://www.youtube.com/watch?v=s8UrYIZhm60
    http://www.youtube.com/watch?v=hR7fWF_qBZI
    http://www.youtube.com/watch?v=ttMI0dmmkrE
    http://www.youtube.com/watch?v=WtPtxz3ef8U
    http://www.youtube.com/watch?v=Pm5ROyoaMZA
    http://www.youtube.com/watch?v=xOzVmC-4gpw
    http://www.youtube.com/watch?v=AC3TMizGpB8
    http://www.youtube.com/watch?v=XG02Yw7u2mc
    http://www.youtube.com/watch?v=VCRG1uzc9xg
    http://www.youtube.com/watch?v=6vdXlwDRRR8
    http://www.youtube.com/watch?v=fVqYlSNqSQk

Dann mit `youtube-dl -t $(cat textdatei.txt)` alles runterladen. Das
Ergebnis kommt im webm-Format. Man kann sich das aber auch alles
konvertieren lassen, einfach mal ins Handbuch schauen.

# Elementarstrukturen Kapitel 1.4: Mikromare Diskontinuitäten

Ein sehr interessanter Teil. Heim nimmt den Energie-Impuls-Tensor aus
der allgemeinen Relativitästheorie um ihn in eine Art disktrete Quantenform
umzubauen. Zu beachten ist, dass hier lateinische Indices verwendet
werden, aber trotzdem mit 4 Dimensionen gearbeitet wird. $T_{ij}$ hat
also 4 Dimensionen.

Heim tauscht zuerst den Ricci-Skalar durch eine Spur des
Energie-Impuls-Tensors aus. Dazu wird als Erstes die Spur des
Energie-Impuls-Tensors $T_{ik}$ gebildet. Dazu wird der erste kovariante
Index mithilfe der doppelt kontravarianten Metrik $g^{ik}$ gehoben.
($T^i_j = g^{ik} T_{kj}$), dann wird die Spur gebildet (es gilt
Einsteinsche Summenkonvention): $T^k_k = T$.

Dann wird der Ricci-Skalar $R$ zu dieser Spur proportial gesetzt: $R \sim
-T$. Warum das gilt, habe ich vorerst nicht herausgefunden, lässt sich
aber sicherlich beweisen.

Schauen wir uns die Einsteinsche Feldgleichung an:

$$R_{ \mu \nu} - \frac{R}{2} g_{ \mu \nu}=\kappa T_{ \mu \nu}$$

Heim schreibt diese verkürzt in proportionaler Form und ersetzt dabei
den Ricci-Skalar durch obige Spur $T$. Daraus macht er einen erweiterten
Energiedichtetensor $W_{ik}$

$$R_{ik} \sim T_{ik} - \frac{1}{2}g_{ik}T = W_{ik}$$

Da die Energien im Raum gequantelt sind, wird geschlussfolgert, dass der
$W_{ik}$ auch gequantelt sein muss. Die Implikationen werden von Heim
nicht direkt erwähnt, deswegen gehe ich mal darauf ein. Da $R_{ik} \sim
W_{ik}$, muss natürlich auch der $R_{ik}$ gequantelt sein. Der $R_{ik}$
kriegt man durch Spurbildung des Riemannschen Krümmungstensors.

$$ R^j_{ijk} = R_{ik}$$

Folglich muss auch der Riemannsche Krümmungstensor gequantelt sein. Der
lässt sich wiederrum bestimmen durch die Christoffelsymbole

$$ R^m_{ikp} = \partial_k \Gamma^m_{ip} - \partial_p \Gamma^m_{ki} + \Gamma^a_{ip} \Gamma^m_{ak} - \Gamma^a_{ik} \Gamma^m_{ap}$$

Und die Christoffelsymbole folgen aus der Metrik $g_{ij}$:

$$\Gamma_{ijl} = \frac{1}{2} \left(\partial_i g_{jl} + \partial_j g_{il} - \partial_l g_{ij}\right)$$

Wir haben es hier also mit einer Horde an differentiellen
Tensorgleichungen zu tun, die nun diskrete Sprünge machen sollen. In den
nächsten Kapiteln baut er sich dann die entsprechen Mathematik zusammen.
Ich habe mich gewundert, dass nicht vorher jemand auf diese Idee
gekommen ist. [Also habe ich mal auf StackExchange Math
nachgefragt, ob es nicht schon sowas wie eine Diskrete Riemannsche Geometrie gibt.](http://math.stackexchange.com/questions/186076/is-there-such-a-thing-as-discrete-riemannian-geometry). Scheint nicht so.

Soweit zu Kapitel 1.


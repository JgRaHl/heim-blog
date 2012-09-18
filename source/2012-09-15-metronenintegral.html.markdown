---
title: Metronenrechnung, Teil 2
date: 2012-09-15 15:18 +02:00
tags:
description: "Im zweiten Teil der Einführung in die Metronenrechnung
leite ich einige Gesetzmäßigkeiten des Metronintegrals her und zeige ein
paar Rechenregeln."
---

# Einführung in die Metronenrechnung, Teil 2

Nachdem wir uns im letzten Teil ja nun schon etwas mit der
Metronenrechnung beschäftigt haben. Möchte ich in diesem Teil etwas
genauer darauf eingehen, wie man das Metronintegral bildet.

Zur Erinnerung: Das Metronintegral ist das Analogon zum infinitesimalen
Integral. Es wird in der Heim'schen Quantenfeldtheorie verwendet um im
mikromaren Bereich mit ganzzahligen Vielfachen zu rechnen, da dort
infinitesimale Konstrukte nicht mehr sinnvoll anwendbar sind.

Das Metronintegral ist die Inversion des Metrondifferential, wie in der
normalen Infinitesimalrechnung das Integral die Inversion des
Differentials ist. Wenn also irgendeine metronische Funktion $\phi$
gegeben ist, lässt sich dazu eine metronische Stammfunktion $\Phi$
bilden, deren Ableitung wieder $\phi$ ergibt.

$$\eth\Phi = \phi$$

## Bestimmung der metronischen Stammfunktion

Nehmen wir uns nun also eine beliebige Funktion, in diesem Fall 
$\phi(n) = n^2$. Die Stammfunktion muss obige Bedingung erfüllen, also
$\eth\Phi = \phi$, somit $\Phi(n) - \Phi(n-1) = n^2$. Dies lässt sich
nicht ganz so einfach bestimmen. Es gibt jedoch einen Weg. Es lassen sich wie in
der Infinitesimalrechnung einige Rechenregeln aufstellen. Diese benutzen
statt Potenzfunktionen sogenannte fallende Fakultäten.

## Fallende Fakultäten

<b>Definition:</b>
Der Ausdruck <i>x hoch m fallend</i> (fallende Fakultät) ist definiert als:

$$x^{\underline{m}} = (x-0)(x-1)(x-2) ... (x - (m - 1))$$

So ist zum Beispiel $x^{\underline{3}} = (x-0)(x-1)(x-2)$.

## Metrondifferential fallender Fakultäten

Wir stellen nun fest: Für das Metrondifferential einer fallenden
Fakultät gilt: $\eth x^{\underline{m}} = mx^{\underline{m-1}}$. Der Beweis ist
einfach. 

$\eth x^{\underline{m}} \\\\
  = x^{\underline{m}} - (x-1)^{\underline{m}} \\\\
  = (x-0)(x-1)(x-2)\cdots(x-(m-1)) - (x-1-0)(x-1-1)(x-1-2)\cdots(x-1-(m-1)) \\\\
  = m(x-0)(x-1)\cdots(x-((m-1)-1)) \\\\
  = mx^{\underline{m-1}}\\\\$

Dies ist ein wunderbares Anlagon zur Ableitungsregel aus der normalen
Differentialrechnung, in der ja gilt $\frac{d}{dx} x^m = mx^{m-1}$ 

## Umwandlung von Potenzfunktionen in fallende Fakultäten

Wenn wir jetzt noch Potenzfunktionen in Konstrukte aus fallenden
Fakultäten umwandeln können, wäre es sehr leicht, Metrondifferentiale
aus Potenzfunktionen umzuwandeln. Tatsächlich geht das. Es gilt nämlich

$$x^m=\sum_k \left\\{\begin{matrix}m\\\\k\end{matrix}\right\\}x^{\underline{k}}$$

Dabei sind $\left\\{\begin{matrix}m\\\\k\end{matrix}\right\\}$ die
[Stirling-Zahlen zweiter
Art](http://de.wikipedia.org/wiki/Stirling-Zahl). Ich will nicht zu sehr
ins Details gehen, die kann man dem Wikipedia-Artikel entnehmen. Weiter
unten finden Sie die Umwandlungsregeln für die ersten paar Potenzen.

## Beispiel: Summe der Quadratzahlen

Im ersten Teil habe ich ja schon das Metronintegral von $\phi(n) = n^2$
gezeigt. Nun lässt sich das auch herleiten. Wandeln wir die Funktion
zuerst in die Summe ihrer fallenden Fakultäten um $\phi(n) = n^2 =
n^{\underline{2}} + n^{\underline{1}}$. Wenn wir davon nun die
metronische Stammfunktion bilden, wird aus $x^{\underline{m}}$ gemäß der
Rechenregel $\frac{x^{\underline{m+1}}}{m}$, wir erhalten also $\Phi(n) =
\frac{n^{\underline{3}}}{3} + \frac{n^{\underline{2}}}{2}$.  Und wenn
wir das auflösen und umstellen, kriegen wir die Funktion, die ich im
ersten Teil angegeben habe.

## Weitere Rechenregeln

Wenn man jetzt viel Zeit hat und damit rumspielt, kriegt man noch viel
mehr Rechenregeln raus, deren Herleitung ich hier nicht angeben will.
Das überlasse ich gerne dem Leser.

<table class="table">
  <thead>
    <tr>
      <td>Funktion $\phi(n)=\cdots$</td>
      <td>Metrondifferential $\eth\phi$</td>
      <td>Metronstammfunktion $\Phi$</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>$n^{\underline{m}}$</td>
      <td>$mn^{\underline{m-1}}$</td>
      <td>$\frac{n^{\underline{m+1}}}{m+1}$</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td>$2^x$</td>
      <td>$2^x$</td>
      <td>$2^x$</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td>$c^x$ ($c$ sei konstant)</td>
      <td>$(c-1)c^x$</td>
      <td>$\frac{c^x}{c-1}$</td>
    </tr>
  </tbody>
</table>

Außerdem finden sich in den Elementarstrukturen im <b>Kapitel III.1</b>
<i>(Metronische Elementaroperationen)</i> einiges an Eigenschaften, die
ich hier nicht wiedergeben möchte. Allerdings gibt es dort zwei Fehler.
Und zwar in der 3. veränderten Auflage von 1998 (das ist meines Wissens
nach die aktuelle Auflage):

1. In Zeile 18, in der Gleichung wird der rechte obere Index in der
ersten Matrix mit $u$ angegeben. Korrekt müsste er lauten $u'$.

2. In Zeile 20, in der 2. Matrix in der Gleichung im rechten oberen
Index wird $v$ geschrieben. Korrekt wäre $\eth v$ - es fehlt also der
Metrondifferentialoperator.

Hier nun noch die Umrechnungen von Potenzen in fallende Fakultäten für
einige Funktionen.

* $x^0 = x^{\underline{0}}$
* $x^1 = x^{\underline{1}}$
* $x^2 = x^{\underline{1}} + x^{\underline{2}}$
* $x^3 = x^{\underline{1}} + 3x^{\underline{2}} + x^{\underline{3}}$
* $x^4 = x^{\underline{1}} + 7x^{\underline{2}} + 6x^{\underline{3}} + x^{\underline{4}}$
* $x^5 = x^{\underline{1}} + 15x^{\underline{2}} + 25x^{\underline{3}} + 10^{\underline{4}} + x^{\underline{5}}$
* $x^6 = x^{\underline{1}} + 31x^{\underline{2}} + 90x^{\underline{3}} + 65^{\underline{4}} + 15x^{\underline{5}} + x^{\underline{6}}$

Die nachfolgenden Gleichungen, ergeben Sie wie geschrieben aus den
Stirling-Zahlen und lassen sich gut folgendem Wikipedia-Artikel entnehmen:
[Stirling Numbers of the second
kind](http://en.wikipedia.org/wiki/Stirling_numbers_of_the_second_kind#Table_of_values)


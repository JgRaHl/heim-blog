---
title: Gravitationsgesetz, Teil 1
date: 2013-08-18 15:20 +02:00
tags:
---

# Einführung

Das korrigierte Gravitationsgesetz von Burkhard Heim ist eine Korrektur
des Newtonschen Gravitationsgesetzes, welches damit eine Näherung der
Heimschen Revision ist. Bereits in den 1980er Jahren stellte sich
heraus, dass die Rotationsgeschwindigekeit von Galaxien nicht den
erwarteten Werten entsprach. Die äußeren Ränder der Galaxien drehten
sich wesentlich schneller, als aus dem Newtonschen Gravitationsgesetz
folgte. Das gängige Erklärungsmodell dafür ist heute hypothetische
<i>Dunkle Materie</i>, du zwar nicht sichtbar ist, dafür aber der
gravitativen Wechselwirkung unterliegt. Dunkle Materie wurde bis jetzt
nicht direkt nachgewiesen. Das Heimsche Gravitationsgesetz könnte ein
Modell sein, dass diese und weitere Phänomene möglicherweise erklärt.

In der Allgemeinen Relativitätstheorie krümmen Energie (und damit über
das Energie-Masse-Äquivalent auch Masse) und Impuls den Raum, was sich
in einem wahrnehmbaren Gravitationsfeld äußert. Dieses Gravitationsfeld
ist ein energetischer Zustand des Raumes, der sich vom leeren Raum
unterscheidet, daher muss auch von diesem Feld wiederrum eine -- wenn auch
sehr schwache -- gravitative Wirkung ausgehen. Wird zusätzlich
einbezogen, dass Materie nicht als Kontinuum, sondern in diskreten
Einheiten (Atomen) auftritt, führt dies zu einer Lösung, in der die
Gravitation in Grenzen des Sonnensystems weitgehend der Newtonschen
Näherung entspricht, in großeren Gebieten jedoch einen ganz anderen
Verlauf zeigt, der auch zu einer abstoßenden Komponente übergeht.

# Einführung der Feldmasse

Ausgangspunkt ist das newtonsche Gravitationsgesetz:

$$ F = \gamma \frac{m M_0}{r^2}$$

Daraus folgt für das newtonsche Gravitation-Potential (hier positiv,
weil als Quadrat der Umlaufgeschwindigkeit interpretierbar):

$$ \phi_n = \gamma \frac{M_0}{r} $$

Treten mehrere Feldquellen auf, verhält sich $\phi_n$ additiv. Ist also
$M_0$ aus $N$ Teilmassen $M_0 = \sum_{k=1}^{N} M_{(0)k}$
zusammengesetzt, gilt, sofern $r$ wesentlich größer ist, als die
Abstande der Teilmassen untereinander:

$$ \phi_n = \frac{\gamma}{r} \sum_{k=1}^{N} M_{(0)k} $$

Wird nun berücksichtigt, dass jede dieser Teilmassen ein
Gravitationsfeld erzeugt, und dass jedes dieser Gravitationsfelder
widerrum ein Gravitationsfeld erzeugt, kommt diesen Gravitationsfeldern
widerrum eine <i>Feldmasse</i> zu. Misst man aber die Masse anhand des
Gravitationsfeldes, wird man diese Masse $M_0$ nur direkt an der
Oberfläche $r_0$ der Feldquelle messen. Für einen Abstand $r > r_0$ soll
im Allgemeinen also gelten: $M = M(r)$, $M_0 = M(r_0)$. Es ergibt sich
also eine Korrektur

$$ \phi = \gamma \frac{M(r)}{r} $$

Dabei ist $M(r)$ eine noch unbekannte Funktion, von der wir nur wissen,
dass $\frac{dM}{dr} \approx 0$, sofern $r$ klein ist.


**komplizierte Herleitungen hier**

Dies führt dann auf die Differentialgleichung

$$ c^2 \frac{dM}{dr} + 2 \pi \alpha r^2 \left(\frac{d \phi}{dr}\right)^2 = 0 $$

Mit $\alpha = \frac{1}{4 \pi \gamma}$ und $\phi = \gamma \frac{M(r)}{r}$
ergibt das:

$$ \frac{1}{2} r^2 \left(\frac{d \phi}{dr}\right)^2 + c^2 \left(r \frac{d\phi}{dr} + \phi\right) = 0 $$

Multiplikation mit $\frac{8}{c^4}$ und Substitution mit $\xi = \frac{2
\phi}{c^2}$ liefert:

$$ r^2 \left(\frac{d\xi}{dr}\right)^2 + 4 \left(r \frac{d \xi}{dr} + \xi \right) = 0 $$




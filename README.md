# ALU computing unit

## Popis

4-bitová aritmeticko-logická jednotka se dvěma vstupy A a B a výstupem Y s přenosem C. Jednotka může provádět 16 různých operací (viz tabulka).

## Řídící signály ALU

<table>
<tr><td>**Řídící signál**</td><td>**Funkce**</td><td>**Popis**</td></tr>
<tr><td> 0x0 </td><td> Y = A + B </td><td> Součet </td></tr>
<tr><td> 0x1 </td><td> Y = A - B </td><td> Rozdíl </td></tr>
<tr><td> 0x2 </td><td> Y = A + 1 </td><td> Inkrementace </td></tr>
<tr><td> 0x3 </td><td> Y = A - 1 </td><td> Dekrementace </td></tr>
<tr><td> 0x4 </td><td> Y = A + B + C </td><td> Součet s přenosem </td></tr>
<tr><td> 0x5 </td><td> Y = A - B - C </td><td> Rozdíl s přenosem </td></tr>
<tr><td> 0x6 </td><td> Y = A or B </td><td> Logický součet </td></tr>
<tr><td> 0x7 </td><td> Y = A and B </td><td> Logický součin </td></tr>
<tr><td> 0x8 </td><td> Y = A xor B </td><td> Exkluzivní logický součet </td></tr>
<tr><td> 0x9 </td><td> Y = not A </td><td> Logická negace </td></tr>
<tr><td> 0xA </td><td> Y = A &gt;&gt; 1 </td><td> Rotace vpravo </td></tr>
<tr><td> 0xB </td><td> Y = A &lt;&lt; 1 </td><td> Rotace vlevo </td></tr>
<tr><td> 0xC </td><td> Y = (A + C) &gt;&gt; 1 </td><td> Rotace vpravo s přenosem </td></tr>
<tr><td> 0xD </td><td> Y = (A - C) &lt;&lt; 1 </td><td> Rotace vlevo s přenosem </td></tr>
<tr><td> 0xE </td><td> Y = A'H &lt;=&gt; A'L  </td><td> Přehození nejvyššího a nejnižšího čtvrbytu </td></tr>
<tr><td> 0xF </td><td> Y = A mul B </td><td> Součin </td></tr>
</table>


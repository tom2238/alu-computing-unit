# ALU computing unit

## Popis

4-bitová aritmeticko-logická jednotka se dvěma vstupy A a B a výstupem Y s přenosem C. Jednotka může provádět 16 různých operací (viz tabulka).

## Řídící signály ALU

<table>
<tr><td><b>Řídící signál</b></td><td><b>Funkce</b></td><td><b>Popis</b></td></tr>
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

# Funkční bloky
- #### Sčítačka 
<img src="./doc/four_adder.svg" height="240">

- #### Odčítačka
<img src="./doc/substraction.svg" height="235">

- #### Inkrementace 
<img src="./doc/increment.svg" height="205">

- #### Dekrementace 
<img src="./doc/decrement.svg" height="210">

- #### Sčítačka s přenosem
<img src="./doc/adder_with_carry.svg" height="250">

- #### Odčítačka s přenosem
<img src="./doc/substraction_with_carry.svg" height="240">

- #### Logický součet 
- #### Logický součin 
- #### Exkluzivní logický součet 
- #### Logická negace 
- #### Rotace vpravo 
- #### Rotace vlevo 
- #### Rotace vpravo s přenosem 
- #### Rotace vlevo s přenosem 
- #### Přehození bitů
- #### Násobička
- #### Jednotka ovládání displeje
- #### Parita výsledku



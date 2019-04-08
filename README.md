# ALU computing unit

## Popis

4-bitová aritmeticko-logická jednotka se dvěma vstupy A a B a výstupem Y s přenosem C. Jednotka může provádět 16 různých operací (viz tabulka).

## Řídící signály ALU

| **Řídící signál** | **Funkce** | **Popis**|
| --- | --- |
| 0x0 | Y = A + B | Součet |
| 0x1 | Y = A - B | Rozdíl |
| 0x2 | Y = A + 1 | Inkrementace |
| 0x3 | Y = A - 1 | Dekrementace |
| 0x4 | Y = A + B + C | Součet s přenosem |
| 0x5 | Y = A - B - C | Rozdíl s přenosem |
| 0x6 | Y = A or B | Logický součet |
| 0x7 | Y = A and B | Logický součin |
| 0x8 | Y = A xor B | Exkluzivní logický součet |
| 0x9 | Y = not A | Logická negace |
| 0xA | Y = A >> 1 | Rotace vpravo |
| 0xB | Y = A << 1 | Rotace vlevo |
| 0xC | Y = (A + C) >> 1| Rotace vpravo s přenosem |
| 0xD | Y = (A - C) << 1 | Rotace vlevo s přenosem |
| 0xE | Y = A'H <=> A'L  | Přehození nejvyššího a nejnižšího čtvrbytu |
| 0xF | Y = A mul B | Součin |
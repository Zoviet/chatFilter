# chatFilter

Лексический анализатор для фильтрования сообщений с номерами телефонов российских мобильных номеров, введенных любым способом: цифрами, словами, вперемежку словами и цифрами. 

Флаг определения номера после анализа - наличие паттерна кода оператора.

Если номер найден возвращается ошибка и номер телефона в национальном формате без кода страны. Например: (937) 886-58-42.


## Компиляция:

С использованием Flex (Потребуется пакет libfl-dev):

```
lex filter.l
gcc -o filter -lfl lex.yy.c 

```

C использованием Lex:

```
lex filter.l
cc -o filter -ll lex.yy.c 

```

## Тест

```
./filter < test.txt

```

Тестовое сообщение: девять 3 семь восемь 8 шесть 58 четыре два





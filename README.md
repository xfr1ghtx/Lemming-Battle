# Lemming-Battle

https://www.codewars.com/kata/5b7d2cca7a2013f79f000129


## English

### Task from Teacher
• Solve the task on Swift

• Cover the solution with Unit and UI tests using test design techniques

### Task from CodeWars
Oh no... more lemmings!! And in Lemmings Planet a huge battle is being fought between the two great rival races: the green lemmings and the blue lemmings. Everybody was now assigned to battle and they will fight until one of the races completely dissapears: the Deadly War has begun!

Every single lemming has a power measure that describes its ability to fight. When two single lemmings fight with each one, the lemming with more power survives and the other one dies. However, the power of the living lemming gets smaller after the fight, exactly in the value of the power of the lemming that died. For example, if we have a green lemming with power 50 and a blue lemming with power 40, the blue one dies and the green one survives, but having only power 10 after the battle (50-40=10). If two lemmings have the same power when they fight, both of them die.

In the fight between the two races, there are a certain number of battlefields. Each race assigns one lemming for each battlefield, starting with the most powerful. So for example, if a race has 5 lemmings with power {50, 50, 40, 40, 30} and we have 3 battlefields, then a lemming with power 50 will be assigned to battlefield 1, another with 50 power will be assigned to battlefield 2 and last a lemming with power 40 will go to battlefield 3. The other race will do the same.

The Deadly War is processed by having each race send its best soldiers as described to the battle- fields, making a battle round. Then, all battles process at the same time, and some of the lemmings will emerge victorious (but with less power) and some of them will die. The surviving ones will return to their race’s army and then a new round will begin, with each race sending again its best remaining soldiers to the battlefields. If at some point a race does not have enough soldiers to fill all battlefields, then only the ones with soldiers from both races will have a fight.

The Deadly War ends when one of the races has no more lemmings or when both of them disappear at the same time. For example, imagine a war with 2 battlefields and a green army with powers {20,10} and a blue army with powers {10, 10, 15}. The first round will have 20 vs 15 in battlefield 1 and 10 vs 10 in battlefield 2. After these battles, green race will still have a power 5 lemming (that won on battlefield 1) and blue race will have one with power 10 (that did not fight). The ones in battlefield 2 died, since they both had the same power. After that comes a second round, and only battlefield 1 will have a fight, being 5 vs 10. The blue lemming wins, killing the last green soldier and giving the victory to the blue race!

But in the real battle, will victory be green or blue?

Given the number of battefields and the armies of both races, your task is to discover which race will win the Deadly War and show the power of the surviving soldiers.

#### Input
You are given B, SG and SB, representing respectively the number of battlefields available, a vector of integers size n of lemmings in the green army and a vector of integers size n of lemmings in the blue army (1 ≤ B, SG, SB ≤ 100000).

The lemmings in each army do not need to come in any particular order.

#### Output
For each test case you should return :

• "Green and Blue died" if both races died in the same round

• "Green wins : Each surviving soldier in descending order" if the green army won the Deadly War

• "Blue wins : Each surviving soldier in descending order" if the blue army won the Deadly War

#### Example
`lemmingBattle(5, [10], [10]) === "Green and Blue died"`  
`lemmingBattle(2, [20,10], [10,10,15]) === "Blue wins: 5"`  
`lemmingBattle(3, [50,40,30,40,50], [50,30,30,20,60]) === "Green wins: 10 10"` 

## Russian

### Задание от учителя
• Решить задачу на Swift

• Покрыть решение Unit и UI тестами, пользуясь техниками тест-дизайна

### Задание от CodeWars
О нет... еще лемминги!! А на планете Леммингов идет грандиозная битва между двумя великии соперничающими расами: зелеными леммингами и голубыми леммингами. Теперь все были назначены на битву, и они будут сражаться до тех пор, пока одна из рас полностью не исчезнет: смертельная война началась!

У каждого отдельного лемминга есть мера силы, которая описывает его способность сражаться. Когда два одиночных лемминга сражаются друг с другом, лемминг с большей силой выживает, а другой умирает. Однако сила живого лемминга становится меньше после боя, ровно на величину силы умершего лемминга. Например, если у нас есть зеленый лемминг с силой 50 и синий лемминг с силой 40, синий умирает, а зеленый выживает, но имеет только силу 10 после битвы (50 - 40 = 10). Если два лемминга обладают одинаковой силой, когда они сражаются, они оба умирают.

В борьбе между двумя расами существует определенное количество полей сражений. Каждая раса назначает по одному леммингу на каждое поле боя, начиная с самого сильного. Так, например, если в расе есть 5 леммингов с силой {50, 50, 40, 40, 30} и у нас есть 3 поля боя, то лемминг с силой 50 будет назначен на поле 1, другой с силой 50 будет назначен на поле 2, а последний лемминг с силой 40 пойдет на поле 3. Другая раса сделает то же самое.

Смертельная война идет так, что каждая раса отправляет своих лучших солдат, как описано, на поля сражений, совершая боевой раунд. Затем все сражения происходят одновременно, и некоторые из леммингов выйдут победителями (но с меньшей силой), а некоторые из них умрут. Выжившие вернутся в армию своей расы, а затем начнется новый раунд, в котором каждая раса снова отправит своих лучшийх оставшихся солдат на поля сражений. Если в какой-то момент у расы не хватит солдат, чтобы заполнить все поля сражений, то сражаться будут только те, у кого есть солдаты из обеих рас.

Смертельная война заканчивается, когда у одной из рас больше нет леммингов или когда они закончатся в одно время. Например, представьте себе война с 2 полями сражений и зеленой армией с силой {20, 10} и синей армией с силой {10, 10, 15}. В первом раунде будет 20 против 15 на поле 1 и 10 против 10 на поле 2. После этой битвы, у зеленой расы все еще будет лемминг с силой 5 (который победил на поле 1), а у синей расы будет лемминг с силой 10 (который не сражался). Те, что были на поле 2, умерли, так как они оба обладали одинаковой силой. После этого наступает второй раунд, и только поле 1 будет использоваться для сражения - 5 против 10. Синий лемминг побеждает, убивая последнего зеленого солдата и приносит победу голубой расе!

Но в реально битве победа будет зеленой или синей? 

Дается количество полей сражений и армии обеих рас, ваше задание выяснить какая раса выиграет смертельную войну и показать силу выживших солдат.

#### Входные данные
Вам даны B, SG и SB, представляющие соответственно количетсво доступных полей сражений, вектор целых чисел размером n леммингов в зеленой армии и вектор целых чисел размером n леммингов в синей армии (1 ≤ B, SG, SB ≤ 100000).

Лемминги в каждой армии не должны появляться в каком-то определенном порядке.

#### Выходные данные
Для каждого тествого случая вы должны вернуть :

• "Green and Blue died" если обе расы умерли в одном раунде

• "Green wins : каждый выживший солдат в порядке убывания" если зеленая армия выиграла Смертельную войну

• "Blue wins : каждый выживший солдат в порядке убывания" если синяя армия выиграла Смертельную войну

#### Пример
`lemmingBattle(5, [10], [10]) === "Green and Blue died"`  
`lemmingBattle(2, [20,10], [10,10,15]) === "Blue wins: 5"`  
`lemmingBattle(3, [50,40,30,40,50], [50,30,30,20,60]) === "Green wins: 10 10"`  
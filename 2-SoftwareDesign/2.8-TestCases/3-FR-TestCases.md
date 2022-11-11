Перевірка методу fillData():

|FR id|TC id|Опис кроків тестового сценарію|Опис очікуваних результатів|
|:-:|:-:|:-|:-:|
|FR1.1|TC1.1|Початкові умови: Дані водія не зареєстровані: <br> S.N.P. = Krutiienko_Andrii_Olexandrovich <br> Birtday_date = 11.08.2015 <br> Fines= 122:Перевищення швидкості <br> Car_licence = Дійсна|Результат = 1|
|FR1.1|TC1.2|Початкові умови: відсутні <br> Кроки сценарію: <br> S.N.P. = Andrii_Olexandrovich_Krutiienko <br> Birtday_date = 11.08.2015 <br> Fines= 122:Перевищення швидкості <br> Car_licence = Дійсна|Результат = -1|
|FR1.1|TC1.3|Початкові умови: відсутні <br> Кроки сценарію: <br> S.N.P. = Krutiienko_Andrii_Olexandrovich <br> Birtday_date = 08:15:2015 <br> Fines= 122:Перевищення швидкості <br> Car_licence = Дійсна|Результат = -2|
|FR1.1|TC1.4|Початкові умови: відсутні <br> Кроки сценарію: <br> S.N.P. = Krutiienko_Andrii_Olexandrovich <br> Birtday_date = 11.08.2015 <br> Fines= Перевищення швидкості:122 <br> Car_licence = Дійсна|Результат = -3|
|FR1.1|TC1.5|Початкові умови: відсутні <br> Кроки сценарію: <br> S.N.P. = Krutiienko_Andrii_Olexandrovich <br> Birtday_date = 11.08.2015 <br> Fines= 122:Перевищення швидкості <br> Car_licence = Ця ліцензія на авто не є дійсною для водія транспорту|Результат = -4|


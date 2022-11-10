/* Створення об'єктного типу (класу) User */
CREATE OR REPLACE TYPE User AS OBJECT (
   	user_id NUMBER(10), -- № користувача
	  surname VARCHAR(20), -- прізвище користувача
	  name VARCHAR(20), -- ім'я користувача
    patronymic VARCHAR(20), -- по-батькові користувача
    phone_number NUMBER(15), -- з/п користувача
    policeman_id NUMBER(10), -- № поліцейського
    driver_id NUMBER(10), -- № водія
    	NOT FINAL MEMBER PROCEDURE display
) NOT FINAL 
/

/* Створення типу для зберігання списку співробітників - "Колекція екземплярів об`єктів класу User */
CREATE TYPE User_List IS TABLE OF User;
/

/* Cтворення об'єктного типу (класу) Policeman, що успадковує об'єктний тип User */
CREATE OR REPLACE TYPE Policeman UNDER User (
   	policeman_id NUMBER(4), -- № поліцейського
    surname VARCHAR(20), -- прізвище поліцейського
    name VARCHAR(20), -- ім'я поліцейського
    patronymic VARCHAR(20), -- по-батькові поліцейського
    salary NUMBER(6,2), -- з/п поліцейського
    education VARCHAR(20), -- рівень освіти поліцейського
    experience NUMBER(2), -- досвід (у роках) поліцейського
	/* перевизначення методу-процедури класу User */
    	OVERRIDING MEMBER PROCEDURE display 
);
/

/* Створення об'єктного типу (клас) Personal_data */
-- DROP TYPE Personal_data FORCE;
CREATE OR REPLACE TYPE Personal_data AS OBJECT (
    personal_id NUMBER(4), -- № персональних даних
    surname VARCHAR(20), -- прізвище водія
    name VARCHAR(20), -- ім'я водія
    patronymic VARCHAR(20), -- по-батькові водія
    birthday_date DATE, -- № день народження водія
    car_licence NUMBER(10) -- ліцензія водія
    	/* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) p_birthday_date - дата народження
	   умова 1) якщо в таблиці Personal_data вже існує вказана дата,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Personal_data створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    	CONSTRUCTOR FUNCTION Personal_data(p_birthday_date DATE)
        	RETURN SELF AS RESULT,
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_birthday_date(p_personal_id NUMBER, p_birthday_date DATE),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_personal_id  RETURN NUMBER,
		MEMBER FUNCTION get_birthday_date RETURN DATE,
    	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/
-- show errors;

/* Створення об'єктного типу (класу) Driver */
CREATE OR REPLACE TYPE Driver AS OBJECT (
    driver_id NUMBER(10), -- № водія
    fines VARCHAR(100), -- штрафи водія
    car_licence VARCHAR(100), -- ліцензія водія
    personal_id NUMBER(10) -- № персональних даних
	/* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) p_fines - штрафи водія
	   умова 1) якщо в таблиці Driver вже існує вказаний дослід,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Driver створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    	CONSTRUCTOR FUNCTION Driver(p_fines  VARCHAR)
        	RETURN SELF AS RESULT,
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_fines (p_driver_id NUMBER, p_fines  VARCHAR),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_driver_id RETURN NUMBER,
		MEMBER FUNCTION get_fines  RETURN VARCHAR,
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/

/* Створення об'єктного типу (класу) Fine */
CREATE OR REPLACE TYPE Fine AS OBJECT (
    fine_id NUMBER(10), -- № штрафу
    amount NUMBER(10), -- сумма штрафу
    policeman_id NUMBER(10), -- № поліцейського
    driver_id NUMBER(10), -- № водія
    Fine_article_id NUMBER(10), -- № статті штрафу
/* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) p_amount - список змін показників обладнання
	   умова 1) якщо в таблиці Fine вже існує вказаний список,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Fine створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    	CONSTRUCTOR FUNCTION Fine(p_amount NUMBER)
        	RETURN SELF AS RESULT,
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_amount(p_fine_id NUMBER, p_amount NUMBER),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_fine_id RETURN NUMBER,
		MEMBER FUNCTION get_amount RETURN NUMBER,
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/

/* Створення об'єктного типу (класу) Fine_article */
CREATE OR REPLACE TYPE Fine_article AS OBJECT (
    fine_article_id NUMBER(10), -- № статті штрафу
    article_number NUMBER(10), -- назва статті штрафу
    article_type VARCHAR(20), -- № тип статті штрафу
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/

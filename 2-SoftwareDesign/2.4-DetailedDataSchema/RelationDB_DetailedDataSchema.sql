/* видалення таблиць з каскадним видаленням 
можливих описів цілісності */
drop table Fine CASCADE CONSTRAINTS;
drop table Fine_article CASCADE CONSTRAINTS;
drop table Policeman CASCADE CONSTRAINTS;
drop table Personal_data CASCADE CONSTRAINTS;
drop table User CASCADE CONSTRAINTS;

CREATE TABLE Policeman ( -- опис поліцейського
	policeman_id NUMBER(4), -- № поліцейського
	surname VARCHAR(20), -- прізвище поліцейського
	name VARCHAR(20), -- ім'я поліцейського
	patronymic VARCHAR(20), -- по-батькові поліцейського
	salary NUMBER(6,2), -- з/п поліцейського
	education VARCHAR(20), -- рівень освіти поліцейського
	experience NUMBER(2), -- досвід (у роках) поліцейського
	);

CREATE TABLE Personal_data ( -- опис персональних даних
	personal_id NUMBER(4), -- № персональних даних
	surname VARCHAR(20), -- прізвище водія
	name VARCHAR(20), -- ім'я водія
	patronymic VARCHAR(20), -- по-батькові водія
	birthday_date DATE, -- № день народження водія
	car_licence NUMBER(10) -- ліцензія водія
);

CREATE TABLE User ( -- опис користувача
	user_id NUMBER(10), -- № користувача
	surname VARCHAR(20), -- прізвище користувача
	name VARCHAR(20), -- ім'я користувача
	patronymic VARCHAR(20), -- по-батькові користувача
	phone_number NUMBER(15), -- з/п користувача
	policeman_id NUMBER(10), -- № поліцейського
	driver_id NUMBER(10), -- № водія
	);

CREATE TABLE Driver ( -- опис водія
	driver_id NUMBER(10), -- № водія
	fines VARCHAR(100), -- штрафи водія
	car_licence VARCHAR(100), -- ліцензія водія
	personal_id NUMBER(10) -- № персональних даних
);
	
CREATE TABLE Fine ( -- опис штрафу
	fine_id NUMBER(10), -- № штрафу
	amount NUMBER(10), -- сумма штрафу
	policeman_id NUMBER(10), -- № поліцейського
	driver_id NUMBER(10), -- № водія
	Fine_article_id NUMBER(10), -- № статті штрафу
);
	
CREATE TABLE Fine_article ( -- опис статті штрафу
	fine_article_id NUMBER(10), -- № статті штрафу
	article_number NUMBER(10), -- назва статті штрафу
	article_type VARCHAR(20), -- № тип статті штрафу
);

-- обмеження первинного ключа
ALTER TABLE Policeman ADD CONSTRAINT plm_pk
	PRIMARY KEY (experiment_id);

ALTER TABLE Personal_data ADD CONSTRAINT pd_pk
	PRIMARY KEY (experiment_id);

ALTER TABLE User ADD CONSTRAINT usr_pk
	PRIMARY KEY (experiment_id);

ALTER TABLE Driver ADD CONSTRAINT drv_pk
	PRIMARY KEY (experiment_id);

ALTER TABLE Fine ADD CONSTRAINT fn_pk
	PRIMARY KEY (experiment_id);

ALTER TABLE Fine_article ADD CONSTRAINT fn_art_pk
	PRIMARY KEY (experiment_id);
	
-- обмеження зовнішнього ключа
ALTER TABLE User ADD CONSTRAINT plm_id_fk
	FOREIGN KEY (policeman_id)
	REFERENCES Policeman (policeman_id);

ALTER TABLE User ADD CONSTRAINT drv_id_fk
	FOREIGN KEY (driver_id)
	REFERENCES Driver (driver_id);

ALTER TABLE Driver ADD CONSTRAINT pd_id_fk
	FOREIGN KEY (personal_id)
	REFERENCES Personal_data (personal_id);

ALTER TABLE Fine ADD CONSTRAINT policeman_id_fk
	FOREIGN KEY (policeman_id)
	REFERENCES Policeman (policeman_id);
	
ALTER TABLE Fine ADD CONSTRAINT drv_id_fk
	FOREIGN KEY (driver_id)
	REFERENCES Driver (driver_id);

ALTER TABLE User ADD CONSTRAINT fn_art_id_fk
	FOREIGN KEY (fine_article_id)
	REFERENCES Fine_article (fine_article_id);

-- обмеження вмісту стовбчика таблиці
ALTER TABLE Policeman ADD CONSTRAINT plm_salary_range
	CHECK (salary between 0 and 50000);

ALTER TABLE Fine ADD CONSTRAINT fine_amoun_range
	CHECK (salary between 0 and 100000);

ALTER TABLE Policeman ADD CONSTRAINT plm_experience_range
	CHECK (experience>0);
	
ALTER TABLE Fine_article ADD CONSTRAINT fn_num_range
	CHECK (article_number>0);
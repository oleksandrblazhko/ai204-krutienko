/* Методи класу Personal_data */
-- DROP TYPE Personal_data FORCE;
CREATE OR REPLACE TYPE BODY Personal_data AS 
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
    IS
        v_driver_id Personal_data.personal_id%TYPE;
    BEGIN
        SELECT personal_id INTO v_personal_id
        FROM Personal_data
        WHERE 
            birthday_date = p_birthday_date ;
        SELF.personal_id := v_personal_id;
        SELF.birthday_date := p_birthday_date;
        RETURN;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        INSERT INTO Personal_data(birthday_date)
            VALUES (p_birthday_date)
        RETURNING personal_id INTO v_personal_id;
        SELF.personal_id := v_personal_id;
        SELF.birthday_date := p_birthday_date;
        RETURN;
    END Personal_data;
    
        /* Процедура зміни значень атрибутів */
	      MEMBER PROCEDURE fillData(p_personal_id NUMBER, p_surname VARCHAR, p_name VARCHAR, p_patronymic VARCHAR, p_birthday_date DATE, p_car_licence NUMBER)
	      IS
	      BEGIN
        UPDATE Personal_data SET surname = p_surname, name = p_name, patronymic = p_patronymic, birthday_date = p_birthday_date, car_licence = p_car_licence
		      WHERE personal_id = p_personal_id;
		      SELF.surname := p_surname, SELF.name := p_name, SELF.patronymic := p_patronymic, SELF.birthday_date := p_birthday_date, SELF.car_licence := p_car_licence;
	      END fillData;
    
        /* Функції отримання значень атрибутів */
	      /* get_personal_id */
        MEMBER FUNCTION get_personal_id
	        RETURN NUMBER 
	      IS
        BEGIN
          RETURN SELF.personal_id;
        END get_personal_id;
        
        /* get_birthday_date */
        MEMBER FUNCTION get_birthday_date
	        RETURN NUMBER 
	      IS
        BEGIN
          RETURN SELF.birthday_date;
        END get_birthday_date;

        /* Процедура виводу на екран значень атрибутів */
        MEMBER PROCEDURE display 
        IS
        BEGIN 
          dbms_output.put_line('personal_id: ' || personal_id);
          dbms_output.put_line('surname: ' || surname);
          dbms_output.put_line('name: ' || name);
          dbms_output.put_line('patronymic: ' || patronymic);
          dbms_output.put_line('birthday_date: ' || birthday_date);
          dbms_output.put_line('car_licence: ' || car_licence);
        END display;
END; 
/

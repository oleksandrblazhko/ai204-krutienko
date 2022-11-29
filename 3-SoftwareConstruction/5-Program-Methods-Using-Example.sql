/* Приклади роботи з класом Personal_data */
DECLARE
    pd1 Personal_data;
BEGIN 
    pd1:= NEW Personal_data(1, 'Krutienko', 'Andrey', 'Igorevich', TO_DATE('11.08.2003','DD/MM/YYYY'), 779790);
	    dbms_output.put_line('personal_id: ' || personal_id);
	    dbms_output.put_line('surname: ' || surname);
      dbms_output.put_line('name: ' || name);
      dbms_output.put_line('patronymic: ' || patronymic);
	    dbms_output.put_line('birthday_date: ' || birthday_date);
      dbms_output.put_line('car_licence: ' || car_licence);
    pd1.display();
END;
/

/* Приклад роботи з класами Personal_data, Driver */
DECLARE 
    pd1 Personal_data;
    dr1 Driver;
BEGIN 
    pd1:= Personal_data(1, 'Krutienko', 'Andrey', 'Igorevich', TO_DATE('11.08.2003','DD/MM/YYYY'), 779790);
    dr1:= Driver(1, 'over speed', 'AA1887EB',pd1);
    dr1.display();
END;
/

/* Приклад роботи з класами Personal_data, Driver, Fine */
DECLARE 
    pd1 Personal_data;
    dr1 Driver;
    fn1 Fine ;
BEGIN
     pd1:= Personal_data(1, 'Krutienko', 'Andrey', 'Igorevich', TO_DATE('11.08.2003','DD/MM/YYYY'), 779790);
     dr1:= Driver(1, 'over speed', 'AA1887EB',pd1);

    fn1 := Fine(6784, 12000, 3, 121, dr1);
    fn1.display(); 
END;
/

/* Приклад роботи з класами Personal_data, Driver, Fine, Fine_article*/
DECLARE 
    pd1 Personal_data;
    dr1 Driver;
    fn1 Fine ;
    fa1 Fine_article;
BEGIN
     pd1:= Personal_data(1, 'Krutienko', 'Andrey', 'Igorevich', TO_DATE('11.08.2003','DD/MM/YYYY'), 779790);
     dr1:= Driver(1, 'over speed', 'AA1887EB',pd1);
     fa1 := Fine_article(121, 'speed override', 'administrative offense');
     
     fn1 := Fine(6784, 12000, 3, fa1, dr1);
     fn1.display(); 
END;
/

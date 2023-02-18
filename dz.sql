
    postgres=# \c skypro
    skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Lena       | Petrova   | female |  38
  2 | Olga       | Alekseeva | female |  28
    skypro=# INSERT INTO employee(
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Aleksey', 'Ivanov', 'male', 48);
INSERT 0 1
    skypro=# INSERT INTO employee(
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Vasiliy', 'Petrov', 'male', 25);
INSERT 0 1
    skypro=# INSERT INTO employee(
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Oleg', 'Lukov', 'male', 40);
INSERT 0 1
    skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Lena       | Petrova   | female |  38
  2 | Olga       | Alekseeva | female |  28
  3 | Aleksey    | Ivanov    | male   |  48
  4 | Vasiliy    | Petrov    | male   |  25
  5 | Oleg       | Lukov     | male   |  40
    skypro=# SELECT first_name AS Имя,
skypro-# last_name AS Фамилия
skypro-# FROM employee;
   Имя   |  Фамилия
---------+-----------
 Lena    | Petrova
 Olga    | Alekseeva
 Aleksey | Ivanov
 Vasiliy | Petrov
 Oleg    | Lukov
    skypro=# SELECT * FROM employee
skypro-# WHERE age < 30 OR age > 50;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  2 | Olga       | Alekseeva | female |  28
  4 | Vasiliy    | Petrov    | male   |  25
skypro=# SELECT * FROM employee
skypro-# WHERE age BETWEEN 30 AND 50;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Lena       | Petrova   | female |  38
  3 | Aleksey    | Ivanov    | male   |  48
  5 | Oleg       | Lukov     | male   |  40
    skypro=# SELECT last_name AS Фамилия
skypro-# FROM employee
skypro-# ORDER BY Фамилия DESC;
  Фамилия
-----------
 Petrova
 Petrov
 Lukov
 Ivanov
 Alekseeva

    skypro=# SELECT * FROM employee
skypro-# WHERE first_name
skypro-# LIKE '_____%';
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Aleksey    | Ivanov    | male   |  48
  4 | Vasiliy    | Petrov    | male   |  25


    skypro=# UPDATE employee SET first_name = 'Lena' WHERE id = 2;
UPDATE 1
    skypro=# UPDATE employee SET first_name = 'Oleg' WHERE id = 4;
UPDATE 1
    skypro=# SELECT first_name AS ИМЯ,
skypro-# SUM(age) AS суммарный_возвраст
skypro-# FROM employee GROUP BY ИМЯ;
   ИМЯ   | суммарный_возвраст
---------+--------------------
 Aleksey |                 48
 Oleg    |                 65
 Lena    |                 66
    skypro=# SELECT first_name AS ИМЯ,
skypro-# MIN(age)
skypro-# FROM employee GROUP BY ИМЯ;
   ИМЯ   | min
---------+-----
 Aleksey |  48
 Oleg    |  25
 Lena    |  28
    skypro=# SELECT first_name AS ИМЯ,
skypro-# MAX(age) AS Максимальный_возвраст
skypro-# FROM employee
skypro-# GROUP BY ИМЯ
skypro-# HAVING COUNT(first_name) > 1
skypro-# ORDER BY Максимальный_возвраст;
 ИМЯ  | Максимальный_возвраст
------+-----------------------
 Lena |                    38
 Oleg |                    40
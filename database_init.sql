CREATE TABLE major(
id_major INT PRIMARY KEY NOT NULL,
name_major VARCHAR(45) NOT NULL
);
CREATE TABLE userinfo(
  id SERIAL PRIMARY KEY UNIQUE  NOT NULL,
  username VARCHAR(45) NOT NULL,
  password VARCHAR(45) NOT NULL,
  id_major INT NOT NULL REFERENCES major(id_major),
  is_admin VARCHAR(1) NOT NULL
);
CREATE TABLE course (
  id_course SERIAL PRIMARY KEY NOT NULL,
  name_course VARCHAR(45) NOT NULL ,
  abbre_course VARCHAR(45) NOT NULL,
  time_course VARCHAR(45) NOT NULL ,
  score_course VARCHAR(45) NOT NULL
);
CREATE TABLE unit_course (
  id_course INT NOT NULL REFERENCES course(id_course),
  year INT NOT NULL ,
  id_major INT NOT NULL REFERENCES major(id_major),
  plan_order VARCHAR(45) NOT NULL,
  unit_id SERIAL NOT NULL unique ,
  primary key (id_course,year,id_major,plan_order,unit_id),
  name VARCHAR(45) NOT NULL,
  attr_course VARCHAR(45) NOT NULL
);

CREATE TABLE pre_course (
  id_course INT NOT NULL REFERENCES unit_course(unit_id),
  pre_id_course INT NOT NULL REFERENCES unit_course(unit_id),
  plan VARCHAR(45) NOT NULL
);
insert into major (id_major, name_major) values (1,'cse');
insert into major (id_major, name_major) values (2,'FINACEN');
insert into major (id_major, name_major) values (3,'PHYSICS');


insert into userinfo (username,password,id_major,is_admin)
values ('A',123,1,'F');
insert into userinfo (username,password,id_major,is_admin)
values ('B',123,2,'T');
insert into userinfo (username,password,id_major,is_admin)
values ('C',123,1,'F');


insert into course (name_course,abbre_course, time_course, score_course)
values ('数据结构与算法分析','CS203',3, 64);
insert into course (name_course,abbre_course, time_course, score_course)
values ('数字逻辑','CS207', 3, 64);
insert into course (name_course,abbre_course, time_course, score_course)
values ('概率论与数理统计','MA212', 3, 48);
insert into course (name_course,abbre_course, time_course, score_course)
values ('数据库原理', 'CS307',3, 21);
insert into course (name_course,abbre_course, time_course, score_course)
values ('离散数学','CS201', 3, 48);
insert into course (name_course,abbre_course, time_course, score_course)
values ('计算机组成原理','CS202', 3, 64);
insert into course (name_course,abbre_course, time_course, score_course)
values ('算法设计与分析','CS208', 3, 64);
insert into course (name_course,abbre_course, time_course, score_course)
values ('计算机程序设计基础A', 'CS102A',3, 64);
insert into course (name_course,abbre_course, time_course, score_course)
values ('数学分析II', 'MA102A',3, 64);
insert into course (name_course,abbre_course, time_course, score_course)
values ('高等数学A下','MA102B', 3, 64);
insert into course (name_course,abbre_course, time_course, score_course)
values ('线性代数A','MA107A', 3, 64);



insert into unit_course(id_course, year, id_major, plan_order, name, attr_course)
values (1, 2019, 1, 2, '数据结构与算法分析', '先修');
insert into unit_course(id_course, year, id_major, plan_order, name, attr_course)
values (2, 2019, 1, 2, '数字逻辑', '先修');
insert into unit_course(id_course, year, id_major, plan_order, name, attr_course)
values (3, 2019, 1, 2, '概率论与数理统计', '先修');
insert into unit_course(id_course, year, id_major, plan_order, name, attr_course)
values (4, 2019, 1, 2, '数据库原理', '先修');
insert into unit_course(id_course, year, id_major, plan_order, name, attr_course)
values (5, 2019, 1, 2, '离散数学', '先修');
insert into unit_course(id_course, year, id_major, plan_order, name, attr_course)
values (6, 2019, 1, 2, '计算机组成原理', '先修');
insert into unit_course(id_course, year, id_major, plan_order, name, attr_course)
values (7, 2019, 1, 2, '算法设计与分析', '先修');
insert into unit_course(id_course, year, id_major, plan_order, name, attr_course)
values (8, 2019, 1, 2, '计算机程序设计基础A', '先修');
insert into unit_course(id_course, year, id_major, plan_order, name, attr_course)
values (9, 2019, 1, 2, '数学分析II', '先修');
insert into unit_course(id_course, year, id_major, plan_order, name, attr_course)
values (10, 2019, 1, 2, '高等数学A下', '先修');
insert into unit_course(id_course, year, id_major, plan_order, name, attr_course)
values (11, 2019, 1, 2, '线性代数A', '先修');




insert into pre_course(id_course, pre_id_course, plan)
VALUES (1, 9, 1);
insert into pre_course(id_course, pre_id_course, plan)
VALUES (3, 9, 1);
insert into pre_course(id_course, pre_id_course, plan)
VALUES (3, 10, 2);
update pre_course set id_course = 3 where id_course = 1 and pre_id_course = 11;
insert into pre_course(id_course, pre_id_course, plan)
VALUES (4, 9, 1);
insert into pre_course(id_course, pre_id_course, plan)
VALUES (5, 10, 1);
insert into pre_course(id_course, pre_id_course, plan)
VALUES (5, 11, 1);
insert into pre_course(id_course, pre_id_course, plan)
VALUES (6, 2, 1);
insert into pre_course(id_course, pre_id_course, plan)
VALUES (7, 9, 1);
insert into pre_course(id_course, pre_id_course, plan)
VALUES (7, 1, 1);

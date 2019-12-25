CREATE TABLE major
(
  id_major   SERIAL PRIMARY KEY NOT NULL,
  name_major VARCHAR(45)        NULL
);
CREATE TABLE userinfo
(
  id           SERIAL PRIMARY KEY NOT NULL,
  username     VARCHAR(45)        NOT NULL,
  password     VARCHAR(45)        NOT NULL,
  mail_address VARCHAR(45)        NOT NULL,
  real_name    VARCHAR(100)       NOT NULL,
  year INT NOT NULL,
  inter_year INT NOT NULL,
  sex          INT                NOT NULL, -- 0 female 1 man others do not care
  id_major     INT                NOT NULL REFERENCES major (id_major),
  is_admin     INT                NOT NULL
);
CREATE TABLE course
(
  id_course   SERIAL PRIMARY KEY NOT NULL,
  name_course VARCHAR(45)        NOT NULL,
  abbr_course Varchar(45)        NOT NULL,
  open_major  INT                NOT NULL REFERENCES major (id_major),
  open_time   INT                NOT NULL,--01 秋季学期, 2(10)春季学期,4(100) 小学期,
  unique (name_course, abbr_course),
  unique (id_course, abbr_course),
  unique (id_course, name_course, abbr_course, open_major, open_time)
);
create TABLE user_course
(
  id_user   INT NOT NULL REFERENCES userinfo (id),
  id_course INT NOT NULL REFERENCES course (id_course),
  primary key (id_user, id_course)
);
CREATE TABLE pre_course
(
  id_course     INT NOT NULL REFERENCES course (id_course),
  pre_course_id INT NOT NULL REFERENCES course (id_course),
  groups        INT NOT NULL,
  primary key (id_course, pre_course_id, groups)
);
CREATE TABLE schema_plan
(
  major_schema INT           NOT NULL REFERENCES major (id_major),
  year         INT           NOT NULL,
  id_auto      SERIAL UNIQUE NOT NULL,
  inter_year   INT           NOT NULL,
  messages     text          NOT NULL,
  primary key (major_schema, year,inter_year)
);
--remeber score_course in int so it need to /2 to be real number
CREATE TABLE plan_course
(
  id_plan        INT         NOT NULL REFERENCES schema_plan (id_auto),
  id_course      INT         NOT NULL REFERENCES course (id_course),
  name_course    VARCHAR(45) NOT NULL,
  score_course   INT         NOT NULL,
  time_course    INT         NOT NULL,
  group_message  VARCHAR(45) NOT NULL,
  adivse_semster INT         NOT NULL,
  primary key (id_plan, id_course)
);
/*
CREATE TABLE schema_kinds
(
  id_schema_plans INT           NOT NULL REFERENCES schema_plan (id_auto),
  schema_kind     SERIAL UNIQUE NOT NULL,
  type            VARCHAR(45)   NOT NULL,
  min_score       VARCHAR(45)   NOT NULL,
  primary key (id_schema_plans, schema_kind)
);
CREATE TABLE schema
(
  id_course INT NOT NULL REFERENCES course (id_course),
  id_schema INT NOT NULL REFERENCES schema_kinds (schema_kind),
  semster   INT NOT NULL,
  primary key (id_course, id_schema)
);
*/

insert into major (id_major, name_major)
values (1, 'CSE');
insert into major (id_major, name_major)
values (2, 'FINACEN');
insert into major (id_major, name_major)
values (3, 'PHYSICS');
insert into major (id_major, name_major)
values (4, 'Math');
insert into major (id_major, name_major)
values (5, 'BIOLOGY');
insert into major (id_major, name_major)
values (6, 'ELECTRON');
insert into major (id_major, name_major)
values (7, 'SiZheng');



insert into userinfo (username, password, real_name, sex, id_major, is_admin, mail_address, year, inter_year)
values ('11769773', '刘邦', 1, 123, 1, 0, '11769773@mail.sustech.edu.cn',2017,2);
insert into userinfo(username, password, real_name, sex, id_major, is_admin, mail_address, year, inter_year)
values ('300001671', '梅林', 0, 123, 2, 1, '300001671@sustc.edu.cn',2017,2);
insert into userinfo(username, password, real_name, sex, id_major, is_admin, mail_address, year, inter_year)
values ('300049872', '王尼玛', 1, 123, 1, 2, '300049872@mail.sustech.edu.cn',2017,2);


insert into course (name_course, abbr_course, open_major, open_time)
values ('数据结构与算法分析', 'CS203', 1, 1);
insert into course (name_course, abbr_course, open_major, open_time)
values ('数字逻辑', 'CS207', 1, 1);
insert into course (name_course, abbr_course, open_major, open_time)
values ('概率论与数理统计', 'MA212', 4, 1);
insert into course (name_course, abbr_course, open_major, open_time)
values ('数据库原理', 'CS307', 1, 2);
insert into course (name_course, abbr_course, open_major, open_time)
values ('离散数学', 'CS201', 1, 2);
insert into course (name_course, abbr_course, open_major, open_time)
values ('计算机组成原理', 'CS202', 1, 2);
insert into course (name_course, abbr_course, open_major, open_time)
values ('算法设计与分析', 'CS208', 1, 2);
insert into course (name_course, abbr_course, open_major, open_time)
values ('计算机程序设计基础A', 'CS102A', 1, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('数学分析II', 'MA102A', 4, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('高等数学A下', 'MA102B', 4, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('线性代数A', 'MA107A', 4, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('高等数学A上', 'MA10B', 4, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('大学物理B上', 'PHY103B', 3, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('大学物理B下', 'PHY105B', 3, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('生命科学概论', 'BIO102B', 5, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('普通物理实验', 'PHY104B', 3, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('思想道德修养和法律基础', 'IPE101', 7, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('马克思主义基本原理概论', 'IPE102', 7, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('中国近现代史纲要', 'IPE103', 7, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('毛泽东思想和中国特色社会主义概论', 'IPE104', 7, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('形势与政策', 'IPE105', 7, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('写作与交流', 'HUM032', 7, 3);
insert into course (name_course, abbr_course, open_major, open_time)
values ('嵌入式系统与微机原理', 'CS301', 1, 1);
insert into course (name_course, abbr_course, open_major, open_time)
values ('人工智能', 'CS303', 1, 1);
insert into course (name_course, abbr_course, open_major, open_time)
values ('计算机网络', 'CS305', 1, 1);
insert into course (name_course, abbr_course, open_major, open_time)
values ('面向对象分析与设计', 'CS309', 1, 1);
insert into course (name_course, abbr_course, open_major, open_time)
values ('创新实践I', 'CS321', 1, 1);
insert into course (name_course, abbr_course, open_major, open_time)
values ('计算机科学与技术前沿讲座', 'CS317', 1, 1);
insert into course (name_course, abbr_course, open_major, open_time)
values ('计算机操作系统', 'CS302', 1, 2);
insert into course (name_course, abbr_course, open_major, open_time)
values ('软件工程', 'CS304', 1, 2);
insert into course (name_course, abbr_course, open_major, open_time)
values ('创新实验II', 'CS326', 1, 2);;
insert into course (name_course, abbr_course, open_major, open_time)
values ('计算机科学与技术前沿讲座II', 'CS318', 1, 2);
insert into course (name_course, abbr_course, open_major, open_time)
values ('创新实践III', 'CS413', 2, 1);
insert into course (name_course, abbr_course, open_major, open_time)
values ('计算机科学与技术前沿讲座III', 'CS415', 2, 1);
insert into course (name_course, abbr_course, open_major, open_time)
values ('工业实习', 'CS470', 2, 7);
insert into course (name_course, abbr_course, open_major, open_time)
values ('毕业论文', 'CS490', 2, 2);


insert into user_course (id_user, id_course)
VALUES (1, 1);
insert into user_course (id_user, id_course)
VALUES (1, 2);
insert into user_course (id_user, id_course)
VALUES (1, 3);
insert into user_course (id_user, id_course)
VALUES (1, 4);
insert into user_course (id_user, id_course)
VALUES (1, 5);
insert into user_course (id_user, id_course)
VALUES (1, 6);
insert into user_course (id_user, id_course)
VALUES (1, 7);
insert into user_course (id_user, id_course)
VALUES (1, 8);
insert into user_course (id_user, id_course)
VALUES (1, 9);
insert into user_course (id_user, id_course)
VALUES (1, 10);
insert into user_course (id_user, id_course)
VALUES (1, 11);
insert into user_course (id_user, id_course)
VALUES (1, 12);
insert into user_course (id_user, id_course)
VALUES (1, 13);
insert into user_course (id_user, id_course)
VALUES (1, 14);
insert into user_course (id_user, id_course)
VALUES (1, 15);
insert into user_course (id_user, id_course)
VALUES (1, 16);
insert into user_course (id_user, id_course)
VALUES (1, 17);
insert into user_course (id_user, id_course)
VALUES (1, 18);
insert into user_course (id_user, id_course)
VALUES (1, 19);
insert into user_course (id_user, id_course)
VALUES (1, 20);
insert into user_course (id_user, id_course)
VALUES (1, 21);
insert into user_course (id_user, id_course)
VALUES (1, 22);
insert into user_course (id_user, id_course)
VALUES (1, 23);
insert into user_course (id_user, id_course)
VALUES (1, 24);
insert into user_course (id_user, id_course)
VALUES (1, 25);
insert into user_course (id_user, id_course)
VALUES (1, 26);
insert into user_course (id_user, id_course)
VALUES (1, 27);
insert into user_course (id_user, id_course)
VALUES (1, 28);
insert into user_course (id_user, id_course)
VALUES (1, 29);


insert into pre_course(id_course, pre_course_id, groups)
VALUES (1, 9, 1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (3, 9, 1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (3, 10, 2);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (4, 9, 1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (5, 10, 1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (5, 11, 1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (6, 2, 1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (7, 9, 1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (7, 1, 1);

insert into schema_plan (major_schema, year, inter_year,messages)
values (1, 2017,2, '123');
insert into schema_plan (major_schema, year,inter_year,  messages)
values (1, 2018, 2, '123');
insert into schema_plan (major_schema, year, inter_year, messages)
values (1, 2019, 2, '123');
insert into schema_plan (major_schema, year,inter_year,  messages)
values (1, 2018, 1, '123');
insert into schema_plan (major_schema, year, inter_year, messages)
values (1, 2019, 1, '123');


ALTER TABLE plan_course ADD inter_year INT NOT NULL;

insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 1, '数据结构与算法分析', 4,4, '专业先修', 3,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 2, '数字逻辑', 4,4, '专业先修', 3,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 3, '概率论与数理统计', 4,4, '专业先修', 3,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 4, '数据库原理', 4,4, '专业先修', 4,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 5, '离散数学', 4,4, '专业先修', 4,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 6, '计算机组成原理', 4,4, '专业先修', 4,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 7, '算法设计与分析', 4,4, '专业先修', 4,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 8, '计算机程序设计基础A', 4,4, '专业先修', 2,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 10, '高等数学A下', 4,4, '专业必修', 2,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 11, '线性代数A', 4,4, '专业必修', 2,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 12, '高等数学A上', 4,4, '专业必修', 1,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 13, '大学物理B上', 4,4, '专业必修', 1,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 14, '大学物理B下', 4,4, '专业必修', 2,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 15, '生命科学概论', 4,4, '专业必修', 1,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 16, '普通物理实验', 4,4, '专业必修', 2,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 17, '思想道德修养和法律基础', 2,2, '思政课', 1,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 18, '马克思主义基本原理概论', 2,2, '思政课', 2,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 19, '中国近现代史纲要', 2,2, '思政课', 3,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 20, '毛泽东思想和中国特色社会主义理论体系概论', 2,2, '思政课', 5,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 21, '形势与政策', 2,2, '思政课', 4,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 23, '嵌入式系统与微机原理', 4,4, '专业核心课', 5,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 24, '人工智能', 4,4, '专业核心课', 5,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 25, '计算机网络', 4,4, '专业核心课', 5,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 26, '面向对象分析与设计', 4,4, '专业核心课', 5,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 27, '创新实践I', 1,2, '专业核心课', 5,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 28, '计算机科学与技术前沿讲座III', 1,2, '专业核心课', 5,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 29, '计算机操作系统', 4,4, '专业核心课', 6,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 30, '软件工程', 4,4, '专业核心课', 6,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 31, '创新实践II', 1,2, '专业核心课', 6,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 32, '计算机科学与技术前沿讲座II', 1,2, '专业核心课', 6,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 33, '创新实践III', 1,2, '专业核心课', 7,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 34, '计算机科学与技术前沿讲座III', 1,2, '专业核心课', 7,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 35, '工业实习', 1,2, '专业核心课', 7,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 36, '毕业论文', 2,2, '专业核心课', 8,1);

drop table user_course;
drop table userinfo;

CREATE TABLE userinfo
(
  id           SERIAL PRIMARY KEY NOT NULL,
  username     VARCHAR(45)        NOT NULL,
  password     VARCHAR(45)        NOT NULL,
  mail_address VARCHAR(45)        NOT NULL,
  real_name    VARCHAR(100)       NOT NULL,
  year INT NOT NULL,
  inter_year INT NOT NULL,
  sex          INT                NOT NULL, -- 0 female 1 man others do not care
  id_major     INT                NOT NULL REFERENCES major (id_major),
  is_admin     INT                NOT NULL
);
create TABLE user_course
(
  id_user   INT NOT NULL REFERENCES userinfo (id),
  id_course INT NOT NULL REFERENCES course (id_course),
  primary key (id_user, id_course)
);
insert into userinfo (username, real_name, password, sex, id_major, is_admin, mail_address, year, inter_year)
values ('11769773', '刘雨舟', 'Happy',  1,1, 0, '11769773@mail.sustech.edu.cn',2017,2);
insert into userinfo(username, real_name, password, sex, id_major, is_admin, mail_address, year, inter_year)
values ('300001671', '王宇', 'password123',0, 2, 1, '300001671@sustc.edu.cn',2017,2);
insert into userinfo(username, real_name, password, sex, id_major, is_admin, mail_address, year, inter_year)
values ('300049872', '周斯','qwertyuiop', 1, 1, 2, '300049872@mail.sustech.edu.cn',2017,2);

insert into user_course (id_user, id_course)
VALUES (1, 1);
insert into user_course (id_user, id_course)
VALUES (1, 2);
insert into user_course (id_user, id_course)
VALUES (1, 3);
insert into user_course (id_user, id_course)
VALUES (1, 4);
insert into user_course (id_user, id_course)
VALUES (1, 5);
insert into user_course (id_user, id_course)
VALUES (1, 6);
insert into user_course (id_user, id_course)
VALUES (1, 7);
insert into user_course (id_user, id_course)
VALUES (1, 8);
insert into user_course (id_user, id_course)
VALUES (1, 9);
insert into user_course (id_user, id_course)
VALUES (1, 10);
insert into user_course (id_user, id_course)
VALUES (1, 11);
insert into user_course (id_user, id_course)
VALUES (1, 12);
insert into user_course (id_user, id_course)
VALUES (1, 13);
insert into user_course (id_user, id_course)
VALUES (1, 14);
insert into user_course (id_user, id_course)
VALUES (1, 15);
insert into user_course (id_user, id_course)
VALUES (1, 16);
insert into user_course (id_user, id_course)
VALUES (1, 17);
insert into user_course (id_user, id_course)
VALUES (1, 18);
insert into user_course (id_user, id_course)
VALUES (1, 19);
insert into user_course (id_user, id_course)
VALUES (1, 20);
insert into user_course (id_user, id_course)
VALUES (1, 21);
insert into user_course (id_user, id_course)
VALUES (1, 22);
insert into user_course (id_user, id_course)
VALUES (1, 23);
insert into user_course (id_user, id_course)
VALUES (1, 24);
insert into user_course (id_user, id_course)
VALUES (1, 25);
insert into user_course (id_user, id_course)
VALUES (1, 26);
insert into user_course (id_user, id_course)
VALUES (1, 27);
insert into user_course (id_user, id_course)
VALUES (1, 28);
insert into user_course (id_user, id_course)
VALUES (1, 29);




--201912241185000;
insert into course (name_course, abbr_course, open_major, open_time)values ('计算机导论','CS102A',1,1);
insert into course (name_course, abbr_course, open_major, open_time)values ('认知科学导论','CS106',1,2);
insert into course (name_course, abbr_course, open_major, open_time)values ('计算机系统设计及应用A','CS209A',1,2);
insert into course (name_course, abbr_course, open_major, open_time)values ('信号与系统','EE205',4,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('C/C++程序设计','CS205',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('时间序列分析','MA309',4,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('数值分析','MA305',4,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('数字信号处理','EE323',6,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('计算机视觉','CS308',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('编译原理','CS323',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('计算机安全','CS315',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('大数据导论','MA333',4,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('数字图像处理','EE326',6,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('数据挖掘','CS306',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('深度学习','CS324',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('计算机图形学','CS312',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values (' 物联网技术','CS314',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('智能机器人','CS401',1,2);
insert into course (name_course, abbr_course, open_major, open_time)values ('信息论与编码','EE411',6,2);
insert into course (name_course, abbr_course, open_major, open_time)values ('密码学与网络安全','CS403',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('机器学习','CS405',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('高级计算机网络与大数据','CS407',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('软件测试','CS409',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('高级算法','CS419',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('高级人工智能','CS421',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('演化计算及应用','CS408',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('高级优化算法','CS406',1,3);
insert into course (name_course, abbr_course, open_major, open_time)values ('计算机科学与技术前沿讲座IV','CS402',1,1);
insert into userinfo(username, password, mail_address, real_name, year, inter_year, sex, id_major, is_admin)
values ('11612837','weizaima','11612837@mail.sustech.edu.cn','吉萨',2016,2,0,1,0);
insert into user_course (id_user, id_course) VALUES (4,1);
insert into user_course (id_user, id_course) VALUES (4,2);
insert into user_course (id_user, id_course) VALUES (4,3);
insert into user_course (id_user, id_course) VALUES (4,4);
insert into user_course (id_user, id_course) VALUES (4,5);
insert into user_course (id_user, id_course) VALUES (4,6);
insert into user_course (id_user, id_course) VALUES (4,7);
insert into user_course (id_user, id_course) VALUES (4,8);
insert into user_course (id_user, id_course) VALUES (4,9);
insert into user_course (id_user, id_course) VALUES (4,10);
insert into user_course (id_user, id_course) VALUES (4,11);
insert into user_course (id_user, id_course) VALUES (4,12);
insert into user_course (id_user, id_course) VALUES (4,13);
insert into user_course (id_user, id_course) VALUES (4,14);
insert into user_course (id_user, id_course) VALUES (4,15);
insert into user_course (id_user, id_course) VALUES (4,16);
insert into user_course (id_user, id_course) VALUES (4,17);
insert into user_course (id_user, id_course) VALUES (4,18);
insert into user_course (id_user, id_course) VALUES (4,19);
insert into user_course (id_user, id_course) VALUES (4,20);
insert into user_course (id_user, id_course) VALUES (4,21);
insert into user_course (id_user, id_course) VALUES (4,22);
insert into user_course (id_user, id_course) VALUES (4,23);
insert into user_course (id_user, id_course) VALUES (4,24);
insert into user_course (id_user, id_course) VALUES (4,25);
insert into user_course (id_user, id_course) VALUES (4,26);
insert into user_course (id_user, id_course) VALUES (4,27);
insert into user_course (id_user, id_course) VALUES (4,28);
insert into user_course (id_user, id_course) VALUES (4,29);
insert into user_course (id_user, id_course) VALUES (4,30);
insert into user_course (id_user, id_course) VALUES (4,31);
insert into user_course (id_user, id_course) VALUES (4,32);
insert into user_course (id_user, id_course) VALUES (4,33);
insert into user_course (id_user, id_course) VALUES (4,34);
insert into user_course (id_user, id_course) VALUES (4,35);
insert into user_course (id_user, id_course) VALUES (4,36);
insert into user_course (id_user, id_course) VALUES (4,37);
insert into user_course (id_user, id_course) VALUES (4,38);
insert into user_course (id_user, id_course) VALUES (4,39);
insert into user_course (id_user, id_course) VALUES (4,40);
insert into user_course (id_user, id_course) VALUES (4,41);
insert into user_course (id_user, id_course) VALUES (4,42);
insert into user_course (id_user, id_course) VALUES (4,43);
insert into user_course (id_user, id_course) VALUES (4,44);
insert into user_course (id_user, id_course) VALUES (4,45);
insert into user_course (id_user, id_course) VALUES (4,46);
insert into user_course (id_user, id_course) VALUES (4,47);
insert into user_course (id_user, id_course) VALUES (4,48);
insert into user_course (id_user, id_course) VALUES (4,49);
insert into user_course (id_user, id_course) VALUES (4,50);
insert into user_course (id_user, id_course) VALUES (4,51);
insert into user_course (id_user, id_course) VALUES (4,52);
insert into user_course (id_user, id_course) VALUES (4,53);
insert into user_course (id_user, id_course) VALUES (4,54);
insert into user_course (id_user, id_course) VALUES (4,55);
insert into user_course (id_user, id_course) VALUES (4,56);
insert into user_course (id_user, id_course) VALUES (4,57);
insert into user_course (id_user, id_course) VALUES (4,58);
insert into user_course (id_user, id_course) VALUES (4,59);
insert into user_course (id_user, id_course) VALUES (4,60);
insert into user_course (id_user, id_course) VALUES (4,61);
insert into user_course (id_user, id_course) VALUES (4,62);
insert into user_course (id_user, id_course) VALUES (4,63);

insert into schema_plan (major_schema, year, inter_year, messages)
values (1, 2016, 2, '2016-2');
insert into pre_course(id_course, pre_course_id, groups)
VALUES (44,40,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (45,8,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (45,1,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (45,10,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (45,11,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (46,6,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (46,8,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (46,8,2);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (46,45,2);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (47,45,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (48,3,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (49,40,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (50,1,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (51,24,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (53,25,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (54,1,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (54,3,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (54,8,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (55,3,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (56,1,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (56,3,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (56,5,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (57,3,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (57,11,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (58,25,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (59,30,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (60,7,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (61,24,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (62,24,1);
insert into pre_course(id_course, pre_course_id, groups)
VALUES (63,60,1);

insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 1, '数据结构与算法分析', 4,4, '专业先修', 3,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 2, '数字逻辑', 4,4, '专业先修', 3,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 3, '概率论与数理统计', 4,4, '专业先修', 3,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 4, '数据库原理', 4,4, '专业先修', 4,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 5, '离散数学', 4,4, '专业先修', 4,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 6, '计算机组成原理', 4,4, '专业先修', 4,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 7, '算法设计与分析', 4,4, '专业先修', 4,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 8, '计算机程序设计基础A', 4,4, '专业先修', 2,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 10, '高等数学A下', 4,4, '专业必修', 2,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 11, '线性代数A', 4,4, '专业必修', 2,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 12, '高等数学A上', 4,4, '专业必修', 1,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 13, '大学物理B上', 4,4, '专业必修', 1,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 14, '大学物理B下', 4,4, '专业必修', 2,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 15, '生命科学概论', 4,4, '专业必修', 1,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 16, '普通物理实验', 4,4, '专业必修', 2,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 17, '思想道德修养和法律基础', 2,2, '思政课', 1,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 18, '马克思主义基本原理概论', 2,2, '思政课', 2,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 19, '中国近现代史纲要', 2,2, '思政课', 3,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 20, '毛泽东思想和中国特色社会主义理论体系概论', 2,2, '思政课', 5,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 21, '形势与政策', 2,2, '思政课', 4,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 23, '嵌入式系统与微机原理', 4,4, '专业核心课', 5,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 24, '人工智能', 4,4, '专业核心课', 5,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 25, '计算机网络', 4,4, '专业核心课', 5,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 26, '面向对象分析与设计', 4,4, '专业核心课', 5,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 27, '创新实践I', 1,2, '专业核心课', 5,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 28, '计算机科学与技术前沿讲座III', 1,2, '专业核心课', 5,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 29, '计算机操作系统', 4,4, '专业核心课', 6,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 30, '软件工程', 4,4, '专业核心课', 6,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 31, '创新实践II', 1,2, '专业核心课', 6,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 32, '计算机科学与技术前沿讲座II', 1,2, '专业核心课', 6,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 33, '创新实践III', 1,2, '专业核心课', 7,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 34, '计算机科学与技术前沿讲座III', 1,2, '专业核心课', 7,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 35, '工业实习', 1,2, '专业核心课', 7,1);
insert into plan_course  (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 36, '毕业论文', 2,2, '专业核心课', 8,1);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 38, '认知科学导论', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 38, '认知科学导论', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 39, '计算机系统设计及应用A', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 39, '计算机系统设计及应用A', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 40, '信号与系统', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 40, '信号与系统', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 41, 'C/C++程序设计', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 41, 'C/C++程序设计', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 42, '时间序列分析', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 42, '时间序列分析', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 43, '数值分析', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 43, '数值分析', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 44, '数字信号处理', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 44, '数字信号处理', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 45, '计算机视觉', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 45, '计算机视觉', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 46, '编译原理', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 46, '编译原理', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 47, '计算机安全', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 47, '计算机安全', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 48, '大数据导论', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 48, '大数据导论', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 49, '数字图像处理', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 49, '数字图像处理', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 50, '数据挖掘', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 50, '数据挖掘', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 51, '深度学习', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 51, '深度学习', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 52, '计算机图形学', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 52, '计算机图形学', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 53, ' 物联网技术', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 53, ' 物联网技术', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 54, '智能机器人', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 54, '智能机器人', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 55, '信息论与编码', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 55, '信息论与编码', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 56, '密码学与网络安全', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 56, '密码学与网络安全', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 57, '机器学习', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 57, '机器学习', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 58, '高级计算机网络与大数据', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 58, '高级计算机网络与大数据', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 59, '软件测试', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 59, '软件测试', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 60, '高级算法', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 60, '高级算法', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 61, '高级人工智能', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 61, '高级人工智能', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 62, '演化计算及应用', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 62, '演化计算及应用', 3,4, '专业选修', 6,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 63, '高级优化算法', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 63, '高级优化算法', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (1, 64, '计算机科学与技术前沿讲座IV', 3,4, '专业选修', 5,2);
insert into plan_course (id_plan, id_course, name_course, score_course, time_course, group_message, adivse_semster, inter_year)
values (2, 64, '计算机科学与技术前沿讲座IV', 3,4, '专业选修', 5,2);


alter table userinfo add constraint unique_username unique(username);

CREATE TABLE topic(
  id_topic SERIAL PRIMARY KEY  NOT NULL,
  part INT NOT NULL,
  name_user VARCHAR(45) NOT NULL REFERENCES userinfo(username),
  title VARCHAR(2000) NOT NULL,
  inside VARChar(2000) NOT NULL,
  unique (name_user,title)
);
-- 1:课程安排,2:培养方案,3:水贴
insert into topic (type, name_user, title,content) VALUES
(1,'11612837','测试-课程安排第一帖','今何在?不知');
insert into topic (type, name_user, title,content) VALUES
(2,'11769773','测试-培养方案第一帖','标准测试语句-1');
insert into topic (type, name_user, title,content) VALUES
(3,'300049872','测试-水一帖','或许这一句话无法被看见');


CREATE TABLE floor(
  id_auto SERIAL NOT NUll,
  id_topic INT NOT NULL REFERENCES topic(id_topic),
  id_user VARCHAR(45) NOT NULL REFERENCES userinfo(username),
  inside VARCHAR(2000) NOT NULL,
  PRIMARY KEY (id_topic,id_user,inside)
);
insert into floor (id_topic, id_user, inside)
values (1,'11612837','顶一下');
insert into floor (id_topic, id_user, inside)
values (1,'11612837','无法复读');
insert into floor (id_topic, id_user, inside)
values (1,'11769773','永远也到不了复读完成的真实!');
insert into floor (id_topic, id_user, inside)
values (2,'11612837','顶一下');
insert into floor (id_topic, id_user, inside)
values (2,'11769773','回复下,一楼是无法回复他人的,毕竟没有楼上');
insert into floor (id_topic, id_user, inside)
values (2,'11612837','纯路人,有一说一,一楼确实不能回复');

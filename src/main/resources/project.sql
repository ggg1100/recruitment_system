use web;
drop table if exists admin;
drop table if exists resume;
drop table if exists application;
drop table if exists job;
drop table if exists kind;
drop table if exists area;
drop table if exists user;

create table admin
(
    name     varchar(50) not null
        primary key,
    password varchar(50) null
);
insert into admin values
('耿雪龙','123456'),
('宋宇轩','123456'),
('文睿','123456'),
('陈鑫龙','123456'),
('高明','123456'),
('孟辰宇','123456'),
('张三','123456');

create table kind
(
    name varchar(50) not null
        primary key
);
insert into kind values
('IT类'),
('金融类'),
('教育类'),
('服务类'),
('建筑类'),
('设计类'),
('电气工程类'),
('化工类'),
('电子信息类'),
('医学药理类'),
('交通运输类');


create table area
(
    name varchar(50) not null
        primary key
);
insert into area values
('哈尔滨'),('长春'),('沈阳'),('北京'),('天津'),('石家庄'),('呼和浩特'),('太原'),('郑州'),('济南'),('合肥'),('南京'),('上海'),('杭州'),('南昌'),('福州'),('台北'),('广州'),('深圳'),('海口'),('南宁'),('贵阳'),('长沙'),('武汉'),('重庆'),('昆明'),('成都'),('西安'),('西宁'),('拉萨'),('乌鲁木齐');


create table job
(
    id              int auto_increment
        primary key,
    name            varchar(50) not null,
    min_salary      int         null,
    max_salary      int         null,
    description     longtext    null,
    company         varchar(50) null,
    area            varchar(50) null,
    kind            varchar(50) null,
    limit_condition varchar(50) null
);
insert into job values
(1,'java工程师',1000,2000,'这是一个很1般的工作','成都雪龙有限公司','成都','IT类','一本'),
(2,'美发师',1000,2000,'这是一个很2般的工作','银川理发有限公司','合肥','服务类','一本'),
(3,'中学教师',1000,2000,'这是一个很3般的工作','广州第一中学','广州','教育类','一本'),
(4,'C++工程师',1000,2000,'这是一个很4般的工作','上海能力有限公司','上海','IT类','一本'),
(5,'职业电工',1000,2000,'这是一个很5般的工作','北方电器集团','石家庄','电气类','一本'),
(6,'服装设计师',1000,2000,'这是一个很6般的工作','拉萨第四服装集团','拉萨','设计类','一本'),
(7,'通信研发设计师',1000,2000,'这是一个很7般的工作','西安华为责任有限公司','西安','电子信息类','一本'),
(8,'卡车司机',1000,2000,'这是一个很8般的工作','福州交通运输有限公司','福州','交通运输类','一本'),
(9,'外科医生',1000,2000,'这是一个很9般的工作','首都第三医院','北京','医学药理类','一本');

create table user
(
    email    varchar(50) not null
        primary key,
    name     varchar(50) null,
    password varchar(50) null
);
insert into user values
('123@qq.com','耿雪龙','123456'),
('456@qq.com','宋宇轩','123456'),
('789@qq.com','文睿','123456'),
('001@qq.com','陈鑫龙','123456'),
('002@qq.com','孟辰宇','123456'),
('003@qq.com','高明','123456');


create table resume
(
    owner_email varchar(50)  not null
        primary key,
    name        varchar(50)  null,
    sex         int          null,
    nation      varchar(50)  null,
    age         int          null,
    profession  varchar(50)  null,
    intention   varchar(500) null,
    school      varchar(50)  null,
    phone       varchar(50)  null,
    email       varchar(50)  null,
    skill       varchar(500) null,
    award       varchar(500) null,
    practice    varchar(500) null,
    description varchar(500) null,
    constraint resume_ibfk_1
        foreign key (owner_email) references user (email)
);
insert into resume values
('123@qq.com','耿雪龙',1,'汉族',21,'软件工程','搬砖，送外卖，或者Java开发','西北男子学校','13933322112','3349495429@qq.com','吃，喝','于2020年获得睡觉大赛一等奖','于2022年作为西安歌颂比赛志愿者','是一个人'),
('456@qq.com','宋宇轩',1,'汉族',21,'软件工程','搬砖，送外卖，或者Java开发','西北男子学校','13933322112','3349495429@qq.com','吃，喝','于2020年获得睡觉大赛一等奖','于2022年作为西安歌颂比赛志愿者','是一个人'),
('789@qq.com','文睿',0,'汉族',21,'软件工程','搬砖，送外卖，或者Java开发','西北男子学校','13933322112','3349495429@qq.com','吃，喝','于2020年获得睡觉大赛一等奖','于2022年作为西安歌颂比赛志愿者','是一个人'),
('001@qq.com','陈鑫龙',1,'汉族',21,'软件工程','搬砖，送外卖，或者Java开发','西北男子学校','13933322112','3349495429@qq.com','吃，喝','于2020年获得睡觉大赛一等奖','于2022年作为西安歌颂比赛志愿者','是一个人'),
('002@qq.com','孟辰宇',1,'汉族',21,'软件工程','搬砖，送外卖，或者Java开发','西北男子学校','13933322112','3349495429@qq.com','吃，喝','于2020年获得睡觉大赛一等奖','于2022年作为西安歌颂比赛志愿者','是一个人'),
('003@qq.com','高明',1,'汉族',21,'软件工程','搬砖，送外卖，或者Java开发','西北男子学校','13933322112','3349495429@qq.com','吃，喝','于2020年获得睡觉大赛一等奖','于2022年作为西安歌颂比赛志愿者','是一个人');


create table application
(
    id          int auto_increment
        primary key,
    owner_email varchar(50)               null,
    job_id      int                       null,
    status      varchar(50) default '处理中',
    constraint application_job__fk
        foreign key (job_id) references job (id)
);
insert into application values
(1,'123@qq.com',1,'处理中'),
(2,'123@qq.com',2,'处理中'),
(3,'123@qq.com',3,'处理中'),
(4,'123@qq.com',4,'处理中'),
(5,'456@qq.com',1,'处理中'),
(6,'456@qq.com',2,'处理中'),
(7,'456@qq.com',3,'处理中'),
(8,'456@qq.com',4,'处理中'),
(9,'789@qq.com',1,'处理中'),
(10,'789@qq.com',2,'处理中'),
(11,'789@qq.com',3,'处理中'),
(12,'789@qq.com',4,'处理中');


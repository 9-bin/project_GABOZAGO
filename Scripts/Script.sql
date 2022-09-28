
-- 컬럼별 (의미<>값) 맵핑
/*
Guide
- local
강릉: 1
부산: 2
서울: 3
여수: 4
제주: 5
천안 아산: 6

- placetype
관광지   : 1
레포츠   : 2
문화시설   : 3
숙박시설   : 4 
음식점   : 5
*/

create table Member1
    (
    userno NUMBER NOT NULL,
    userid varchar2(20) not null primary key,
    password varchar2(30) not null,
    name varchar2(20) not null,
    phone varchar2(30),
    email varchar2(40),
    gender number(1) not null,
    admin number(1) not null
    );
   
DROP TABLE MEMBER1;

    
    insert into member1(userno, userid, password, name, phone, email, gender, admin) values(ppap.nextval, '1', '1', '이유나', '010-0000-0000', 'lyuna92@gmail.com', 1, 1);
    insert into member1(userno, userid, password, name, phone, email, gender, admin) values(ppap.nextval, '2', '2', '임구빈', '010-0000-0000', 'koobin97@gmail.com', 0, 1);
    insert into member1(userno, userid, password, name, phone, email, gender, admin) values(ppap.nextval, '3', '3', '김재은', '010-0000-0000', 'gjaeeun950@gmail.com', 1, 1);
    
    create table Schedule
    (
    schedulenum number(5) not null primary key,
    userid varchar2(20) not null,
    placenum number(5) not null,
    schedulename varchar2(20) not null
    );
    
    create table Guide
    (
    placenum number(10) not null primary key,
    local number(1) not null,
    placetype number(1) not null,
    placename varchar2(150) not null,
    placephone varchar2(30),
    adress varchar2(2000),
    latitude number(25,15) not null,
    longtiude number(25,15) not null
    );
    -- 가이드 데이터 파일 임포트(guideinfo컬럼 제외) 
    
    create table Trip
    (
    tripnum number(5) not null primary key,
    tripname varchar2(20) not null,
    userid varchar2(20) not null,
    schedulenum number(5) not null
    );
    
    create table Post
    (
    postnum number(5) not null primary key,
    schedulenum number(5) not null,
    userid varchar2(20) not null,
    cummentsnum number(5),
    emojinum number(5),
    postname varchar2(60) not null,
    postdate date not null
    );
    
    create table Comments
    (
    commentsnum number(5) not null primary key,
    userid varchar2(20) not null,
    postnum number(5) not null,
    text varchar2(4000) not null
    );
    
    create table Emoji
    (
    emojinum number(5) not null primary key,
    userid varchar2(20) not null,
    postnum number(5) not null,
    emojitype number(1) not null
    );
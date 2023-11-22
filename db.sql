-- tạo database

CREATE DATABASE IF NOT EXISTS `MD18102`;

-- sử dụng database

USE `MD18102`;

-- tạo bảng USERS(ID, EMAIL, PASSWORD, NAME, ROLE, AVATAR)

CREATE TABLE
    IF NOT EXISTS `USERS` (
        `ID` int(11) NOT NULL AUTO_INCREMENT,
        `EMAIL` varchar(255) UNIQUE NOT NULL,
        `PASSWORD` varchar(255) NOT NULL,
        `NAME` varchar(255) NOT NULL,
        `ROLE` varchar(255) NOT NULL,
        `AVATAR` varchar(255) NOT NULL,
        PRIMARY KEY (`ID`)
    );

-- tạo bảng TOPICS(ID, NAME, DESCRIPTION)

CREATE TABLE
    IF NOT EXISTS `TOPICS` (
        `ID` int(11) NOT NULL AUTO_INCREMENT,
        `NAME` varchar(255) NOT NULL,
        `DESCRIPTION` varchar(255) NOT NULL,
        PRIMARY KEY (`ID`)
    );

-- tạo bảng NEWS(ID, TITLE, CONTENT, CREATED_AT, USER_ID, TOPIC_ID)

CREATE TABLE
    IF NOT EXISTS `NEWS` (
        `ID` int(11) NOT NULL AUTO_INCREMENT,
        `TITLE` varchar(255) NOT NULL,
        `CONTENT` varchar(255) NOT NULL,
        `CREATED_AT` datetime DEFAULT NOW() NOT NULL,
        `USER_ID` int(11) NOT NULL,
        `TOPIC_ID` int(11) NOT NULL,
        PRIMARY KEY (`ID`),
        FOREIGN KEY (`USER_ID`) REFERENCES `USERS`(`ID`),
        FOREIGN KEY (`TOPIC_ID`) REFERENCES `TOPICS`(`ID`)
    );

-- thêm dữ liệu vào bảng USERS

INSERT INTO
    `USERS` (
        `ID`,
        `EMAIL`,
        `PASSWORD`,
        `NAME`,
        `ROLE`,
        `AVATAR`
    )
VALUES (
        1,
        'admin@gmail.com',
        '123',
        'Nguyen van a',
        'admin',
        'https://www.w3schools.com/howto/img_avatar.png'
    ), (
        2,
        'binh@gmail.com',
        '123',
        'Nguyen van b',
        'user',
        'https://www.w3schools.com/howto/img_avatar.png'
    ), (
        3,
        'khang@gmail.com',
        '123',
        'Nguyen van c',
        'user',
        'https://www.w3schools.com/howto/img_avatar.png'
    );

-- thêm dữ liệu vào bảng TOPICS

INSERT INTO
    `TOPICS` (`ID`, `NAME`, `DESCRIPTION`)
VALUES (
        1,
        'PHP',
        'PHP is a server scripting language'
    ), (
        2,
        'JAVA',
        'Java is a high-level programming language '
    ), (
        3,
        'PYTHON',
        'Python is a programming language'
    );

-- thêm dữ liệu vào bảng NEWS

INSERT INTO
    `NEWS` (
        `ID`,
        `TITLE`,
        `CONTENT`,
        `CREATED_AT`,
        `USER_ID`,
        `TOPIC_ID`
    )
VALUES (
        1,
        'PHP',
        'PHP is a server scripting language',
        '2019-11-11 00:00:00',
        1,
        1
    ), (
        2,
        'JAVA',
        'Java is a high-level programming language ',
        '2019-11-11 00:00:00',
        1,
        2
    ), (
        3,
        'PYTHON',
        'Python is a programming language',
        '2019-11-11 00:00:00',
        1,
        3
    ), (
        4,
        'PHP',
        'PHP is a server scripting language',
        '2019-11-11 00:00:00',
        2,
        1
    ), (
        5,
        'JAVA',
        'Java is a high-level programming language ',
        '2019-11-11 00:00:00',
        2,
        2
    ), (
        6,
        'PYTHON',
        'Python is a programming language',
        '2019-11-11 00:00:00',
        2,
        3
    ), (
        7,
        'PHP',
        'PHP is a server scripting language',
        '2019-11-11 00:00:00',
        3,
        1
    ), (
        8,
        'JAVA',
        'Java is a high-level programming language ',
        '2019-11-11 00:00:00',
        3,
        2
    ), (
        9,
        'PYTHON',
        'Python is a programming language',
        '2019-11-11 00:00:00',
        3,
        3
    );
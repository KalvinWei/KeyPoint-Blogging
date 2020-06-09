-- TODO: Add your database init script here. This should initialize all your tables, and add any initial data required.
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS cover;
DROP TABLE IF EXISTS avatar;

CREATE TABLE user
(
    id     int(11)     NOT NULL,
    userName  varchar(32) NOT NULL,
    nickname  varchar(32) NOT NULL,
    firstName  varchar(32) NOT NULL,
    lastName  varchar(32) NOT NULL,
    dateOfBirth   varchar(10) NOT NULL,
    email        char(24),
    avatar      int(11)     NOT NULL,
    signature      TEXT        NOT NULL,
    passwordHash   varchar(600) NOT NULL,
    salt varchar(32) NOT NULL,
    iteration int NOT NULL,
    description  TEXT     NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (avatar) REFERENCES avatar (id)

);


CREATE TABLE article
(
    id      int(11)     NOT NULL,
    title   varchar(32) NOT NULL,
    content   TEXT NOT NULL,
    dateTime timestamp(14) NOT NULL,
    cover  int(11)     NOT NULL,
    user  int(11)     NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (cover) REFERENCES cover (id),
    FOREIGN KEY (user) REFERENCES user (id)


);

CREATE TABLE comment
(
    id       int(11) NOT NULL,
    content   TEXT NOT NULL,
    date varchar(10),
    parent  int(11) NOT NULL,
    user int(11) NOT NULL,
    article   int(11) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (parent) REFERENCES comment (id),
    FOREIGN KEY (user) REFERENCES user (id),
    FOREIGN KEY (article) REFERENCES article (id)

);

CREATE TABLE cover
(
    id       varchar(11) NOT NULL,
    filePath     varchar(10) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE avatar
(
    id       varchar(11) NOT NULL,
    filePath     varchar(10) NOT NULL,
    PRIMARY KEY (id)
);






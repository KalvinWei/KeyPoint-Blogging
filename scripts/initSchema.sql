-- TODO: Add your database init script here. This should initialize all your tables, and add any initial data required.
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS cover;
DROP TABLE IF EXISTS avatar;
DROP TABLE IF EXISTS likeArticle;
DROP TABLE IF EXISTS likeComment;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS hasTag;


CREATE TABLE user
(
    id           INT PRIMARY KEY,
    userName     VARCHAR(128),
    nickname     VARCHAR(128),
    firstName    VARCHAR(128),
    lastName     VARCHAR(128),
    dateOfBirth  DATE         NOT NULL,
    email        VARCHAR(128),
    avatar       INT          NOT NULL,
    signature    TEXT,
    description  TEXT,
    passwordHash VARCHAR(128) NOT NULL,
    salt         VARCHAR(128)  NOT NULL,
    iteration    INT          NOT NULL,
    FOREIGN KEY (avatar) REFERENCES avatar (id)

);

CREATE TABLE article
(
    id        int(11)       NOT NULL,
    title     varchar(32)   NOT NULL,
    content   TEXT          NOT NULL,
    dateTime  timestamp(14) NOT NULL,
    cover     int(11)       NOT NULL,
    user      int(11)       NOT NULL,
    isDeleted varchar(1)    NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (cover) REFERENCES cover (id),
    FOREIGN KEY (user) REFERENCES user (id)


);
CREATE TABLE comment
(
    id        int(11)    NOT NULL,
    content   TEXT       NOT NULL,
    date      varchar(10),
    parent    int(11)    NOT NULL,
    user      int(11)    NOT NULL,
    article   int(11)    NOT NULL,
    isDeleted varchar(1) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (parent) REFERENCES comment (id),
    FOREIGN KEY (user) REFERENCES user (id),
    FOREIGN KEY (article) REFERENCES article (id)

);

CREATE TABLE cover
(
    id       varchar(11) NOT NULL,
    filePath varchar(10) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE avatar
(
    id       varchar(11) NOT NULL,
    filePath varchar(10) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE likeArticle
(
    user    int(11) NOT NULL,
    article int(10) NOT NULL,
    PRIMARY KEY (user, article),
    FOREIGN KEY (user) REFERENCES user (id),
    FOREIGN KEY (article) REFERENCES article (id)


);

CREATE TABLE likeComment
(
    user    int(11) NOT NULL,
    comment int(10) NOT NULL,
    PRIMARY KEY (user, comment),
    FOREIGN KEY (user) REFERENCES user (id),
    FOREIGN KEY (comment) REFERENCES comment (id)

);

CREATE TABLE tag
(
    id          int(11) NOT NULL,
    description TEXT    NOT NULL,
    PRIMARY KEY (id)

);


CREATE TABLE hasTag
(
    article int(11) NOT NULL,
    tag     int(11) NOT NULL,
    PRIMARY KEY (article, tag),
    FOREIGN KEY (article) REFERENCES article (id),
    FOREIGN KEY (tag) REFERENCES tag (id)


);









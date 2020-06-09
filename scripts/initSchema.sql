DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS likeArticle;
DROP TABLE IF EXISTS likeComment;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS user;

CREATE TABLE user
(
    id           INT PRIMARY KEY,
    userName     VARCHAR(128) UNIQUE,
    nickname     VARCHAR(128),
    firstName    VARCHAR(128),
    lastName     VARCHAR(128),
    dateOfBirth  DATE,
    email        VARCHAR(128),
    signature    TEXT,
    description  TEXT,
    avatar       VARCHAR(128) NOT NULL,
    passwordHash VARCHAR(600) NOT NULL,
    salt         VARCHAR(128) NOT NULL,
    iteration    INT          NOT NULL
);

CREATE TABLE article
(
    id        INT PRIMARY KEY,
    title     TEXT         NOT NULL,
    content   TEXT,
    time      TIMESTAMP    NOT NULL,
    cover     VARCHAR(128) NOT NULL,
    user      INT          NOT NULL,
    isDeleted BOOLEAN      NOT NULL,
    FOREIGN KEY (user) REFERENCES user (id)
);

CREATE TABLE comment
(
    id        INT PRIMARY KEY,
    content   TEXT      NOT NULL,
    time      TIMESTAMP NOT NULL,
    parent    INT,
    user      INT       NOT NULL,
    article   INT       NOT NULL,
    isDeleted BOOLEAN   NOT NULL,
    FOREIGN KEY (parent) REFERENCES comment (id),
    FOREIGN KEY (user) REFERENCES user (id),
    FOREIGN KEY (article) REFERENCES article (id)
);

CREATE TABLE likeArticle
(
    user    INT NOT NULL,
    article INT NOT NULL,
    PRIMARY KEY (user, article),
    FOREIGN KEY (user) REFERENCES user (id),
    FOREIGN KEY (article) REFERENCES article (id)
);

CREATE TABLE likeComment
(
    user    INT NOT NULL,
    comment INT NOT NULL,
    PRIMARY KEY (user, comment),
    FOREIGN KEY (user) REFERENCES user (id),
    FOREIGN KEY (comment) REFERENCES comment (id)
);

CREATE TABLE tag
(
    article INT          NOT NULL,
    tag     VARCHAR(128) NOT NULL,
    PRIMARY KEY (article, tag),
    FOREIGN KEY (article) REFERENCES article (id)
);

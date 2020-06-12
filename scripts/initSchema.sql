DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS likeArticle;
DROP TABLE IF EXISTS likeComment;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS user;


CREATE TABLE user
(
    userName     VARCHAR(128) PRIMARY KEY,
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
    id        INT PRIMARY KEY AUTO_INCREMENT,
    title     TEXT         NOT NULL,
    content   TEXT,
    time      TIMESTAMP    NOT NULL,
    cover     VARCHAR(128) NOT NULL,
    userName  VARCHAR(128) NOT NULL,
    isDeleted BOOLEAN      NOT NULL,
    FOREIGN KEY (userName) REFERENCES user (userName) ON DELETE CASCADE
);

CREATE TABLE comment
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    content   TEXT      NOT NULL,
    time      TIMESTAMP NOT NULL,
    parent    INT,
    userName      VARCHAR(128)       NOT NULL,
    article   INT       NOT NULL,
    isDeleted BOOLEAN   NOT NULL,
    FOREIGN KEY (parent) REFERENCES comment (id) ON DELETE CASCADE,
    FOREIGN KEY (userName) REFERENCES user (userName) ON DELETE CASCADE,
    FOREIGN KEY (article) REFERENCES article (id) ON DELETE CASCADE
);

CREATE TABLE likeArticle
(
    userName    VARCHAR(128) NOT NULL,
    article INT NOT NULL,
    PRIMARY KEY (userName, article),
    FOREIGN KEY (userName) REFERENCES user (userName) ON DELETE CASCADE,
    FOREIGN KEY (article) REFERENCES article (id) ON DELETE CASCADE
);

CREATE TABLE likeComment
(
    userName    VARCHAR(128) NOT NULL,
    comment INT NOT NULL,
    PRIMARY KEY (userName, comment),
    FOREIGN KEY (userName) REFERENCES user (userName) ON DELETE CASCADE,
    FOREIGN KEY (comment) REFERENCES comment (id) ON DELETE CASCADE
);

CREATE TABLE tag
(
    article INT          NOT NULL,
    tag     VARCHAR(128) NOT NULL,
    PRIMARY KEY (article, tag),
    FOREIGN KEY (article) REFERENCES article (id) ON DELETE CASCADE
);

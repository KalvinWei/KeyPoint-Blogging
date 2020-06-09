DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS cover;
DROP TABLE IF EXISTS avatar;
DROP TABLE IF EXISTS likeArticle;
DROP TABLE IF EXISTS likeComment;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS hasTag;

CREATE TABLE cover
(
    id       VARCHAR(128) PRIMARY KEY,
    filePath VARCHAR(128) NOT NULL
);

CREATE TABLE avatar
(
    id       VARCHAR(128) PRIMARY KEY,
    filePath VARCHAR(128) NOT NULL
);

CREATE TABLE user
(
    id           INT PRIMARY KEY,
    userName     VARCHAR(128),
    nickname     VARCHAR(128),
    firstName    VARCHAR(128),
    lastName     VARCHAR(128),
    dateOfBirth  DATE         NOT NULL,
    email        VARCHAR(128),
    signature    TEXT,
    description  TEXT,
    passwordHash VARCHAR(128) NOT NULL,
    salt         VARCHAR(128) NOT NULL,
    iteration    INT          NOT NULL,
    avatar       VARCHAR(128),
    FOREIGN KEY (avatar) REFERENCES avatar (id)
);

CREATE TABLE article
(
    id        INT PRIMARY KEY,
    title     TEXT         NOT NULL,
    content   TEXT,
    time  TIMESTAMP    NOT NULL,
    cover     VARCHAR(128) NOT NULL,
    user      INT          NOT NULL,
    isDeleted BOOLEAN      NOT NULL,
    FOREIGN KEY (cover) REFERENCES cover (id),
    FOREIGN KEY (user) REFERENCES user (id)
);

CREATE TABLE comment
(
    id        INT    PRIMARY KEY,
    content   TEXT       NOT NULL,
    time      TIMESTAMP NOT NULL,
    parent    INT   ,
    user      INT    NOT NULL,
    article   INT   NOT NULL,
    isDeleted BOOLEAN NOT NULL,
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
    id          INT PRIMARY KEY,
    description TEXT    NOT NULL
);

CREATE TABLE hasTag
(
    article INT NOT NULL,
    tag     INT NOT NULL,
    PRIMARY KEY (article, tag),
    FOREIGN KEY (article) REFERENCES article (id),
    FOREIGN KEY (tag) REFERENCES tag (id)
);

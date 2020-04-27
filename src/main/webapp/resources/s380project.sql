CREATE TABLE users ( id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
username VARCHAR(50) NOT NULL UNIQUE, password VARCHAR(50) NOT NULL, role VARCHAR(20) NOT NULL,status VARCHAR(20) DEFAULT 'normal',
PRIMARY KEY (id) );

CREATE TABLE topic ( id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
    title VARCHAR(100) NOT NULL, 
    content VARCHAR(600) NOT NULL, 
    author VARCHAR(50) NOT NULL,time TIMESTAMP NOT NULL,
    categories VARCHAR(50) NOT NULL,
    PRIMARY KEY (id) 
);

CREATE TABLE attachment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    filename VARCHAR(255) DEFAULT NULL,
    content_type VARCHAR(255) DEFAULT NULL,
    content BLOB DEFAULT NULL,
    thread_id INTEGER DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (thread_id) REFERENCES topic(id)
);

CREATE TABLE reply ( id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
topicID INTEGER NOT NULL,
author VARCHAR(50) NOT NULL,time TIMESTAMP NOT NULL,
content VARCHAR(600) NOT NULL,
filename VARCHAR(255) DEFAULT NULL, 
file BLOB DEFAULT NULL,
PRIMARY KEY (id) );

CREATE TABLE poll ( id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
userid INTEGER NOT NULL,
time TIMESTAMP NOT NULL,
topic VARCHAR(100) NOT NULL,option1 VARCHAR(100),option2 VARCHAR(100),option3 VARCHAR(100),option4 VARCHAR(100),
PRIMARY KEY (id) );

CREATE TABLE pollresult ( pollid INTEGER NOT NULL , userid INTEGER NOT NULL,selected INTEGER NOT NULL);

INSERT INTO users(username, password, role)VALUES ('admin', '{noop}admin','ROLE_ADMIN');
INSERT INTO users(username, password, role)VALUES ('user1', '{noop}user1','ROLE_USER');
INSERT INTO users(username, password, role)VALUES ('user2', '{noop}user2','ROLE_USER');
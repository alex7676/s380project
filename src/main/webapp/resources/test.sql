CREATE TABLE users ( username VARCHAR(50) NOT NULL , password VARCHAR(50) NOT NULL, role VARCHAR(20) NOT NULL,status VARCHAR(20) DEFAULT 'normal',
PRIMARY KEY (username) );

CREATE TABLE topic ( id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
title VARCHAR(100) NOT NULL, content VARCHAR(600) NOT NULL, 
author VARCHAR(50) NOT NULL,time TIMESTAMP NOT NULL,
filename VARCHAR(255) DEFAULT NULL,
file BLOB DEFAULT NULL,
categories VARCHAR(50) NOT NULL,
PRIMARY KEY (id) );

CREATE TABLE reply ( id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
topicID INTEGER NOT NULL,
author VARCHAR(50) NOT NULL,time TIMESTAMP NOT NULL,
content VARCHAR(255) NOT NULL,
filename VARCHAR(255) DEFAULT NULL, 
file BLOB DEFAULT NULL,
PRIMARY KEY (id) );


CREATE TABLE poll ( id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
username VARCHAR(50) NOT NULL,
time TIMESTAMP NOT NULL,
topic VARCHAR(50) NOT NULL,option1 VARCHAR(50),option2 VARCHAR(50),option3 VARCHAR(50),option4 VARCHAR(50),
PRIMARY KEY (id) );


CREATE TABLE vote ( id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) ,pollid INTEGER NOT NULL , username VARCHAR(50) NOT NULL,choice INTEGER NOT NULL);

INSERT INTO users(username, password, role)VALUES ('admin', '{noop}admin','ROLE_ADMIN');
INSERT INTO users(username, password, role)VALUES ('user1', '{noop}user1','ROLE_USER');
INSERT INTO users(username, password, role)VALUES ('user2', '{noop}user2','ROLE_USER');
INSERT INTO poll (topic,option1,option2)VALUES ('demo topic 1','demo option1','demo option2');
INSERT INTO poll (topic,option1,option2,option3,option4)VALUES ('demo topic 2','demo2 option1','demo2 option2','demo2 option3','demo2 option4');
INSERT INTO vote(pollid,username,choice) VALUES (1, 'admin', 1);
INSERT INTO vote(pollid,username,choice) VALUES (1, 'user1', 2);
INSERT INTO vote(pollid,username,choice) VALUES (2, 'user1', 1);
INSERT INTO vote(pollid,username,choice) VALUES (2, 'user2', 2);
INSERT INTO vote(pollid,username,choice) VALUES (2, 'admin', 1);

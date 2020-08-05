PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL, 
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL, 

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER, 
    questions_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_subject_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    parent_reply_id INTEGER, 
    body TEXT NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_subject_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,  
    likes INTEGER NOT NULL,
    name_id INTEGER NOT NULL,

    FOREIGN KEY (likes) REFERENCES questions(id),
    FOREIGN KEY (name_id) REFERENCES users(id)
);

INSERT INTO 
    users (fname, lname)
VALUES
    ('Rachana', 'Vishwanath'),
    ('Drew', 'Shroyer');

INSERT INTO 
    questions (title, body, author_id)
VALUES
    ('What is coding?', 'explain to me what coding is, i am so curious', (SELECT id FROM users WHERE fname = 'Drew')),
    ('How to use CSS?', 'please list out the steps for me', (SELECT id FROM users WHERE fname = 'Rachana')),
    ('How does HTML integrate with CSS?', 'what are the most basic rules I should know?', (SELECT id FROM users WHERE fname = 'Drew'));

INSERT INTO
    replies (question_subject_id, user_id, parent_reply_id, body)
VALUES
    ((SELECT id FROM questions WHERE id = 1),
     (SELECT id FROM users WHERE fname = 'Drew'),
     null , 'This is a great post!');


INSERT INTO
    replies
    (question_subject_id, user_id, parent_reply_id, body)
VALUES
    ((SELECT id FROM questions WHERE id = 1), 
     (SELECT id FROM users WHERE fname = 'Rachana'),
     (SELECT id FROM replies WHERE body = 'This is a great post!' ),
     'Hi there - how''s it going?');


INSERT INTO 
    question_follows
    (user_id, questions_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Drew'), 
    (SELECT  id FROM questions WHERE title = 'What is coding?') 
);
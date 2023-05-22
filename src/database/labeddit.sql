-- Active: 1684761688536@@127.0.0.1@3306
CREATE TABLE users(
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  username TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

CREATE TABLE posts(
id TEXT PRIMARY KEY UNIQUE NOT NULL,
body TEXT NOT NULL,
user_id TEXT NOT NULL UNIQUE,
upvote INTEGER DEFAULT (0),
downvote INTEGER DEFAULT (0),
comments INTEGER DEFAULT (0),
created_at TEXT DEFAULT (DATETIME()) NOT NULL,
updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
Foreign Key (user_id) REFERENCES users (id)
  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE comments(
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  user_id TEXT NOT NULL,
  post_id TEXT NOT NULL,
  body TEXT NOT NULL,
  upvote INTEGER DEFAULT (0),
  downvote INTEGER DEFAULT (0),
  created_at TEXT DEFAULT (DATETIME()) NOT NULL,
  updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
  Foreign Key (user_id) REFERENCES users(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  Foreign Key (post_id) REFERENCES posts(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE upvote_downvote_posts(
  id INTEGER PRIMARY KEY UNIQUE NOT NULL,
  upvote INTEGER DEFAULT (0),
  post_id TEXT NOT NULL,
  user_id TEXT NOT NULL,
  Foreign Key (post_id) REFERENCES posts(id)
  ON UPDATE CASCADE ON DELETE CASCADE,
  Foreign Key (user_id) REFERENCES users(id)
  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE upvote_downvote_comments(
  id INTEGER PRIMARY KEY UNIQUE NOT NULL,
  upvote INTEGER DEFAULT (0),
  comment_id TEXT NOT NULL,
  user_id TEXT NOT NULL,
  Foreign Key (comment_id) REFERENCES comments(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  Foreign Key (user_id) REFERENCES users(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO users (id,username,name,email,password)
VALUES("ui001", "exemple01", "exemple","exemple@gmail.com","$2a$12$vAu7KjrOpf5A23A1uiJudOr4DjGwAmDE7Rghyg4KvtTbueIaNUyJ2");

--1234--

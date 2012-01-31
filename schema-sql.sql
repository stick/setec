/* SQLEditor (SQLite)*/
DROP TABLE "group_user";
DROP TABLE "user";
DROP TABLE "group_record";
DROP TABLE "record";
DROP TABLE "group";

CREATE TABLE "user"
(
"id" INTEGER PRIMARY KEY  AUTOINCREMENT,
"first_name" TEXT,
"last_name" TEXT,
"email" TEXT,
"public_key" BLOB,
"private_key" BLOB
);

CREATE TABLE "record"
(
"id" INTEGER PRIMARY KEY  AUTOINCREMENT,
"title" TEXT,
"description" TEXT,
"username" TEXT,
"password" TEXT,
"comments" TEXT,
"modified" TEXT,
"created" TEXT,
"expires" TEXT
);

CREATE TABLE "group"
(
"id" INTEGER PRIMARY KEY  AUTOINCREMENT,
"name" TEXT,
"description" TEXT
);

CREATE TABLE "group_user"
(
"group_id" INTEGER REFERENCES "group" ("id"),
"user_id" INTEGER REFERENCES "user" ("id")
);

CREATE TABLE "group_record"
(
"record_id" INTEGER REFERENCES "record" ("id"),
"group_id" INTEGER REFERENCES "group" ("id")
);


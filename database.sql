CREATE TABLE "recipes" (
  "id" SERIAL PRIMARY KEY,
  "chef_id" int UNIQUE,
  "title" varchar,
  "ingredients" varchar[],
  "preparation" varchar[],
  "information" varchar,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "chefs" (
  "id" SERIAL PRIMARY KEY,
  "file_id" int UNIQUE,
  "name" varchar,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "files" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "path" varchar
);

CREATE TABLE "recipe_files" (
  "id" SERIAL PRIMARY KEY,
  "recipe_id" int UNIQUE,
  "file_id" int UNIQUE
);

ALTER TABLE "recipes" ADD FOREIGN KEY ("chef_id") REFERENCES "chefs" ("id");

ALTER TABLE "recipes" ADD FOREIGN KEY ("id") REFERENCES "recipe_files" ("recipe_id");

ALTER TABLE "files" ADD FOREIGN KEY ("id") REFERENCES "recipe_files" ("file_id");

ALTER TABLE "files" ADD FOREIGN KEY ("id") REFERENCES "chefs" ("file_id");

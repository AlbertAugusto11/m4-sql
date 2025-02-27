CREATE TABLE "areasAtv4" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(200) NOT NULL
);

CREATE TABLE "coursesAtv4" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(200) NOT NULL
);

CREATE TABLE "areasAtv4_coursesAtv4" (
    "id" SERIAL PRIMARY KEY,
    "areasAtv4Id" INTEGER NOT NULL,
    "coursesAtv4Id" INTEGER NOT NULL,
    FOREIGN KEY ("areasAtv4Id") REFERENCES "areasAtv4"("id") ON DELETE CASCADE,
    FOREIGN KEY ("coursesAtv4Id") REFERENCES "coursesAtv4"("id") ON DELETE CASCADE
);

INSERT INTO "areasAtv4" ("name") VALUES ('TI'), ('Humanas'), ('Exatas');

INSERT INTO "coursesAtv4" ("name") VALUES ('Dev Full Stack'), ('Sociologia'), ('Matematica');

INSERT INSERT "areasAtv4_coursesAtv4" ("areasAtv4Id","coursesAtv4Id") VALUES (1,1), (1,3), (2,2), (3,3);

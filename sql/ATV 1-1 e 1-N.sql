CREATE TABLE employees (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(200) NOT NULL,
    "email" VARCHAR(200) NOT NULL
);

CREATE TABLE contracts (
    "id" SERIAL PRIMARY KEY,
    "startedAt" DATE NOT NULL,
    "expiresAt" DATE NOT NULL,
    "employeeId" INTEGER UNIQUE NOT NULL,
    FOREIGN KEY ("employeeId") REFERENCES employees("id") ON DELETE CASCADE
);

CREATE TABLE skills (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    "employeeId" INTEGER NOT NULL,
    FOREIGN KEY ("employeeId") REFERENCES employees("id") ON DELETE CASCADE
);

-- Atividade feita; employees tem uma relação unica com contracts e uma relação multipla com skills

INSERT INTO employees ("name","email") VALUES ('Albert Augusto','augustothelema@gmail.com');

INSERT INTO contracts ("startedAt","expiresAt","enployeeId") VALUES ('2025-02-26','2025-12-31',1);
-- relação 1:1 entre employees e contracts

INSERT INTO skills ("name","employeeId") VALUES ('Projeção Astral',1);
INSERT INTO skills ("name","employeeId") VALUES ('Clarividencia',1);
INSERT INTO skills ("name","employeeId") VALUES ('Clariaudiencia',1);
-- relação 1:N entre employees e skills
CREATE TABLE products (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(150) NOT NULL,
    "description" TEXT,
    "price" INTEGER NOT NULL,
    "createdAt" TIMESTAMP NOT NULL,
    "updatedAt" TIMESTAMP NOT NULL
);

CREATE TABLE students (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(150) NOT NULL,
    "email" VARCHAR(250) NOT NULL,
    "module" CHAR(2) NOT NULL,
    "score" INTEGER NOT NULL,
    "active" BOOLEAN NOT NULL
);

CREATE TABLE endereco (
    "id" SERIAL PRIMARY KEY,
    "rua" VARCHAR(250) NOT NULL,
    "numero" INTEGER,
    "studentsId" INTEGER UNIQUE NOT NULL,
    FOREIGN KEY ("studentsId") REFERENCES students("id") ON DELETE CASCADE  
);
-- relação 1 : 1 students com endereco

INSERT INTO students ("name","email","module","score","active") VALUES ('Albert Augusto','augustothelema@gmail.com','M9',100,true);
-- inserindo dados na tabela students

INSERT INTO endereco ("rua","numero","studentsId") VALUES ('Rua Sargento Valdemar Lima',146,1)
-- inserindo dados na tabela endereco, referenciando ao ID 1 na tabela students
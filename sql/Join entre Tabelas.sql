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
    "studentsId" INTEGER NOT NULL,
    FOREIGN KEY ("studentsId") REFERENCES students("id") ON DELETE CASCADE  
);

-- Relação 1:N entre students e endereco, onde um estudante pode ter mais de um endereço

SELECT * FROM students JOIN endereco ON students."id" = endereco."studentsId";
-- Está busca gera um resultado ruim, com colunas de nomes repetidos, usa-se o metodo abaixo;

SELECT students."id" AS "studentsId",
students."name",
students."email",
students."module",
students."score",
students."active",
endereco."id" AS "enderecoId",
endereco."rua",
endereco."numero",
FROM students ON students."id" = endereco."studentsId";
-- Aqui renomeia as colunas de mesmo nome e exclui colunas que trazem informações iguais


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




CREATE TABLE products3 (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(150) NOT NULL,
    "price" INTEGER NOT NULL
);

CREATE TABLE categories3 (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(150) NOT NULL
);

CREATE TABLE products_categories3 (
    "id" SERIAL PRIMARY KEY,
    "productId" INTEGER NOT NULL,
    "categoryId" INTEGER NOT NULL,
    FOREIGN KEY ("productId") REFERENCES products3("id") ON DELETE CASCADE,
    FOREIGN KEY ("categoryId") REFERENCES categories3("id") ON DELETE CASCADE
);

SELECT * FROM products3 JOIN products_categories3 ON products3."id" = products_categories3."productsId" JOIN categories3 ON categories3."id" = products_categories3."categoryId";
-- Assim a tabela não estara organizada, mas aparecera a relação completas de todos os produtos e suas categorias.

SELECT products3."id" AS "productId",
products3."name" AS "productName",
products3."price" AS "productPrice",
categories3."id" AS "categoryId",
categories3."name" AS "categoryName"
FROM products3
JOIN products_categories3 ON products3."id" = products_categories3."productId"
JOIN categories3 ON categories3."id" = products_categories3."categoryId";
--Assim a tabela renomeara ps nomes excuindo informações repetidas ou desnecessarias
WHERE products."id" = 2; -- adicionando a clausula where busca-se somente um products pelo id informado


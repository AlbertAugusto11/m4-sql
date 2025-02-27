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

INSERT INTO products3 ("name","price") VALUES ('Computador',2500), ('Notebook',3500), ('Mouse',250);

INSERT INTO categories3 ("name") VALUES ('Computadores'), ('Notebooks'), ('Acessorios');

INSERT INTO products_categories3 ("productId","categoryId") VALUES (1,1), (2,1), (2,2), (3,3);
CREATE TABLE clientesFA (
    "clientesId" SERIAL PRIMARY KEY,
    "Nome" VARCHAR(150) NOT NULL,
    "Telefone" VARCHAR(15) NOT NULL,
    "Endereço" VARCHAR(250) NOT NULL
);

CREATE TABLE pedidosFA (
    "pedidosId" SERIAL PRIMARY KEY,
    "Descrição" VARCHAR(300) NOT NULL,
    "Valor" INTEGER NOT NULL,
    "Impostos" INTEGER NOT NULL,
    "clientesId" INTEGER NOT NULL,
    FOREIGN KEY ("clientesId") REFERENCES clientesFA("clientesId") ON DELETE CASCADE
);

INSERT INTO clientesFA ("Nome","Telefone","Endereço") VALUES ('Albert','21965108192','Rua Santo Afonso'), ('Ana','21997881522','Rua da Ana'), ('Joana','21965448877','Rua da Joana');

INSERT INTO pedidosFA ("Descrição","Valor","Impostos","clientesId") VALUES ('Bolo',10,4,1), ('Refrigerante',5,2,2), ('Churasquinho',5,3,1), ('Whiski',50,19,3), ('Cerveja',4,1,3), ('Salgadinhos',3,1,2);

--COUNT : Calcula o numero de registro em uma coluna
SELECT COUNT(*) AS "Numero de Pedidos" FROM pedidosFA;
SELECT COUNT("pedidosId") AS "Numero de Pedidos" FROM pedidosFA;

--SUM: Soma dos valores em uma coluna numerica
SELECT SUM("Valor") AS "Total dos Pedidos" FROM pedidosFA;
SELECT SUM("Impostos") AS "Total de Impostos" FROM pedidosFA;

--AVG: Calcula a média de valores em uma coluna numerica
SELECT AVG("Valor") AS "Valor médio de Pedidos" FROM pedidosFA;
SELECT AVG("Impostos") AS "Valor médio de Impostos" FROM pedidosFA;

--MIN: Retorna o Valor minimo em uma coluna
SELECT MIN("Valor") AS "Pedido mais Barato" FROM pedidosFA;
SELECT MIN("Impostos") AS "Imposto mais Barato" FROM pedidosFA;

--MAX: Retorna o Valor maximo de uma coluna
SELECT MAX("Valor") AS "Pedido mais Caro" FROM pedidosFA;
SELECT MAX("Impostos") AS "Imposto mais Caro" FROM pedidosFA;
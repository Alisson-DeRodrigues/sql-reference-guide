# 🧭 Guia de Referência SQL para PostgreSQL

Este repositório contém um guia de referência SQL utilizando o SGDB PostgreSQL. A essência de um guia de referência é servir de material de consulta para aqueles que possuem noção do que já pretendem buscar aqui, mas este material também servirá como material de estudo.

O repositório também contém alguns exemplos de projetos que foram criados como requisito para obter a certificação do curso [Relational Database](https://www.freecodecamp.org/learn/relational-database/) da Freecodecamp. Curso que reúne PostgreSQL, GNU Bash e Git.
- [Celestial Bodies Database](https://github.com/Alisson-DeRodrigues/sql-reference-guide/tree/main/Projetos/Celestial%20Bodies%20Database)
- [World Cup Database](https://github.com/Alisson-DeRodrigues/sql-reference-guide/tree/main/Projetos/World%20Cup%20Database)
- [Salon Appointment Scheduler](https://github.com/Alisson-DeRodrigues/sql-reference-guide/tree/main/Projetos/Salon%20Appointment%20Scheduler)
- [Periodic Table Database](https://github.com/Alisson-DeRodrigues/sql-reference-guide/tree/main/Projetos/Periodic%20Table%20Database)
- [Number Guessing Game](https://github.com/Alisson-DeRodrigues/sql-reference-guide/tree/main/Projetos/Number%20Guessing%20Game)

## 📦 PostgreSQL – Guia de Comandos
### 🚪 Acessando o Terminal Interativo (PSQL):
```bash
psql -U postgres
```
Acesso com o usuário padrão postgres, a senha que será solicitada é a definida por você durante a instalação ou estará em branco.

O comando pode não ser reconhecido dependendo do sistema operacional e instalação, nesse caso, abra a pasta do programa e execute o programa psql diretamente. No Windows, por exemplo, a pasta padrão pode ser `C:\Program Files\PostgreSQL\X\bin`, execute o programa diretamente ou abra essa pasta no cmd com `cd C:\Program Files\PostgreSQL\X\bin` e execute o comando `psql -U postgres` novamente.

**Definindo senha para o usuário postgres:**
```bash
ALTER USER postgres WITH PASSWORD 'sua_senha_forte';
```
Faça isso se você não definiu uma senha anteriormente.

### 🆕 Criando Usuários:
```bash
CREATE USER meuusuario WITH PASSWORD 'minhasenha';
GRANT ALL PRIVILEGES ON DATABASE meuteste TO meuusuario;
```
É necessário estar logado com o usuário postgres na primeira vez que configurar o PostgreSQL.

### 🔓 Acessando o PostgreSQL com Usuário Específico:
```bash
psql --username=usuario --dbname=postgres
```
Inicia o postgresql no terminal conectando-se a um usuário específico e a um banco de dados desse usuário.

### 💻 Comandos do PostgreSQL:
- Listar bancos de dados: `\l`
- Conectar a um banco de dados: `\c database_name`
- Listar tabelas: `\d`
- Info da tabela: `\d table_name`

### ⌨️ Manipular o banco de dados via bash:
```bash
PSQL="psql -X --username=usuario --dbname=banco_dados --no-align --tuples-only -c"
```
- variável que define o comando que permite o bash se conectar ao banco de dados, executar um comando simples e depois sair
- as palavras-chave username, dbname e -c são as mais importantes, o resto é formatação para como o bash recebe os dados em texto do banco de dados
- -c serve para executar um comando simples e depois sair do banco de dados
- representação lógica no db: psql --username=usuario --dbname=banco_dados -c "SQL QUERY HERE"

**Exemplo de uso:**
```bash
MAJOR_ID=$($PSQL "select major_id from MAJORS where major='$MAJOR'")
```
A query SQL dentro de aspas duplas é o mesmo comando que se faria dentro do banco de dados.

### 💾 Fazer backup do banco de dados para um arquivo:
```bash
pg_dump --clean --create --inserts --username=usuario banco_dados > meu_banco_de_dados.sql
```
Salva o banco de dados em um arquivo.

### 💽 Importar banco de dados para o PostgreSQL:
```bash
psql -U postgres < students.sql
```
Faz um rebuild de um banco de dados para o postgres.

---

## 🗃️ Comandos de Banco de Dados
### 🆕 Criar um banco de dados:
```sql
CREATE DATABASE database_name;
```

### 🧽 Deletar (drop) banco de dados:
```sql
DROP DATABASE database_name;
```

### ✏️ Renomear banco de dados:
```sql
ALTER DATABASE database_name RENAME TO new_name;
```

---

## 🧱 Comandos de Tabela
### 🆕 Criar tabela:
```sql
CREATE TABLE table_name();
```

### 🆕 Criar tabela com coluna na mesma query:
```sql
CREATE TABLE table_name(column_name1 DATATYPE <CONSTRAINTS>, column_name2 DATATYPE <CONSTRAINTS>);
```

* Exemplo:
```sql
CREATE TABLE sounds(sound_id SERIAL PRIMARY KEY);
```

### 🧽 Deletar (drop) tabela:
```sql
DROP TABLE table_name;
```

### 🧽 Deletar (drop) constraint da tabela:
```sql
ALTER TABLE table_name DROP CONSTRAINT constraint_name;
```

### ✏️ Renomear tabela:
```sql
ALTER TABLE table_name RENAME TO new_name;
```

### 🧽 Apagar todas as linhas de tabelas:
```sql
TRUNCATE table_1, table_2;
```

---

## 🗼 Comandos de Coluna
### 🆕 Adicionar Coluna (básico):
```sql
ALTER TABLE table_name ADD COLUMN column_name DATATYPE <CONSTRAINT> <DEFAULT>;
```

#### Tipos de dados:

* `INT`
* `TEXT`
* `VARCHAR(N)` – Tipo texto com limite de N caracteres
* `SERIAL` – Tipo INT, NOT NULL e autoincrementado, útil para IDs
* `NUMERIC(M,N)` – Número decimal com M sendo dígitos totais (incluindo casas decimais) e N casas decimais
* `DECIMAL(M,N)` - É o mesmo que NUMERIC, são equivalentes
* `DATE` – Data no formato `yyyy-mm-dd`

#### Constraint (restrições):

* `NOT NULL` – Impede a coluna de aceitar valores nulos
* `UNIQUE` – Garante que os dados sejam únicos para determinada coluna
* `PRIMARY KEY` – Define a coluna como chave primária; é automaticamente UNIQUE e NOT NULL
* `FOREIGN KEY` – Defina uma chave estrangeira que referencia uma coluna de outra tabela

#### Default:

Define um valor padrão para uma célula da coluna se ela ficar vazia durante a inserção de uma linha; pode ser um datatype ou uma função.

---

### 🔑 Adicionar coluna com chave estrangeira:
#### Forma básica:

```sql
ALTER TABLE table_name ADD COLUMN column_name DATATYPE <CONSTRAINT> REFERENCES referenced_table_name(referenced_column_name);
-- Cria uma nova coluna e adiciona uma chave estrangeira para ela na mesma query; em CONSTRAINT pode ser restrições como NOT NULL e UNIQUE.
```
Exemplo:
```sql
ALTER TABLE pedidos ADD COLUMN cliente_id INT REFERENCES clientes(id);
```

#### Forma com nome da constraint:
```sql
ALTER TABLE more_info ADD COLUMN character_id INTEGER CONSTRAINT fk_character REFERENCES characters(id);
```
Uma chave estrangeira é uma CONSTRAINT, então a boa prática recomenda definir um nome para a CONSTRAINT. O exemplo utiliza **fk_character**. Um nome padrão é criado quando se omite o nome.

---

### 🔗 Adicionar constraint UNIQUE:
#### Forma básica:
```sql
ALTER TABLE more_info ADD UNIQUE(column_name);
-- Define que uma coluna da tabela deve aceitar somente valores únicos.
```

#### Forma com nome da constraint:
```sql
ALTER TABLE more_info ADD CONSTRAINT unique_character_id UNIQUE (character_id);
```
UNIQUE é um CONSTRAINT, então a boa prática recomenda definir um nome para a CONSTRAINT, **unique_character_id** é o do exemplo. Um nome padrão é criado quando se omite o nome.

---

### 🧽 Deletar (drop) coluna:
```sql
ALTER TABLE table_name DROP COLUMN column_name;
```

---

### ✏️ Renomear coluna:
```sql
ALTER TABLE table_name RENAME COLUMN old_name TO new_name;
```

---

### 🔑 Adicionar chave primária a uma coluna:
```sql
ALTER TABLE table_name ADD PRIMARY KEY(column_name);
```

---

### 🔑 Adicionar chave primária composta a uma coluna:
```sql
ALTER TABLE table_name ADD PRIMARY KEY(column_1, column_2);
```

---

### 🔑 Adicionar chave estrangeira a uma coluna:
```sql
ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES table_name(column_name);
```

---

### 📝 Palavra-chave SET:
Define propriedades como o tipo de dado das células (datatype), restrições (constraint) de uma coluna e valor padrão (default).

#### Definir constraint:
```sql
ALTER TABLE table_name ALTER COLUMN column_name SET constraints;
```

#### Definir tipo de dado:
```sql
ALTER TABLE table_name ALTER COLUMN column_name SET DATA TYPE datatype;
```

#### Definit valor padrão:
```sql
ALTER TABLE table_name ALTER COLUMN column_name SET DEFAULT value;
```
---

## 🧵 Comandos de Linha (ROW)
### 🆕 Inserir uma linha (INSERT):

#### Forma com uma linha:
```sql
INSERT INTO table_name(column_1, column_2) VALUES(value_1, value_2);
```

#### Forma com múltiplas linhas:
```sql
INSERT INTO table_name(column_1, column_2) VALUES(value_1, value_2), (value_1, value_2), (value_1, value_2);
```

---

### ✏️ Atualizar uma linha (UPDATE):
#### Atualizar uma célula específica:
```sql
UPDATE table_name SET column_name = new_value WHERE condition;
```

#### Atualizar todas as células:
```sql
UPDATE table_name SET column_name = value;
```


#### Deletar uma linha específica:
```sql
DELETE FROM table_name WHERE condition;
```

---

## 🔍 Consultas – SELECT

### 📖 Consulta básica:
```sql
SELECT column FROM table_name;
-- Seleciona uma coluna específica da tabela exibe seus valores.
```
```sql
SELECT * FROM table_name;
-- Seleciona todas as colunas de uma tabela exibe seus valores.
```
---

### 📃 Consulta por ordem de coluna (ORDER BY):
---
#### ORDER BY básico:
```sql
SELECT columns FROM table_name ORDER BY column_name;
-- Seleciona colunas da tabela e permite escolher a ordem de exibição com base em uma coluna escolhida
```

* Exemplo:
```sql
SELECT * FROM phone_list ORDER BY name;
-- Exibe os dados de uma lista telefônica por ordem de nome
```

---

#### ORDER BY descendente (DESC) / ascendente (ASC):
```sql
SELECT columns FROM table_name ORDER BY column_name DESC;
-- Exibe o resultado em ordem decrescente (DESC); ascendente (ASC) é o padrão, pode ser omitido.
```

* Exemplo:
```sql
SELECT * FROM notas ORDER BY nota DESC;
-- Exibe todas as linhas com todas as colunas da tabela notas por ordem de da maior nota para a menor nota (descendente).
```

Ordem **descendente** significa o mesmo que ordem **decrescente**, enquanto ordem **ascendente** é o mesmo que ordem **crescente**.

---

#### ORDER BY múltiplas colunas:
```sql
SELECT columns FROM table_name ORDER BY <column_1>, <column_2>;
-- Exibe os resultados na ordem da primeira coluna, se houver valores iguais para a primeira coluna, exibe os iguais na ordem da segunda coluna.
```

* Exemplo:
```sql
SELECT * FROM notas ORDER BY nota DESC, nome;
-- Exibe as notas por ordem descendente, se houver pessoas com notas iguais, exibe por ordem de nome.
```

---

### 📘 Condição WHERE:

```sql
SELECT * FROM table WHERE condition;
-- Aplica uma condição na busca para exibir somente a linha (ou linhas) que possuem uma célula ou mais células específicas.
```

* Exemplos:
```sql
SELECT character_id, name FROM characters WHERE name='Zeus';
-- Exibe somente a(s) linha(s) onde a coluna name é igual a Zeus.
```

```sql
SELECT * FROM students WHERE last_name < 'M' OR gpa = 3.9;
-- Exibe somente a(s) linha(s) onde a coluna last_name é menor que M (ordem alfabética) ou a(s) linha(s) onde a coluna gpa é igual a 3.9.
```

```sql
SELECT * FROM students WHERE last_name < 'M' AND gpa = 3.9 OR gpa < 2.3;
-- Exibe somente a(s) linha(s) onde a coluna last_name é menor que M e o gpa é igual a 3.9 ou a(s) linha(s) onde a coluna gpa é menor que 2.3.
```

```sql
SELECT * FROM students WHERE last_name < 'M' AND (gpa = 3.9 OR gpa < 2.3);
-- Exibe somente a(s) linha(s) onde a coluna last_name é menor que M e a coluna gpa é igual a 3.9 ou menor que 2.3.
```

---

### 📗 Condição WHERE com LIKE
```sql
... WHERE <column> LIKE '<pattern>'
-- LIKE serve para selecionar as células com um pattern (padrão) específico.
```

* Exemplo:
```sql
SELECT course FROM courses WHERE course LIKE '_lgorithms'
-- '_lgorithms', seleciona a(s) célula(s) que começa com uma única letra qualquer e termina com 'lgorithms' na coluna course.
```

```sql
SELECT course FROM courses WHERE course LIKE '%lgorithms';
-- '%lgorithms', seleciona a(s) célula(s) que começam com uma quantidade qualquer de letras e termina com 'lgorithms'.
```

```sql
SELECT course FROM courses WHERE course LIKE '_e%';
-- '_e%', seleciona a(s) célula(s) que começam com uma única letra qualquer, seguida pela letra 'e' e terminada com qualquer quantidade de letras.
```

```sql
SELECT course FROM courses WHERE course LIKE '% %';
-- % %', seleciona a célula que tem um espaço ' ' no meio e qualquer quantidade de letras antes e depois do espaço.
```

```sql
SELECT course FROM courses WHERE course LIKE '%A%';
-- '%A%', seleciona a célula que tem um 'A' no meio e qualquer quantidade de letras antes e depois.
```

---

### 📕 Condição WHERE com NOT LIKE
```sql
... WHERE <column> NOT LIKE '<pattern>';
-- NOT LIKE serve para selecionar as células com strings que não seguem um pattern (padrão) específico.
```

* Exemplo:
```sql
SELECT course FROM courses WHERE course NOT LIKE '% %';
-- '% %', seleciona as células que não tem um vazio nelas.
```

---

### 📙 Condição WHERE com ILIKE
```sql
... WHERE <column> ILIKE '<pattern>';
-- Como o LIKE, mas não diferencia maiúsculas de minúsculas; 'A' é o mesmo que 'a'.
```

* Exemplo:
```sql
SELECT course FROM courses WHERE course ILIKE '%A%';
-- '%A%', seleciona as células que tem um A no meio, independente de serem maiúsculo ou minúsculo.
```

---

### 📒 Condição WHERE com NOT ILIKE
```sql
... WHERE <column> NOT ILIKE '<pattern>';
-- Como o NOT LIKE, mas não faz diferença entre maiúscula e minúscula.
```

* Exemplo:
```sql
SELECT course FROM courses WHERE course NOT ILIKE '%A%';
-- '%A%', seleciona as células que não possuem um 'A' no meio, maiúsculo ou minúsculo.
```
```sql
SELECT course FROM courses WHERE course NOT ILIKE '%A%' AND course LIKE '% %';
-- Seleciona as células que não possuem um 'A', maiúsculo ou minúsculo, no meio e que também não possuem espaço.
```

---

### 📓 Condição WHERE com IS NULL
```sql
... WHERE <column> IS NULL;
-- IS NULL, seleciona as células que estão vazias, iguais a null.
```

* Exemplo:
```sql
SELECT * FROM boletim WHERE nota IS NULL;
-- Selecionas as notas de valor null no boletim.
```

---

### 📔 Condição WHERE com NOT NULL
```sql
... WHERE <column> IS NOT NULL;
-- Selecionas as células não null.
```

* Exemplo:
```sql
SELECT * FROM boletim WHERE nota IS NOT NULL;
```

---

### 📚 Condição WHERE com IS NULL e NOT NULL
```sql
SELECT * FROM students WHERE major_id IS NULL AND gpa IS NOT NULL;
-- Seleciona células combinando IS NULL com NOT NULL.
```

---

### 🌡️ Quantidade de resultados (LIMIT)
```sql
... LIMIT <number>;
-- Limita a quantidade de resultados de um select.
```

* Exemplo:
```sql
SELECT * FROM sala_aula ORDER BY nota DESC, first_name LIMIT 10;
-- Seleciona os alunos por ordem de nota descrescente, se houver notas iguais, organiza pelo nome, o limite de resultados é 10.
```

```sql
SELECT * FROM provas WHERE nota IS NOT NULL ORDER BY nota DESC, first_name LIMIT 10;
-- Seleciona as provas com nota não nula, por ordem decrescente de nota, se houver notas iguais, organiza pelo nome, o limite de resultados é 10.
```

---

### 📊 Funções Agregadas
---
#### Menor valor - MIN():
```sql
SELECT MIN(column) FROM table;
-- Seleciona a célula de menor valor de uma coluna da tabela.
```

* Exemplo:
```sql
SELECT MIN(nota) FROM alunos;
-- Seleciona a menor nota entre os alunos.
```

#### Maior valor - MAX():
```sql
SELECT MAX(column) FROM table;
-- Seleciona a célula de maior valor de uma coluna da tabela.
```

* Exemplo:
```sql
SELECT MAX(nota) FROM alunos;
-- Seleciona a maior nota entre os alunos.
```

#### Soma de valores - SUM():
```sql
SELECT SUM(column) FROM table;
-- Soma todas as células de uma coluna da tabela e retorna o resultado.
```

* Exemplo:
```sql
SELECT SUM(nota) FROM alunos;
```

#### Média de valores - AVG():
```sql
SELECT AVG(column) FROM table;
-- Média entre todas as células de uma coluna da tabela.
```

* Exemplo:
```sql
SELECT AVG(nota) FROM alunos;
```

#### Contagem - COUNT():
```sql
SELECT COUNT(column) FROM table;
-- Exibe a quantidade de células/linhas para uma coluna especificada.
```

* Exemplo:
```sql
SELECT COUNT(*) FROM alunos;
-- Exibe a quantidade de linhas da tabelas alunos.
```
```sql
SELECT COUNT(nota) FROM alunos;
-- Exibe a quantidade de células de uma coluna da tabela.
```
---

### ⭕ Arredondamento de decimais
---
#### Arredondar para cima - CEIL():
```sql
SELECT CEIL(value) ...;
-- Arredonda o decimal para o inteiro acima.
```

* Exemplo:
```sql
SELECT CEIL(AVG(nota)) FROM alunos;
```

#### Arredondar para baixo - FLOOR():
```sql
SELECT FLOOR(value) ...;
-- Arredonda o decimal para o inteiro abaixo.
```

* Exemplo:
```sql
SELECT FLOOR(AVG(nota)) FROM alunos;
```

#### Arredondar para o mais próximo - ROUND():
```sql
SELECT ROUND(value);
-- Arredonda o decimal para o inteiro mais próximo.
```

* Exemple:
```sql
SELECT ROUND(AVG(nota)) FROM alunos;
```
```sql
SELECT ROUND(AVG(nota), 2) FROM alunos;
-- Arredonda para o número de casas decimais especificado, 2 casas decimais.
```

---

### 🎯 Agrupamentos
---
#### DISTINCT:

```sql
SELECT DISTINCT column FROM table;
-- Exibe valores únicos, sem repetição de linhas com colunas de mesmo valor;
```

* Exemplo:
```sql
SELECT DISTINCT city FROM clients;
-- Seleciona todas as cidades dos clientes cadastrados sem repetição de nomes de cidades.
```
```sql
SELECT DISTINCT city, state FROM clients;
-- Seleciona todas as combinações únicas das cidades + estados dos clientes cadastrados.
```
```sql
SELECT COUNT(DISTINCT city) FROM clients;
-- Exibe a quantidade de cidades cadastradas, sem considerar cidades repetidas.
```

---

#### GROUP BY:
```sql
SELECT <column> FROM <table> GROUP BY <column>
-- Exibe valores únicos da mesma forma que o DISTINCT; sua vantagem está no uso junto com MIN, MAX, AVG, COUNT; pode ser entendido como agrupar células iguais em um grupo.
```

* Exemple:
```sql
SELECT city FROM clientes GROUP BY city;
-- Exibe as cidades dos clientes, sem repetição de cidades.
```
```sql
SELECT city, COUNT(*) as total_clientes FROM clients GROUP BY city;
-- Exibe o número de clientes de cada cidade; quantidades de linhas que contém cada cidade específica.
```
```sql
SELECT department, SUM(salary) AS total_salaries FROM employees GROUP BY department;
-- Exibe a soma de salários para cada departamento específico; exibe as células de uma coluna sem repetição, enquanto realiza a soma das células de outra coluna agrupando pelas célula repetidas da primeira coluna.
```
```sql
SELECT category, AVG(price) AS average_price FROM products GROUP BY category;
-- Média de preço por categoria de produto.
```
```sql
SELECT supplier_id, MIN(price) AS cheapest, MAX(price) AS most_expensive FROM products GROUP BY supplier_id;
--Mínimo e Máximo por grupo.
```


```sql
SELECT column, COUNT(*) FROM table GROUP BY column;
```
---
#### GROUP BY HAVING:
```sql
SELECT <column> FROM <table> GROUP BY <column> HAVING <condition>;
-- Permite filtrar os grupos conforme uma condição.
```

* Exemplo:
```sql
SELECT department, COUNT(*) FROM employees GROUP BY department HAVING COUNT(*) > 10;
-- Agrupa os departamentos por quantidade de funcionários, mas o HAVING filtra o departamentos para exibir aquele que possuem mais de dez funcionários.
```
```sql
SELECT major_id, MIN(gpa), MAX(gpa) FROM students GROUP BY major_id HAVING MAX(gpa) = 4.0;
-- Agrupa as áreas de estudos dos alunos exibindo, as menores e maiores médias, mas o HAVING filtra para exibir apenas os cursos com a maior média igual a 4.
```

---

### 💱 Aliases - AS

```sql
SELECT column AS new_name FROM table;
-- Permite renomear o nome de uma coluna na exibição; o novo nome também pode ser utilizado no corpo da query.
```

* Exemplos:
```sql
SELECT major_id, MIN(gpa) AS min_gpa, MAX(gpa) FROM students GROUP BY major_id HAVING MAX(gpa) = 4.0;
```
```sql
SELECT major_id, COUNT(*) AS number_of_students FROM students GROUP BY major_id;
```
```sql
select major_id, count(*) as number_of_students from students group by major_id having count(*) < 8;
```
```sql
SELECT s.major_id FROM students AS s FULL JOIN majors AS m ON s.major_id=m.major_id;
```

---

### 🪢 Junções de Tabelas - JOIN
---
#### FULL JOIN:
```sql
SELECT columns FROM table_1 FULL JOIN table_2 ON table_1.primary_key_column = table_2.foreign_key_column;
-- Junta duas tabelas relacionadas entre si por chave primária e chave estrangeira, essas duas colunas serão uma só na junção;
-- FULL JOIN juntará todas as entradas mesmo quando não houver relacionamento de chave primária e estrangeiras.
-- As colunas sem correspondência terão valor NULL.
```

* Exemplo:
```sql
SELECT * FROM characters FULL JOIN more_info ON characters.character_id = more_info.character_id;
-- Há uma tabela sobre informações básicas sobre personagem (characters) e outra com mais informações sobre os personagens (more_info).
-- O que relaciona as duas tabelas é o character_id, que serão a mesma coluna na junção;
-- FULL JOIN juntará as duas tabelas incluindo as linhas que não possuem correspondente na outra tabela.
```
```sql
SELECT * FROM students FULL JOIN majors ON students.major_id = majors.major_id;
-- Os alunos e as áreas de estudo estão relacionado pelo id da área de estudo.
```

#### LEFT JOIN:

```sql
SELECT * FROM students LEFT JOIN majors ON students.major_id = majors.major_id;
-- Juntará as duas tabelas, exibindo todas as linhas da tabela da esquerda, mas juntando com somente as linhas da tabela da direita que possuem correspondência com a tabela da esquerda.
-- Todas as linhas da tabela da esquerda serão exibidas, mesmo que não possuam correspondência com a tabela da direita.
-- Somente as linhas da tabela da direita que possuem correspondência com a tabela da esquerda serão exibidas.
```

* Exemplo:
```sql
SELECT clientes.nome, pedidos.produto FROM clientes LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id;
-- Juntará duas tabelas, a tabela de clientes cadastrados (só a coluna de nome) e a tabelas de pedidos de clientes (só o produto).
-- As duas tabelas estão relacionadas pelo id do cliente.
-- O left_join exibirá todos os clientes cadastrados, coluna da esquerda.
-- O left_join exibirá somente os produtos, coluna da direita, relacionado aos clintes da tabela da esquerda.
-- Se houver produtos de outros clientes que não estão na tabela da esquerda, ele não serão exibidos.
```

#### RIGHT JOIN:

```sql
SELECT * FROM students RIGHT JOIN majors ON students.major_id = majors.major_id;
-- Juntará as duas tabelas, exibindo todas as linhas da tabela da direitas, mas juntando somente com as linhas da tabela da esquerda que possuem correspondência com a tabela da direita.
-- Todas as linhas da tabela da direita serão exibidas, mesmo que não possuam correspondência com a tabela da esquerda.
-- Somenta as linhas da tabela da esquerda que possuem correspondência com a tabela da direita serão exibidas.
```

* Exemplo:
```sql
SELECT clientes.nome, pedidos.produto FROM clientes RIGHT JOIN pedidos ON clientes.id = pedidos.cliente_id;
-- Caso semelhante ao do LEFT JOIN.
-- Exibirá todos os pedidos cadastradados (tabela da direita), mesmo que não possuam correspondência com os clientes da tabela da esquerda.
-- Exibirá somente os clientes da tabela da esquerda que possuam correspondência com os pedido da tabela da direita.
```

#### INNER JOIN:
```sql
SELECT * FROM students INNER JOIN majors ON students.major_id = majors.major_id;
-- Juntará as duas tabelas, mas somente as linhas que possuem correspondência em ambas as tabelas.
-- As linhas sem correspondência em ambas as tabela não serão exibidas.
```

* Exemplo:
```sql
SELECT clientes.nome, pedidos.produto FROM clientes INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;
-- Caso semelhante ao do left join.
-- Exibirá somente os pedidos e clientes com correspondência em ambas as tabelas.
-- As linhas sem correspondência em ambas as tabelas não serão exibidas.
```

#### Múltiplos JOINs:
```sql
SELECT columns FROM junction_table FULL JOIN table_1 ON junction_table.foreign_key_column = table_1.primary_key_column FULL JOIN table_2 ON junction_table.foreign_key_column = table_2.primary_key_column;
-- Junção de mais de uma tabela; a tabela juction_table possui duas chaves estrangeiras para tabelas diferentes.
```

#### JOIN simplificado com USING:
```sql
SELECT * FROM <table_1> FULL JOIN <table_2> USING(<column>);
-- Junção de duas tabelas que possuem o mesmo nome de chave primária e estrangeira; forma mais prática de juntar tabelas.
```

* Exemplo:
```sql
SELECT * FROM students FULL JOIN majors USING (major_id) FULL JOIN majors_courses USING (major_id);
-- As três tabelas utilizam o mesmo nome de chave primária e estrangeira.
```

#### Exemplo com todas as opções:
```sql
SELECT course FROM students FULL JOIN majors USING(major_id) FULL JOIN majors_courses USING(major_id) FULL JOIN courses USING (course_id) WHERE student_id IS NOT NULL GROUP BY course HAVING count(course)=1 ORDER BY course;
-- Exemplo que utiliza: FULL JOIN, USING, WHERE, IS NOT NULL, GROUP BY, HAVING, COUNT, ORDER BY
```

---

## ⏰ Funções do PostgreSQL

```sql
NOW();
-- Retorna a data e a hora atual de acordo com o fuso horário do SGDB; pode ser usado como DEFAULT ou em um INSERT.
```

---

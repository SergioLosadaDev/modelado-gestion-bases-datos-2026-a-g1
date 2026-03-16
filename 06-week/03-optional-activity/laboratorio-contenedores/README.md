# Docker Workshop: PostgreSQL & MySQL Containers

This guide demonstrates how to run **PostgreSQL and MySQL using Docker
containers**, create a database, define a table, insert records, and
execute SQL scripts from the host machine.

It is intended as a **practical introduction to containerized
databases** commonly used in backend development.

------------------------------------------------------------------------

# Table of Contents

1.  Verify Docker Installation
2.  Start PostgreSQL Container
3.  Start MySQL Container
4.  Create a Database
5.  Create the `student` Table
6.  Insert and Query Data
7.  Run SQL Script from Host
8.  Access Containers with `docker exec`

------------------------------------------------------------------------

# 1. Verify Docker Installation

Before starting, verify that **Docker** and **Docker Compose** are
installed.

``` bash
docker --version
docker compose version
```

------------------------------------------------------------------------

# 2. Start PostgreSQL Container

Run the PostgreSQL container using Docker Compose.

``` bash
docker compose up -d
```

Verify the container is running:

``` bash
docker ps
```

------------------------------------------------------------------------

# 3. Start MySQL Container

Run the MySQL container using Docker Compose.

``` bash
docker compose up -d
```

Verify running containers:

``` bash
docker ps
```

------------------------------------------------------------------------

# 4. Create the Database

## MySQL

Connect to MySQL container:

``` bash
docker exec -it corhuila-mysql mysql -u root -p
```

Create the database:

``` sql
CREATE DATABASE laboratorio_docker;
```

------------------------------------------------------------------------

## PostgreSQL

Connect to PostgreSQL container:

``` bash
docker exec -it corhuila-postgres psql -U postgres
```

Create the database:

``` sql
CREATE DATABASE laboratorio_docker;
```

------------------------------------------------------------------------

# 5. Create the `student` Table

## MySQL

Select the database:

``` sql
USE laboratorio_docker;
```

Create the table:

``` sql
CREATE TABLE estudiante (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20),
    nombre VARCHAR(120),
    correo VARCHAR(120),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

------------------------------------------------------------------------

## PostgreSQL

Connect to the database:

``` sql
\c laboratorio_docker
```

Create the table:

``` sql
CREATE TABLE estudiante (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    correo VARCHAR(120) UNIQUE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

------------------------------------------------------------------------

# 6. Insert and Query Data

Insert a record:

``` sql
INSERT INTO estudiante (codigo, nombre, correo)
VALUES ('2026001', 'Ana Torres', 'ana.torres@email.com');
```

Query records:

``` sql
SELECT * FROM estudiante;
```

------------------------------------------------------------------------

# 7. Run SQL Script from Host

Example SQL file:

    sql/bd.sql

## MySQL

``` bash
docker exec -i corhuila-mysql mysql -u root -pmysql123 laboratorio_docker < sql/bd.sql
```

## PostgreSQL

``` bash
docker exec -i corhuila-postgres psql -U postgres -d laboratorio_docker < sql/bd.sql
```

------------------------------------------------------------------------

# 8. Access Containers with `docker exec`

## MySQL

``` bash
docker exec -it corhuila-mysql mysql -u root -pmysql123
```

``` sql
SHOW DATABASES;
USE laboratorio_docker;
DESCRIBE estudiante;
SELECT * FROM estudiante;
```

------------------------------------------------------------------------

## PostgreSQL

``` bash
docker exec -it corhuila-postgres psql -U postgres
```

``` sql
\l
\c laboratorio_docker
\dt
\d estudiante
SELECT * FROM estudiante;
```

------------------------------------------------------------------------

# Useful Docker Commands

``` bash
docker ps
docker compose down
docker compose restart
docker logs corhuila-postgres
docker logs corhuila-mysql
```

------------------------------------------------------------------------

# Conclusion

Using Docker to run databases provides:

-   Isolated environments
-   Easy setup and removal
-   Reproducible development environments
-   Ideal for backend development and testing

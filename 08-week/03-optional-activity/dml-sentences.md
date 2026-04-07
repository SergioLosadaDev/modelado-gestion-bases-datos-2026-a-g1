# Quiz 2 - Crear sentencias DML

# Definición de Sentencias DML

**DML** son las siglas de **Data Manipulation Language** (Lenguaje de Manipulación de Datos).

## ¿Qué son?

Las sentencias DML son un subconjunto de comandos SQL utilizados para **consultar, insertar, modificar y eliminar** los datos dentro de las tablas de una base de datos relacional.

A diferencia de las sentencias DDL (Data Definition Language) que definen la estructura de la base de datos (crear tablas, índices, etc.), las DML trabajan directamente con los **datos en sí mismos**.

## Principales sentencias DML

| Comando      | Función                                       | Ejemplo                                                                      |
| :----------- | :-------------------------------------------- | :--------------------------------------------------------------------------- |
| **`SELECT`** | Consulta o recupera datos de una o más tablas | `SELECT * FROM Clientes WHERE Ciudad = 'Madrid';`                            |
| **`INSERT`** | Agrega nuevas filas (registros) a una tabla   | `INSERT INTO Clientes (Nombre, Email) VALUES ('Ana López', 'ana@mail.com');` |
| **`UPDATE`** | Modifica los datos existentes en una tabla    | `UPDATE Clientes SET Teléfono = '123456789' WHERE ID = 1;`                   |
| **`DELETE`** | Elimina filas existentes de una tabla         | `DELETE FROM Clientes WHERE ID = 1;`                                         |

## Características clave

- **Transaccionalidad:** Las operaciones DML suelen ser transaccionales, permitiendo agrupar cambios con:
  - `BEGIN TRANSACTION` - Iniciar transacción
  - `COMMIT` - Confirmar cambios permanentemente
  - `ROLLBACK` - Deshacer cambios no confirmados

- **Manipulación de contenido:** Su único objetivo es manipular el contenido de los datos, no la estructura del esquema.

## DML vs DDL

| Característica    | **DML** (Manipulación)                    | **DDL** (Definición)                   |
| :---------------- | :---------------------------------------- | :------------------------------------- |
| **Objetivo**      | Manejar los datos                         | Definir la estructura                  |
| **Comandos**      | `SELECT`, `INSERT`, `UPDATE`, `DELETE`    | `CREATE`, `ALTER`, `DROP`, `TRUNCATE`  |
| **Transaccional** | Generalmente sí (se puede hacer rollback) | Generalmente no (ejecución automática) |
| **Ejemplo**       | Agregar un cliente nuevo                  | Crear la tabla "Clientes"              |

# APLICACIÓN

# 🔐 SECURITY

## 📌 Tabla: `security.role`

### INSERT

```sql
INSERT INTO security.role (name, description, created_by)
VALUES ('ADMIN', 'Administrador del sistema', 'system');

INSERT INTO security.role (name, description, created_by)
VALUES ('USER', 'Usuario estándar', 'system');

INSERT INTO security.role (name, description, created_by)
VALUES ('MANAGER', 'Gestor', 'system');
```

### SELECT

```sql
SELECT * FROM security.role;

SELECT name, state FROM security.role;

SELECT * FROM security.role WHERE state = 'ACTIVE';
```

### DELETE

```sql
DELETE FROM security.role WHERE name = 'MANAGER';

DELETE FROM security.role WHERE state = 'INACTIVE';

DELETE FROM security.role WHERE name = 'USER';
```

---

## 📌 Tabla: `security.user`

### INSERT

```sql
INSERT INTO security."user" (username, email, password, role_id)
SELECT 'juan', 'juan@mail.com', '123456', id FROM security.role WHERE name='ADMIN';

INSERT INTO security."user" (username, email, password, role_id)
SELECT 'ana', 'ana@mail.com', '123456', id FROM security.role WHERE name='USER';

INSERT INTO security."user" (username, email, password, role_id)
SELECT 'carlos', 'carlos@mail.com', '123456', id FROM security.role WHERE name='USER';
```

### SELECT

```sql
SELECT * FROM security."user";

SELECT username, email FROM security."user";

SELECT * FROM security."user" WHERE state='ACTIVE';
```

### DELETE

```sql
DELETE FROM security."user" WHERE username='carlos';

DELETE FROM security."user" WHERE email='ana@mail.com';

DELETE FROM security."user" WHERE state='INACTIVE';
```

---

## 📌 Tabla: `security.form`

### INSERT

```sql
INSERT INTO security.form (name, route) VALUES ('Dashboard', '/dashboard');

INSERT INTO security.form (name, route) VALUES ('Usuarios', '/users');

INSERT INTO security.form (name, route) VALUES ('Inventario', '/inventory');
```

### SELECT

```sql
SELECT * FROM security.form;

SELECT name FROM security.form;

SELECT * FROM security.form WHERE state='ACTIVE';
```

### DELETE

```sql
DELETE FROM security.form WHERE name='Inventario';

DELETE FROM security.form WHERE route='/users';

DELETE FROM security.form WHERE state='INACTIVE';
```

---

# 📦 INVENTORY

## 📌 Tabla: `inventory.category`

### INSERT

```sql
INSERT INTO inventory.category (name, description) VALUES ('Metal', 'Material metálico');

INSERT INTO inventory.category (name, description) VALUES ('Herramientas', 'Herramientas industriales');

INSERT INTO inventory.category (name, description) VALUES ('Accesorios', 'Accesorios varios');
```

### SELECT

```sql
SELECT * FROM inventory.category;

SELECT name FROM inventory.category;

SELECT * FROM inventory.category WHERE state='ACTIVE';
```

### DELETE

```sql
DELETE FROM inventory.category WHERE name='Accesorios';

DELETE FROM inventory.category WHERE state='INACTIVE';

DELETE FROM inventory.category WHERE name='Herramientas';
```

---

## 📌 Tabla: `inventory.product`

### INSERT

```sql
INSERT INTO inventory.product (name, price, category_id)
SELECT 'Lamina acero', 50000, id FROM inventory.category WHERE name='Metal';

INSERT INTO inventory.product (name, price, category_id)
SELECT 'Martillo', 20000, id FROM inventory.category WHERE name='Herramientas';

INSERT INTO inventory.product (name, price, category_id)
SELECT 'Tornillos', 10000, id FROM inventory.category WHERE name='Accesorios';
```

### SELECT

```sql
SELECT * FROM inventory.product;

SELECT name, price FROM inventory.product;

SELECT * FROM inventory.product WHERE price > 15000;
```

### DELETE

```sql
DELETE FROM inventory.product WHERE name='Tornillos';

DELETE FROM inventory.product WHERE price < 15000;

DELETE FROM inventory.product WHERE state='INACTIVE';
```

---

## 📌 Tabla: `inventory.inventory`

### INSERT

```sql
INSERT INTO inventory.inventory (product_id, quantity)
SELECT id, 100 FROM inventory.product WHERE name='Lamina acero';

INSERT INTO inventory.inventory (product_id, quantity)
SELECT id, 50 FROM inventory.product WHERE name='Martillo';

INSERT INTO inventory.inventory (product_id, quantity)
SELECT id, 200 FROM inventory.product WHERE name='Tornillos';
```

### SELECT

```sql
SELECT * FROM inventory.inventory;

SELECT quantity FROM inventory.inventory;

SELECT * FROM inventory.inventory WHERE quantity > 50;
```

### DELETE

```sql
DELETE FROM inventory.inventory WHERE quantity < 50;

DELETE FROM inventory.inventory WHERE state='INACTIVE';

DELETE FROM inventory.inventory WHERE quantity > 150;
```

---

# 💳 BILLING

## 📌 Tabla: `bill.bill`

### INSERT

```sql
INSERT INTO bill.bill (user_id, total)
SELECT id, 100000 FROM security."user" WHERE username='juan';

INSERT INTO bill.bill (user_id, total)
SELECT id, 50000 FROM security."user" WHERE username='ana';

INSERT INTO bill.bill (user_id, total)
SELECT id, 75000 FROM security."user" WHERE username='juan';
```

### SELECT

```sql
SELECT * FROM bill.bill;

SELECT total FROM bill.bill;

SELECT * FROM bill.bill WHERE total > 60000;
```

### DELETE

```sql
DELETE FROM bill.bill WHERE total < 60000;

DELETE FROM bill.bill WHERE state='INACTIVE';

DELETE FROM bill.bill WHERE total > 90000;
```

---

## 📌 Tabla: `bill.bill_item`

### INSERT

```sql
INSERT INTO bill.bill_item (bill_id, product_id, quantity, unit_price, total)
SELECT b.id, p.id, 2, 50000, 100000
FROM bill.bill b, inventory.product p
WHERE p.name='Lamina acero'
LIMIT 1;

INSERT INTO bill.bill_item (bill_id, product_id, quantity, unit_price, total)
SELECT b.id, p.id, 1, 20000, 20000
FROM bill.bill b, inventory.product p
WHERE p.name='Martillo'
LIMIT 1;

INSERT INTO bill.bill_item (bill_id, product_id, quantity, unit_price, total)
SELECT b.id, p.id, 5, 10000, 50000
FROM bill.bill b, inventory.product p
WHERE p.name='Tornillos'
LIMIT 1;
```

### SELECT

```sql
SELECT * FROM bill.bill_item;

SELECT quantity, total FROM bill.bill_item;

SELECT * FROM bill.bill_item WHERE quantity > 2;
```

### DELETE

```sql
DELETE FROM bill.bill_item WHERE quantity < 2;

DELETE FROM bill.bill_item WHERE state='INACTIVE';

DELETE FROM bill.bill_item WHERE total > 80000;
```

---

### ¿Qué criterios usaría para decidir cuándo migrar de archivos planos a un SGBD?

- Multiples usuarios manipulando los datos
- Perdida de la integridad de los datos
- Concurrencia alta en el texto plano

### ¿Qué tipo de SGBD (relacional o NoSQL) parece más adecuado para este contexto y por qué?

- Es mas adecuado un SGBD relacional por que en el escenario podemos identificar 3 entidades que estan relacionadas (Estudiantes, asignaturas, notas) y este comportamiento se puede modelar de manera optima con bases de datos relacionales.

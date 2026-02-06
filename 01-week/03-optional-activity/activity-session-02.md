### Actividad breve de activación

- Dato: "ORF S.A", "FEDV1873", "CONTADO", 560000
- Información: "El cliente ORF S.A pago de CONTADO la factura FEDV1873 por el valor de 560000"
- DB: El diseño constaria de Clientes, Facturas, Metodo de pago.

### Actividad Practica guiada

| Entidad candidata | Posibles atributos                                                    | Comentarios iniciales                                 |
| ----------------- | --------------------------------------------------------------------- | ----------------------------------------------------- |
| Docente           | Código, nombre, documento, correo institucional, programa, asigantura | Un profesor puede dictar varias asignaturas           |
| Programa          | Duracion, Modalidad, Jornada, codigo snies, Creditos                  | Un programa puede ser tomado por multiples estudiante |

### Preparando el terreno para el modelo entidad-relación.

1. ¿Qué pasaría si no definimos correctamente las claves de cada entidad desde el inicio?

   > Algunos problemas que surgen estan relacionados a la integridad de los datos ya que pudrian existir datos duplicados o inconsistentes, tambien podria dificultar las relaciones debido a que las claves foraneas dependen de las claves primarias permitiendo relaciones fragiles entre tablas, otros aspectos a considerar son los problemas de rendimiento y complejidad de mantenimiento.

2. ¿Qué ventajas aporta tener identificadas las entidades antes de pasar al diagrama ER formal?

   > Esto permite un claridad conceptual al entender a fondo el dominio del problema, los objetos principales y sus responsabilidades antes de entrar en detalles técnicos, tambien facilita la detección de relaciones pues al tener las entidades definidas, es más fácil descubrir cómo se conectan entre sí (relaciones uno a uno, uno a muchos, muchos a muchos).

3. ¿Qué información adicional consideras crítica en un sistema académico que aún no hemos modelado?
   > Además de los elementos básicos como estudiantes, profesores y cursos, un sistema académico requiere modelar información crítica como: prerrequisitos entre asignaturas, mallas curriculares por carrera, un subsistema de usuarios y roles con permisos diferenciados, historiales de cambios (auditoría), registro de asistencia, gestión de recursos físicos (aulas/laboratorios), períodos académicos específicos, y módulos de seguimiento financiero o de pagos, para garantizar que el sistema cubra tanto la gestión académica como la administrativa de manera integral.

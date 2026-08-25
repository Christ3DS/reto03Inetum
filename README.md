# PET-1045 Backend Automation

## Descripción

Framework de automatización de pruebas API REST desarrollado con Karate DSL para validar el ciclo de vida de usuarios del servicio PetStore.

## Tecnologías

- Java 17
- Maven
- Karate DSL
- JUnit 5
- GitHub Actions

---

## Endpoints Automatizados

### POST /user

Creación de usuarios.

### GET /user/{username}

Consulta de usuarios existentes y no existentes.

### PUT /user/{username}

Actualización de información de usuario.

### DELETE /user/{username}

Eliminación de usuarios.

---

## Cobertura Implementada

### Smoke Test

- Creación exitosa de usuario.

### Happy Path

- POST User.
- GET User.
- PUT User.
- DELETE User.

### Headers Validation

Validación de:

- api_key
- X-Transaction-Id

### Schema Validation

Validación de contratos JSON mediante schemas.

### Data Types Validation

Validación de:

- id
- username
- email
- userStatus

### Fields Validation

Validación de contenido específico de campos.

### Error Handling

Validación de respuestas 404 para usuarios inexistentes.

### Boundary Testing

Pruebas mediante Scenario Outline.

### Regression Testing

Validación de múltiples usuarios inexistentes.

---

## Ejecución Local

### Ejecutar toda la suite

```bash
mvn test
```

### Ejecutar por ambiente

```bash
mvn test -Dkarate.env=integracion
```

```bash
mvn test -Dkarate.env=certificacion
```

```bash
mvn test -Dkarate.env=produccion
```

### Ejecutar por tags

```bash
mvn test -Dkarate.options="--tags @smoke"
```

```bash
mvn test -Dkarate.options="--tags @regression"
```

```bash
mvn test -Dkarate.options="--tags @error-handling"
```

---

## Gestión de Ambientes

El framework soporta los siguientes ambientes:

- integracion
- certificacion
- produccion

La configuración se realiza mediante:

```javascript
karate.env
```

en el archivo:

```text
karate-config.js
```

---

## Gestión de Secretos

La api_key se obtiene mediante variables de entorno.

Variable utilizada:

```text
API_KEY
```

Lectura:

```java
System.getenv("API_KEY")
```

GitHub Actions utiliza:

```text
GitHub Secrets
```

para evitar credenciales hardcodeadas.

---

## Arquitectura del Proyecto

```text
src
└── test
    ├── java
    │   └── karate
    │       ├── UserRunner.java
    │       └── karate-config.js
    │
    └── resources
        ├── functional
        │   ├── features
        │   ├── request
        │   └── schemas
```

---

## CI/CD

Pipeline implementado mediante GitHub Actions.

Características:

- Runner ubuntu-latest.
- Ejecución por ambiente.
- Ejecución por tags.
- Gestión segura de secretos.
- Generación de reportes Karate.
- Publicación de artefactos.

---

## Reportes

Los reportes se generan en:

```text
target/karate-reports
```

Incluyen:

- karate-summary.html
- karate-tags.html
- karate-timeline.html

---

## Integración QMetry

La solución se encuentra preparada para exportar resultados hacia QMetry Test Management mediante integración API.

---

## Evidencias

- Suite ejecutada exitosamente.
- GitHub Actions en estado Success.
- Artefactos publicados.
- Rama utilizada:

```text
feature/PET-1045/qa
```

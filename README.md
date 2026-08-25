# PET-1045 Backend Automation

## Tecnologías

- Java 17
- Maven
- Karate DSL
- GitHub Actions

## Ejecución local - Gestión de Ambientes

Ejecutar toda la suite:

```bash
mvn test
```

Ejecutar por ambiente:

```bash
mvn test -Dkarate.env=integracion
```

Ejecutar por tags:

```bash
mvn test -Dkarate.options="--tags @smoke"
```

## Gestión de secretos

La api_key es obtenida desde variables de entorno:

```bash
API_KEY
```

## Ambientes

- integracion
- certificacion
- produccion

## Estructura

- Features
- Requests
- Schemas
- Runner
- Configuración multiambiente
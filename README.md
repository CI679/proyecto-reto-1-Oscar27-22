# Guía Rápida de Metodologías (Proyecto del Primer Parcial)

Este proyecto es un pequeño script en **Bash**, empaquetado en **Docker**, que permite consultar de forma interactiva conceptos y definiciones de metodologías de desarrollo **ágiles** y **tradicionales**. Está pensado como entrega del primer parcial de la materia **“Desarrollo basado en plataformas”**.

## Iniciar

Sigue estos pasos para clonar el repositorio, construir la imagen de Docker y probar la aplicación en tu máquina local.

### Pre-requisitos

* [**Docker**](https://docs.docker.com/engine/install/) (versión 20.10 o superior) instalado y en ejecución
* **Git** para clonar el repositorio
* Un entorno Unix-like con **Bash**, **Zsh** (o similar) disponible (Linux, macOS, WSL)

### Instalación

1. **Clona** este repositorio:

```bash
git clone https://github.com/CI679/proyecto-reto-1-Oscar27-22

# Para desarrollo clona por medio de SSH:
git@github.com:CI679/proyecto-reto-1-Oscar27-22.git

cd proyecto-reto-1-Oscar27-22
```

## Ejecución de Tests

Este proyecto no incluye pruebas automatizadas, pero se puede corroborar su funcionamiento mediante las siguientes pruebas manuales:

### Pruebas Manuales

Ejecuta estos comandos en la terminal:

1. **Inicialización del sistema**

```bash
printf "6\n" | ./main.sh -a && ls methods/
```

**Qué verificar:**
Que se creen los archivos `scrum.inf`, `xp.inf`, etc., en la carpeta `/methods`.

2. **Ciclo completo (Añadir + Buscar + Borrar)**

```bash
printf "1\n1\nRetro\nReunión post-sprint\n5\n1\n2\nRetro\n5\n1\n3\nRetro\n5\n6\n" | ./main.sh -a
```

**Salida esperada:**
Añade el concepto "Retro", luego lo encuentra y finalmente lo borra.

3. **Aislamiento entre métodos**

```bash
# Añadir a Cascade (tradicional)
printf "1\n1\nWaterfall\nSecuencial\n5\n6\n" | ./main.sh -t

# Buscar en SCRUM (ágil) – No debe aparecer
printf "1\n2\nWaterfall\n5\n6\n" | ./main.sh -a
```

**Qué verificar:**
Que el concepto "Waterfall" no aparezca en los resultados de búsqueda ágil.

## Estilo de Código

Este proyecto sigue una estructura de Bash procedural con toques de modularidad por medio de funciones, ya que así es más sencillo de leer y mantener. Además, proporciona una interfaz intuitiva para el usuario.

### Reglas Básicas

* **Indentación:** 2 espacios (no tabs)
* **Nombres:** `snake_case` para variables y funciones
* **Variables:** Siempre locales dentro de funciones y entre comillas (`"$var"`)
* **Comparaciones:** Se prefiere `[[ ]]` en vez de `[ ]`
* **Funciones:** Máximo 30 líneas (dividir si es necesario)

### Ejemplo

```bash
function_ejemplo() {
  local concepto="$1"
  [[ -z "$concepto" ]] && return 1
}
```

## Cómo Ejecutar la Aplicación

1. Descarga la imagen desde Docker Hub:

```bash
docker pull emilianopime/metodo:latest
```

2. Ejecuta la aplicación indicando el tipo de metodología:

* Para metodologías **ágiles**:

```bash
docker run -it -e method="-a" emilianopime/metodo:latest
```

* Para metodologías **tradicionales**:

```bash
docker run -it -e method="-t" emilianopime/metodo:latest
```

## Tecnologías Utilizadas

* [Bash](https://www.gnu.org/software/bash/) – Lenguaje del script
* [Docker](https://www.docker.com/) – Contenedor
* [Alpine](https://alpinelinux.org/) – Sistema base para el contenedor

## Contribuciones

Este es un proyecto académico, por lo cual no se aceptan contribuciones externas.

## Versionado

**V1.0.0** – Versión inicial del proyecto

## Colaboradores

* **OSCAR JOAQUÍN MÁRQUEZ ORTEGA** – [Oscar27-22](https://github.com/Oscar27-22)
* **MARTÍN EDUARDO CHACÓN ORDUÑO** – [Chacon0754](https://github.com/Chacon0754)
* **EMILIANO PIÑÓN MARÍN** – [emilianopime](https://github.com/emilianopime)
* **MANUEL MARTÍNEZ MARTÍNEZ** – [Yenm2](https://github.com/Yenm2)

## Licencia

Este proyecto no cuenta con ninguna licencia específica.

## Reconocimientos

* **Profesor Luis Antonio Ramírez Martínez**
* **Brian Fox** (Creador de Bash)


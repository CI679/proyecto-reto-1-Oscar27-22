# Guía Rápida de Metodologías (Proyecto del primer parcial)

Este proyecto es un pequeño script en Bash, empaquetado en Docker, que permite consultar de forma interactiva conceptos y definiciones de metodologías de desarrollo **ágiles** y **tradicionales**. Está pensado como entrega del primer parcial de la materia **“Desarrollo basado en plataformas”**.

## Iniciar

Sigue estos pasos para clonar el repositorio, construir la imagen Docker y probar la aplicación en tu máquina local.

### Pre-requisitos

- **Docker** (versión 20.10 o superior) instalado y en ejecución  
- **Git** para clonar el repositorio  
- Un entorno Unix‑like con **Bash** disponible (Linux, macOS, WSL)

### Instalacion

1. **Clona** este repositorio:
   ```bash
   git clone https://github.com/Oscar27-22/bash-temp.git
   ó usa la sshkey: git@github.com:Oscar27-22/bash-temp.git
   cd guia-metodologias
   
## Ejecución de tests

Pruebas End-to-End
Este proyecto no incluye pruebaas automatizadas,pero podemos corroborar su funcionamiento mediante las pruebas manuales que se presentan a continuacion.
# Pruebas Manuales
Ejecuta estos comandos en terminal:

1. Inicialización del sistema
```
printf "6\n" | ./main.sh -a && ls methods/
```
Qué verificar:
Que se creen los archivos scrum.inf, xp.inf, etc. en /methods.

2. Ciclo completo (Add + Search + Delete)
```
printf "1\n1\nRetro\nReunión post-sprint\n5\n1\n2\nRetro\n5\n1\n3\nRetro\n5\n6\n" | ./main.sh -a
```
Salida esperada:
Añade el concepto "Retro", luego lo encuentra y finalmente lo borra.

3. Aislamiento entre métodos
   
```
# Añade a Cascade (tradicional)  
printf "1\n1\nWaterfall\nSecuencial\n5\n6\n" | ./main.sh -t  

# Busca en SCRUM (ágil) - No debe aparecer  
printf "1\n2\nWaterfall\n5\n6\n" | ./main.sh -a
```
# Qué verificar:
Que el concepto "Waterfall" no aparezca en los resultados de búsqueda ágil.


### Estilo de codigo

Este proyecto sigue una estructura de Bash procedural con toques de modularidad, debido a que de esta manera es mas sencillo de leer y mantenes, ademas de que nos brinda una interfa intuitiva para el usuario.

# Reglas Básicas:

Indentación: 2 espacios (no tabs).

Nombres: snake_case para variables/funciones.

Variables: Siempre local en funciones y con comillas ("$var").

Comparaciones: Usa [[ ]] en vez de [ ].

Funciones: Máximo 30 líneas (si no, divídelas).

# Ejemplo
```
agregar_concepto() {  
  local concepto="$1"  
  [[ -z "$concepto" ]] && return 1  
}
```

## Como ejecutar la aplicacion

1.Descarga la imagen desde Docker Hub:
```
docker pull emilianopime/metodo:latest
```
2.Ejecuta la aplicacion indicando el tipo de metodología:
Para metodologías **ágiles**:
```
docker run -it -e method="-a" emilianopime/metodo:latest
```
Para metodologías **tradicionales**:
```
docker run -it -e method="-t" emilianopime/metodo:latest
```


## Built With

* [Alpine](https://alpinelinux.org/) - El sistema base que utilizamos
* [Bash](https://www.gnu.org/software/bash/) - Lenguaje del script
* [Docker](https://www.docker.com/) - Contenedor

## Contribuciones
Este es un  proyecto academico, por lo cual no se aceptan contribuciones externas

## Versioning
V1.0.0-Version inicial del proyecto
## Colaboradores
* **OSCAR JOAQUIN MARQUEZ ORTEGA** - *Colaborador* - [Oscar27-22](https://github.com/Oscar27-22)
* **MARTIN EDUARDO CHACON ORDUÑO** - *Colaborador* - [Chacon0754](https://github.com/Chacon0754)
* **EMILIANO PIÑON MARIN** - *Colaborador* - [emilianopime](https://github.com/emilianopime)
* **Manuel Martínez Martínez** - *Colaborador* - [Yenm2](https://github.com/Yenm2)

## License
Este proyecto no cuenta con ninguna licencia específica.

## Reconocimientos

* **Profesor Luis Antonio Ramire Martínez**
* **Brian Fox(Creador de bash)**
 
  

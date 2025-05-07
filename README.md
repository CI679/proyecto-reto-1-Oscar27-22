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
   
## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Login en Docker Hub:
```
   docker login
```   
Push de la imagen:
```
   docker push emilianopime/metodo:1.0
```
Ejecucion del contenedor:
   para ejecutar correctamente este contenedor, tenemos que colocar el parametro que queramos usar,  
   si es para metodologias agiles es -a, si es para tradicionales es -t
```
   docker run --rm -it emilianopime/metodo:1.0 -(parametro)
```


## Built With

* [Alpine](https://alpinelinux.org/) - El sistema base que utilizamos
* [Bash](https://www.gnu.org/software/bash/) - Lenguaje del script
* [Docker](https://www.docker.com/) - Contenedor

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

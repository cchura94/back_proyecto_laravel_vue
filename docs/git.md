# Git & GitHub
## 1. Descargar e instalar GIT
``` bash
https://git-scm.com/
```
## 2. Configurar GIT
- abrir la Terminal para configurar su (name y email)
```
git config --global user.email "correo@mail.com"
git config --global user.name "Cristian"

```
------
## Iniciar o clonar un nuevo repositorio
- Para clonar
```
git clone direccion_repositorio
```
- Para inicializar un nuevo repositorio
```bash
git init
```
## Crear un repositorio remoto en github y asociar con el repositorio local
```bash
git remote add origin https://github.com/cchura94/back_proyecto_laravel_vue.git
```
--------
```
git add .
git commit -m "proyecto Inicial con Auth Api"
git push origin master
```
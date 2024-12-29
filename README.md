# Regresión Lineal y Múltiple: Proyecto de Machine Learning

## Documentación de la Carpeta `model`

La carpeta `model` contiene todos los modelos entrenados y los scripts relacionados con el entrenamiento y evaluación de los modelos de regresión lineal y múltiple. A continuación se detalla la estructura y contenido de esta carpeta:

### Estructura de la Carpeta `model`
```
model/
├── script.R            # Script para entrenar el modelo de forma modular
├── docs                # Renderizado de la documentación del modelo
├── models              # Scripts para cargar y guardar modelos    
```

### Ejemplo de Uso

Para activar el modelo, ejecuta el siguiente comando en R:

```R
source("models/R/regresion.R")
```

### Notas Adicionales

- Asegúrate de que todos los paquetes necesarios estén instalados antes de ejecutar los scripts.
- Para más detalles, consulta los comentarios dentro de cada script.

## Descripción

Este proyecto implementa modelos de regresión lineal y múltiple utilizando R. El objetivo es predecir valores continuos basándose en diversas características. El proyecto está estructurado de manera modular para facilitar su comprensión y mantenimiento.

## Estructura del Proyecto

```
{{cookiecutter.project_slug}}/
├── notebooks/             # Datos de entrada y conjuntos de datos
├── data/                  # Notebooks de Quarto

```

## Requisitos

- R (versión 4.0 o superior)
- Paquetes de R: lm, dplyr, ggplot2

## Instalar desde la Terminal:

    1. Clona el repositorio:
```sh
git clone https://github.com/tu_usuario/tu_repositorio.git
```

    2. Instala Cookiecutter:

```sh
pip install cookiecutter
```
o dede conda:

```sh
conda install -c conda-forge cookiecutter
```

## Instala los paquetes necesarios en R:

```R
devtools::install("/home/user/models")
```

## Uso

Preprocesa los datos:

```R
source("models/R/regresion.R")
```

Si prefieres no usar Cookiecutter, puedes clonar este repositorio directamente:

```sh
git clone https://github.com/Eduard088/Regression_Tesis_ML.git
```

## Visualización web del proyecto

### Presentación del Modelo

[Ver el Modelo](https://eduard088.github.io/Regression_Tesis_ML/)

## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o envía un pull request para discutir cualquier cambio.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE para más detalles.

## Contacto

Para cualquier consulta, puedes escribirme: eduardobareapoot@outlook.com
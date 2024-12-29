# Cargar las librerías necesarias
library(dplyr)
library(ggplot2)
library(plotly)
library(purrr)
library(reactable)
library(broom)
library(readxl)

# Función para ajustar los modelos de regresión
ajustar_modelos <- function(data, formula) {
  data %>%
    split(.$Sexo) %>%
    map(~lm(formula, data = .))
}

# Función para obtener el R-cuadrado de los modelos ajustados
obtener_r_cuadrado <- function(modelos) {
  modelos %>%
    map(summary) %>%
    map_dbl(~.x$r.squared)
}

# Función para obtener los coeficientes de los modelos ajustados
obtener_coeficientes <- function(modelos, coef_index = 2) {
  modelos %>%
    map(summary) %>%
    map_dbl(~.x$coefficients[coef_index, 1])
}

# Función para resumir los modelos ajustados
resumir_modelos <- function(modelos) {
  modelos %>%
    map(summary)
}

# Función para obtener los coeficientes en formato 'tidy' con broom
coeficientes_tidy <- function(modelos) {
  modelos %>%
    map(~broom::tidy(.))
}

crear_datos_modelo <- function(modelos, data) {
  modelos %>%
    map2(
      names(modelos),
      ~{
        # Extraer las filas utilizadas por el modelo
        filas_usadas <- model.frame(.x)

        # Aplicar augment solo a las filas del modelo
        augment(.x, data = filas_usadas) %>%
          mutate(Modelo = .y)
      }
    ) %>%
    bind_rows()
}

obtener_resultados <- function(modelos) {
  map_df(modelos, function(modelo) {
    data <- modelo$model
    data$Predicciones <- predict(modelo)
    data$Residuos <- residuals(modelo)
    data
  }, .id = "Sexo")
}

plot_real_vs_pred <- function(data, y_real_col, y_pred_col, facet_col) {
  ggplotly(ggplot(data, aes(x = 1:nrow(data))) +
    geom_line(aes_string(y = y_real_col, color = "'Real'")) +
    geom_line(aes_string(y = y_pred_col, color = "'Predicción'")) +
    facet_wrap(as.formula(paste("~", facet_col))) +
    labs(title = "Datos Reales y Predicciones",
         x = "Índice",
         y = "Valor") +
    scale_color_manual(name = "Leyenda", values = c("Real" = "blue", "Predicción" = "red")))
}

plot_density_real_vs_pred <- function(data, x_real_col, x_pred_col, facet_col) {
  ggplotly(ggplot(data) +
    geom_density(aes_string(x = x_real_col, color = "'Real'"), adjust = 1, cumulative = TRUE) +
    geom_density(aes_string(x = x_pred_col, color = "'Predicción'"), adjust = 1, cumulative = TRUE) +
    facet_wrap(as.formula(paste("~", facet_col))) +
    labs(title = "Densidad Acumulada de Datos Reales y Predicciones",
         x = "Valor",
         y = "Densidad Acumulada") +
    scale_color_manual(name = "Leyenda", values = c("Real" = "blue", "Predicción" = "red")))
}
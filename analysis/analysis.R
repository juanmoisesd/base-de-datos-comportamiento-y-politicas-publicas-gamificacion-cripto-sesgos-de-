# analysis.R — Base de datos: Comportamiento y Políticas Públicas —
# Gamificación cripto, sesgos de anclaje en subsidios verdes y aversión al riesgo migratorio en Latinoamérica (2022-2025)
# DOI: 10.5281/zenodo.19017501
# Author: de la Serna Tuya, Juan Moisés · ORCID: 0000-0002-8401-8018
# License: CC0 1.0

# ── SETUP ────────────────────────────────────────────────────────────────
# Install required packages if needed:
# install.packages(c("readr", "ggplot2", "dplyr", "tidyr"))

library(readr)
library(ggplot2)
library(dplyr)
library(tidyr)

# ── LOAD DATA ────────────────────────────────────────────────────────────
# Download dataset from Zenodo and place the main CSV in the working directory.
# Replace "dataset.csv" with the actual file name if different.
# Example:
# df <- read_csv("base-datos-comportamiento-politicas-publicas.csv")

# Temporary example with synthetic data (remove once using the real dataset)
set.seed(42)
years <- 2000:2023
df <- data.frame(
  year         = years,
  gamificacion = rnorm(length(years), 50, 15),
  criptomoneda = rnorm(length(years), 55, 12),
  politicas_pu = rnorm(length(years), 48, 10),
  migracion_la = rnorm(length(years), 52, 14),
  stringsAsFactors = FALSE
)

cat("Dataset: Base de datos: Comportamiento y Políticas Públicas\n")
cat("DOI: 10.5281/zenodo.19017501\n")
cat("Dimensions:", nrow(df), "x", ncol(df), "\n\n")

print(head(df))
cat("\nSummary statistics:\n")
print(summary(df))

# ── VISUALIZATION ────────────────────────────────────────────────────────
# Temporal trend by variable

long_df <- df %>%
  pivot_longer(
    cols = -year,
    names_to = "variable",
    values_to = "value"
  )

p1 <- ggplot(long_df, aes(x = year, y = value, color = variable)) +
  geom_line(size = 0.8) +
  geom_point(size = 1.5) +
  labs(
    title    = "Tendencias temporales — Base de datos: Comportamiento y Políticas Públicas",
    subtitle = "Gamificación cripto, subsidios verdes y migración (datos de ejemplo)",
    x        = "Año",
    y        = "Valor (escala simulada)",
    caption  = "de la Serna Tuya, Juan Moisés · 2026 · DOI: 10.5281/zenodo.19017501"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

if (!dir.exists("figures")) dir.create("figures")
ggsave("figures/analysis_output_r.png", p1, width = 10, height = 6, dpi = 150)

cat("\nFigure saved: figures/analysis_output_r.png\n")

# ── CITATION ─────────────────────────────────────────────────────────────
cat("\nCitation:\n")
cat("de la Serna Tuya, Juan Moisés (2026). ",
    "Base de datos: Comportamiento y Políticas Públicas — Gamificación cripto, ",
    "sesgos de anclaje en subsidios verdes y aversión al riesgo migratorio en Latinoamérica (2022-2025). ",
    "Zenodo. https://doi.org/10.5281/zenodo.19017501\n", sep = "")

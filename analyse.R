# Mini-analyse « extérieure » : agrège des séjours fictifs par GHM, sérialise
# l'indicateur en JSON, puis se félicite.
# (Ce qui compte ici : le code dépend de dplyr, jsonlite et praise.)

library(dplyr)
library(jsonlite)
library(praise)

sejours <- tibble(
  ghm   = c("05M09", "05M09", "06C04", "06C04", "06C04", "01M30"),
  duree = c(3, 5, 2, 8, 4, 12)
)

indicateur <- sejours |>
  group_by(ghm) |>
  summarise(n = n(), dms = mean(duree), .groups = "drop") |>
  arrange(desc(n))

cat(toJSON(indicateur, pretty = TRUE), "\n")

message(praise("${EXCLAMATION} ! Analyse ${adjective}."))

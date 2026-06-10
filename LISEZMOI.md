# demo-renv-formation — le projet « extérieur » de la démo

Petit projet d'analyse **sans renv au départ** : il joue le rôle d'un projet
existant, développé hors PDH, qu'on veut rendre **portable** d'un environnement
à l'autre.

Il contient seulement `analyse.R`, qui dépend de **dplyr**, **jsonlite** et
**praise** — dont plusieurs dépendances compilées : c'est ce qui rendra visible
le contraste *compilation source* vs *binaires*.

## Parcours de la démo

1. **Poste local** — on ajoute renv au projet existant :
   `options(repos = c(CRAN = "https://packagemanager.posit.co/cran/2025-12-25"))`
   puis `renv::init()` → commit du `renv.lock` (versions épinglées au snapshot
   P3M du 2025-12-25, la date du snapshot de la nouvelle PDH).
2. **PDH actuelle** — `git clone` + `renv::restore()` → installation depuis les
   **sources** via Artifactory (compilation, plusieurs minutes).
3. **Nouvelle PDH** (image snapshot 2025-12-25) — `git clone` +
   `renv::restore()` → **binaires** Ubuntu (quasi instantané).

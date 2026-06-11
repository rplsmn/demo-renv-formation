# demo-renv-formation - projet fictif R

Petit projet d'analyse **sans renv au départ** : il joue le rôle d'un projet
existant, qu'on veut rendre **portable** d'un environnement
à l'autre.

Il contient seulement `analyse.R`, qui dépend de **dplyr**, **jsonlite** et
**praise** — dont plusieurs dépendances compilées : c'est ce qui rendra visible
le contraste *compilation source* vs *binaires*.

## Parcours de la démo

1. **Poste local** — on ajoute renv au projet existant :
   `renv::init()` → commit du `renv.lock`
2. **PDH actuelle** — `git clone` + `renv::restore()` → installation depuis les
   **sources** via Artifactory (compilation, plusieurs minutes).
3. **Nouvelle PDH** (image snapshot 2025-12-25) — `git clone` +
   `renv::restore()` → **binaires** Ubuntu (quasi instantané).

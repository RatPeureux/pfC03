# Génération de documentation technique et utilisateur

**! ATTENTION !,**
**un fichier config est nécessaire à l'exécution du script il se présente ainsi :**

*EX :*

CLIENT=Les Génies du Ponant
PRODUIT=Machine à courber les bananes
VERSION=3.1.0

## Télécharger le .zip

**Tout est censé être en place, néanmoins :**

*Conseil :* lire le document en entier est rapide et fortement recommandé.

### Exécution du script bash (sae103.bash)

**! À VÉRIFIER !,**
**le fichier "doc.md" et les fichiers ".c" doivent se situer à l'endroit ou le script est exécuté, de même pour les 2 css, les 2 php ainsi que le fichier config**

Activation des images docker nécessaires au script

>     docker image pull clock:latest
>     docker image pull sae103-php:latest
>     docker image pull sae103-html2pdf:latest

Ajout du droit d'exécution **(à ne faire qu'une fois)**

>     chmod +x sae103.bash

Lancement du script

>     ./sae103.bash

### Modification de version

Mise a jour de type major (Nouvelles fonctionnalités, changement interface utilisateur)

>     --major

+ *Ajouter le MAJOR soit l'incrémenter met à 0 le minor et le build*

Mise a jour de type minor (Correction de bug important)

>     --minor

+ *Ajouter le minor soit l'incrémenter met à 0 le build*

Mise a jour de type build (Esthetique, correction de bug legers)

>     --build

+ *Ajouter le build soit l'incrémenter conserve le MAJOR et le minor*

**Ajout des options présentés ci-dessus à l'execution du script.**

>     ./sae103.bash --major

*OU*

>     ./sae103.bash --minor

*OU*

>     ./sae103.bash --build
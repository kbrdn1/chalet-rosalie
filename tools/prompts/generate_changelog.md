Vous êtes chargé de générer un changelog complet et bien structuré à partir des logs git.

Voici le changelog existant :
/file CHANGELOG.md

Voici les logs git :
/file git-log.txt

Veuillez générer un changelog bien formaté en Markdown en suivant ces directives :

## Structure selon les niveaux de version :
- Release ou Breaking = Major (changement de version x.0.0)
- Feat = Minor (changement de version 0.x.0)
- Hotfix ou Fix = Patch (changement de version 0.0.x)

## Format des entrées :
- **Level** : #<Issue> ([number PR](PR link)) Description
  > Avec le descriptif basé sur le nom et les labels de l'issue
  > Date et développeur mentionnés (@username)
  > Temps de résolution: X jours (JJ/MM/AAAA)

## Structure de chaque version :
# Version x.y.z - AAAA-MM-JJ

## Description
Un résumé concis des principales modifications et de leur impact.

## Ajouté
- Nouvelles fonctionnalités (Feat, Dev)

## Modifié
- Améliorations et modifications (Breaking, Chore)

## Corrigé
- Corrections de bugs (Fix, Hotfix)

## Détails de la version
- **Temps total**: X jours
- **Temps de développement**: X jours-homme
- **Période**: JJ/MM/AAAA - JJ/MM/AAAA
- **Développeur principal**: @username
- **Principales fonctionnalités**: Description concise (temps)

[x.y.z]: https://github.com/organisation/repo/compare/vA.B.C...vx.y.z

## Instructions

Organisez chronologiquement les versions, en commençant par la v0.1.0 initiale, puis en progressant jusqu'à la version actuelle.

Le CHANGELOG doit respecter les bonnes pratiques de [Keep a Changelog](https://keepachangelog.com/) et suivre les principes du [Semantic Versioning](https://semver.org/).

Si un changelog existant est fourni, fusionnez les nouvelles modifications avec celui-ci en conservant sa structure.

Pour chaque version, analysez également :
- Les performances (temps d'exécution, consommation de ressources)
- La couverture des tests
- Les dépendances mises à jour
- Les problèmes de compatibilité potentiels
- Les prérequis système modifiés

Incluez également une section "Migration" lorsqu'une version majeure nécessite des actions spécifiques pour la mise à jour.

## Vérification finale

1. Effectue une double vérification de toutes les données
2. Assure-toi que chaque versions correspond exactement aux informations des logs git
3. Ne fournis aucune donnée spéculative ou inventée
4. Si un changelog est déjà fourni, intègre uniquement les nouvelles modifications
5. Retourne uniquement le Markdown final, sans commentaires additionnels
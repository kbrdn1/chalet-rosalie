# CONTRIBUTING - <Project Name>

Thanks for your interest in contributing to <Project Name>. We're happy to have you here.

Please take a moment to review this document before submitting your first pull request. We also strongly recommend that you check for open issues and pull requests to see if someone else is working on something similar.

If you need any help, feel free to reach out to [@FlippadTeam](https://flippad.fr).

## Table of Contents 📚

- [About this repository](#about-this-repository-)
- [Structure](#structure-)
- [Testing](#testing-)
- [Development](#development-)
  - [Fork this repo](#fork-this-repo)
  - [Clone on your local machine](#clone-on-your-local-machine)
  - [Navigate to project directory](#navigate-to-project-directory)
  - [Create a new Branch](#create-a-new-branch)
  - [Install dependencies](#install-dependencies)
  - [Run the project](#run-the-project)
- [Documentation](#documentation-)
- [Branches Convention](#branches-convention-)
  - [Naming Convention](#naming-convention-)
  - [Examples](#examples)
- [Commit Convention](#commit-convention-)
  - [Commits](#commits)
    - [Emojis](#emojis)
    - [Types](#types)
    - [Scopes](#scopes)
    - [Breaking Changes](#breaking-changes)
    - [Subject](#subject)
    - [Examples](#examples)
- [GitHub Issue Management](#github-issue-management)
  - [Labels](#labels)
    - [Type Labels](#type-labels)
    - [Domain Labels](#domain-labels)
    - [Management Labels](#management-labels)
    - [Status Labels](#status-labels)
  - [Priorities](#priorities)
  - [Issue Types](#issue-types)
- [Releases](#releases)
  - [Versioning](#versioning)
  - [Examples](#examples)

## About this repository 📁

This repository is An Laravel <type> application that serves as the <backend|frontend> for the <website> application. It is built using the Laravel framework and follows the <type> conventions.

## Structure 🏗️

This repository is structured as follows:

```
├── app
      ├── Components
      ├── Http/Modules
            ├── Admin
            └── Authentication
      ├── Models
      ├── Providers
      ├── Services
      └── Utils
            ├── OAuth
            ├── Recovery
            └── Rules
├── bootstrap
├── config
├── database
      ├── factories
      ├── migrations
      └── seeders
├── lang
      ├── en
      └── fr
├── public
├── routes
├── storage
├── tests
├── composer.json
├── composer.lock
├── docker-compose.yml
├── docker-compose.testing.yml
└── phpunit.xml
```

| Path                         | Description                                                |
| ---------------------------- | ---------------------------------------------------------- |
| `app`                        | Contains the main application code                         |
| `app/Components`             | Contains the components of the application                 |
| `app/Http/Modules`           | Contains the modules of the application                    |
| `app/Providers`              | Contains the service providers of the application          |
| `app/Services`               | Contains the services of the application                   |
| `app/Utils`                  | Contains the utility classes of the application            |
| `bootstrap`                  | Contains the Laravel bootstrap files                       |
| `config`                     | Contains the configuration files of the application        |
| `database`                   | Contains the database migrations, factories, and seeders   |
| `lang`                       | Contains the language files of the application             |
| `public`                     | Contains the public files of the application               |
| `routes`                     | Contains the routes of the application                     |
| `storage`                    | Contains the storage files of the application              |
| `tests`                      | Contains the tests of the application                      |
| `composer.json`              | Contains the composer dependencies of the application      |
| `composer.lock`              | Contains the composer lock file of the application         |
| `docker-compose.yml`         | Contains the docker compose file of the application        |
| `docker-compose.testing.yml` | Contains the docker compose file for testing               |
| `phpunit.xml`                | Contains the PHPUnit configuration file of the application |

## Testing 🧪

> [!IMPORTANT]
> Not yet implemented 🏗️

## Development 🚀

### Fork this repo

You can fork this repo by clicking the fork button in the top right corner of this page.

### Clone on your local machine

```bash
git clone https://github.com/FlippadTeam/<repo>.git
```

### Navigate to project directory

```bash
cd <repo>
```

### Create a new Branch

```bash
git checkout -b my-new-branch
```

### Install dependencies

```bash
composer install
```

### Run the project

```bash
php artisan serve
```

## Documentation 📖

Documentation is written using [MDX](https://mdxjs.com). You can find the documentation files in the `docs` directory.

## Branches Convention 🌿

Main branches:
- `main`: Main branch
- `dev`: Development branch

### Naming Convention 📛

```bash
<type>/#<issue-number>-<short-description>
```

- `type`: Type of the branch
- `issue-number`: Issue number
- `short-description`: Short description of the issue or issue title

### Examples

- `feat/#1-add-new-feature`
- `fix/#2-fix-typo`
- `docs/#3-update-readme`
- `chore/#4-update-dependencies`
- `test/#5-add-new-test`
- `ci/#6-update-github-actions`
- `refactor/#7-refactor-code`
- `build/#8-update-docker-compose`
- `perf/#10-improve-performance`

## Commit Convention 📝

Before you create a Pull Request, please check whether your commits comply with the commit conventions used in this repository.

When you create a commit we kindly ask you to follow the convention `category(scope or module): message` in your commit message while using one of the following categories:

- `feat / feature`: all changes that introduce completely new code or new features
- `fix`: changes that fix a bug (ideally you will additionally reference an issue if present)
- `refactor`: any code related change that is not a fix nor a feature
- `docs`: changing existing or creating new documentation (i.e. README, docs for usage of a lib or cli usage)
- `build`: all changes regarding the build of the software, changes to dependencies or the addition of new dependencies
- `test`: all changes regarding tests (adding new tests or changing existing ones)
- `ci`: all changes regarding the configuration of continuous integration (i.e. github actions, ci system)
- `chore`: all changes to the repository that do not fit into any of the above categories

  e.g. `feat(components): add new prop to the avatar component`

If you are interested in the detailed specification you can visit https://www.conventionalcommits.org/ or check out the [Angular Commit Message Guidelines](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#-commit-message-guidelines).

### Commits

Use the following prefixes for your commit messages:
`<emoji> <type>(<scope>)<!>: <subject>`

#### Emojis

Use the following emoji prefixes for your commit messages [Gitmoji](https://gitmoji.dev/)

You can install the Gitmoji extension for VSCode [here](https://marketplace.visualstudio.com/items?itemName=seatonjiang.gitmoji-vscode)

#### Types

Choose a type from the following list, in terms of the kind of change that you're committing:

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing or correcting existing tests
- `chore`: Changes to the build process or auxiliary tools and libraries such as documentation generation

#### Scopes

> [!NOTE]
> Only use in monorepo projects or if you have multiple modules in your project.

Choose a scope from the following list, in terms of the location of the change:

- `app`
- `back-office`
- `docs`
- `lambda`
- `assets`
- `cli`
- `composables`
- `constants`
- `stores`
- `types`
- `ui`
- `utils`
- `scripts`

#### Breaking Changes

Any breaking changes should be indicated with `!` after the type/scope. e.g. `✨ feat(back)!: this is a breaking change`

#### Subject

- Describe what you did in imperative mood, e.g.:
  | Word | Description | Example |
  | --- | --- | --- |
  | `add` | Create a capability e.g. feature, test, dependency. | `✨ feat: add new feature` |
  | `change` | Change behavior of the code e.g. refactor, style, doc. | `🔧 chore: change config` |
  | `remove` | Delete a capability e.g. feature, test, dependency. | `🔥 feat: remove feature` |
  | `fix` | Fix an issue e.g. bug, typo, accident, misstatement. | `🐛 fix: fix typo` |
  | `bump` | Increase the version of something e.g. dependency. | `⬆️ chore: bump version` |
  | `make` | Add or change something to make it work. | `🏗 chore: make build` |
  | `start` | Begin doing something; e.g. create a feature flag. | `🏁 chore: start feature flag` |
  | `stop` | End doing something; e.g. remove a feature flag. | `🏁 chore: stop feature flag` |
  | `optimize` | A change that MUST be just about performance, e.g. speed up code. | `🚀 chore: optimize code` |
  | `revert` | Revert a change e.g. revert commit. | `⏪ chore: revert commit` |
  | `clean` | A change that MUST be just about removing code. | `🧹 chore: clean code` |
  | `disable` | A change that MUST be just about disabling code. | `🔒 chore: disable code` |
  | `refactor` | A change that MUST be just about refactoring code. | `♻️ chore: refactor code` |
  | `update` | A change that MUST be just about updating code. | `🚀 chore: update code` |
  | `improve` | A change that MUST be just about improving code. | `🚀 chore: improve code` |
  | `clean` | A change that MUST be just about cleaning code. | `🧹 chore: clean code` |
  | `optimize` | A change that MUST be just about optimizing code. | `🚀 chore: optimize code` |
  > Source: [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- Don't capitalize first letter
- No dot (.) at the end

#### Examples

- `✨ feat(app): add new feature`
- `🐛 fix(back-office): fix typo`
- `🔧 chore(cli): change config`
- `♻️ chore(types): refactor code`
- `💄 style(ui): change style`
- `🚑️ hotfix(composables): fix import`
- `🔥 feat(lambda)!: remove feature`
- `⬆️ chore(docs): bump version`
- `🏗 chore(scripts/donwload-images): make build`

## GitHub Issue Management

### Labels

#### Type Labels

| Name | Color | Description (EN) | Note (FR) |
|-----|---------|-----------------|-----------| 
| **feature** | `#0E8A16` (Green) | Implementation of a new feature | Label pour identifier l'ajout d'une nouvelle fonctionnalité au projet |
| **fix** | `#D73A4A` (Light red) | Bug fix | Correction d'un problème existant dans le code |
| **hotfix** | `#FF3333` (Bright red) | Critical bug fix in production | Correction urgente d'un bug critique en environnement de production |
| **docs** | `#1D76DB` (Blue) | Improvements or additions to documentation | Modifications ou ajouts concernant la documentation technique ou utilisateur |
| **test** | `#87CEEB` (Sky blue) | Unit, integration, or functional tests | Ajout ou modification de tests automatisés |
| **refactor** | `#FBCA04` (Yellow) | Code restructuring without changing external behavior | Amélioration de la structure du code sans modifier son comportement externe |
| **chore** | `#808080` (Gray) | Routine maintenance tasks not modifying the main codebase (configuration, scripts, etc.) | Tâches de maintenance qui ne modifient pas directement le code principal (configuration, scripts, etc.) |
| **optimisation** | `#FFA500` (Orange) | Performance or logic improvements | Améliorations des performances ou de la logique du code |

#### Domain Labels

| Name | Color | Description (EN) | Note (FR) |
|-----|---------|-----------------|-----------| 
| **authentication** | `#0075CA` (Dark blue) | Related to authentication | Concerne les fonctionnalités d'authentification et de gestion des sessions |
| **errors** | `#D73A4A` (Red) | Related to error handling | Concerne la gestion des erreurs et exceptions |
| **ci/cd** | `#26A69A` (Teal) | Continuous integration / Continuous deployment | Modifications liées à l'intégration continue ou au déploiement continu |
| **security** | `#B60205` (Dark red) | Security issues to fix | Problèmes de sécurité à corriger |
| **UI/UX** | `#FF69B4` (Pink) | User interface or user experience improvements | Améliorations de l'interface utilisateur ou de l'expérience utilisateur |

#### Management Labels

| Name | Color | Description (EN) | Note (FR) |
|-----|---------|-----------------|-----------| 
| **dependencies** | `#8B008B` (Purple) | Updates or issues with dependencies | Mises à jour ou problèmes avec les dépendances du projet |
| **breaking** | `#FF0000` (Red) | Non-backward compatible changes | Changements qui ne sont pas rétrocompatibles |
| **versioning** | `#000080` (Navy blue) | Version management | Gestion des versions du projet |
| **urgent** | `#FF1493` (Deep pink) | Requires immediate attention | Nécessite une attention immédiate |

#### Status Labels

| Name | Color | Description (EN) | Note (FR) |
|-----|---------|-----------------|-----------| 
| **duplicate** | `#CCCCCC` (Gray) | Duplicated issue or PR | Issue ou Pull Request qui duplique une autre déjà existante |
| **invalid** | `#444444` (Dark gray) | Invalid issue that cannot be resolved | Issue non valide ou qui ne peut pas être résolue |
| **wontfix** | `#FFFFFF` (White) | Valid issue that will not be fixed | Issue valide mais qui ne sera pas corrigée pour une raison spécifique |

### Priorities

Priorities are managed via a dedicated selector and not via labels to avoid redundancy.

| Name | Color | Description (EN) | Note (FR) |
|-----|---------|-----------------|-----------| 
| **Critical** | Red | Blocking issue that must be resolved immediately. Severely affects core functionality. | Problème bloquant qui doit être résolu immédiatement. Affecte gravement les fonctionnalités principales. |
| **High** | Orange | Important issue that is not blocking but needs to be resolved quickly. Significant impact on user experience. | Problème important qui n'est pas bloquant mais doit être résolu rapidement. Impact significatif sur l'expérience utilisateur. |
| **Medium** | Yellow | Standard priority issue that should be addressed in the current development cycle. | Problème de priorité standard qui devrait être traité dans le cycle de développement actuel. |
| **Low** | Green | Minor issue that can be deferred to future development cycles. | Problème mineur qui peut être reporté aux prochains cycles de développement. |
| **Trivial** | Blue | Cosmetic or non-essential improvements that can be handled when time permits. | Améliorations cosmétiques ou non essentielles qui peuvent être traitées lorsque le temps le permet. |

### Issue Types

| Name | Color | Description (EN) | Note (FR) |
|-----|---------|-----------------|-----------| 
| **Task** | Blue | Specific task to accomplish, usually small to medium-sized. | Tâche spécifique à accomplir, généralement de petite à moyenne taille. |
| **Story** | Green | Feature described from the end user's perspective. | Fonctionnalité décrite du point de vue de l'utilisateur final. |
| **Bug** | Red | Problem or incorrect behavior to fix. | Problème ou comportement incorrect à corriger. |
| **Epic** | Purple | Set of stories or tasks grouped for a major feature. | Ensemble de stories ou de tâches regroupées pour une fonctionnalité majeure. |
| **Question** | Blue | Request for clarification or information. | Demande de clarification ou d'information. |
| **Improvement** | Blue | Enhancement of an existing feature. | Amélioration d'une fonctionnalité existante. |
| **Research** | Yellow | Preliminary investigation to explore solutions. | Investigation préliminaire pour explorer des solutions. |
| **Infrastructure** | Gray | Changes concerning infrastructure or development environment. | Modifications concernant l'infrastructure ou l'environnement de développement. |
| **Support Request** | Orange | Request for assistance requiring intervention. | Demande d'assistance nécessitant une intervention. |
| **Technical Documentation** | Blue | Internal technical documentation for the development team. | Documentation technique interne pour l'équipe de développement. |
| **Spike** | Pink | Time-limited technical investigation to assess feasibility. | Investigation technique limitée dans le temps pour évaluer la faisabilité. |
| **Incident** | Red | Problem that occurred in production requiring immediate intervention. | Problème survenu en production nécessitant une intervention immédiate. |
| **Feature** | Green | Request for a new feature to be implemented | Demande d'implémentation d'une nouvelle fonctionnalité |

#### Implementation of GitHub Labels

To implement these labels in GitHub, you can:

1. Access `https://github.com/[organisation]/[repository]/labels`
2. Delete existing unwanted labels
3. Create new labels with the names, descriptions, and colors indicated above
4. For more efficient implementation, you can use tools like [GitHub Label Sync](https://github.com/Financial-Times/github-label-sync)

To configure issue types and priorities, you will need to create appropriate issue templates in the `.github/ISSUE_TEMPLATE/` folder of your repository.

## Release 🚀

Versioning is done automatically by [GitHub Actions](https://docs.github.com/fr/actions).

Using [Github worflows](https://docs.github.com/en/actions/writing-workflows) and release `vX.X.X` branches

### Versioning

- `major`: Breaking changes
- `minor`: New features
- `patch`: Bug fixes

e.g. `<major>.<minor>.<patch>`

### Examples

- `1.0.0` First release
- `1.1.0` New feature
- `1.1.1` Bug fix

---

<p align="center">
	Copyright &copy; 2025-present <a href="https://github.com/FlippadTeam" target="_blank">@FlippadTeam</a>
</p>

<p align="center">
	<a href="https://github.com/FlippadTeam/jewely-brand-product-configurator/blob/main/LICENSE.md"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a>
</p>
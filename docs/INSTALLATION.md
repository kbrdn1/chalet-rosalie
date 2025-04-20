# Installation 💾

## Table of Contents 📚

- [Using Makefile](#using-makefile-) 📋
- [Install dependencies](#install-dependencies-) 📦
- [Environment Configuration](#environment-configuration-) 🛠️
- [Docker](#docker-) 🐳
		- [Laravel Sail](#laravel-sail)
		- [Generate SSL Certificates](#generate-ssl-certificates)
		- [HTTPS Configuration and custom domain](#https-configuration-and-custom-domain)
		- [Open a terminal in the App container](#open-a-terminal-in-the-app-container)
- [Run Migrations](#run-migrations-) 🚀
- [Run Seeders](#run-seeders-) 🌱
- [Run the Application](#run-the-application-) 🚀
- [Testing](#testing-) 🧪

## Using Makefile 📋

The project includes a Makefile to simplify common tasks. You can see all available commands with:

```bash
make help
```

For a complete setup (dependencies, .env file, SSL certificates), run:

```bash
make setup
```

Here are the available Makefile commands:

| Command | Description |
| ------- | ----------- |
| `make help` | Show help with all available commands |
| `make install` | Install dependencies with Composer |
| `make env` | Create .env file from .env.example |
| `make ssl` | Generate SSL certificates |
| `make setup-hosts` | Setup custom domain in /etc/hosts file |
| `make sail-up` | Start Laravel Sail with SSL and watch mode |
| `make sail-up-local` | Start Laravel Sail with local environment |
| `make sail-down` | Stop Laravel Sail |
| `make build` | Docker build |
| `make build-cache` | Docker build with cache |
| `make build-local` | Docker build with local environment |
| `make app-shell` | Open a terminal in the App container |
| `make migrate` | Run migrations |
| `make seed` | Run seeders |
| `make fresh-seed` | Run fresh migrations with seeders |
| `make serve` | Run the application |
| `make test` | Run tests |
| `make test-coverage` | Run tests with coverage |
| `make generate-git-log` | Generate a git log file (last 400 commits) |
| `make generate-git-log-all` | Generate a full git log file |
| `make generate-project-structure` | Generate a project structure document |
| `make setup` | Complete setup: install dependencies, create .env, generate SSL certificates |

## Install dependencies 📦

```bash
composer install
# -- or --
make install
```

```bash
Installing dependencies from lock file (including require-dev)
Verifying lock file contents can be installed on current platform.

Package operations: 108 installs, 0 updates, 0 removals

78 packages you are using are looking for funding.
```

## Environment Configuration 🛠️

Create a `.env` file by copying the `.env.example` file:

```bash
cp .env.example .env
# -- or --
make env
```

You don't need to change the environment variables if you are using the default configuration, just replace the fields values `<something>` with your own values.

> [!NOTE]
> You can change the environment variables as needed, but the default configuration will work out of the box.

## Docker 🐳

The actual [`docker-compose.yml`](../docker-compose.yml) provides a default configuration for the following services:

| Container     | Hostname         | Port     | Username | Password | Database   |
| ------------- | ---------------- | ----     | -------- | -------- | ---------- |
| Adminer       | adminer-fp       | 8080     | root     | root     |            |
| App           | app              | 8000     |          |          |            |
| Minio         | minio-fp         | 9000     | sail     | password |            |
| MySQL         | mysql-fp         | 3306     | sail     | password | laravel-db |
| Nginx         | nginx-fp         | 80 | 443 |          |          |            |
| Redis         | redis-fp         | 6379     |          | root     | 1          |

> [!NOTE]
> If want to use your own database, you can read the [Laravel documentation](https://laravel.com/docs/11.x/database#configuration) to configure your database.

> [!TIP]
> I currently use [TablePlus](https://tableplus.com/) to manage my databases.
> You can also use [MySQL Workbench](https://www.mysql.com/products/workbench/).
> Or [PhpMyAdmin](https://www.phpmyadmin.net/).

### Generate SSL Certificates

You can generate SSL certificates using the following command:

```bash
sh tools/generate-ssl-certificate.sh
# -- or --
make ssl
```

or use the following command:

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
					-keyout docker/nginx/ssl/app.key \
					-out docker/nginx/ssl/app.crt
```

> [!NOTE]
> Certificates are generated for development purposes only. You should use a valid certificate in production.
> The project already provides a default certificate for development purposes, but it is recommended to generate your own certificate.

### HTTPS Configuration and custom domain

You can configure the HTTPS protocol and a custom domain by editing the `/etc/hosts` file.

```bash
sudo nano /etc/hosts
# -- or --
vim /etc/hosts
# -- or --
make setup-hosts
```

Add the following line to the file:

```bash
127.0.0.1 <host>
127.0.0.1 www.<host>
::1 <host>
::1 www.<host>
```

### Laravel Sail

Laravel Sail is a light-weight command-line interface for interacting with Laravel's default Docker development environment. Sail provides a great starting point for building a Laravel application using Docker.

```bash
./vendor/bin/sail up
# -- or --
make sail-up
```

You can add an alias to your `.bashrc` or `.zshrc` file to run the command more easily:

```bash
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
```

```bash
sail up
```

Now you can run the following command to start the services:

```bash
sh tools/generate-ssl-certificate.sh && sail up --build --watch
# -- or --
make build-sail
```

You don't need to configure anything else if the environment variables are set correctly. The default configuration will work out of the box.

### Open a terminal in the App container

```bash
docker exec -it fp-api-rest zsh # or use bash
# -- or --
make app-shell
```

## Run Migrations 🚀

```bash
php artisan migrate
# -- or --
make migrate
```

See results [-> HERE](https://app.warp.dev/block/xrWhqqo4YjntdMpr9gFKpo)

## Run Seeders 🌱

```bash
php artisan db:seed
# -- or --
make seed
```

See results [-> HERE](https://app.warp.dev/block/fTGFxmUOZLOY4NpsoBTxAp)

> [!NOTE]
> The migration step can be run the default seeders that come with Laravel. If you want to run the seeders, you can run the following command:
>
> ```bash
> php artisan migrate:fresh --seed
> # -- or --
> make fresh-seed
> # -- or --
> php artisan migrate --seed
> ```
>
> See results [-> HERE](https://app.warp.dev/block/fTGFxmUOZLOY4NpsoBTxAp)

## Run the Application 🚀

```bash
php artisan serve
# -- or --
make serve
```

See results [-> HERE](https://app.warp.dev/block/TYXu9pD37iAHoY9GiT6bZt)

## Testing 🧪

```bash
php artisan test
# -- or --
make test
```

See results [-> HERE](https://app.warp.dev/block/1BKVVC7IXMZUXcVOulsUht)

See more details on the [Testing](TESTS.md) documentation page.

## Contributing 🤝

Please read the [contributing guide](../CONTRIBUTING.md).

## Project 📂

We have organized our work into a single project to streamline development and ensure clarity. You can follow the progress and contribute through the link below:

- [<type> - Name Project](https://github.com/orgs/FlippadTeam/projects/<number>)

---

<p align="center">
	Copyright &copy; 2025-present <a href="https://github.com/FlippadTeam" target="_blank">@FlippadTeam</a>
</p>

<p align="center">
	<a href="https://github.com/FlippadTeam/<repo>/blob/main/LICENSE.md"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a>
</p>

# Usage 🔧

## Table of Contents 📚

- [API Documentation](#api-documentation-) 📖
- [Web Endpoints](#web-endpoints-) 🌐
  - [Authentication](#authentication-) 🔐
  - [Admin](#admin-) 🛡️
- [API Endpoints](#api-endpoints-) 📡
  - [Authentication](#authentication-) 🔐
  - [Admin](#admin-) 🛡️
- [Postman](#postman-) 📬
- [Debug Mode](#debug-mode-) 🐞

## API Documentation 📖

The API documentation is available at the following link:

- [API Documentation](https://documenter.getpostman.com/view/22240109/2sAYBREDeP)

> [!NOTE]
> The Base URL for the API must be have these following values:
> - `http://localhost:8000` for local development
> - `http://127.0.0.1:8000` for local development
> - `http://<host>` for staging
> - `https://<host>` for production

Exemple of an endpoint:

| Endpoint | Method | Path | Params | Headers | Description |
| --- | --- | --- | --- | --- | --- |
| [Name] | 🟢🟡🔵🟣🔴 GET-POST-PUT-PATH-DELETE | `/path/endpoint` | `field`, `second_field` | `Authorization: Bearer {token}`  | [Description] |

## Web Endpoints 🌐

### Authentication 🔐

| Endpoint | Method | Path | Params | Headers | Description |
| --- | --- | --- | --- | --- | --- |

### Admin 🛡️

## API Endpoints 📡

### Authentication 🔐

| Endpoint | Method | Path | Params | Headers | Description |
| --- | --- | --- | --- | --- | --- |


### Admin 🛡️


## Postman 📬

[![Go to Collection](https://run.pstmn.io/button.svg)](<url to your collection>)

You can see the API documentation in Postman by clicking on the button above.

> [!TIP]
> You can also import the collection and environement directly ->
>
> HERE: [Project Name Collection](docs/postman-workspace)

## Debug Mode 🐞

To enable or disable debug mode in Laravel, modify the `.env` file:

```
# Development mode
APP_ENV=local
APP_DEBUG=true

# Production mode
APP_ENV=production
APP_DEBUG=false
```

### How It Works

1. **In development mode** (`APP_DEBUG=true`), error responses will include:
   - Detailed error message
   - File name and line number where the error occurred
   - Complete stack trace
   - Specific error codes

2. **In production mode** (`APP_DEBUG=false`), responses will be simplified:
   - Generic and secure error messages
   - No technical details (file, line, trace)
   - Error codes are still present for debugging

## Contributing 🤝

Please read
the [contributing guide](CONTRIBUTING.md).

## Project 📂

We have organized our work into a single project to streamline development and ensure clarity. You can follow the
progress and contribute through the link below:

- [<type> - Name Project](https://github.com/orgs/FlippadTeam/projects/<number>)

---

<p align="center">
	Copyright &copy; 2025-present <a href="https://github.com/FlippadTeam" target="_blank">@FlippadTeam</a>
</p>

<p align="center">
	<a href="https://github.com/FlippadTeam/<repo>/blob/main/LICENSE.md"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a>
</p>

# Tests 🧪

## Table of Contents 📚

- [Environment Configuration](#environment-configuration-) 🛠️
- [Database Setup](#database-setup-) 🗃️
- [Usage](#usage-) 🔧
  - [Running Tests](#running-tests-) 🧪
  
## Environment Configuration 🛠️

You can add environment variables to the `.env.testing` file to configure the testing environment.
  
```bash
cp .env.example .env.testing
```

## Database Setup 🗃️

SQLite Configuration

1. Configure your `.env.testing` file to use SQLite:
   ```bash
   DB_CONNECTION=sqlite
   DB_DATABASE=:memory:
   ```

2. This will create an in-memory SQLite database for your tests, which is faster and doesn't require any additional setup.

3. If you prefer to use a file-based SQLite database:
   ```bash
   DB_CONNECTION=sqlite
   DB_DATABASE=database/db-test.sqlite
   ```
   Then create the empty file:
   ```bash
   touch database/db-test.sqlite
   ```

## Usage 🔧

### Running Tests 🧪

```bash
php artisan test
```
See results [-> HERE](https://app.warp.dev/block/1BKVVC7IXMZUXcVOulsUht)
# Redis 🟥

## Table of Contents 📚

- [Prerequisites](#prerequisites-) 📋
- [Installation](#installation-) 🛠️
- [Start Redis](#start-redis-) 🏁
  - [MacOS](#macos)
  - [Ubuntu](#ubuntu)
- [Conection to Redis](#conection-to-redis-) 🔄
- [Redis Commands](#redis-commands-) 🧪
  - [List all keys](#list-all-keys)
  - [Get a value by key](#get-a-value-by-key)
  - [Set a value by key](#set-a-value-by-key)
  - [Delete a key](#delete-a-key)
  - [Delete all keys from the current database](#delete-all-keys-from-the-current-database)
  - [Delete all keys from all databases](#delete-all-keys-from-all-databases)

## Prerequisites 📋

- [Redis](https://redis.io/download)
- [Php](https://www.php.net/downloads)

## Installation 🛠️

### MacOS
```bash
brew install redis
```

### Ubuntu
```bash
sudo apt update
sudo apt install redis-server
```

### Php Redis Extension

```bash
pecl install redis
```

## Start Redis 🏁

### MacOS
```bash
brew services start redis
```

### Ubuntu
```bash
sudo systemctl start redis
```

## Conection to Redis 🔄

```bash
docker exec -it redis-fp redis-cli -a $REDIS_PASSWORD # default password is root

# -- or --

redis-cli -a $REDIS_PASSWORD
```

```bash
select 1
```

## Redis Commands 🧪

### List all keys
```bash
keys *
```

### Get a value by key
```bash
get <key>
```

### Set a value by key
```bash
set <key> <value>
```

### Delete a key
```bash
del <key>
```

### Delete all keys from the current database
```bash
flushdb
```

### Delete all keys from all databases
```bash
flushall
```

> [!NOTE]
> You can see more commands on the [Redis documentation](https://redis.io/commands).
# SQL

## MySQL (mariadb)

```
$ mysql {database_name} < {query}.sql
```

## Postgres

```
$ psql -f {query}.sql
```

### One-liner
```
$ psql -c "select 'Hello world! '"
```

### Troubleshooting

Postgres

```
$ sudo -u postgres createuser -s $(whoami); createdb $(whoami)
```

MariaDB

```
$ mysql -u root -p
```

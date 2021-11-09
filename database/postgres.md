# :elephant: Postgres

```
$ psql -f {query}.sql
```

### One-liner
```
$ psql -c "select 'Hello world! '"
```

## Management

```
$ psql
```

List databases
```
# \l
```

Connect to db
```
# \c <db>
```

List tables
```
# \d
```

Switch output mode
```
# \x
```

Quit postgres CLI
```
# \q
```

### Troubleshooting

Postgres

```
$ sudo -u postgres createuser -s $(whoami); createdb $(whoami)
```

# PHP

```
$ php {program}.php
```

### One-liner
```
$ php -r '{code}'
```

### Debug

Check php.ini location
```
$ php --ini
```
Check loaded drivers and other info
```
$ php -m
$ php -i   OR   php -r 'phpinfo();'
```

# Framework / Library

## Symfony

### Debug

Displays the default config values defined by Symfony
```
$ php bin/console config:dump-reference doctrine
```
Displays the actual config values used by your application
```
$ php bin/console debug:config doctrine
```

### php-cs-fixer

```
$ sudo rm -f $(which php-cs-fixer)
$ wget https://cs.symfony.com/download/php-cs-fixer-v2.phar -O php-cs-fixer
$ sudo chmod a+x php-cs-fixer
$ sudo mv php-cs-fixer /usr/local/bin/php-cs-fixer
```


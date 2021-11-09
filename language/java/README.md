# Java

```
$ javac {program}.java
$ java {program}
```

## Compile

The order of the `jar` arguments matter
```
$ javac {program}.java
$ jar cmf META-INF/MANIFEST.MF {program}.jar {program}.class
$ java -jar {program}.jar
```

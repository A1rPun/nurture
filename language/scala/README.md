# Scala

- [Documentation](https://docs.scala-lang.org/)
- [Learn Scala in Y minutes](https://learnxinyminutes.com/docs/scala/)

```
$ scala {program}.scala
```

### One-liner
```
$ scala -e '{code}'
```

## Compile

```
$ scalac {program}.scala -d {program}.jar
$ scala {program}.jar
```

Or create a JVM jar (need scala-library.jar). The order of the `jar` arguments matter
```
$ jar cmf META-INF/MANIFEST.MF {program}.jar
$ java -jar {program}.jar
```

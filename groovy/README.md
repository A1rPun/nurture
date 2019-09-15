# Groovy

- [Documentation](http://docs.groovy-lang.org/next/html/documentation/)
- [Learn Groovy in Y minutes](https://learnxinyminutes.com/docs/groovy/)

```
$ groovy {program}.groovy
```

**One-liner**
```
$ groovy -e 'println "Hello world!"'
```

## Compile

Create a JVM jar (need groovy-all.jar). The order of the `jar` arguments matter
```
$ groovyc {program}.groovy
$ jar cmf META-INF/MANIFEST.MF {program}.jar {program}.class
$ java -jar {program}.jar
```

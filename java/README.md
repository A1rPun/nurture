# Java

```
$ javac {program}.java
$ java {program}
```

Or create a manifest and jar and run it

**META-INF/MANIFEST.M**
```
Main-Class: name.space.class
```

The order of the arguments matter `jar`
```
$ jar cmf META-INF/MANIFEST.MF {program}.jar {program}.class
$ java -jar {program}.jar
```

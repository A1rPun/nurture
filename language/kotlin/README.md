# Kotlin

```
$ kotlinc {program}.kt -d {program}.jar
$ kotlin -classpath {program}.jar {MainClass}
```
*The {MainClass} defaults to {Program}Kt (case-sensitive)*

Or include the kotline runtime and run it with java
```
$ kotlinc {program}.kt -include-runtime -d {program}.jar
$ java -jar {program}.jar
```

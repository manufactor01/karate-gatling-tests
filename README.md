### Properties

| property | value |
| :---: | :---: |
| project.build.sourceEncoding | UTF-8 |
| java.version | 17 |
| maven.compiler.version | 3.6.0 |

## Project structure

```
└───karate_gatling
    ├───.settings
    ├───src
    │   └───test
    │       └───java
    │           └───petstore
    │           │    ├───features
    │           │    ├───request
    │           │    └───response
    │           │    
    │           └───performance
    │           │    ├───data
    │           │    └───PetSimulation.scala
    │           │    └───UserSimulation.scala
    │           │
    │           └───core
    │           │    ├───constants
    │           │    └───environment
    │           │
    │           └───utils
    │           |    ├───reusable_steps
    │           |    └───DataGenerator.java
    │           │
    │           └───TestRunnerParallel.java
    │
    └───target
```

## How to run gatling tests
1. Open your terminal in your project
2. Write `mvn clean test-compile gatling:test`

## How to run specific Simulation File
1. Open your terminal in your project
2. Write `mvn clean test-compile gatling:test -Dgatling.simulationClass=performance.SimulationFile`
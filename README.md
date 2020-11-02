# ImageGeneticAlgorithm

## Introduction
This project implements the Genetic Algorithm to recreate the pixel art of Homer Simpsion. Genetic algorithm
mimics the process of natural selection where the most fittest and best sample from population are selected
to breed so that their genetic meterial i.e.DNA, we are interested in, is passed to their offspring. This process
is repeated again and again so best of the best genetic materials are only passed to next generation.

In this program the image is a entity of the population and the genetic material is the pixel RGB value.

<img src="https://raw.githubusercontent.com/KurejiMilan/HomerImageGeneticAlgorithm/master/homerImageGeneticAlgorithm/homer.png" alt="homer pixel art" height="150px" width="150px">

## Technologies and programming language 
* Processing
* Genetic Algorithm

## Contributors and Developers
* Milan Rai

## Issues
I recently found that processing is not that good when it comes to the floating points. It does not provides
high fraction resolution, i don't think it's only on my machine, which could cause problems when calculating
the fitness of the entity and when performing selection of best sample based on their probability.

## Improvements
The floating point operation should be rewritten for integers on the pool selection operation as the
floating point value won't represent the true probability  as processing is only supports float 0.0 .

## Special Thanks
I would like to thank Danial Shiffman(Coding Train) for the wonderful tutorial on genetic algorithm.
 
## Project status
This project is completed. You can clone the repo and run it on processing. You can change parameters like
mutation rate and population size to see how these parameters effect how fast can it achive the desired goal,
in this case recreating the pixel art of homersimpsion.

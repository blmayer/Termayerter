# Termayerter
> UDP Server and esp 01s firmware to collect temperature data.

In this project esp 01s are deployed with a simple program that reads data from a connected temperature sensor and sends that information to an UDP server in a Raspberry PI.

### Compiling

To compile this project clone this repository or download all files, change to the Termayerter directory and run the command:

`make`

this should compile without warnings and create a binary in bin, which you can then execute with `./bin/udp-server`.

## Current work

- Bug corrections;
- Building a cross compiler; &
- Compiling esp firmware

## To-do

There are lots of things to do, the ones in my mind now are listed below.

- Create all versions of firmware needed; &
- Build a cross compiler.

## Meta

Created by: Brian Mayer - bleemayer@gmail.com
Inital commit: Dec, 24, 2017
Distributed under The Unlicense. See ``UNLICENSE`` for more information.

## Contributing

Check the *contributing* file for details, but, in advance, it is pretty intuitive and straightforward.


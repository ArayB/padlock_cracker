# Padlock Cracker Simulation

Often I'm locking various combination padlocks and idly wonder things like:

* Does how you lock the padlock affect how easy it would be to guess the combination.
* What strategies could you employ for more efficiently guessing the combination.

## Padlock

A simple padlock class, initializing a Padlock will have it generate a random 4 digit lock code and then set the lock display randomly.

This is to be extended to employ different lock strategies which will set the display differently.

Ideas for locking strategies:

* Lazy - just move all the dials the same direction a similar amount
* Up and Down - move alternating dials up or down a similar amount

## Cracker

The Cracker class will instantiate a new padlock on initialize and store the initial code displayed by the padlock.

The run method will then attempt to crack the padlock and outputs the unlock combination once the lock is unlocked

The cracker can use the following strategies:

#### Brute Force

Starts at 0 and runs through all codes in order up to 9999

#### Start in the middle

Starting from 5000 try codes going up and down either side.

i.e 5000, 4999, 5001, 4998, 5002 etc

#### Start with the displayed code

Starting from the code displayed by the padlock try codes going up and down either side.

i.e if displayed value is 1234, try 1234, 1233, 1235, 1232, 1236 etc.
